local mod = ...



-- the number of villagers required before security monument is unlocked
function MinPopUnlock()
    return 20
    -- return 5 -- TESTING ONLY, REPLACE!!!
end


-- the number of villagers required before security effects are live (outlaws, bandits)
function MinPopCrime()
    return 50
    -- return 5 -- TESTING ONLY, REPLACE!!!
end


-- Grace period -------------------------------------------------------------------------------------
-- the number of days to wait after someone becomes unemployed, or after a workplace is built, to start the outlaw logic
function GraceDays(type)
    if (type == "Workplace") then
        return 14
    elseif (type == "Worker") then
        return 14
    elseif (type == "Bandit") then
        return 14
    else
        return 14
    end
    -- return 1 -- TESTING ONLY, REPLACE!!!
end



-- Random Float between -------------------------------------------------------------------------------------
function CurrentDay(comp)
    return comp:getLevel():getComponentManager("COMP_SECURITY"):getFirst().CurrentDay
end



-- Random Float between -------------------------------------------------------------------------------------
function RandomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end



-- Get Water Elevation -------------------------------------------------------------------------------------
function GetWaterElevation(comp, pos)

    local raycastResult = {} 
    local fromPosition = { pos[1], pos[2]+1000, pos[3] }
    local toPosition = { pos[1], pos[2]-1000, pos[3] }
    if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.WATER:toNumber()) then
        return -9999
    else
        return raycastResult["Position"][2]
    end

end



-- Get Ground Elevation -------------------------------------------------------------------------------------
function GetGroundElevation(comp, pos)

    local raycastResult = {} 
    local fromPosition = { pos[1], pos[2]+1000, pos[3] }
    local toPosition = { pos[1], pos[2]-1000, pos[3] }
    if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.TERRAIN:toNumber()) then
        return -9999
    else
        return raycastResult["Position"][2]
    end

end


-- Has building part collision -------------------------------------------------------------------------------------
-- Check a position to see if it collides with a building part, bridge, platform, or wall
function HasBuildingCollision(comp, pos)
    
    local found = true
    local radius = 1.5

    -- test a vertical line at the position
    local fromPosition = { pos[1], pos[2]+1000, pos[3] }
    local toPosition = { pos[1], pos[2]-1000, pos[3] }

    if not (CheckLine(comp, fromPosition, toPosition)) then

        local height = GetGroundElevation(comp, pos)
        for i = (height + 0.1), (height + 5.1), 0.25 do -- check different heights ranging from just above the ground, to 5m above

            -- line 1 (left to right)
            fromPosition = {pos[1] - radius, height, pos[3]}
            toPosition = {pos[1] + radius, height, pos[3]}

            if not (CheckLine(comp, fromPosition, toPosition)) then
                
                -- line 2 (across perpendicular to the first line)
                fromPosition = {pos[1], height, pos[3] - radius}
                toPosition = {pos[1], height, pos[3] + radius}

                if not (CheckLine(comp, fromPosition, toPosition)) then

                    -- line 3 (diagonal left up to right bottom)
                    fromPosition = {pos[1] - radius, height, pos[3] + radius}
                    toPosition = {pos[1] + radius, height, pos[3] - radius}

                    if not (CheckLine(comp, fromPosition, toPosition)) then

                        -- line 4 (diagonal left up to right bottom)
                        fromPosition = {pos[1] - radius, height, pos[3] - radius}
                        toPosition = {pos[1] + radius, height, pos[3] + radius}

                        if not (CheckLine(comp, fromPosition, toPosition)) then
                        
                            found = false

                        end
                    end
                end
            end
        end
    end

    return found

end


-- Check Line -------------------------------------------------------------------------------------
function CheckLine(comp, fromPosition, toPosition)

    local found = true
    local raycastResult = {}

    if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.BUILDING_PART:toNumber()) then
        -- mod:log("Didn't find building part")
        if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.BRIDGE:toNumber()) then
            -- mod:log("Didn't find bridge")
            if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.PLATFORM:toNumber()) then
                -- mod:log("Didn't find platform")
                if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.WALL_PART:toNumber()) then
                    -- mod:log("Didn't find wall part")
                    if not comp:getLevel():rayCast(fromPosition, toPosition, raycastResult, 2 ^ OBJECT_FLAG.BUILDING_PART_NON_INTERACTIVE:toNumber()) then
                        -- mod:log("Didn't find building part non interactive")
                        found = false
                    end
                end
            end
        end
    end

    return found

end



-- Get Random Position -------------------------------------------------------------------------------------
function GetNewCampPosition(comp, distFromParts)

    -- Try 50 times; it may be impossible to find a good position in some cases (e.g. player has bought and built on all hexes)
    for i = 1, 50 do

        -- Pick a random position, not too close to the map edges
        local pos = {50, 0, 50}
        pos[1] = math.random(20, 980)
        pos[3] = math.random(20, 980)

        -- mod:log("Testing potential outlaw camp position at " .. tostring(pos))

        local elevationWater = GetWaterElevation(comp, pos)
        local elevationGround = GetGroundElevation(comp, pos)

        if (elevationWater > (elevationGround - 2.5)) or (elevationGround == -9999) then -- this is not a suitable position (in or too near to water)
            -- mod:log("Position was found to be on water, trying again.")
        else

            -- Test for steepness
            local maxSlope = 0.4
            local maxSlopeFound = 0
            local testSlope = 0
            local testPointA = nil
            local testPointB = nil
            local radius = 5

            testPointA = GetGroundElevation(comp, {pos[1], pos[2], pos[3] + radius})
            testPointB = GetGroundElevation(comp, {pos[1], pos[2], pos[3] - radius})
            testSlope = math.abs(testPointA - testPointB) / (radius * 2) -- rise over run
            if testSlope > maxSlopeFound then
                maxSlopeFound = testSlope
            end

            testPointA = GetGroundElevation(comp, {pos[1] + radius, pos[2], pos[3]})
            testPointB = GetGroundElevation(comp, {pos[1] - radius, pos[2], pos[3]})
            testSlope = math.abs(testPointA - testPointB) / (radius * 2) -- rise over run
            if testSlope > maxSlopeFound then
                maxSlopeFound = testSlope
            end

            if maxSlopeFound > maxSlope then

            else

                -- test that the camp is at least `distFromParts` m from an existing building part
                local found = false
                comp:getLevel():getComponentManager("COMP_WORKPLACE"):getAllEnabledComponent():forEach(function(compWork)
                    local posPart = compWork:getOwner():getGlobalPosition()
                    local dist = math.sqrt( (pos[1] - posPart.x)^2 + (pos[3] - posPart.z)^2 )
                    if (dist < distFromParts) then
                        found = true
                    end
                end)

                if not (found) and not (HasBuildingCollision(comp, pos)) then

                    return pos

                end

            end

        end

    end

    return nil

end



-- Get Population -------------------------------------------------------------------------------------
function GetPopulation(comp)

    local count = 0
    comp:getLevel():getComponentManager("COMP_VILLAGER"):getAllEnabledComponent():forEach(function(compVillager)
        count = count + 1
    end)

    return count

end



-- Get Cutlaw count -------------------------------------------------------------------------------------
function GetOutlawCount(comp)

    local count = 0
    comp:getLevel():getComponentManager("COMP_SECURITY_VILLAGER"):getAllEnabledComponent():forEach(function(compSecVill)
        if (compSecVill.OutlawFlag) then
            count = count + 1
        end
    end)

    return count

end



-- Sort a table by column "dist" -------------------------------------------------------------------------------------
function SortByDist(row1, row2)
    return row1.dist < row2.dist
end
