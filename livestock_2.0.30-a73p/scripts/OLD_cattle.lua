local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Livestock2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/MilkCart2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })




-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Livestock2.fbx/Prefab/CattlePasture.Part.001", "PREFAB_LIVESTOCKFARM_CATTLEPASTURE1")

for i = 1, 4 do
    mod:registerAssetId("models/Livestock2.fbx/Prefab/CattleYard.Part.00" .. i, "PREFAB_LIVESTOCKFARM_CATTLEYARD" .. i)
    mod:registerAssetId("models/Livestock2.fbx/Prefab/CattlePen.Part.00" .. i, "PREFAB_LIVESTOCKFARM_CATTLEPEN" .. i)

    mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_CATTLEYARD" .. i, {
        DataType = "COMP_RESOURCE_DEPOT",
        Capacity = 10,
        OutgoingReservedResources = {},
        IncomingReservedResources = {},
    })

    mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_CATTLEPEN" .. i, {
        DataType = "COMP_RESOURCE_DEPOT",
        Capacity = 20,
        OutgoingReservedResources = {},
        IncomingReservedResources = {},
    })

end

mod:registerAssetId("models/textures/Blank.png", "TEXTURE_LIVESTOCKFARM_BLANK")

mod:registerAssetId("models/MilkCart2.fbx/Prefab/CartPart", "PREFAB_LIVESTOCKFARM_MILKCART")



-- Transparency -------------------------------------------------------------------------------------
mod:registerAssetId("models/Livestock2.fbx/Materials/Material.Hay3", "MATERIAL_LIVESTOCKFARM_HAY3")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_HAY3",
    HasAlphaTest = true
})

mod:registerAssetId("models/Livestock2.fbx/Materials/Material.Grass1", "MATERIAL_LIVESTOCKFARM_GRASS1")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_GRASS1",
    HasAlphaTest = true
})

mod:registerAssetId("models/Livestock2.fbx/Materials/Material.Flowers1", "MATERIAL_LIVESTOCKFARM_FLOWERS1")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_FLOWERS1",
    HasAlphaTest = true
})



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Hay.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Hay.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Shed.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Shed.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Trough.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/DungHeap.001", {DataType = "COMP_GROUNDED"})
for i=1, 18, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Hay.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Hay.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Hay.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Shed.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Shed.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Trough.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/DungHeap.002", {DataType = "COMP_GROUNDED"})
for i=51, 68, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Hay.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Hay.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Hay.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Shed.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Shed.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Trough.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/DungHeap.003", {DataType = "COMP_GROUNDED"})
for i=69, 86, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Hay.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Shed.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Shed.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Trough.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Trough.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/DungHeap.004", {DataType = "COMP_GROUNDED"})
for i=87, 104, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattleYard.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.001/Bucket.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.001/Bucket.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.001/Bucket.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.001/Hook.001", {DataType = "COMP_GROUNDED"})
for i=19, 26, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.002/Bucket.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.002/Bucket.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.002/Bucket.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.002/Hook.002", {DataType = "COMP_GROUNDED"})
for i=27, 34, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.003/Bucket.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.003/Bench.003", {DataType = "COMP_GROUNDED"})
for i=35, 42, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.004/Bucket.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.004/Bench.004", {DataType = "COMP_GROUNDED"})
for i=43, 50, 1 do
	mod:registerPrefabComponent("models/Livestock2.fbx/Prefab/CattlePen.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end



-- Paths: Milk cart -------------------------------------------------------------------------------------
mod:registerAssetId("models/MilkCart2.fbx/Prefab/CartPart/PATH_A_1", "PATH_MILKCART_A1")
mod:registerAssetId("models/MilkCart2.fbx/Prefab/CartPart/PATH_B_1", "PATH_MILKCART_B1")
mod:registerAssetId("models/MilkCart2.fbx/Prefab/CartPart/PATH_C_1", "PATH_MILKCART_C1")
mod:registerAssetId("models/MilkCart2.fbx/Prefab/CartPart/PATH_D_1", "PATH_MILKCART_D1")

mod:registerPrefabComponent("models/MilkCart2.fbx/Prefab/CartPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_MILKCART_A1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_MILKCART_B1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_MILKCART_C1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_MILKCART_D1" }
        },
    }
})



-- Building Part: Cattle Yard -------------------------------------------------------------------------------------
local poly1a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -4.00, -4.00 },
	{ -4.00, 4.00 },
	{ 4.00, 4.00 },
	{ 4.00, -4.00 },
	{ -4.00, -4.00 },
	{ -4.5, -7.0 },
	{ 4.5, -7.0 },
	{ 4.5, 4.5 },
	{ -4.5, 4.5 },
	{ -4.5, -7.0 },
}

local poly1b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -2.50, -2.50 },
	{ -2.50, 2.50 },
	{ 2.50, 2.50 },
	{ 2.50, -2.50 },
	{ -2.50, -2.50 },
	{ -3.00, -3.00 },
	{ 3.00, -3.00 },
	{ 3.00, 3.00 },
	{ -3.00, 3.00 },
	{ -3.00, -3.00 },
}

local poly1c = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ 4.5, -7.0 },
	{ 4.5, 4.5 },
	{ -4.5, 4.5 },
	{ -4.5, -7.0 },
}

for i=1, 4, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD" .. i .. "_NAME", 
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_CATTLEYARD" .. i,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0.5, 4.4, -10 },
                OrientationOffset = -15.0,
                CameraPitchOffset = 25.0
            },
        },
    })

end

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_CATTLEYARD1",
			"BUILDING_PART_LIVESTOCKFARM_CATTLEYARD2",
			"BUILDING_PART_LIVESTOCKFARM_CATTLEYARD3",
			"BUILDING_PART_LIVESTOCKFARM_CATTLEYARD4",
		},
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0.5, 4.4, -10 },
            OrientationOffset = -15.0,
            CameraPitchOffset = 25.0
        },
    },
    BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = poly1a,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            { 
                Polygon = poly1b,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createRectangle( {10, 4}, {0.0, -5.0} ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            },
            {
                Polygon = polygon.createRectangle( {10, 10}, {0.0, 0.0} ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEYARD",
    Cost = {
        BuildRightTaxes = { 
            { Resource = "GOLD_COINS", Quantity = 80 },
            -- { Resource = "RESOURCE_CATTLE", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 2 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 10 },
            },
        }
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "SUBSTRACT",
        Radius = 20.0,
        Value = 0.5
    } },
})



-- Building Part: Cattle Pen -------------------------------------------------------------------------------------
local poly2a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -2.00, -2.00 },
	{ -2.00, 2.00 },
	{ 2.00, 2.00 },
	{ 2.00, -2.00 },
	{ -2.00, -2.00 },
	{ -2.20, -2.20 },
	{ 2.20, -2.20 },
	{ 2.20, 2.20 },
	{ -2.20, 2.20 },
	{ -2.20, -2.20 },
}

local poly2b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -1.00, -1.00 },
	{ -1.00, 1.00 },
	{ 1.00, 1.00 },
	{ 1.00, -1.00 },
	{ -1.00, -1.00 },
	{ -1.50, -1.50 },
	{ 1.50, -1.50 },
	{ 1.50, 1.50 },
	{ -1.50, 1.50 },
	{ -1.50, -1.50 },
}

for i=1, 2, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER_NAME", 
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_CATTLEPEN" .. i,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 25.0
            },
        },
    })

end

for i=3, 4, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK_NAME",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_CATTLEPEN" .. i,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 25.0
            },
        },
    })

end

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER_NAME",
    Category = "OTHER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER1",
			"BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER2",
		},
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = poly2a,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            {
                Polygon = poly2b,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            { 
                Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        }
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_SLAUGHTER",
    Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 5 },
                { Resource = "TOOL", Quantity = 1 },
            },
        },
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "SUBSTRACT",
        Radius = 20.0,
        Value = 0.5
    } },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK_NAME",
    Category = "OTHER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK3",
			"BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_MILK4",
		},
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = poly2a,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            { 
                Polygon = poly2b,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_MILK",
    Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 5 },
            },
        },
    },
})



-- Job: Herder (yards) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_HERD",
	JobName = "JOB_LIVESTOCKFARM_HERD_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_HERD_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_LIVESTOCK_WORK",
	-- DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 10.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_HERD",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_HERD",
    },
})



-- Job: process -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_PROCESS",
	JobName = "JOB_LIVESTOCKFARM_PROCESS_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_PROCESS_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_LIVESTOCK_WORK",
	-- DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 15.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_PROCESS"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_PROCESS",
    },
})



-- Building Function: Cattle -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEYARD",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEYARD_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 10,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_HERD",
        Behavior = "BEHAVIOR_LIVESTOCK_WORK",
        -- Behavior = "BEHAVIOR_WORK",
	},
    InputInventoryCapacity = {
        { Resource = "WATER", Quantity = 50 },
        { Resource = "RESOURCE_HAY", Quantity = 20 },
    },
    ResourceListNeeded = {
        { Resource = "WATER", Quantity = 1 },
        { Resource = "RESOURCE_HAY", Quantity = 1 },
    },
    ResourceProduced = {
        { Resource = "RESOURCE_CATTLE", Quantity = 1 },
        { Resource = "RESOURCE_DUNG", Quantity = 2 },
    },
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_SLAUGHTER",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_SLAUGHTER_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_PROCESS",
        Behavior = "BEHAVIOR_LIVESTOCK_WORK",
        -- Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "RESOURCE_CATTLE", Quantity = 5 }
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CATTLE", Quantity = 1 }
	},
    ResourceProduced = {
		{ Resource = "BV1_CARCASS", Quantity = 1 },
		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
		-- { Resource = "RESOURCE_TALLOW", Quantity = 1 },
	},
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_MILK",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLE_MILK_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_PROCESS",
        Behavior = "BEHAVIOR_LIVESTOCK_WORK",
        -- Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "RESOURCE_CATTLE", Quantity = 5 }
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CATTLE", Quantity = 1 }
	},
    ResourceProduced = {
		{ Resource = "MILK", Quantity = 3 },
	},
})



-- Spawn cattle in yard and pen -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEYARD1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 5, Radius = 2.0 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEYARD2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 5, Radius = 2.0 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEYARD3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 5, Radius = 2.0 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEYARD4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 5, Radius = 2.0 } )

mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEPEN1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 1, Radius = 0.2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEPEN2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 1, Radius = 0.2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEPEN3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 1, Radius = 0.2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_CATTLEPEN4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_COW", AnimalCount = 1, Radius = 0.2 } )



-- Building Part: Cattle Barn (repupose Dairy Farm) -------------------------------------------------------------------------------------

-- Hide the vanilla monument
mod:overrideAsset({
    Id = "BUILDING_DAIRY_FARM",
    IsHidden = true,
})

-- Limit output inventory size
mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_CATTLEPASTURE1", {
    DataType = "COMP_RESOURCE_DEPOT",
    Capacity = 10,
    OutgoingReservedResources = {},
    IncomingReservedResources = {},
})

-- Replace original building function with one that will not appear
mod:overrideAsset({
    Id = "BUILDING_PART_DAIRY_FARM",
    AssetBuildingFunction = "BUILDING_FUNCTION_PUBLIC_LOUNGE_ROOM",
})

-- Assemblage to provide a prefab for limiting the output inventory
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN_ASSEMBLAGE",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_LIVESTOCKFARM_CATTLEPASTURE1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_DAIRY_FARM", OptionalAttachNodeString = "Attach_Major.Pasture" },
		}
	},
})

-- Random
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN",
    Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN_NAME",
    Category = "PRODUCTION",
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEBARN",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
        RandomPartList = {
            "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 2.0, -30 },
            OrientationOffset = 90.0,
            CameraPitchOffset = 0.0,
        },
    },
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 80 },
            -- { Resource = "RESOURCE_CATTLE", Quantity = 10 },
        },
    },
})



-- Building Function: Cattle Barn for pasture -------------------------------------------------------------------------------------
mod:registerAsset({

    -- DataType = "BUILDING_FUNCTION_WORKPLACE",
    DataType = "BUILDING_FUNCTION_LIVESTOCK_FARM",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEBARN",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CATTLEBARN_NAME",
    SpawningLivestock = "PREFAB_LIVESTOCK_COW",
    LivestockSpawningLocation = "",
    SpawnLivestockButtonText = "DAIRY_FARM_SPAWN_LIVESTOCK",
    RemoveLivestockButtonText = "DAIRY_FARM_REMOVE_LIVESTOCK",
    -- GameRuleModifierList = { -- cannot seem to get this to work; idea is that it produces more if it remains far from other buildings
    --     {
    --         DataType = "GAME_RULE_MODIFIER_CONDITIONAL_GAME_RULE",
    --         GameCondition = {
    --             DataType = "GAME_CONDITION_FAR_FROM_OTHER_BUILDINGS",
    --             -- IsReverseCondition = true,
    --             -- IsNeedExecution = true,
    --             -- IsAReason = true,
    --             ConditionOnMetAction = "TOGGLE",
    --             MaxTestDistance = 15, --25
    --             TestedBuildingType = {
    --                 GENERAL = true,
    --                 MONUMENT = true,
    --                 HOUSING = true,
    --                 MASTERPIECE = true,
    --                 WALL = true,
    --                 RESOURCE_PRODUCTION = true,
    --                 FOOD_PRODUCTION = true,
    --                 GOODS_PRODUCTION = true,
    --                 LOGISTICS = true,
    --                 SERVICE = true,
    --                 ADMINISTRATION = true,
    --                 MODS = true,
    --                 TRANSPORTATION = true,
    --             },
    --         },
    --         GameRuleModifier = {
    --             DataType = "GAME_RULE_MODIFIER_CROP_YIELDS",
    --             IsUntilRemoval = true,
    --             IsGlobal = false,
    --             ResourceList = {
    --                 "RESOURCE_CATTLE",
    --             },
    --             YieldPercentage = 3,
    --             -- DataType = "GAME_RULE_MODIFIER_RESOURCE_DEPOT_CAPACITY",
    --             -- CapacityQuantity = 100,
    --             -- IsGlobal = false,
    --         },
    --     },
    -- },
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 40,
    -- RelatedJob = {
    --     Job = "JOB_LIVESTOCKFARM_GATHER",
    --     Behavior = "BEHAVIOR_GATHER",
    -- },
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_HERD",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
	ResourceProduced = {
        { Resource = "RESOURCE_CATTLE", Quantity = 1 },
    }
})



-- Building Function: Farm Milk Cart -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_MILKCART",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_MILKCART_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING"
    },
	TypeList = { "LIVESTOCKFARM_RESOURCE_TYPE" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "MILK", Quantity = 50 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "MILK", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	-- { Resource = "RESOURCE_MILK_SELL", Quantity = 10 },
	-- 	{ Resource = "MILK", Quantity = 10 },
	-- }
})



-- Building Part: Milk Cart -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_MILKCART",
	Name = "BUILDING_PART_LIVESTOCKFARM_MILKCART_NAME",
    Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_MILKCART",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1, 1}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true }
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_MILKCART",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 2 }
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 25.0,
		Value = 0.5
	} },
})