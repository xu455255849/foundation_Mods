local mod = ...



-- ***********************************************************************************************************************************************************
-- ********** P A T H F I N D E R ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Explorer: Define component -------------------------------------------------------------------------------------
local COMP_SECURITY_PATHFINDER = {
	TypeName = "COMP_SECURITY_PATHFINDER",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "Type", Type = "string", Default = "OUTLAWCAMP", Flags = { "SAVE_GAME" } },
        { Name = "SpawnFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "Destination", Type = "vec3f", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "DestinationFound", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}


-- Explorer: Init -------------------------------------------------------------------------------------
function COMP_SECURITY_PATHFINDER:onEnabled()

    self.lastPosition = self:getOwner():getGlobalPosition()
    self.SpawnFlag = true
    self.timer = 10

    if self.Type == "OUTLAWCAMP" then
        local dest = GetNewCampPosition(self, 100)
        if (dest) then 
            self.Destination = dest
        end
    else
        local dest = GetNewCampPosition(self, 300)
        if (dest) then
            self.Destination = dest
        end
    end

end


-- Pathfinder: Update -------------------------------------------------------------------------------------
function COMP_SECURITY_PATHFINDER:update()

    -- update timer
    local dt = self:getLevel():getDeltaTime() -- how much real time passed since the last frame
    self.timer = self.timer - dt -- decrement the timer

    if dt == 0 then -- game is paused

    elseif (self.timer <= 0) then -- check position every n seconds

        -- check to see if Pathfinder is still moving
        local pos = self:getOwner():getGlobalPosition()
        local dist = math.sqrt( (pos.x - self.lastPosition[1])^2 + (pos.z - self.lastPosition[3])^2 )
        if (dist > 2) then -- moving

            mod:log("Pathfinder is moving, so a suitable position must have been found")
            self.lastPosition = pos
            self.DestinationFound = true

            if self.Type == "OUTLAWCAMP" then -- outlaw camp
                local objCamp = self:getLevel():createObject("PREFAB_SECURITY_OUTLAWCAMP1", self.Destination)
                objCamp:setRotationY(2 * math.pi * math.random())
            else -- bandit
                local compBanditController = self:getLevel():getComponentManager("COMP_SECURITY_BANDIT_CONTROLLER"):getFirst()
                compBanditController:createBandit("PREFAB_SECURITY_BANDIT1", self.Destination)
            end

            -- mod:log("New outlaw camp or bandit was created.")

            -- Self destruct the pathfinder
            mod:log("Pathfinder will self-destruct.")
            self:getOwner():destroy()

        else -- pathfinder is not moving

            -- Set a new destination
            if (self.Type == "OUTLAWCAMP") then
                local newCampDest = GetNewCampPosition(self, 100)
                if (newCampDest) then
                    self.Destination = newCampDest
                    mod:log("New destination set.")
                end
            else
                local newBanditDest = GetNewCampPosition(self, 300)
                if (newBanditDest) then
                    self.Destination = newBanditDest
                    mod:log("New destination set.")
                end
            end

        end

        self.timer = 10 -- reset timer

    end

end



-- -- Pathfinder: get new Camp or Bandit position -------------------------------------------------------------------------------------
-- function COMP_SECURITY_PATHFINDER:getNewPosition(distanceFromParts)

--     -- Try up to 50 times
--     for i = 1, 50 do

--         -- Pick a random position, not too close to the map edges
--         local pos = {0, 0, 0}
--         pos[1] = math.random(20, 980)
--         pos[3] = math.random(20, 980)

--         -- mod:log("Testing potential outlaw camp position at " .. tostring(pos))

--         local elevationWater = GetWaterElevation(self, pos)
--         local elevationGround = GetGroundElevation(self, pos)

--         if (elevationWater > (elevationGround - 2.5)) or (elevationGround == -9999) then -- this is not a suitable position (in or too near to water)
--             -- mod:log("Position was found to be on water, trying again.")
--         else

--             -- test that the camp is at least `distanceFromParts` meters from an existing building part
--             local found = false
--             self:getLevel():getComponentManager("COMP_BUILDING_PART"):getAllEnabledComponent():forEach(function(compPart)
--                 local posPart = compPart:getOwner():getGlobalPosition()
--                 local dist = math.sqrt( (pos[1] - posPart.x)^2 + (pos[3] - posPart.z)^2 )
--                 if (dist < distanceFromParts) then
--                     found = true
--                 end
--             end)
        
--             if not found then
--                 -- test that the camp does not collide with a building part, wall, or platform
--                 if not (HasBuildingCollision(self, pos)) then
--                     return pos
--                 end
--             end

--         end

--     end

--     return nil

-- end


-- Explorer: Register class
mod:registerClass(COMP_SECURITY_PATHFINDER)

