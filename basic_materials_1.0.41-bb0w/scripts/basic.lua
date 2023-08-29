local mod = ...



-- Variables --------------------------------------------------------------------------------------------------------
LowestWaterElevation = 9999
TreeList = {}
local treeClearRadius = 6



-- Function: sort by elevation --------------------------------------------------------------------------------------
function SortByElevation(row1, row2)
    return row1.elevation < row2.elevation
end



-- Function: Get Water Elevation -------------------------------------------------------------------------------------
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



-- Function: Set Lowest Water Elevation -------------------------------------------------------------------------------------
function SetLowestWaterElevation(comp)

    -- Find the lowest point of water
    for x = 10, 1010, 10 do
        for y = 10, 1010, 10 do
            local waterElevation = GetWaterElevation(comp, {x, 0, y})
            if waterElevation > -9999 and waterElevation < LowestWaterElevation then
                LowestWaterElevation = waterElevation
            end
        end
    end

    -- No water, so base the lowest elevation on the lowest tree
    if LowestWaterElevation == 9999 then
        comp:getLevel():getComponentManager("COMP_TREE"):getAllEnabledComponent():forEach(function(compTree)
            local objTree = compTree:getOwner()
            local elevation = objTree:getGlobalPosition()[2]
            if elevation < LowestWaterElevation then LowestWaterElevation = elevation end
        end)
    end

    mod:log("Lowest Water Elevation set at " .. LowestWaterElevation)

end



-- Function: Get Tree list -------------------------------------------------------------------------------------
function GetTreeList(comp)
    comp:getLevel():getComponentManager("COMP_TREE"):getAllEnabledComponent():forEach(function(compTree)
        local objTree = compTree:getOwner()
        local posTree = objTree:getGlobalPosition()
        table.insert(TreeList, { objectId = objTree:getId(), x = posTree[1], y = posTree[3] })
    end)
end



-- Function: Get Ground Elevation -------------------------------------------------------------------------------------
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



-- Function: Is On Land -------------------------------------------------------------------------------------------------
function IsOnLand(comp, pos, height)

    local elevationGround = GetGroundElevation(comp, pos)

    local elevationWater = GetWaterElevation(comp, pos)
    -- if elevationWater == -9999 then elevationWater = LowestWaterElevation end

    -- mod:log("Water = " .. tostring(GetWaterElevation(comp, pos)) .. ", ground = " .. tostring(GetGroundElevation(comp, pos)))

    if (elevationWater > (elevationGround - height)) or (elevationGround == -9999) then -- this is not a suitable position (in or too near to water)
        return false
    else
        return true
    end

end



-- Function: Is Not Steep -------------------------------------------------------------------------------------------------
function IsNotSteep(comp, pos, range, maxSlope)

    local elevationList = {}
    local radius = range / 2
    for x = pos[1] - radius, pos[1] + radius, range - 0.1 do
        for y = pos[3] - radius, pos[3] + radius, range - 0.1 do
            local elevationGround = GetGroundElevation(comp, {x, 0, y})
            if elevationGround then
                table.insert(elevationList, { elevation = elevationGround })
            end
        end
    end

    table.sort(elevationList, SortByElevation)

    -- for i = 1, #elevationList do
    --     mod:log(elevationList[i])
    -- end

    if (math.abs(elevationList[#elevationList].elevation - elevationList[1].elevation) / range) > maxSlope then
        return false
    else
        return true
    end

end



-- Function: Height Above Water -------------------------------------------------------------------------------------------------
function HeightAboveWater(comp, pos)

    local elevationWater = GetWaterElevation(comp, pos)
    local elevationGround = GetGroundElevation(comp, pos)
    if elevationWater == -9999 then elevationWater = LowestWaterElevation end
    return elevationGround - elevationWater

end



-- Change starting inventory -------------------------------------------------------------------------------------
mod:overrideAsset({
	Id = "DEFAULT_VILLAGE_CENTER_INVENTORY",
	Collection = {
		Action = "APPEND",
        {Resource = "RESOURCE_CLAY", Quantity = 60},
        {Resource = "RESOURCE_THATCH", Quantity = 60},
        {Resource = "RESOURCE_SHINGLE", Quantity = 40},
        {Resource = "RESOURCE_TILE", Quantity = 40},
        {Resource = "TOOL", Quantity = 30}, -- because buildings require more tools now
    },
})



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/BasicMaterials1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ShingleSplitterPart", "PREFAB_BASIC_SHINGLE")

mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ClayPart", "PREFAB_BASIC_CLAYPIT")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ClayDeposit", "PREFAB_BASIC_CLAYDEPOSIT")
-- mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ClayWorkerPart1", "PREFAB_BASIC_CLAYPIT_WORKER1")
-- mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ClayWorkerPart2", "PREFAB_BASIC_CLAYPIT_WORKER2")

mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ThatchPart", "PREFAB_BASIC_THATCHER")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/ReedPart", "PREFAB_BASIC_REEDBED")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/Reed", "PREFAB_BASIC_REED")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/CollectionReed.Small", "PREFAB_BASIC_COLLECTION_REED_SMALL")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/CollectionReed.Large", "PREFAB_BASIC_COLLECTION_REED_LARGE")

mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterPart", "PREFAB_BASIC_POTTERKILN")
-- mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterWorkerPart1", "PREFAB_BASIC_POTTERKILN_WORKER1")
-- mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterWorkerPart2", "PREFAB_BASIC_POTTERKILN_WORKER2")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterCartPart", "PREFAB_BASIC_POTTERCART")

mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/TerrainCheck", "PREFAB_BASIC_TERRAINCHECK")



-- Grass and tree clearing -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_BASIC_CLAYDEPOSIT", {
	DataType = "COMP_DIRT_CIRCLE",
	IsPermanent = true,
	HardRadius = 0.0,
	SoftRadius = 8.0,
	Strength = 0.30, -- any higher than 0.10, and houses won't consistently spawn
})



-- Paths: Pottery Cart
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterCartPart/PATH_A_1.RESOURCE_POTTERY", "PATH_BASIC_POTTERCART1")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterCartPart/PATH_B_1.RESOURCE_POTTERY", "PATH_BASIC_POTTERCART2")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterCartPart/PATH_C_1.RESOURCE_POTTERY", "PATH_BASIC_POTTERCART3")
mod:registerAssetId("models/BasicMaterials1.fbx/Prefab/PotterCartPart/PATH_D_1.RESOURCE_POTTERY", "PATH_BASIC_POTTERCART4")

mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/PotterCartPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_BASIC_POTTERCART1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_BASIC_POTTERCART2" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_BASIC_POTTERCART3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_BASIC_POTTERCART4" }
        },
    }
})



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ThatchPart/Thatch.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ThatchPart/Thatch.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ThatchPart/Thatch.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/Reed", {DataType = "COMP_GROUNDED", AutoDisable = true})

for i=1, 4, 1 do
	mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ClayPart/Bucket." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

for i=1, 115, 1 do
	mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ReedPart/Reed." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

for i=1, 12, 1 do
	mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/PotterPart/Pottery." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

for i=1, 15, 1 do
	mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ClayDeposit/Nodule." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED", SetOrientation = true, AutoDisable = true})
end

mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ShingleSplitterPart", {DataType = "COMP_GROUNDED", SetOrientation = true})



-- Material -------------------------------------------------------------------------------------
mod:registerAssetId("models/BasicMaterials1.fbx/Materials/Material.Reed", "MATERIAL_REED")
mod:overrideAsset({
    Id = "MATERIAL_REED",
    HasAlphaTest = true,
    BackFaceVisible = true,
})

mod:registerAssetId("models/BasicMaterials1.fbx/Materials/Material.ReedShort", "MATERIAL_REED_SHORT")
mod:overrideAsset({
    Id = "MATERIAL_REED_SHORT",
    HasAlphaTest = true,
    BackFaceVisible = true,
})

mod:registerAssetId("models/BasicMaterials1.fbx/Materials/Material.Clay", "MATERIAL_CLAY")
-- mod:overrideAsset({
--     Id = "MATERIAL_CLAY",
--     HasShadow = false,
-- })

mod:registerAssetId("models/BasicMaterials1.fbx/Materials/Material.Clay.Depleted", "MATERIAL_CLAY_DEPLETED")
-- mod:overrideAsset({
--     Id = "MATERIAL_CLAY_DEPLETED",
--     HasShadow = false,
-- })



-- Plantable -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ReedPart", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 0.2 })



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/Reed", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_THATCH",
    IsReplenishable = true,
    ReplenishDurationInDays = 60,
    ReplenishQuantity = 1,
    ReplenishedMaterial = "MATERIAL_REED",
    DepletedMaterial = "MATERIAL_REED_SHORT",
    ResourceValue = 1, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 2.0, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = false,
    HasMaximumWorkstation = false,
})

for i=1, 115, 1 do
    mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ReedPart/Reed." .. string.sub("000" .. i, -3), {
        DataType = "COMP_RESOURCE_CONTAINER",
        ResourceData = "RESOURCE_THATCH",
        IsReplenishable = true,
        ReplenishDurationInDays = 60,
        ReplenishQuantity = 1,
        ReplenishedMaterial = "MATERIAL_REED",
        DepletedMaterial = "MATERIAL_REED_SHORT",
        ResourceValue = 1, -- how many are gathered with each pick
        AvailableQuantity = 1, -- maximum container stock
        Radius = 2.0, -- distance from container that the villager will stand to pick
        IsDestroyWhenEmpty = false,
        HasMaximumWorkstation = false,
    })
end

for i=1, 15, 1 do
    mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/ClayDeposit/Nodule." .. string.sub("000" .. i, -3), {
        DataType = "COMP_RESOURCE_CONTAINER",
        ResourceData = "RESOURCE_CLAY",
        IsReplenishable = true,
        ReplenishDurationInDays = 28,
        ReplenishQuantity = 4,
        ReplenishedMaterial = "MATERIAL_CLAY",
        DepletedMaterial = "MATERIAL_CLAY_DEPLETED",
        ResourceValue = 1, -- how many are gathered with each pick
        AvailableQuantity = 4, -- maximum container stock
        Radius = 1.2, -- distance from container that the villager will stand to pick
        IsDestroyWhenEmpty = false,
        HasMaximumWorkstation = false,
    })
end



-- Smoke Emitter -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/PotterPart/SmokeEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/BasicMaterials1.fbx/Prefab/PotterPart/SmokeEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})



-- Component ---------------------------------------------------------------------------------------------------
local COMP_BASIC_DEPOSIT = {
	TypeName = "COMP_BASIC_DEPOSIT",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "InitFlag",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
    }
}

-- onEnabled 
function COMP_BASIC_DEPOSIT:onEnabled()

    self:convert()

end

-- Convert
function COMP_BASIC_DEPOSIT:convert()

    if not self.InitFlag then

        SetLowestWaterElevation(self)
        GetTreeList(self)

        -- Find minimum and maximum elevation
        local maxElevation = -1000
        local minElevation = 1000
        self:getLevel():getComponentManager("COMP_TREE"):getAllEnabledComponent():forEach(function(compTree)
            local objTree = compTree:getOwner()
            local elevation = objTree:getGlobalPosition()[2]
            if elevation < minElevation then minElevation = elevation end
            if elevation > maxElevation then maxElevation = elevation end
        end)

        local factorElevation = 0.25 -- 25% lowest terrain
        if maxElevation - minElevation < 20 then factorElevation = 1 end -- very flat maps should include all terrain
        maxElevation = minElevation + ((maxElevation - minElevation) * factorElevation) -- deposits must be in the lowest x% of possible elevations



        mod:log("Min elevation = " .. tostring(minElevation))
        mod:log("Max elevation = " .. tostring(maxElevation))

        local countNew = 0
        local treeClearList = {}

        -- Clay deposits
        local countClay = 30
        local tryCount = 200
        repeat

            local randX = math.random(10, 1010)
            local randY = math.random(10, 1010)

            local elevation = GetGroundElevation(self, {randX, 0, randY})
            if elevation > minElevation and elevation < maxElevation then
                tryCount = tryCount - 1
                if IsOnLand(self, {randX, 0, randY}, 0.25) then
                    if IsNotSteep(self, {randX, 0, randY}, 5, 0.30) then

                        local objNew = self:getLevel():createObject("PREFAB_BASIC_CLAYDEPOSIT", {randX, elevation, randY})
                        objNew:rotateLocalY(2 * math.pi * math.random())
                        objNew:setScale(math.random(70, 130) / 100)
                        countClay = countClay - 1
                        countNew = countNew + 1

                        local xMin = randX - treeClearRadius
                        local xMax = randX + treeClearRadius
                        local yMin = randY - treeClearRadius
                        local yMax = randY + treeClearRadius
                        for i = 1, #TreeList do
                            if TreeList[i].x >= xMin and TreeList[i].x <= xMax and TreeList[i].y >= yMin and TreeList[i].y <= yMax then
                                table.insert(treeClearList, { objectId = TreeList[i].objectId })
                            end
                        end

                    end
                end
            end

        until countClay <= 0 or tryCount <= 0

        mod:log("Placed " .. countNew .. " clay deposits.")

        -- Reed beds
        local countReeds = 3500
        countNew = 0

        -- Find a list of points that are in the water
        local waterList = {}
        for x = 10, 1010, 10 do
            for y = 10, 1010, 10 do
                if not IsOnLand(self, {x, 0, y}, 0.5) then
                    local elevation = GetWaterElevation(self, {x, 0, y})
                    table.insert(waterList, { position = {x, elevation, y}, elevation = elevation })
                end
            end
        end

        table.sort(waterList, SortByElevation)

        -- Find points next to the water that are on land
        local spawnList = {}
        for i = 1, #waterList do
            local objTerrainCheck = self:getLevel():createObject("PREFAB_BASIC_TERRAINCHECK", waterList[i].position)
            local listCheck = {}
            objTerrainCheck:forEachChild(function(objCheck)
                local posCheck = objCheck:getGlobalPosition()
                if IsOnLand(self, posCheck, 0.5) then
                    if IsNotSteep(self, posCheck, 5, 0.80) then
                        table.insert(listCheck, { position = posCheck, elevation = posCheck[2] })
                    end
                end
            end)

            -- There is at least one point on land nearby
            if #listCheck > 0 then
                table.sort(listCheck, SortByElevation)
                table.insert(spawnList, { position = objTerrainCheck:getGlobalPosition() })
            end
        end

        -- Spawn collections at these spots
        for i = 1, #spawnList do
            if countReeds > 0 then
                local pickSpawn = math.random(1, #spawnList)
                local objCollectionLarge = self:getLevel():createObject("PREFAB_BASIC_COLLECTION_REED_LARGE", spawnList[pickSpawn].position)
                objCollectionLarge:rotateLocalY(2 * math.pi * math.random())

                -- Loop through the positions of the big collection
                objCollectionLarge:forEachChild(function(objPositionSmall)
                    local posCollectionSmall = objPositionSmall:getGlobalPosition()
                    local heightAboveWater = HeightAboveWater(self, posCollectionSmall)
                    if heightAboveWater > 0 and heightAboveWater < 1.25 then
                        if IsNotSteep(self, posCollectionSmall, 5, 0.80) then
                            if math.random() < 1.25 then
                                local objCollectionSmall = self:getLevel():createObject("PREFAB_BASIC_COLLECTION_REED_SMALL", posCollectionSmall)
                                objCollectionSmall:rotateLocalY(2 * math.pi * math.random())

                                -- Clear trees
                                local xMin = posCollectionSmall.x - treeClearRadius
                                local xMax = posCollectionSmall.x + treeClearRadius
                                local yMin = posCollectionSmall.z - treeClearRadius
                                local yMax = posCollectionSmall.z + treeClearRadius
                                for i = 1, #TreeList do
                                    if TreeList[i].x >= xMin and TreeList[i].x <= xMax and TreeList[i].y >= yMin and TreeList[i].y <= yMax then
                                        table.insert(treeClearList, { objectId = TreeList[i].objectId })
                                    end
                                end

                                -- Loop through the positions within the small collection
                                objCollectionSmall:forEachChild(function(objPositionReed)
                                    if math.random() < 0.85 then
                                        local objReed = self:getLevel():createObject("PREFAB_BASIC_REED", objPositionReed:getGlobalPosition())
                                        objReed:rotateLocalY(2 * math.pi * math.random())
                                        objReed:setScale(math.random(70, 130) / 100)
                                        objReed:removeComponent(objReed:getComponent("COMP_GROUNDED")) -- performance improvement
                                        countNew = countNew + 1
                                        countReeds = countReeds - 1
                                    end
                                end)

                            end
                        end
                    end
                end)

                table.remove(spawnList, pickSpawn) -- so you don't spawn the same point again
            end
        end

        -- Place more reeds if not enough water spawn points were found, e.g., there is no water on the map
        if countReeds > 0 then
            tryCount = 100
            repeat

                local randX = math.random(10, 1010)
                local randY = math.random(10, 1010)

                local elevation = GetGroundElevation(self, {randX, 0, randY})
                if elevation > minElevation and elevation < maxElevation then

                    -- Spawn large collection
                    tryCount = tryCount - 1
                    local objCollectionLarge = self:getLevel():createObject("PREFAB_BASIC_COLLECTION_REED_LARGE", {randX, elevation, randY})
                    objCollectionLarge:rotateLocalY(2 * math.pi * math.random())

                    -- Loop through children of large collection
                    objCollectionLarge:forEachChild(function(objPositionSmall)

                        if math.random() < 0.50 then

                            local posCollectionSmall = objPositionSmall:getGlobalPosition()
                            if IsOnLand(self, posCollectionSmall, 0.1) then
                                if IsNotSteep(self, posCollectionSmall, 5, 0.30) then

                                    local objCollectionSmall = self:getLevel():createObject("PREFAB_BASIC_COLLECTION_REED_SMALL", posCollectionSmall)
                                    objCollectionSmall:rotateLocalY(2 * math.pi * math.random())

                                    -- Clear trees
                                    local xMin = posCollectionSmall.x - treeClearRadius
                                    local xMax = posCollectionSmall.x + treeClearRadius
                                    local yMin = posCollectionSmall.z - treeClearRadius
                                    local yMax = posCollectionSmall.z + treeClearRadius
                                    for i = 1, #TreeList do
                                        if TreeList[i].x >= xMin and TreeList[i].x <= xMax and TreeList[i].y >= yMin and TreeList[i].y <= yMax then
                                            table.insert(treeClearList, { objectId = TreeList[i].objectId })
                                        end
                                    end

                                    -- Loop through the reed positions within the small collection
                                    objCollectionSmall:forEachChild(function(objPositionReed)
                                        if math.random() < 0.85 then
                                            local objReed = self:getLevel():createObject("PREFAB_BASIC_REED", objPositionReed:getGlobalPosition())
                                            objReed:rotateLocalY(2 * math.pi * math.random())
                                            objReed:setScale(math.random(70, 130) / 100)
                                            objReed:removeComponent(objReed:getComponent("COMP_GROUNDED")) -- performance improvement
                                            countNew = countNew + 1
                                            countReeds = countReeds - 1
                                        end
                                    end)

                                end
                            end

                        end

                    end)
                end

            until countReeds <= 0 or tryCount <= 0
        end

        mod:log("Placed " .. countNew .. " reeds.")


        -- Remove trees
        local destroyCount = 0
        for i = 1, #treeClearList do
            local obj = self:getLevel():find(treeClearList[i].objectId)
            if obj then
                obj:destroy()
                destroyCount = destroyCount + 1
            end
        end

        mod:log("Removed " .. destroyCount .. " trees around clay deposits and reeds.")


        self.InitFlag = true

    end

end

-- Register custom Class
mod:registerClass(COMP_BASIC_DEPOSIT)

-- Attach class to prefab
mod:registerPrefabComponent("PREFAB_MANAGER", { DataType = "COMP_BASIC_DEPOSIT" } )

