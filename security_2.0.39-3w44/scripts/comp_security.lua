local mod = ...





-- *************************************************************************************************************
-- Custom Component: Security -------------------------------------------------------------------------------------
-- Calculates each building part's security score and creates security for consumption
-- *************************************************************************************************************
local COMP_SECURITY = {
	TypeName = "COMP_SECURITY",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "CurrentDay", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "VillageCenterAdded", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "SpawnList", Type = "list<string>", Default = nil, Flags = { "SAVE_GAME" } },
    }
}


-- -- addGenerator -------------------------------------------------------------------------------------
-- function COMP_SECURITY:addGenerator(objPart)

--     objPart:getOrCreateComponent("COMP_SECURITY_GENERATOR")
--     local compResGen = objPart:getOrCreateComponent("COMP_RESOURCE_GENERATOR")
--     compResGen.GrowRate = 0
--     compResGen:setResourceGeneratorData("BUILDING_FUNCTION_SECURITY_GENERATOR")
--     compResGen:setMaxQuantity(0)

-- end


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY:init()
    self.gameActionOutlaw = nil
end


-- onEnabled -------------------------------------------------------------------------------------
function COMP_SECURITY:onEnabled()

    mod:log("COMP_SECURITY ______________________________________________________________________________________")

    -- Game Action data for new outlaw from workplace
    self.gameActionOutlaw = foundation.createData(
        {
            DataType = "GAME_ACTION_TRIGGER_EVENT_CALLBACK",
            Callback = {
                DataType = "EVENT_CALLBACK_TRIGGER_EVENT",
                Event = "EVENT_SECURITY_OUTLAW",
                Delay = 0
            }
        }
    )

    -- Process security on loading the game
    if GetPopulation(self) >= MinPopCrime() then
        self:trackVillagers()
        self:trackWorkplaces()
        self:trackHouses()
        self:trackTreasuries()
    end

    -- Turn off all overlays
    self:getLevel():getComponentManager("COMP_SECURITY_OVERLAY"):getAllComponent():forEach(function(compOverlay)
        compOverlay.Show = false
    end)

    -- Ensure no buildings are stuck in edit mode (this can prevent the overlay from working at all)
    self:getLevel():getComponentManager("COMP_BUILDING"):getAllComponent():forEach(function(compBuilding)
        compBuilding.EditMode = false
        -- mod:log("Building edit mode turned off.")
    end)

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        -- Record the current day
        self.CurrentDay = self.CurrentDay + 1

        -- Give points to vanilla assets (some of these are now covered by the embedded building functions which attach points to whatever they are used with)
        self:attachPoints("WoodenKeepBaseCoreRootPart", 10, 2)
        -- self:attachPoints("RusticLordHouseTowerRootPart", 2, 2)
        -- self:attachPoints("RusticLordHouseTowerRootPart2", 2, 2)
        -- self:attachPoints("RusticLordHouseCoreRootPart", 0, 2)
        -- self:attachPoints("RootPart2", 0, 2) -- wooden tower from lord manor
        -- self:attachPoints("RusticLordHouseExtension1RootPart", 0, 2)
        -- self:attachPoints("RusticLordHouseTowerRootPart2", 4, 2)
        -- self:attachPoints("RusticLordHouseTowerRootPart2", 4, 2)

        -- Calculate generated points from security buildings
        self:calcPoints()

        -- Execute security tracking code
        self:trackVillagers()
        self:trackWorkplaces()
        self:trackHouses()
        self:trackTreasuries()

        -- Manage physical alerts
        self:trackAlerts()

    end)

end



-- Calculate Security Points -------------------------------------------------------------------------------------
function COMP_SECURITY:calcPoints()

    self:getLevel():getComponentManager("COMP_SECURITY_POINTS"):getAllComponent():forEach(function(compPoints)

        -- Calculate worker points based on employment
        local workerPoints = 0
        local workerCount = 0

        local compWork = compPoints:getOwner():getEnabledComponent("COMP_WORKPLACE")
        if not compWork then
            compWork = compPoints:getOwner():findFirstObjectWithComponentUp("COMP_WORKPLACE")
        end

        if compWork then

            -- mod:log("Found workplace for security item " .. tostring(compPoints:getOwner()))

            local listWorker = compWork.AssignedWorkerList
            if listWorker then
                for i = 1, #listWorker do
                    if (listWorker[i]) then
                        -- mod:log("Assigned worker: " .. tostring(listWorker[i]))
                        workerCount = workerCount + 1
                    end
                end

                workerPoints = compPoints.WorkerPoints * workerCount

            end
        end

        -- Set the current Points based on base + worker points
        compPoints.Points = compPoints.BasePoints + workerPoints

        -- mod:log("Points generated by " .. tostring(compPoints:getOwner().Name) .. " = " .. tostring(compPoints.Points))

    end)

end



-- Track villagers -------------------------------------------------------------------------------------
function COMP_SECURITY:trackVillagers()

    local outlawCount = GetOutlawCount(self)
    local outlawPercent = outlawCount / GetPopulation(self)

    -- Loop through all villagers
    self:getLevel():getComponentManager("COMP_VILLAGER"):getAllEnabledComponent():forEach(function(compVillager)

        -- Track unemployed and make outlaws of those unemployed too long
        local compSecVill = compVillager:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER")
        local job = compVillager:getJobInstance()
        local jobName = ""

        if (job) then
            jobName = job.AssetJob.JobName
            compSecVill.DayUnemployed = 0 -- villager is not unemployed
        else
            if (compSecVill.DayUnemployed == 0) then
                compSecVill.DayUnemployed = self.CurrentDay -- track when the villager become unemployed
            end
        end

        -- Generate chance for outlaws from unemployed villagers
        local chance = math.random()
        if (chance < 0.25) and (GetPopulation(self) >= MinPopCrime()) and (outlawPercent <= 0.05) and (self.CurrentDay > GraceDays("Worker")) and (compSecVill.DayUnemployed > 0) and (compSecVill.DayUnemployed < (self.CurrentDay - GraceDays("Worker"))) then
            self:createOutlawFromVillager(compVillager)
        end

        -- Reset any outlaws that have had their job manually changed
        if (compSecVill.OutlawFlag) then
            -- mod:log("TrackVillagers. Outlaw flag set on " .. tostring(compVillager:getOwner().Name))
            if not (jobName == "JOB_SECURITY_OUTLAW_NAME") then
                compVillager:changeJob("JOB_SECURITY_OUTLAW")
                jobName = "JOB_SECURITY_OUTLAW_NAME"
            end

        -- Reset any prisoners that have had their job manually changed
        elseif (compSecVill.PrisonerFlag) then
            if not (jobName == "JOB_SECURITY_PRISONER_NAME") then
                compVillager:changeJob("JOB_SECURITY_PRISONER")
                jobName = "JOB_SECURITY_PRISONER_NAME"
            end

        end

        -- Set the Defender flag for soldiers and guards
        if (jobName == "SOLDIER") or (jobName == "JOB_SECURITY_GUARD_NAME") then
            compSecVill.DefenderFlag = true
        else
            compSecVill.DefenderFlag = false
        end

    end)


    -- Add outlaws as new immigrants if there are not many outlaws from the existing villagers
    local compImmigration = self:getLevel():getComponentManager("COMP_IMMIGRATION_MANAGER"):getFirstEnabled()
    if compImmigration then
        if compImmigration:getIsImmigrationEnabled() then

            local chance = math.random()
            if (GetPopulation(self) >= MinPopCrime()) and (outlawPercent <= 0.05) and (outlawCount < 5) and (chance < 0.05) then
            -- if (GetPopulation(self) > 7) then -- TESTING ONLY, REPLACE!!!

                local newOutlawCount = math.random(1, 5 - outlawCount)
                local posSpawn = self:getLevel():getComponentManager("COMP_VILLAGER"):getFirstEnabled():getOwner():getGlobalPosition()
                self:createOutlawFromScratch(newOutlawCount, posSpawn)

            end

        end
    end


end



-- Track Workplaces -------------------------------------------------------------------------------------
function COMP_SECURITY:trackWorkplaces()

    -- -- testing only
    -- local testcount = 0
    -- self:getLevel():getComponentManager("COMP_SECURITY_POINTS"):getAllComponent():forEach(function(compPoints)
    --     testcount = testcount + 1
    --     mod:log(tostring(compPoints:getOwner().Name) .. "  "  .. tostring(compPoints.Duration))
    -- end)
    -- mod:log("Count of COMP_SECURITY_POINTS = " .. tostring(testcount))


    local pop = GetPopulation(self)
    local outlawPercent = GetOutlawCount(self) / pop

    -- Score workplaces and create outlaws in unprotected workplaces
    self:getLevel():getComponentManager("COMP_WORKPLACE"):getAllEnabledComponent():forEach(function(compWork)

        -- local compWorkName = compWork:getOwner().Name
        local compSecPart = compWork:getOwner():getOrCreateComponent("COMP_SECURITY_BUILDING_PART")

        local compWorkBuilding = compWork:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")
        local compWorkBuildingName = nil
        if compWorkBuilding then
            compWorkBuildingName = compWorkBuilding.AssetBuilding.Name
        end

        -- mod:log(compWorkName .. ", parent = " .. compWork:getOwner():getParent().Name)

        local posPart = compWork:getOwner():getGlobalPosition()
        local score = self:getScore(posPart)
        if not score then score = 0 end

        -- provide exemptions for basic workplaces that tend to be far away from town
        -- if (compWorkName == "ForesterPart" or compWorkName == "WoodCutterCampPart" or compWorkName == "StonecutterPart" or compWorkName == "HunterPart") then score = 10
        if compWorkBuildingName == "FORESTER_CAMP" then score = 10
        elseif compWorkBuildingName == "LUMBER_CAMP" then score = 10
        elseif compWorkBuildingName == "STONECUTTER_CAMP" then score = 10
        elseif compWorkBuildingName == "HUNTERS_HUT" then score = 10
        elseif compWorkBuildingName == "BUILDER_WORKSHOP" then score = 10
        end

        -- mod:log("Building name: " .. compWorkBuildingName)
        -- mod:log("Workplace object" .. tostring(compWork:getOwner()))
        -- mod:log(tostring(compWorkName) .. ", score = " .. tostring(score))

        -- find out if the score changed, for the grace period
        if (score == compSecPart.Score) then -- score is the same now as it was before
        else
            compSecPart.DayScoreChanged = self.CurrentDay -- record today as the day the score changed
        end

        -- record the current score
        compSecPart.Score = score

        -- mod:log("Workplace security score: " .. tostring(compWork:getOwner().Name) .. " = " .. tostring(score) .. ", Day Score Changed: " .. compSecPart.DayScoreChanged)


        -- Find the largest inventory above a threshold
        local qtyInv = 0
        local resourceInv = nil
        -- mod:log("Workplace: " .. tostring(compWork:getOwner().Name))

        -- Find resource depot
        local compDepot = compWork:getOwner():findFirstObjectWithComponentDown("COMP_RESOURCE_DEPOT")
        if compDepot then
            for i = 1, #compDepot.InputInventory.Inventory.Collection do
                local qtyTest = compDepot.InputInventory.Inventory.Collection[i].Quantity
                -- mod:log(string.upper(string.sub(tostring(compDepot.InputInventory.Inventory.Collection[i].Resource), 9, -16)) .. "  " .. tostring(qtyTest))
                if qtyTest > qtyInv then
                    qtyInv = qtyTest
                    resourceInv = string.upper(string.sub(tostring(compDepot.InputInventory.Inventory.Collection[i].Resource), 9, -16))
                end
            end
            for i = 1, #compDepot.OutputInventory.Inventory.Collection do
                local qtyTest = compDepot.OutputInventory.Inventory.Collection[i].Quantity
                -- mod:log(string.upper(string.sub(tostring(compDepot.OutputInventory.Inventory.Collection[i].Resource), 9, -16)) .. "  " .. tostring(qtyTest))
                if qtyTest > qtyInv then
                    qtyInv = qtyTest
                    resourceInv = string.upper(string.sub(tostring(compDepot.OutputInventory.Inventory.Collection[i].Resource), 9, -16))
                end
            end
        end

        -- -- Find resource stockpile
        -- local compStock = compWork:getOwner():findFirstObjectWithComponentDown("COMP_RESOURCE_STOCKPILE")
        -- if compStock then

        --     compStock:getOwner():forEachChild(function(objChild)

        --         -- Child objects with inventory
        --         local objChildName = objChild.Name
        --         if objChildName == "Input Inventory" or objChildName == "Output Inventory" then
                    -- local compInv = objChild:getComponent("COMP_INVENTORY")
                    -- if compInv then
                    --     for i = 1, #compInv.Inventory.Collection do
                    --         local qtyTest = compInv.Inventory.Collection[i].Quantity
                    --         -- mod:log(string.upper(string.sub(tostring(compInv.Inventory.Collection[i].Resource), 9, -16)) .. "  " .. tostring(qtyTest))
                    --         if qtyTest > qtyInv then
                    --             qtyInv = qtyTest
                    --             resourceInv = string.upper(string.sub(tostring(compInv.Inventory.Collection[i].Resource), 9, -16))
                    --         end
                    --     end
                    -- end
        --         end

        --         -- Children of child with inventory
        --         objChild:forEachChild(function(objChildChild)
        --             local objChildChildName = objChildChild.Name
        --             if objChildChildName == "Input Inventory" or objChildChildName == "Output Inventory" then
        --                 local compInv = objChildChild:getComponent("COMP_INVENTORY")
        --                 if compInv then
        --                     for i = 1, #compInv.Inventory.Collection do
        --                         local qtyTest = compInv.Inventory.Collection[i].Quantity
        --                         -- mod:log(string.upper(string.sub(tostring(compInv.Inventory.Collection[i].Resource), 9, -16)) .. "  " .. tostring(qtyTest))
        --                         if qtyTest > qtyInv then
        --                             qtyInv = qtyTest
        --                             resourceInv = string.upper(string.sub(tostring(compInv.Inventory.Collection[i].Resource), 9, -16))
        --                         end
        --                     end
        --                 end
        --             end
        --         end)

        --     end)

        -- end

        -- Clean up some resource ids that don't match their resource asset ID
        if resourceInv == "COMMONCLOTHES" then resourceInv = "CLOTHES" end
        if resourceInv == "COMMONWARES" then resourceInv = "COMMON_WARES" end
        if resourceInv == "POLISH STONE" then resourceInv = "POLISHED_STONE" end
        if resourceInv == "IRONORE" then resourceInv = "IRON_ORE" end
        if resourceInv == "GOLDORE" then resourceInv = "GOLD_ORE" end
        if resourceInv == "CLOTH" then resourceInv = "WOOLEN_CLOTH" end
        if resourceInv == "FAITH" or resourceInv == "WATER" or resourceInv == "RESOURCE_PAGANISM" then resourceInv = nil end
        if compWorkBuildingName == "TREASURY" then
            resourceInv = "GOLD_COINS"
            qtyInv = 20
        end

        -- if qtyInv >= 10 then
        --     mod:log("Inventory >10 found on " .. tostring(compWork:getOwner()) .. ": " .. resourceInv .. " " .. tostring(qtyInv) )
        -- end


        -- Create theft points near unprotected workplaces; these delete themselves after a few days
        local chance = RandomFloat(0.05, 0.75) * (compSecPart.Score + 1.25) -- creates a distribution where score = 0 results in ~60% chance of success, score = 5 is ~8%, score = 9 is <1%
        if resourceInv and (qtyInv >= 20) and (pop >= MinPopCrime()) and (compSecPart.Score < 5 and compSecPart.DaySpawnedTheftPoint < (self.CurrentDay - 6) and (chance <= 0.5)) then -- the building is vulnerable to theft and it's been at least 7 days since theft points were spawned (they have expired by now)

            -- Spawn theft object
            local pos = self:findTheftPosition(compWork:getOwner():getGlobalPosition())

            local i = math.random(1, 3)
            local objTheft = self:getLevel():createObject("PREFAB_SECURITY_OUTLAWTHEFTPOINT" .. i, pos)
            objTheft:setRotationY(2 * math.pi * math.random())

            local scaleX = RandomFloat(0.85, 1.15)
            local scaleY = RandomFloat(0.85, 1.15)
            objTheft:scale( { scaleX, scaleY, scaleX } )

            compSecPart.DaySpawnedTheftPoint = self.CurrentDay

            -- Assign a relevant resource to the theft point; if collected, this resource will be paid to the outlaws
            local compTheft = objTheft:getOrCreateComponent("COMP_SECURITY_OUTLAWTHEFTPOINT")
            compTheft.Resource = resourceInv

        end

        -- Generate Outlaws where security score is too low after a grace period
        if resourceInv and qtyInv >= 10 and (pop >= MinPopCrime()) and (outlawPercent <= 0.05) and (compSecPart.DayScoreChanged < (self.CurrentDay - GraceDays("Workplace"))) and (compSecPart.Score < 2) then
            self:createOutlawFromWorkplace(compWork, compSecPart)
        end

    end)


    -- Initiate a new outlaw camp if warranted
    local countOutlaw = 0
    self:getLevel():getComponentManager("COMP_SECURITY_VILLAGER"):getAllEnabledComponent():forEach(function(compSecVill)
        if (compSecVill.OutlawFlag) then
            countOutlaw = countOutlaw + 1
        end
    end)

    local countOutlawCamp = 0
    self:getLevel():getComponentManager("COMP_SECURITY_OUTLAWCAMP"):getAllEnabledComponent():forEach(function(compOutlawCamp)
        countOutlawCamp = countOutlawCamp + 1
    end)

    local demandOutlawCamp = math.ceil(countOutlaw / 5) -- round up
    if (demandOutlawCamp > countOutlawCamp) then -- there is demand above the current number
        for i = 1, (demandOutlawCamp - countOutlawCamp) do
            self:launchPathfinder("OUTLAWCAMP")
        end
    end
    
end



-- Track houses ----------------------------------------------------------------------------------------------------------------
function COMP_SECURITY:trackHouses()

    local pop = GetPopulation(self)

    -- mod:log("trackHouses() started")

    -- Find all houses with tax object
    local listObj = {}
    self:getLevel():find("HouseTerrainPart_TaxCollectable", listObj)

    for i = 1, #listObj do

        -- mod:log("House parent object: " .. tostring(listObj[i]:getParent()))

        -- Ensure the house has a security component for tracking
        local compSecHouse = listObj[i]:getParent():getOrCreateComponent("COMP_SECURITY_HOUSE")

        local posHouse = compSecHouse:getOwner():getGlobalPosition()
        -- mod:log("House located at: " .. tostring(posHouse))
        local score = self:getScore(posHouse)
        if not score then score = 0 end

        -- find out if the score changed, for the grace period
        if (score == compSecHouse.Score) then -- score is the same now as it was before
        else
            compSecHouse.DayScoreChanged = self.CurrentDay -- record today as the day the score changed
        end

        -- record the current score
        compSecHouse.Score = score

        -- Create theft points near unprotected houses; these delete themselves after a few days
        local chance = RandomFloat(0.05, 0.75) * (compSecHouse.Score + 1.25) -- creates a distribution where score = 0 results in ~60% chance of success, score = 5 is ~8%, score = 9 is <1%
        if (pop >= MinPopCrime()) and (compSecHouse.Score < 5 and compSecHouse.DaySpawnedTheftPoint < (self.CurrentDay - 6) and (chance <= 0.5)) then -- the building is vulnerable to theft and it's been at least 7 days since theft points were spawned (they have expired by now)

            -- Spawn theft object
            local pos = self:findTheftPosition(compSecHouse:getOwner():getGlobalPosition())

            local i = math.random(1, 3)
            local objTheft = self:getLevel():createObject("PREFAB_SECURITY_OUTLAWTHEFTPOINT" .. i, pos)
            objTheft:setRotationY(2 * math.pi * math.random())

            local scaleX = RandomFloat(0.85, 1.15)
            local scaleY = RandomFloat(0.85, 1.15)
            objTheft:scale( { scaleX, scaleY, scaleX } )

            compSecHouse.DaySpawnedTheftPoint = self.CurrentDay

            -- Assign a relevant resource to the theft point; if collected, this resource will be paid to the outlaws
            local compTheft = objTheft:getOrCreateComponent("COMP_SECURITY_OUTLAWTHEFTPOINT")
            compTheft.Resource = "GOLD_COINS"

            mod:log("Theft resource placed near house: " .. compTheft.Resource)

        end

        -- Testing
        -- mod:log("HouseTerrainPart_TaxCollectable object found.")
        -- listObj[i]:forEachChild(function(objChild)
        --     mod:log("Object has child object: " .. tostring(objChild))
        -- end)

        -- listObj[i]:forEachComponent(function(compObj)
        --     mod:log("Object has component: " .. tostring(compObj))
        -- end)

    end

    -- self:getLevel():getComponentManager("PlaCCompHouse"):getAllEnabledComponent():forEach(function(compHouse)

    --     mod:log("House component found.")

    --     local objHouse = compHouse:getOwner()


    --     objHouse:forEachChild(function(objChild)
    --         mod:log("House has child object: " .. tostring(objChild))
    --     end)

    --     objHouse:forEachComponent(function(compObj)
    --         mod:log("House has component: " .. tostring(compObj))
    --     end)


    --     local compPart = objHouse:getComponent("COMP_BUILDING_PART")
    --     if compPart then

    --         -- Ensure the building is already built
    --         if compPart:getIsBuilt() then

    --         end

    --     end

    -- end)

end



-- Track treasuries ----------------------------------------------------------------------------------------------------------------
function COMP_SECURITY:trackTreasuries()


end




-- Get score from nearby security points -------------------------------------------------------------------------------------
function COMP_SECURITY:getScore(pos)

    local score = 0
    local dist = 0

    local objPoints = nil
    local posPoints = nil
    local points = 0

    self:getLevel():getComponentManager("COMP_SECURITY_POINTS"):getAllComponent():forEach(function(compPoints)

        objPoints = compPoints:getOwner()
        posPoints = objPoints:getGlobalPosition()

        -- dist = math.sqrt( (pos[1] - posPoints[1])^2 + (pos[3] - posPoints[3])^2 )
        local distX = math.abs(pos[1] - posPoints[1])
        local distY = math.abs(pos[3] - posPoints[3])
        dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots

        points = compPoints.Points

        -- Factor the points down the further away they are
        -- point effectiveness is at maximum up to 30m, and drops to zero by 90m (60m further out)
        local pointsFactor = (1.00 - (dist - 30.00) / 60.00)

        if pointsFactor < 0 then pointsFactor = 0 elseif pointsFactor > 1 then pointsFactor = 1 end

        score = score + (pointsFactor * points)

        -- break out early to save processing, if the score is already green
        if score > 9 then
            -- mod:log("Ending scoring early")
            return score
        end

    end)

    -- mod:log("Total accumulated score: " .. tostring(score))

    return score

end



-- Attach Points to Vanilla assets -------------------------------------------------------------------------------------
function COMP_SECURITY:attachPoints(partName, basePoints, workerPoints)

    local compOverlay = nil
    local compPoints = nil
    local compWork = nil
    local listWorker = nil
    local countWorker = 0
    local pointsWorker = 0

    -- -- mod:log("Looking for parts: " .. tostring(partName))
    -- local objPart = self:getLevel():find(partName)

    -- compPoints = objPart:getOrCreateComponent("COMP_SECURITY_POINTS")
    -- compPoints.BasePoints = basePoints
    -- compPoints.WorkerPoints = workerPoints

    -- if (compPoints.Points == 0) then

    --     compWork = objPart:getEnabledComponent("COMP_WORKPLACE")
    --     if not (compWork) then
    --         compWork = objPart:getParent():getEnabledComponent("COMP_WORKPLACE")
    --     end

    --     if (compWork) then
    --         listWorker = compWork.AssignedWorkerList
    --         if (listWorker) then
    --             countWorker = 0
    --             for i = 1, #listWorker do
    --                 if (listWorker[i]) then
    --                     countWorker = countWorker + 1
    --                 end
    --             end
    --             pointsWorker = compPoints.WorkerPoints * countWorker
    --         end

    --     end

    --     compPoints.Points = compPoints.BasePoints + pointsWorker

    --     mod:log("Security points added to part: " .. partName)

    -- end


    local listPart = {}
    self:getLevel():find(partName, listPart)

    -- mod:log("listPart = " .. tostring(listPart))

    if (next(listPart, nil)) then
        for i = 1, #listPart do

            -- compOverlay = listPart[i]:getOrCreateComponent("COMP_SECURITY_OVERLAY")
            compOverlay = listPart[i]:getOrCreateComponent("COMP_SECURITY_OVERLAY_INIT")
            compPoints = listPart[i]:getOrCreateComponent("COMP_SECURITY_POINTS")
            compPoints.BasePoints = basePoints
            compPoints.WorkerPoints = workerPoints

            if (compPoints.Points == 0) then

                -- try this part or its parent to get a workplace (e.g. in the Wooden keep it is the parent part that has the workplace, not the part itself, but we want the points on the child part)
                compWork = listPart[i]:getEnabledComponent("COMP_WORKPLACE")
                if not (compWork) then
                    compWork = listPart[i]:getParent():getEnabledComponent("COMP_WORKPLACE")
                end

                if (compWork) then
                    listWorker = compWork.AssignedWorkerList
                    if (listWorker) then
                        countWorker = 0
                        for w = 1, #listWorker do
                            if (listWorker[w]) then
                                countWorker = countWorker + 1
                            end
                        end
                        pointsWorker = compPoints.WorkerPoints * countWorker
                    end

                end

                compPoints.Points = compPoints.BasePoints + pointsWorker

                -- mod:log("Security points added to part: " .. partName)

            end

        end
    end

end



-- Find theft position -------------------------------------------------------------------------------------
-- Looks for an empty (pathable) space near the workplace to attract outlaws
function COMP_SECURITY:findTheftPosition(posCenter)

    -- mod:log("Workplace centred at " .. tostring(posCenter))
    local posGuess = {0, 0, 0}

    -- try 100 times if needed
    local found = false
    for i = 1, 100 do

        posGuess[1] = math.random(posCenter[1] - 10, posCenter[1] + 10)
        posGuess[3] = math.random(posCenter[3] - 10, posCenter[3] + 10)

        -- mod:log("Guessing position at " .. tostring(posGuess))

        if not (HasBuildingCollision(self, posGuess)) and (GetWaterElevation(self, posGuess) < GetGroundElevation(self, posGuess)) then
            -- mod:log("Found a position that didn't have a collision or under water.")
            found = true
            break
        end

    end

    if (found) then
        return posGuess
    else
        return posCenter
    end

end



-- Launch pathfinder -------------------------------------------------------------------------------------
function COMP_SECURITY:launchPathfinder(type)

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

end



-- Create Outlaw from Workplace -------------------------------------------------------------------------------------
function COMP_SECURITY:createOutlawFromWorkplace(compWork, compSecPart)

    local rand = math.random() -- random float between zero and one
    local chance = rand * (compSecPart.Score + 1)

    local job = nil
    local nameJob = nil
    local banned = false

    -- mod:log("Undefended building part: " .. tostring(compPart:getOwner().Name) .. ", chance: " .. tostring(chance))

    if (chance < 0.1) then -- any workers will be outlaws if the score falls below n%

        -- get the workers
        local listWorker = compWork.AssignedWorkerList

        -- there is at least one worker
        if listWorker then
            if #listWorker > 0 then
                for i = 1, #listWorker do
                    if (listWorker[i]) then

                        if not (listWorker[i]:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag) then -- they haven't already been marked as an Outlaw from previous code

                            job = listWorker[i]:getAssetJob()
                            if (job) then
                                nameJob = job.JobName
                                if
                                    nameJob == "SOLDIER"
                                    or nameJob == "BAILIFF"
                                    or nameJob == "JOB_SECURITY_CONSTABLE_NAME"
                                    or nameJob == "JOB_SECURITY_GUARD_NAME"
                                    or nameJob == "JOB_AUTHORITY_LORD_NAME"
                                    or nameJob == "JOB_AUTHORITY_LADY_NAME"
                                    then banned = true
                                end
                            end

                            if not banned then

                                -- change the job to Outlaw
                                listWorker[i]:changeJob("JOB_SECURITY_OUTLAW")
                        
                                -- register a flag change the job back to Outlaw if it is changed by the player
                                listWorker[i]:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag = true

                                -- Set the resource generator (for visual tracking)
                                local posWork = compWork:getOwner():getGlobalPosition()
                                local objAlert = self:getLevel():createObject("PREFAB_SECURITY_ALERT", posWork)

                                local compGen = objAlert:getOrCreateComponent("COMP_RESOURCE_GENERATOR")
                                compGen.MaxQuantity = 0
                                compGen:setResourceGeneratorData("BUILDING_FUNCTION_SECURITY_ALERT")
                                compGen:setMaxQuantity(1, true)
                                compGen.GrowRate = 0

                                mod:log("Villager " .. tostring(listWorker[i]:getOwner().Name) .. " became an Outlaw after working at an undefended workplace.")

                                -- trigger outlaw notification
                                -- listWorker[i]:changeJob("JOB_SECURITY_EVENT_OUTLAW")
                                self.gameActionOutlaw:execute(self:getLevel())

                            end

                        end
                    end
                end
            end
        end

    end

end



-- Create Outlaw from Unemployed Villager -------------------------------------------------------------------------------------
function COMP_SECURITY:createOutlawFromVillager(compVillager)

    local chance = math.random()

    if (chance < 0.10) then -- the villager will be an outlaw if their random number falls below n%

        -- change profile to villager (if this happens to be a monk or soldier)
        compVillager:getOwner():getComponent("COMP_AGENT"):setProfile("PROFILE_DEFAULT")

        -- change the job to Outlaw
        compVillager:changeJob("JOB_SECURITY_OUTLAW")

        -- register a flag change the job back to Outlaw if it is changed by the player
        compVillager:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag = true

        mod:log("Villager " .. compVillager:getOwner().Name .. " became an Outlaw after being unemployed for more than n days.")

        -- trigger outlaw notification
        -- compVillager:changeJob("JOB_SECURITY_EVENT_OUTLAW")
        self.gameActionOutlaw:execute(self:getLevel())

    end

end



-- Create Outlaw from Scratch -------------------------------------------------------------------------------------
function COMP_SECURITY:createOutlawFromScratch(newOutlawCount, posSpawn)

    local compVillagerManager = self:getLevel():getComponentManager("COMP_VILLAGER_MANAGER"):getFirstEnabled()
    if compVillagerManager then

        for i = 1, newOutlawCount do

            -- create a new Villager
            local compVillager = compVillagerManager:spawnImmigrant(posSpawn)

            -- give them the immigrant component, which will wait until they are enabled and then turn them to outlaws
            if compVillager then
                compVillager:getOwner():getOrCreateComponent("COMP_SECURITY_IMMIGRANT")
            end

        end

    end

end



-- -- Spawn Object -------------------------------------------------------------------------------------
-- function COMP_SECURITY:spawnObject(prefab, pos, offset)

--     local objNew = self:getLevel():createObject(prefab, pos)
--     if (offset) then   
--         objNew:translate({offset, 0, 0})
--     end

--     local comp = objNew:getOrCreateComponent("COMP_RESOURCE_GENERATOR")
--     comp:setResourceGeneratorData("BUILDING_FUNCTION_SECURITY_RESOURCEGENERATOR")
--     comp:setMaxQuantity(1)
--     comp.GrowRate = 0

--     table.insert(self.SpawnList, objNew:getId())

-- end


function COMP_SECURITY:trackAlerts()

    -- Manage resource generators (alerts)
    local listDelete = {}
    self:getLevel():getComponentManager("COMP_SECURITY_ALERT"):getAllEnabledComponent():forEach(function(compAlert)

        -- Decrement timer
        compAlert.Timer = compAlert.Timer - 1

        -- Disable alert if timer has run down (deletion causes a crash when using resource tracker)
        if compAlert.Timer == 0 then
            table.insert(listDelete, compAlert:getOwner():getId())
        end

    end)

    if #listDelete > 0 then
        for i = 1, #listDelete do

            local objDelete = self:getLevel():find(listDelete[i])
            if objDelete then

                -- Remove resource depot (clears inventory in the Resource toolbar) - must be done before removing resource generator
                local compRes = objDelete:getComponent("COMP_RESOURCE_DEPOT")
                if compRes then
                    objDelete:removeComponent(compRes)
                    -- mod:log("Removed resource depot component")
                end

                -- Remove resource generator (next time resource tracker refreshes, no alert will be shown)
                local compGen = objDelete:getComponent("COMP_RESOURCE_GENERATOR")
                if compGen then
                    objDelete:removeComponent(compGen)
                    -- mod:log("Removed resource generator component")
                end

                objDelete.Active = false -- ensures it will not be a subject of burning itself
                -- objDelete:destroy() -- causes crash when you right-click the resource icon again, seemingly due to removal of the building part component

            end
        end
    end

end



-- destroySpawned -------------------------------------------------------------------------------------
function COMP_SECURITY:destroySpawned()

    -- remove any object in the spawn list 
    for i, idPair in ipairs(self.SpawnList) do
        local obj = self:getLevel():find(self.SpawnList[i])
        if (obj) then
            obj:destroyAllChild()
            obj:destroy()
        end
    end
    
    -- Clear the spawn list for future use
    for k,v in pairs(self.SpawnList) do
        self.SpawnList[k] = nil
    end

end



-- onDestroy -------------------------------------------------------------------------------------
function COMP_SECURITY:onDestroy(isClearingLevel)

    self:destroySpawned()
    
end



-- Register custom Class
mod:registerClass(COMP_SECURITY)

-- Attach class to prefab
mod:registerPrefabComponent("PREFAB_MANAGER", { DataType = "COMP_SECURITY" } )



