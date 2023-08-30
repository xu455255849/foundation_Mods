local mod = ...



-- *************************************************************************************************************
-- Custom Component: Rally Position -------------------------------------------------------------------------------------
-- Soldiers go to these positions before clearing the Outlaw camp
-- *************************************************************************************************************
local COMP_SECURITY_RALLYPOSITION = {
	TypeName = "COMP_SECURITY_RALLYPOSITION",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Reserved", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "DayReserved", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
		{ Name = "SendSoldier", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_RALLYPOSITION:onEnabled()

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)
        if (self.DayReserved < (currentDay - 5)) then -- it's been too long since reservation, free up this position (soldier got lost)
            self.Reserved = false
            self.DayReserved = -1
        end
    
    end)
        
end


-- Register custom Class
mod:registerClass(COMP_SECURITY_RALLYPOSITION)




-- *************************************************************************************************************
-- Custom Component: Rally -------------------------------------------------------------------------------------
-- A component embedded in the rally point for five guards
-- *************************************************************************************************************
local COMP_SECURITY_RALLY = {
	TypeName = "COMP_SECURITY_RALLY",
	ParentType = "COMPONENT",
	Properties = {
		-- { Name = "RallyPositionList", Type = "list<COMP_SECURITY_RALLYPOSITION>", Default = nil, Flags = { "SAVE_GAME" } },
		{ Name = "TargetCamp", Type = "COMP_SECURITY_OUTLAWCAMP", Default = nil, Flags = { "SAVE_GAME" } },
		{ Name = "SoldiersSent", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "DayMissionGiven", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_RALLY:onEnabled()

    -- -- Record child components if not recorded already
    -- if not (self.RallyPositionList[1]) then
    --     local compRallyPosition = nil
    --     self:getOwner():forEachChild(function(child)
    --         if (string.find(child.Name, "RallyPosition")) then
    --             compRallyPosition = child:getOrCreateComponent("COMP_SECURITY_RALLYPOSITION")
    --             if (compRallyPosition) then
    --                 table.insert(self.RallyPositionList, compRallyPosition)
    --             end
    --         end
    --     end)
    -- end
    -- -- mod:log("RallyPositionList: " .. tostring(self.RallyPositionList))

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)

        -- Clear old missions that are stale (should not happen but just in case)
        if (self.DayMissionGiven < (currentDay - 7)) then
            self:resetRally()
        end

        -- Clear missions that were given but no soldiers were sent for two days (will release soldiers from waiting for a mission if there are not enough to go)
        if (self.DayMissionGiven > 0) and (self.DayMissionGiven < (currentDay - 1)) and not (self.SoldiersSent) then
            self:resetRally()
            -- mod:log("Rally has expired")
        end

        -- Issue new mission
        local compWork = self:getOwner():getComponent("COMP_WORKPLACE")
        local compOutlawCamp = nil
        local compOutlawCampDest = nil
        local objSolPos = nil
        local compSolPos = nil
        
        if (compWork) then
            local assignedSoldiers = compWork.AssignedWorkerList
            local countSoldiers = nil
            countSoldiers = 0

            -- mod:log("Assigned soldiers: " .. tostring(assignedSoldiers))
            for i = 1, #assignedSoldiers do
                if (assignedSoldiers[i]) then
                    countSoldiers = countSoldiers + 1
                end
            end

            if (countSoldiers >= 3) then
                -- mod:log("There are at least 3 soldiers in this workplace")

                if not (self.SoldiersSent) then
                    -- mod:log("Soldiers have not been sent yet")

                    -- Check that at least 3 guards are around the rally point
                    local posRally = self:getOwner():getGlobalPosition()
                    local posSoldier = nil
                    local countPresent = 0
                    local dist = nil

                    for i = 1, #assignedSoldiers do

                        if (assignedSoldiers[i]) then
                            -- mod:log(tostring(assignedSoldiers[i]))
                            local objSoldier = assignedSoldiers[i]:getOwner()
                            if (objSoldier) then

                                posSoldier = objSoldier:getGlobalPosition()
                                dist = math.sqrt( (posRally.x - posSoldier.x)^2 + (posRally.z - posSoldier.z)^2 )

                                if (dist <= 10) then
                                    countPresent = countPresent + 1
                                end

                            end
                        end

                    end
                    -- mod:log("There are " .. countPresent .. " soldiers present at the rally.")

                    if (countPresent >= 3) then

                        -- Find the nearest camp with no reservations
                        self:getLevel():getComponentManager("COMP_SECURITY_OUTLAWCAMP"):getAllEnabledComponent():forEach(function(compOutlawCamp)

                            -- mod:log("Inspecting camp: " .. tostring(compOutlawCamp))

                            -- Count reservations
                            local countReservation = 0
                            compOutlawCamp:getOwner():forEachChild(function(child)
                                if (string.find(child.Name, "SoldierPosition")) then
                                    objSolPos = child
                                    compSolPos = objSolPos:getOrCreateComponent("COMP_SECURITY_SOLDIERPOSITION")
                                    if (compSolPos) then
                                        if (compSolPos.Reserved) then
                                            countReservation = countReservation + 1
                                        end
                                    end
                                end

                                if (countReservation == 0) then
                                    compOutlawCampDest = compOutlawCamp
                                end

                                -- mod:log("Reservations = " .. countReservation)
                            end)
                        end)
                    end

                    if (compOutlawCampDest) then
                        self:sendSoldiers(compOutlawCampDest)
                        -- mod:log("Outlaw camp clearance mission given to the Rally guards.")
                    else
                        -- mod:log("No orders yet to clear camp.")
                    end
                    
                end

            else
                -- mod:log("There are not at least 3 soldiers employed")

            end
        end


    end)

end



-- -- onDestroy -------------------------------------------------------------------------------------
-- function COMP_SECURITY_RALLY:onDestroy(isClearingLevel)

--     local compWork = self:getOwner():getComponent("COMP_WORKPLACE")
--     if (compWork) then 
--         local assignedWorkers = compWork.AssignedWorkerList
--         if (#assignedWorkers > 0) then

--             for i = 1, #assignedWorkers do

--                 if (assignedWorkers[i]) then

--                     -- Unemploy any soldiers assigned to this workplace so that they pick up normal Soldier behaviours again
--                     assignedWorkers[i]:changeJob(nil)
--                     assignedWorkers[i]:changeJob("SOLDIER")

--                 end

--             end

--         end
--     end

-- end


function COMP_SECURITY_RALLY:sendSoldiers(compOutlawCamp)

    self:getOwner():forEachChild(function(child)
        if (string.find(child.Name, "RallyPosition")) then
            local objRallyPos = child
            local compRallyPos = objRallyPos:getComponent("COMP_SECURITY_RALLYPOSITION")
            if (compRallyPos) then
                compRallyPos.SendSoldier = true -- this is picked up by the soldier rally behaviour tree
                -- mod:log("Individual rally position marked to SendSoldier")
            end
        end
    end)

    self.TargetCamp = compOutlawCamp -- this is picked up by the rally behaviour tree
    self.DayMissionGiven = CurrentDay(self)
    self.SoldiersSent = true

end


function COMP_SECURITY_RALLY:resetRally()

    self.SoldiersSent = false
    self.TargetCamp = nil
    self.DayMissionGiven = 0

    -- Reset SendSoldier status for each rally position, and remove rallyposition from villager attributes
    self:getOwner():forEachChild(function(child)
        if (string.find(child.Name, "RallyPosition")) then
            local objRallyPos = child
            local compRallyPos = objRallyPos:getComponent("COMP_SECURITY_RALLYPOSITION")
            if (compRallyPos) then

                compRallyPos.SendSoldier = false

                -- Remove rally position if it appears in any soldier attribute
                self:getLevel():getComponentManager("COMP_SECURITY_VILLAGER"):getAllComponent():forEach(function(compRallyPos2)

                    if (compRallyPos == compRallyPos2) then
                        compRallyPos2 = nil
                    end

                end)

                -- mod:log("Rally position no longer has SendSoldier status")
            end
        end
    end)

    mod:log("Rally reset from the component.")

end


-- Register custom Class
mod:registerClass(COMP_SECURITY_RALLY)


