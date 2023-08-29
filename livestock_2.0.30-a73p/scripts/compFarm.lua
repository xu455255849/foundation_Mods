local mod = ...



-- Gaussian distribution -----------------------------------------------------------------------------
function Gaussian (mean, variance)
    return  math.sqrt(-2 * variance * math.log(math.random())) *
            math.cos(2 * math.pi * math.random()) + mean
end



-- Custom Component: Livestock Farm -------------------------------------------------------------------------------------
local COMP_LIVESTOCKFARM = {
	TypeName = "COMP_LIVESTOCKFARM",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "PrefabName",
            Type = "string",
            Default = "PREFAB_LIVESTOCK_COW",
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "AnimalCount",
            Type = "integer",
            Default = 0,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "Radius",
            Type = "float",
            Default = 1.0,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "LivestockSpawnFlag",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "SpawnedList",
            Type = "list<string>",
            Default = nil,
            Flags = { "SAVE_GAME" }
        },
    }
}



-- -- Custom Component: Livestock Brand (keep track of building spawned from) -------------------------------------------------------------------------------------
-- local COMP_LIVESTOCKFARM_BRAND = {
-- 	TypeName = "COMP_LIVESTOCKFARM_BRAND",
-- 	ParentType = "COMPONENT",
-- 	Properties = {
--         {
--             Name = "SpawningObjectGUID",
--             Type = "string",
--             Default = "",
--             Flags = { "SAVE_GAME" }
--         },
--         {
--             Name = "MarkForDestroy",
--             Type = "boolean",
--             Default = false,
--             Flags = { "SAVE_GAME" }
--         },
--     }
-- }

-- -- Register custom Class
-- mod:registerClass(COMP_LIVESTOCKFARM_BRAND)

-- -- Attach to prefabs
-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_COW", { DataType = "COMP_LIVESTOCKFARM_BRAND" } )



-- -- Resource Generator -------------------------------------------------------------------------------------
-- -- Each animal generates a small amount of resource without any inputs (based on using the pasture only)

-- -- Define custom class
-- local COMP_LIVESTOCKFARM_RESOURCEGENERATOR = {
-- 	TypeName = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR",
-- 	ParentType = "COMPONENT",
-- 	Properties = {
--         { Name = "ResourceGenerator", Type = "BUILDING_FUNCTION_RESOURCE_GENERATOR", Default = "BUILDING_FUNCTION_WELL"},
--         { Name = "MaxQuantity", Type = "integer", Default = 1 },
--         { Name = "GrowRate", Type = "float", Default = 0.0006 } -- 0.0024 is once a week, 0.0006 is once a month
--     }
-- }

-- -- Run when Init custom class
-- function COMP_LIVESTOCKFARM_RESOURCEGENERATOR:onEnabled()
--     comp = self:getOwner():getOrCreateComponent("COMP_RESOURCE_GENERATOR")
--     comp:setResourceGeneratorData(self.ResourceGenerator)
--     comp:setMaxQuantity(self.MaxQuantity)
--     comp.GrowRate = self.GrowRate
-- end

-- -- Register custom class
-- mod:registerClass(COMP_LIVESTOCKFARM_RESOURCEGENERATOR)

-- Create base function to generate each resource
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_RESOURCEGENERATOR_CATTLE",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_RESOURCEGENERATOR_CATTLE_NAME",
--     ResourceGenerated = "RESOURCE_CATTLE",
--     IsInfinite = false,
-- })

-- -- Attach resource generator to each point
-- for i=1, 4, 1 do
--     mod:registerPrefabComponent("models/Pasture1.fbx/Prefab/PasturePart/ResourceGenerator." .. string.sub("000" .. i, -3), {
--         DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", 
--         ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_RESOURCEGENERATOR_CATTLE",
--         MaxQuantity = 1,
--         GrowRate = 0.0006,
--     })
-- end



-- Custom Component: Initialise Farm -------------------------------------------------------------------------------------
function COMP_LIVESTOCKFARM:onEnabled()

    mod:log("COMP_LIVESTOCKFARM.onEnabled ______________________________________________________________________________________")

    -- testing
    -- local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    -- event.register(self, compMainGameLoop.ON_NEW_DAY, function()

    --     local pos = self:getOwner():getGlobalPosition()
    --     local moveX = 10
    --     self:getOwner():setGlobalPosition( { pos[1] + moveX, pos[2], pos[3] + moveX } )

    -- end)

    -- -- Attach event listener
    -- local compWork = self:getOwner():getComponent("COMP_WORKPLACE")
    -- mod:log(tostring(compWork))

    -- if (compWork) then
    --     event.register(self, compWork.ON_WORKPLACE_PRODUCED, function(resourceList)
    --         mod:log("WORKPLACE PRODUCED *******************************************")
    --     end)
    --     mod:log("COMP_WORKPLACE found, event registered")
    -- else
    --     mod:log("No COMP_WORKPLACE found")
    -- end

    -- event.register(self, compWork.ON_WORKPLACE_STATUS_UPDATE, function()
    --     mod:log("Workplace status updated **********************************************************************************")
    --     mod:log("PendingProductionCount: " .. tostring(compWork.PendingProductionCount))
    --     mod:log("IsPaused: " .. tostring(compWork.IsPaused))
    --     mod:log("CurrentProductionAmountList: " .. tostring(compWork.CurrentProductionAmountList))
    -- end)

    -- -- List all game objects and components for testing purposes
    -- self:getOwner():getParent():forEachChildRecursive(function(object)
    --     mod:log(tostring(object))        
    --     object:forEachComponent(function(comp)
    --         mod:log("   " .. tostring(comp))
    --     end)
    -- end)

    local posFarm = self:getOwner():getGlobalPosition() -- position of the farm

    if (self.LivestockSpawnFlag) then -- don't respawn, but move any animals that have escaped

        for i, idPair in ipairs(self.SpawnedList) do

            local obj = self:getLevel():find(self.SpawnedList[i]) -- find the animal game object
            -- local posLivestock = obj:getGlobalPosition() -- get animal's position
            -- local distance = (posLivestock.x - posFarm.x)^2 + (posLivestock.z - posFarm.z)^2 -- calculate distance from animal to farm
            -- if (distance > 20) then -- animal has strayed
            obj:setGlobalPosition(posFarm) -- return animal to the farm
            -- mod:log("Returned animal to farm: " .. self:getOwner():getId())
            -- end

            -- local compEnforcerRectangle = obj:getOrCreateComponent("COMP_ENFORCE_RECTANGLE")
            -- if (compEnforcerRectangle) then
            --     compEnforcerRectangle.Rectangle = {1,1}
            --     compEnforcerRectangle:setEnforcer(self:getOwner())
            -- end

            local compEnforcerRadius = obj:getOrCreateComponent("COMP_ENFORCE_RADIUS")
            if compEnforcerRadius then
                compEnforcerRadius.Radius = self.Radius
                compEnforcerRadius:setEnforcer(self:getOwner())
                -- mod:log("Radius enforcer object set.")
            end

            -- -- shrink the radius for the sheep pen since they were having collisions
            -- local compEnforcerRectangle = obj:getOrCreateComponent("COMP_ENFORCE_RECTANGLE")
            -- if (string.sub(self:getOwner().Name, 1, 8) == "SheepPen") then
            --     compEnforcerRectangle.Radius = 1
            --     -- mod:log("Sheep pen radius reduced")
            -- end

        end


    else -- spawn new animals

        local animalCount = self.AnimalCount
        local prefabName = self.PrefabName

        -- Spawn animals
        for i=1, animalCount, 1 do

            -- Create spawned animal and record Id
            local obj = self:getLevel():createObject(prefabName, posFarm)
            table.insert(self.SpawnedList, obj:getId())

            -- testing
            -- mod:log(tostring(obj:getComponent("COMP_AGENT").BehaviorTree))
            obj:getComponent("COMP_AGENT").BehaviorTree = nil

            -- mod:log("Printing list of cow components")
            -- obj:forEachComponent(function(comp)
            --     mod:log("  component: " .. tostring(comp))

            -- end)

            -- Randomly resize
            local _xy = Gaussian(100, 25) / 99.99
            local _z = Gaussian(100, 25) / 99.99
            obj:scale({_xy, _z, _xy})

            -- -- Change behaviour tree to move the animal within a radius
            -- if not (prefabName == "PREFAB_LIVESTOCK_COW") then
            -- local compEnforcerRectangle = obj:getOrCreateComponent("COMP_ENFORCE_RECTANGLE")
            -- if (compEnforcerRectangle) then
            --     compEnforcerRectangle.Rectangle = {1,1}
            --     compEnforcerRectangle:setEnforcer(self:getOwner())
            -- end

            local compEnforcerRadius = obj:getOrCreateComponent("COMP_ENFORCE_RADIUS")
            if compEnforcerRadius then
                compEnforcerRadius.Radius = self.Radius
                compEnforcerRadius:setEnforcer(self:getOwner())
                -- mod:log("Radius enforcer object set.")
            end

            -- local compEnforcerRadius = obj:getOrCreateComponent("COMP_ENFORCE_RADIUS")
            -- if (compEnforcerRadius) then
            --     compEnforcerRadius:setEnforcer(self:getOwner())
            -- end

            --     -- shrink the radius for the sheep pen since they were having collisions
            --     if (prefabName == "PREFAB_LIVESTOCK_SHEEP") and (string.sub(self:getOwner().Name, 1, 8) == "SheepPen") then
            --     -- compEnforcerRectangle.Rectangle = {2,2}
            --         compEnforcerRadius.Radius = 1
            --         -- mod:log("Sheep pen radius reduced")
            --     end

            -- end

        end

        -- Avoid respawning animals again the next time the component loads
        self.LivestockSpawnFlag = true

    end -- livestockspawnflag was not set

end -- component init end



-- Custom Component: onDestroy -------------------------------------------------------------------------------------
function COMP_LIVESTOCKFARM:onDestroy(isClearingLevel)

    if not (isClearingLevel) then
        mod:log("COMP_LIVESTOCKFARM.destroy ______________________________________________________________________________________")
        local id = self:getOwner():getId()

        for i, idPair in ipairs(self.SpawnedList) do
            local obj = self:getLevel():find(self.SpawnedList[i])
            obj:destroyAllChild()
            obj:destroy()
        end
    end

end



-- Register custom Class
mod:registerClass(COMP_LIVESTOCKFARM)


