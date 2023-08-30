local mod = ...



-- *************************************************************************************************************
-- Custom Component: Outlaw Theft Point -------------------------------------------------------------------------------------
-- *************************************************************************************************************
local COMP_SECURITY_OUTLAWTHEFTPOINT = {
	TypeName = "COMP_SECURITY_OUTLAWTHEFTPOINT",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "DayCreated", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
		{ Name = "Reserved", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "Resource", Type = "string", Default = "GOLD_COINS", Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_OUTLAWTHEFTPOINT:onEnabled()

    -- mod:log("Theft point day created: " .. tostring(self.DayCreated))


    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)
        if (self.DayCreated == -1) then
            self.DayCreated = currentDay
        end

        -- mod:log("Theft point day created: " .. tostring(self.DayCreated) .. " vs current day: " .. tostring(currentDay))

        if (self.DayCreated < (currentDay - 2)) and not (self.Reserved) then -- delete after 3 days unless it is reserved
            self:getOwner():destroy()
        elseif (self.DayCreated < (currentDay - 4)) then -- delete after 5 days regardless of reservation
            self:getOwner():destroy()
        end

    end)

end


-- Register custom Class
mod:registerClass(COMP_SECURITY_OUTLAWTHEFTPOINT)



-- *************************************************************************************************************
-- Custom Component: Security Building Part -------------------------------------------------------------------------------------
-- Stores a building part's security score
-- *************************************************************************************************************
local COMP_SECURITY_BUILDING_PART = {
	TypeName = "COMP_SECURITY_BUILDING_PART",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Score", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "DayScoreChanged", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "DaySpawnedTheftPoint", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
    }
}

-- Register custom Class
mod:registerClass(COMP_SECURITY_BUILDING_PART)



-- *************************************************************************************************************
-- Custom Component: Security House -------------------------------------------------------------------------------------
-- Stores a house's security score
-- *************************************************************************************************************
local COMP_SECURITY_HOUSE = {
	TypeName = "COMP_SECURITY_HOUSE",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Score", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "DayScoreChanged", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "DaySpawnedTheftPoint", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
    }
}

-- Register custom Class
mod:registerClass(COMP_SECURITY_HOUSE)



-- -- *************************************************************************************************************
-- -- Custom Component: Prisoner Position -------------------------------------------------------------------------------------
-- -- Prisoners go to these positions during their work cycle
-- -- *************************************************************************************************************
-- local COMP_SECURITY_PRISONERPOSITION = {
-- 	TypeName = "COMP_SECURITY_PRISONERPOSITION",
-- 	ParentType = "COMPONENT",
-- 	Properties = {
-- 		{ Name = "Reserved", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
-- 		{ Name = "DayReserved", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
--     }
-- }


-- -- Init -------------------------------------------------------------------------------------
-- function COMP_SECURITY_PRISONERPOSITION:onEnabled()

--     -- Daily script
--     local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
--     event.register(self, compMainGameLoop.ON_NEW_DAY, function()

--         local currentDay = CurrentDay(self)
--         if (self.DayReserved < (currentDay - 5)) then -- it's been too long since reservation, free up this position (outlaw got lost?)
--             self.Reserved = false
--             self.DayReserved = -1
--         end
    
--     end)
        
-- end


-- -- Register custom Class
-- mod:registerClass(COMP_SECURITY_PRISONERPOSITION)



-- *************************************************************************************************************
-- Custom Component: Security Villager -------------------------------------------------------------------------------------
-- Stores the length a villager has been unemployed
-- *************************************************************************************************************
local COMP_SECURITY_VILLAGER = {
	TypeName = "COMP_SECURITY_VILLAGER",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "DayUnemployed", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
		{ Name = "DefenderFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "OutlawFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "PrisonerFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "Questioning", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "QuestioningVillager", Type = "COMP_SECURITY_VILLAGER", Default = nil, Flags = { "SAVE_GAME" } },
		{ Name = "TheftPoint", Type = "COMP_SECURITY_OUTLAWTHEFTPOINT", Default = nil, Flags = { "SAVE_GAME" } },
		{ Name = "OutlawPosition", Type = "COMP_SECURITY_OUTLAWPOSITION", Default = nil, Flags = { "SAVE_GAME" } },
		-- { Name = "RallyPosition", Type = "COMP_SECURITY_RALLYPOSITION", Default = nil, Flags = { "SAVE_GAME" } },
		{ Name = "SoldierPosition", Type = "COMP_SECURITY_SOLDIERPOSITION", Default = nil, Flags = { "SAVE_GAME" } },
		-- { Name = "PrisonerPosition", Type = "COMP_SECURITY_PRISONERPOSITION", Default = nil, Flags = { "SAVE_GAME" } },
    }
}

-- Register custom Class
mod:registerClass(COMP_SECURITY_VILLAGER)



-- *************************************************************************************************************
-- Custom Component: Patrol Arrow -------------------------------------------------------------------------------------
-- Keeps track of whether it has been used in the last n seconds
-- *************************************************************************************************************
local COMP_SECURITY_GUARD_ARROW = {
	TypeName = "COMP_SECURITY_GUARD_ARROW",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Used", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "DayUsed", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_GUARD_ARROW:onEnabled()

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)
        if (self.DayUsed > 0) and (self.DayUsed < (currentDay - 4)) then -- expired after five days
            self.Used = false
            self.DayUsed = -1
        end

    end)

end


-- Register custom Class
mod:registerClass(COMP_SECURITY_GUARD_ARROW)

-- Attach class to prefab
mod:registerPrefabComponent("PREFAB_SECURITY_PATROLPOINT", { DataType = "COMP_SECURITY_GUARD_ARROW" } )



-- *************************************************************************************************************
-- Custom Component: New Immigrant -------------------------------------------------------------------------------------
-- Make an outlaw as soon as a new immigrant is enabled
-- *************************************************************************************************************
local COMP_SECURITY_IMMIGRANT = {
	TypeName = "COMP_SECURITY_IMMIGRANT",
	ParentType = "COMPONENT",
	Properties = {
    }
}

-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_IMMIGRANT:init()
    self.gameActionOutlaw = nil
end


-- onEnabled -------------------------------------------------------------------------------------
function COMP_SECURITY_IMMIGRANT:onEnabled()

    self.gameActionOutlaw = foundation.createData(
        {
            DataType = "GAME_ACTION_TRIGGER_EVENT_CALLBACK",
            Callback = {
                DataType = "EVENT_CALLBACK_TRIGGER_EVENT",
                Event = "EVENT_SECURITY_OUTLAW_NEW",
                Delay = 0
            }
        }
    )

end


-- Update -------------------------------------------------------------------------------------
function COMP_SECURITY_IMMIGRANT:update()

    local compVillager = self:getOwner():getComponent("COMP_VILLAGER")
    if compVillager.Enabled then

        -- register the outlaw flag so that the villager will stay an outlaw until caught
        compVillager:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag = true

        -- trigger outlaw notification
        -- compVillager:changeJob("JOB_SECURITY_EVENT_OUTLAW_NEW")
        self.gameActionOutlaw:execute(self:getLevel())

        -- make an outlaw
        compVillager:changeJob("JOB_SECURITY_OUTLAW")

        -- -- trigger outlaw notification
        -- local objVillageCenter = nil
        -- self:getLevel():getComponentManager("COMP_BUILDING_PART"):getAllEnabledComponent():forEach(function(compPart)
        --     if compPart:getOwner().Name == "TempVillageCenterPart" then
        --         objVillageCenter = compPart:getOwner()
        --         mod:log("Found village center")
        --     end
        -- end)

        -- if objVillageCenter then
        --     local compDepot = objVillageCenter:getComponent("COMP_RESOURCE_DEPOT")
        --     if compDepot then
        --         for i = 1, #compDepot.OutputInventory.Inventory.Collection do
        --             mod:log(tostring(compDepot.OutputInventory.Inventory.Collection[i].Resource) .. "  " .. tostring(compDepot.OutputInventory.Inventory.Collection[i].Quantity))
        --             if tostring(compDepot.OutputInventory.Inventory.Collection[i].Resource) == "Asset [\"RESOURCE_SECURITY_EVENT_TRIGGER.data - ASSET\"]" then
        --                 compDepot.OutputInventory.Inventory.Collection[i].Quantity = 3
        --                 mod:log("Set inventory to 3 to trigger")
        --             end
        --         end
        --     end
        -- end

        -- log
        mod:log("New villager " .. compVillager:getOwner().Name .. " arrived as an outlaw immigrant.")

        -- remove this component
        self:getOwner():removeComponent(self)

    end

end
-- Register custom Class
mod:registerClass(COMP_SECURITY_IMMIGRANT)
