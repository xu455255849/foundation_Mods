local mod = ...



-- Slow down speed of horses
mod:overrideAsset({
    Id = "VEHICLE_HORSE",
    DefaultSpeed = 4 -- villagers walk at speed 4
})



-- ***********************************************************************************************************************************************************
-- ********** B A N D I T ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Bandit: Define component -------------------------------------------------------------------------------------
local COMP_SECURITY_BANDIT = {
	TypeName = "COMP_SECURITY_BANDIT",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "SpawnFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "SpawnList", Type = "list<string>", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "EnRouteToRaid", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "AbandonRaid", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}


-- Init
function COMP_SECURITY_BANDIT:onEnabled()

    self.timer = 5

    if not self.SpawnFlag then

        local objBandit = self:getOwner()

        -- add the agent component with a horse vehicle
        local compAgent = objBandit:getOrCreateComponent("COMP_AGENT")
        if (compAgent) then
            compAgent:setVehicle("VEHICLE_HORSE")
        end

        -- record id of spawned object
        table.insert(self.SpawnList, compAgent:getOwner():getId())
        -- mod:log("Created object: " .. tostring(compAgent:getOwner():getId()))

        -- find generic character objects that spawn with the vehicle, and record these too so you can delete them later
        local i = 1
        compAgent = nil
        self:getLevel():getComponentManager("COMP_AGENT"):getAllComponent():forEach(function(compAgent)

            local nameObj = compAgent:getOwner().Name
            if (nameObj == "GenericCharacter") then

                -- Record Id
                compAgent:getOwner().Name = objBandit:getId() .. "__" .. i -- rename the object so that it doesn't get linked to any future bandits
                table.insert(self.SpawnList, compAgent:getOwner():getId())

                -- turn off path making
                compAgent:setIsRoadTracingEnabled(false)

                -- mod:log("Found and renamed GenericCharacter object: " .. compAgent:getOwner():getId())
            end

            i = i + 1

        end)

        self.SpawnFlag = true

    end

end


-- Update
function COMP_SECURITY_BANDIT:update()

    -- timer: check every 5 seconds
    local dt = self:getLevel():getUnscaledDeltaTime()
    local ts = self:getLevel():getTimeScale()
    if (dt ~= 0) then -- game is not paused
        self.timer = self.timer - (dt * ts)
    end

    -- check for defenders if en route to a raid
    if self.timer <= 0 then

        self.timer = 5 -- reset timer

        if (self.EnRouteToRaid) and not (self.AbandonRaid) then

            -- mod:log("en route = " .. tostring(self.EnRouteToRaid) .. ", abandon = " .. tostring(self.AbandonRaid))

            local compSecVill = nil
            local posVill = nil
            local dist = nil
            local posBandit = self:getOwner():getGlobalPosition()
            local found = false

            self:getLevel():getComponentManager("COMP_VILLAGER"):getAllEnabledComponent():forEach(function(compVill)

                if not found then
                    compSecVill = compVill:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER")
                    if (compSecVill.DefenderFlag) then
                        posVill = compVill:getOwner():getGlobalPosition()
                        dist = math.sqrt( (posBandit.x - posVill.x)^2 + (posBandit.z - posVill.z)^2 )
                        if (dist <= 15) then
                            found = true
                        end
                    end
                end

            end)

            -- guards or soldiers were found, abandon
            if found then
                self.AbandonRaid = true
                mod:log("Bandit encountered Guard or soldier while en route to a raid.")
            end

        end
    end
end


-- Get Workplace Destination
function COMP_SECURITY_BANDIT:getWorkplaceDestination()

    local job = nil
    local jobName = nil
    local posVillTarget = nil
    local posVill = nil
    local posWork = nil
    local compWorkClosest = nil
    local dist = nil
    local minDist = nil
    minDist = 1024

    local found = false

    local posBandit = self:getOwner():getGlobalPosition()
    local posTarget = nil
    local posDest = nil
    local countWorkers = 0
    local compWork = nil
    local compWorkName = nil
    local listWork = nil
    listWork = {}

    -- Find all workplaces and record with distance
    self:getLevel():getComponentManager("COMP_WORKPLACE"):getAllEnabledComponent():forEach(function(compWork)

        -- do not record basic workplaces that tend to be far away from town, and have nothing to steal
        compWorkName = compWork:getOwner().Name
        if (compWorkName == "ForesterPart" or compWorkName == "WoodCutterCampPart" or compWorkName == "StonecutterPart" or compWorkName == "HunterPart") then
        else

            posWork = compWork:getOwner():getGlobalPosition()
            dist = math.sqrt( (posBandit.x - posWork.x)^2 + (posBandit.z - posWork.z)^2 )

            table.insert(listWork, {compWork = compWork, dist = dist})

        end

    end)

    -- Sort the workplaces by distance
    table.sort(listWork, SortByDist)
    -- for i = 1, #listWork do
    --     mod:log(tostring(listWork[i].compWork) .. ", " .. tostring(listWork[i].dist) .. " - " .. tostring(listWork[i].compWork:getOwner():getId()))
    -- end

    -- Take a random one in the closest five workplaces
    local topN = 5
    if (#listWork < 5) then topN = #listWork end

    local rand = math.random(1, topN)
    compWorkClosest = listWork[rand].compWork
    -- mod:log(compWorkClosest:getOwner():getId())

    -- Get an unblocked location near this workplace
    if (compWorkClosest) then

        posTarget = compWorkClosest:getOwner():getGlobalPosition()

        local compSec = self:getLevel():getComponentManager("COMP_SECURITY"):getFirst()
        if (compSec) then
            posDest = compSec:findTheftPosition(posTarget)
        end

        if (posDest) then
            return posDest
        else
            return nil
        end

    end

end


-- onDestroy -------------------------------------------------------------------------------------
function COMP_SECURITY_BANDIT:onDestroy(isClearingLevel)

    self:destroySpawned()
    
end


-- destroySpawned -------------------------------------------------------------------------------------
function COMP_SECURITY_BANDIT:destroySpawned()

    -- remove any object that was logged in the spawn list
    for i, idPair in ipairs(self.SpawnList) do
        local obj = self:getLevel():find(self.SpawnList[i])
        if (obj) then
            mod:log("Destroying spawned object: " .. obj:getId())
            obj:destroyAllChild()
            obj:destroy()
        end
    end

    -- Clear the spawn list for future use
    for k,v in pairs(self.SpawnList) do
        self.SpawnList[k] = nil
    end

end


-- Bandit: Register class
mod:registerClass(COMP_SECURITY_BANDIT)


-- Bandit: Attach components
mod:registerPrefabComponent("PREFAB_SECURITY_BANDIT1", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_SECURITY_BANDIT" } )
mod:registerPrefabComponent("PREFAB_SECURITY_BANDIT1", { DataType = "COMP_SECURITY_BANDIT" } )




-- ***********************************************************************************************************************************************************
-- ********** C O N T R O L L E R ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Define component -------------------------------------------------------------------------------------
local COMP_SECURITY_BANDIT_CONTROLLER = {
	TypeName = "COMP_SECURITY_BANDIT_CONTROLLER",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "DayLastSpawned", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_BANDIT_CONTROLLER:onEnabled()

    -- -- Daily script
    -- local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    -- event.register(self, compMainGameLoop.ON_NEW_DAY, function()

    --     local currentDay = CurrentDay(self)

    --     if GetPopulation(self) >= MinPopCrime() then

    --         if (self.DayLastSpawned < (currentDay - GraceDays("Bandit"))) then -- rest period has elapsed since last spawn

    --             local chance = math.random()
    --             if (chance < 0.1) then
    --                 self:launchPathfinder("BANDIT")
    --                 self.DayLastSpawned = currentDay
    --                 mod:log("Initiating bandit pathfinder.")
    --             end

    --         end

    --     end

    -- end)

end


-- Launch pathfinder -------------------------------------------------------------------------------------
function COMP_SECURITY_BANDIT_CONTROLLER:launchPathfinder(type)

    local posVillageCenter = {500, 0, 500}

    -- find the village center
    self:getLevel():getComponentManager("COMP_BUILDING_PART"):getAllEnabledComponent():forEach(function(compPart)
        if compPart:getOwner().Name == "TempVillageCenterPart" then
            posVillageCenter = compPart:getOwner():getGlobalPosition()
            -- mod:log("Village center position found: " .. tostring(posVillageCenter))
        end
    end)

    local objPathfinder = self:getLevel():createObject("PREFAB_SECURITY_PATHFINDER", posVillageCenter)
    local compPathfinder = objPathfinder:getOrCreateComponent("COMP_SECURITY_PATHFINDER")
    if (type) then
        compPathfinder.Type = type
    end
    mod:log("Pathfinder agent launched at coordinates " .. tostring(posVillageCenter))

    -- comp_pathfinder will wait until a location is found, then call createBandit

end


-- Create Bandit -------------------------------------------------------------------------------------
function COMP_SECURITY_BANDIT_CONTROLLER:createBandit(prefab, pos)

    -- create bandit prefab
    -- pos = {500, 0, 500}
    local objBandit = self:getLevel():createObject(prefab, pos)
    -- return objBandit

end


-- Register class
mod:registerClass(COMP_SECURITY_BANDIT_CONTROLLER)


-- Attach to prefabs
mod:registerPrefabComponent("PREFAB_MANAGER", { DataType = "COMP_SECURITY_BANDIT_CONTROLLER" } )