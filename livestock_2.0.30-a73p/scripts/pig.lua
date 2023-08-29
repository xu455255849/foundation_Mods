local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Livestock4.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Silo3.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Silo4.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Livestock4.fbx/Prefab/PigYard.Part.001", "PREFAB_LIVESTOCKFARM_PIGYARD1")
mod:registerAssetId("models/Livestock4.fbx/Prefab/PigYard.Part.002", "PREFAB_LIVESTOCKFARM_PIGYARD2")
mod:registerAssetId("models/Livestock4.fbx/Prefab/PigYard.Part.003", "PREFAB_LIVESTOCKFARM_PIGYARD3")
mod:registerAssetId("models/Livestock4.fbx/Prefab/PigYard.Part.004", "PREFAB_LIVESTOCKFARM_PIGYARD4")

-- mod:registerAssetId("models/Livestock4.fbx/Prefab/PigPen.Part.001", "PREFAB_LIVESTOCKFARM_PIGPEN1")
-- mod:registerAssetId("models/Livestock4.fbx/Prefab/PigPen.Part.002", "PREFAB_LIVESTOCKFARM_PIGPEN2")
-- mod:registerAssetId("models/Livestock4.fbx/Prefab/PigPen.Part.003", "PREFAB_LIVESTOCKFARM_PIGPEN3")
-- mod:registerAssetId("models/Livestock4.fbx/Prefab/PigPen.Part.004", "PREFAB_LIVESTOCKFARM_PIGPEN4")

mod:registerAssetId("models/Livestock4.fbx/Prefab/Pig.001", "PREFAB_LIVESTOCK_PIG_YARD")
mod:registerAssetId("models/Livestock4.fbx/Prefab/Pig.002", "PREFAB_LIVESTOCK_PIG_PEN")
mod:registerAssetId("models/Livestock4.fbx/Prefab/PigDecorative", "PREFAB_LIVESTOCKFARM_PIGDECORATIVE")

mod:registerAssetId("models/Silo3.fbx/Prefab/SiloPart", "PREFAB_LIVESTOCKFARM_SILO1")
mod:registerAssetId("models/Silo4.fbx/Prefab/SiloPart", "PREFAB_LIVESTOCKFARM_SILO2")
mod:registerAssetId("models/Silo3.fbx/Prefab/ConstructionSteps", "PREFAB_LIVESTOCKFARM_SILO1_CONSTR")
mod:registerAssetId("models/Silo4.fbx/Prefab/ConstructionSteps", "PREFAB_LIVESTOCKFARM_SILO2_CONSTR")



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Bucket.009", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Bucket.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Carcass.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Trough.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Trough.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Trough.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Trough.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/DungHeap.001", {DataType = "COMP_GROUNDED"})
for i=1, 18, 1 do
	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Bucket.011", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Bucket.012", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Carcass.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Trough.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Trough.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Trough.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Trough.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/DungHeap.002", {DataType = "COMP_GROUNDED"})
for i=51, 68, 1 do
	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Bucket.013", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Bucket.014", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Carcass.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Trough.009", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Trough.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Trough.011", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Trough.012", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/DungHeap.003", {DataType = "COMP_GROUNDED"})
for i=69, 86, 1 do
	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Bucket.015", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Bucket.016", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Carcass.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Trough.013", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Trough.014", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Trough.015", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Trough.016", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/DungHeap.004", {DataType = "COMP_GROUNDED"})
for i=87, 104, 1 do
	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigYard.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.001/Carcass.001", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.001/Bucket.001", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.001/Bucket.001", {DataType = "COMP_GROUNDED"})
-- for i=19, 26, 1 do
-- 	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.002/Carcass.002", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.002/Bucket.003", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.002/Bucket.004", {DataType = "COMP_GROUNDED"})
-- for i=27, 34, 1 do
-- 	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.003/Carcass.003", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.003/Bucket.005", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.003/Bucket.006", {DataType = "COMP_GROUNDED"})
-- for i=35, 42, 1 do
-- 	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.004/Carcass.004", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.004/Bucket.007", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.004/Bucket.008", {DataType = "COMP_GROUNDED"})
-- for i=43, 50, 1 do
-- 	mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/Silo3.fbx/Prefab/SiloPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/Silo4.fbx/Prefab/SiloPart", { "PLATFORM" })



-- -- Resource Generator -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.001/TallowGenerator.001", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.002/TallowGenerator.002", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.003/TallowGenerator.003", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })
-- mod:registerPrefabComponent("models/Livestock4.fbx/Prefab/PigPen.Part.004/TallowGenerator.004", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })



-- Building Part: Pig Yard -------------------------------------------------------------------------------------
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
	{ -3.25, -3.25 },
	{ -3.25, 3.25 },
	{ 3.25, 3.25 },
	{ 3.25, -3.25 },
	{ -3.25, -3.25 },
	{ -3.75, -3.75 },
	{ 3.75, -3.75 },
	{ 3.75, 3.75 },
	{ -3.75, 3.75 },
	{ -3.75, -3.75 },
}

local poly1c = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ 4.5, -7.0 },
	{ 4.5, 4.5 },
	{ -4.5, 4.5 },
	{ -4.5, -7.0 },
}

for i=1, 4, 1 do

    -- -- Limit output inventory size
    -- mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_PIGYARD" .. i, {
    --     DataType = "COMP_RESOURCE_DEPOT",
    --     Capacity = 10,
    --     OutgoingReservedResources = {},
    --     IncomingReservedResources = {},
    -- })

    -- Building part
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_PIGYARD" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_PIGYARD" .. i .. "_NAME",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_PIGYARD" .. i,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0.5, 4.4, -10 },
                OrientationOffset = -15.0,
                CameraPitchOffset = 25.0,
            },
        },
    })

end

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_PIGYARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_PIGYARD_NAME",
    Category = "PRODUCTION",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_PIGYARD1",
			"BUILDING_PART_LIVESTOCKFARM_PIGYARD2",
			"BUILDING_PART_LIVESTOCKFARM_PIGYARD3",
			"BUILDING_PART_LIVESTOCKFARM_PIGYARD4",
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
            -- { 
            --     Polygon = polygon.createRectangle( {10, 4}, {0.0, -5.0} ),
            --     Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            -- },
            -- { 
            --     Polygon = polygon.createRectangle( {10, 10}, {0.0, 0.0} ),
            --     Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            -- },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_PIGYARD",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 100 },
            -- { Resource = "RESOURCE_PIG", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 15 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "TOOL", Quantity = 1 },
            },
        },
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "SUBSTRACT",
        Radius = 20.0,
        Value = 0.5,
    } },
})



-- -- Building Part: Pig Slaughter Pen -------------------------------------------------------------------------------------
-- local poly2a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -1.70, -1.70 },
-- 	{ -1.70, 1.70 },
-- 	{ 1.70, 1.70 },
-- 	{ 1.70, -1.70 },
-- 	{ -1.70, -1.70 },
-- 	{ -2.20, -2.20 },
-- 	{ 2.20, -2.20 },
-- 	{ 2.20, 2.20 },
-- 	{ -2.20, 2.20 },
-- 	{ -2.20, -2.20 },
-- }

-- local poly2b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -1.20, -1.20 },
-- 	{ -1.20, 1.20 },
-- 	{ 1.20, 1.20 },
-- 	{ 1.20, -1.20 },
-- 	{ -1.20, -1.20 },
-- 	{ -1.70, -1.70 },
-- 	{ 1.70, -1.70 },
-- 	{ 1.70, 1.70 },
-- 	{ -1.70, 1.70 },
-- 	{ -1.70, -1.70 },
-- }

-- for i=1, 4, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_PIGPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building part
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_PIGPEN" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_PIGPEN_" .. i .. "NAME",
--         -- Category = "CORE", 
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_PIGPEN" .. i,
--             MiniatureConfig = {
--                 ClipUnderGround = false,
--                 GroupHeight = 0.0,
--                 CameraPosition = { 0, 0, 0 },
--                 OrientationOffset = 0.0,
--                 CameraPitchOffset = 25.0,
--             },
--         },
--     })

-- end

-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_PIGPEN",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_PIGPEN_NAME",
--     Category = "OTHER",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_PIGPEN1",
-- 			"BUILDING_PART_LIVESTOCKFARM_PIGPEN2",
-- 			"BUILDING_PART_LIVESTOCKFARM_PIGPEN3",
-- 			"BUILDING_PART_LIVESTOCKFARM_PIGPEN4",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0,
--         },
--     },
--     BuildingZone = {
--         ZoneEntryList = {
--             {
--                 Polygon = poly2a,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--                 -- Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 -- Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
--             },
--             {
--                 Polygon = poly2b,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--                 -- Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 -- Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
--             },
--             {
--                 Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
--             },
--         },
--     },
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SLAUGHTER_PIG",
--     Cost = {
--         ResourceNeededList = {
--             {
--                 { Resource = "WOOD", Quantity = 5 },
--                 { Resource = "TOOL", Quantity = 1 },
--             },
--         }
--     },
--     DesirabilityModifiers = { {
--         Desirability = "DESIRABILITY_RESIDENTIAL",
--         Type = "SUBSTRACT",
--         Radius = 20.0,
--         Value = 0.5,
--     } },
-- })



-- Building Function: Pig Yard -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_PIGYARD",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_PIGYARD_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_HERD",
        Behavior = "BEHAVIOR_LIVESTOCK_WORK",
        -- Behavior = "BEHAVIOR_WORK",
	},
    InputInventoryCapacity = {
        { Resource = "WATER", Quantity = 30 },
        { Resource = "RESOURCE_FEED", Quantity = 30 },
    },
    ResourceListNeeded = {
        { Resource = "WATER", Quantity = 2 },
        { Resource = "RESOURCE_FEED", Quantity = 2 },
    },
    ResourceProduced = {
        -- { Resource = "RESOURCE_PIG", Quantity = 1 },
        { Resource = "BV1_CARCASS", Quantity = 2 },
		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
        { Resource = "RESOURCE_DUNG", Quantity = 2 },
    },
})



-- -- Building Function: Slaughter Pig -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SLAUGHTER_PIG",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SLAUGHTER_PIG_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 30,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_PIG", Quantity = 5 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_PIG", Quantity = 1 },
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 1 },
-- 		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
-- 		-- { Resource = "RESOURCE_TALLOW", Quantity = 1 },
-- 	},
-- })



-- Spawn animals in yard and pen -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_LIVESTOCK_PIG_YARD", { DataType = "COMP_ENFORCE_RADIUS", Radius = 4 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCK_PIG_YARD", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )

-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_PIG_PEN", { DataType = "COMP_ENFORCE_RADIUS", Radius = 2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_PIG_PEN", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )

mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGYARD1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_YARD", AnimalCount = 8, Radius = 2.5 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGYARD2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_YARD", AnimalCount = 8, Radius = 2.5 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGYARD3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_YARD", AnimalCount = 8, Radius = 2.5 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGYARD4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_YARD", AnimalCount = 8, Radius = 2.5 } )

-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGPEN1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGPEN2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGPEN3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGPEN4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_PEN", AnimalCount = 1, Radius = 0.5 } )

mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_PIGDECORATIVE", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_PIG_YARD", AnimalCount = 1, Radius = 1.0 } )



-- Job: Animal Feed -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_FEED",
	JobName = "JOB_LIVESTOCKFARM_FEED_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_FEED_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 30.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
                HatList = {
                        "PREFAB_LIVESTOCKFARM_HAT",
                    },
                },
            { -- FEMALE
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
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

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_FEED",
    },
})



-- Building Function: Animal Feed from Wheat and Milk -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED1",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_FEED",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "WHEAT", Quantity = 50 },
		-- { Resource = "RESOURCE_VEGETABLE", Quantity = 50 },
		{ Resource = "MILK", Quantity = 50 },
	},
    ResourceListNeeded = {
		{ Resource = "WHEAT", Quantity = 5 },
		-- { Resource = "RESOURCE_VEGETABLE", Quantity = 5 },
		{ Resource = "MILK", Quantity = 5 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_FEED", Quantity = 15 },
	},
})



-- Building Function: Animal Feed from Vegetables and Milk -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED2",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_FEED",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		-- { Resource = "WHEAT", Quantity = 50 },
		{ Resource = "RESOURCE_VEGETABLE", Quantity = 50 },
		{ Resource = "MILK", Quantity = 50 },
	},
    ResourceListNeeded = {
		-- { Resource = "WHEAT", Quantity = 5 },
		{ Resource = "RESOURCE_VEGETABLE", Quantity = 5 },
		{ Resource = "MILK", Quantity = 5 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_FEED", Quantity = 15 },
	},
})


-- Building Part Types -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_PIG1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_PIG2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_PIG3")



-- Building Part: Silo -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_SILO1",
	Name = "BUILDING_PART_LIVESTOCKFARM_SILO1_NAME",
    Category = "OTHER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SILO1"
	},
	ConstructionVisual = "PREFAB_LIVESTOCKFARM_SILO1_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {4.5, 3.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED1",
	Cost = {
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 2 },
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 4 },
            },
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_SILO2",
	Name = "BUILDING_PART_LIVESTOCKFARM_SILO2_NAME",
    Category = "OTHER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SILO2"
	},
	ConstructionVisual = "PREFAB_LIVESTOCKFARM_SILO2_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5.5, 4.0}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_FEED2",
	Cost = {
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 2 },
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 4 },
            },
		},
	},
})



-- Building Part: Decorative Pig -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_PIGDECORATIVE",
	Name = "BUILDING_PART_LIVESTOCKFARM_PIGDECORATIVE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_PIGDECORATIVE",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0,
            CameraPosition = { 0, -1.5, -4 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
})