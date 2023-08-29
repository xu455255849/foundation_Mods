local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Livestock5.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
-- mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatPen.Part.001", "PREFAB_LIVESTOCKFARM_GOATPEN1")
-- mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatPen.Part.002", "PREFAB_LIVESTOCKFARM_GOATPEN2")
-- mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatPen.Part.003", "PREFAB_LIVESTOCKFARM_GOATPEN3")
-- mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatPen.Part.004", "PREFAB_LIVESTOCKFARM_GOATPEN4")
mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatPen.Part.005", "PREFAB_LIVESTOCKFARM_GOATPEN5")

mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatShed.Part.001", "PREFAB_LIVESTOCKFARM_GOATSHED")

mod:registerAssetId("models/Livestock5.fbx/Prefab/Goat.001", "PREFAB_LIVESTOCK_GOAT_PEN")
mod:registerAssetId("models/Livestock5.fbx/Prefab/Goat.002", "PREFAB_LIVESTOCK_GOAT_PASTURE")

mod:registerAssetId("models/Livestock5.fbx/Prefab/GoatSpawner", "PREFAB_LIVESTOCKFARM_GOATSPAWNER")



-- Grounding -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.001/Bucket.001", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.001/Bucket.002", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.001/Bucket.003", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.001/Hook.001", {DataType = "COMP_GROUNDED"})
-- for i=19, 26, 1 do
-- 	mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.002/Bucket.004", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.002/Bucket.005", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.002/Hook.002", {DataType = "COMP_GROUNDED"})
-- for i=27, 34, 1 do
-- 	mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.003/Bucket.008", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.003/Bucket.009", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.003/Bench.003", {DataType = "COMP_GROUNDED"})
-- for i=35, 42, 1 do
-- 	mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.004/Bucket.007", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.004/Bench.004", {DataType = "COMP_GROUNDED"})
-- for i=43, 50, 1 do
-- 	mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.005/Bucket.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.005/Bucket.011", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.005/Hook.003", {DataType = "COMP_GROUNDED"})
for i=1, 8, 1 do
	mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatPen.Part.005/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatShed.Part.001/Barrel.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatShed.Part.001/Barrel.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatShed.Part.001/Bench.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatShed.Part.001/Bucket.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatShed.Part.001/Jug.001", {DataType = "COMP_GROUNDED"})



-- Building Part: Goat Pen -------------------------------------------------------------------------------------
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

-- for i=1, 2, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_GOATPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building part
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER_NAME",
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_GOATPEN" .. i,
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

-- for i=3, 4, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_GOATPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building pen
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK_NAME",
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_GOATPEN" .. i,
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
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER_NAME",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER1",
-- 			"BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER2",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0
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
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER",
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
--         Value = 0.5
--     } },
-- })

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER",
	Name = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER_NAME",
    Category = "OTHER",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_GOATPEN5",
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
                Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER",
    Cost = {
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
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

-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK_NAME",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK3",
-- 			"BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK4",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0
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
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_MILK",
--     Cost = {
--         ResourceNeededList = {
--             {
--                 { Resource = "WOOD", Quantity = 5 },
--             },
--         }
--     },
-- })



-- Building Function Assignable: Goat -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_ASSIGNABLE",
--     Id = "BUILDING_FUNCTION_ASSIGNABLE_LIVESTOCKFARM_GOAT",
-- 	Name = "BUILDING_FUNCTION_ASSIGNABLE_LIVESTOCKFARM_GOAT_NAME",
-- 	AuthorizedFunctionList = "FUNCTION_LIST_LIVESTOCKFARM_GOAT"
-- })

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_LIST",
--     Id = "FUNCTION_LIST_LIVESTOCKFARM_GOAT",
-- 	AssetFunctionList = {
-- 		"BUILDING_FUNCTION_LIVESTOCKFARM_MIX_GOAT",
-- 		"BUILDING_FUNCTION_LIVESTOCKFARM_SLAUGHTER_GOAT",
-- 		"BUILDING_FUNCTION_LIVESTOCKFARM_MILK_GOAT",
-- 	}
-- })


-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_MIX_GOAT",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_MIX_GOAT_NAME",
--     WorkerCapacity = 1,
--     RelatedJob = { 
--         Job = "JOB_LIVESTOCKFARM_PROCESS", 
--         Behavior = "BEHAVIOR_WORK"
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 4 }
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 4 }
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 1 },
-- 		{ Resource = "MILK", Quantity = 2 },
-- 	},
-- })

mod:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER_NAME",
    GameRuleModifierList = {
        {
            DataType = "GAME_RULE_MODIFIER_WORKPLACE_RECIPE",
            ResourceProducedToAdd = {
                {
                    Resource = "BV1_CARCASS",
                    Quantity = 1,
                },
                {
                    Resource = "RESOURCE_HIDE",
                    Quantity = 1,
                },
            },
            ResourceProducedToRemove = {
                {
                    Resource = "MILK",
                    Quantity = 1,
                },
            },
        },
    },
})

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_SLAUGHTER_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 30,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 5 }
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 2 }
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 1 },
-- 		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
-- 		-- { Resource = "RESOURCE_TALLOW", Quantity = 1 },
-- 	},
-- })

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_MILK",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_GOAT_MILK_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 20,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 5 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_GOAT", Quantity = 1 },
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "MILK", Quantity = 2 },
-- 	},
-- })



-- Spawn animals in yard and pen -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_LIVESTOCK_GOAT_PEN", { DataType = "COMP_ENFORCE_RADIUS", Radius = 2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCK_GOAT_PEN", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )

-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_GOATPEN1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_GOAT_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_GOATPEN2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_GOAT_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_GOATPEN3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_GOAT_PEN", AnimalCount = 1, Radius = 0.5 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_GOATPEN4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_GOAT_PEN", AnimalCount = 1, Radius = 0.5 } )



-- Building Part: Goat Shed -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_GOATSHED",
	Name = "BUILDING_PART_LIVESTOCKFARM_GOATSHED_NAME",
    Category = "PRODUCTION",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_GOATSHED",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 1.5, -15 },
            OrientationOffset = -200.0,
            CameraPitchOffset = 0.0
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 2.4, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_GOATBARN",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 40 },
            -- { Resource = "RESOURCE_GOAT", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
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



-- Crop Field Element -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatSpawner", { DataType = "COMP_CROP_FIELD_ELEMENT" })



-- Plantable -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Livestock5.fbx/Prefab/GoatSpawner", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 0.5 })

mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_LIVESTOCKFARM_GOATSPAWNER",
    Name = "PLANTABLE_LIVESTOCKFARM_GOATSPAWNER_NAME",
    PlantPrefab = "PREFAB_LIVESTOCKFARM_GOATSPAWNER",
    Icon = "ICON_RESOURCE_GOAT",
    MinimumScale = 0.85, -- min size at full growth
    MaximumScale = 1.15 -- max size at full growth
})



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "models/Livestock5.fbx/Prefab/GoatSpawner", {
    DataType = "COMP_RESOURCE_CONTAINER",
    -- ResourceData = "RESOURCE_GOAT",
    ResourceData = "MILK",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 2.00, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})



-- Zone -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ZONE",
    Id = "ZONE_LIVESTOCKFARM_GOAT",
    Name = "ZONE_LIVESTOCKFARM_GOAT_NAME",
    Description = "ZONE_LIVESTOCKFARM_GOAT_NAME",
    Icon = "ICON_RESOURCE_GOAT",
    HoverIcon = "ICON_RESOURCE_GOAT",
    SelectionIcon = "ICON_RESOURCE_GOAT",
    Color = {1.00, 1.70, 0.60, 0.9}, -- RGB A = 
    DesirabilityLayerToShow = "DESIRABILITY_FERTILITY"
})



-- Farm Field Config -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_LIVESTOCKFARM_GOAT",
    ZoneType = "ZONE_LIVESTOCKFARM_GOAT",
    PlantPrefab = "PREFAB_LIVESTOCKFARM_GOATSPAWNER",
    HasPlantingCycle = false,
    IsScaling = false,
    RowDistance = 5,
    ItemDistance = 5,
    RandomOrientation = {-180, 180},
    RandomPositionOffset = {-0.5, 0.5},
    SourceMaterial = "MATERIAL_LIVESTOCKFARM_GRASS1",
    GrowingMaterial = "MATERIAL_LIVESTOCKFARM_GRASS1",
    HarvestedMaterial = "MATERIAL_LIVESTOCKFARM_GRASS1",
    GrowingTextureList = {
        "TEXTURE_LIVESTOCKFARM_BLANK",
    },
    HarvestingTextureList = {
        "TEXTURE_LIVESTOCKFARM_BLANK",
    },
    AlphaTestThreshold = 0.5
})



-- Sowing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_SOWING",
    PurposeList = {
        "WORK",
    },
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
                IdleAnimation = "GUARD",
            },
        },
	},
})



-- Growing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_GROWING",
    PurposeList = {
        "WORK",
    },
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
                    Model = "PREFAB_TOOL_SHEPHERD_STICK"
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GUARD",
            },
        },
	},
})



-- Harvest Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_HARVEST",
    PurposeList = {
        "WORK",
    },
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
                IdleAnimation = "GUARD",
            },
        },
	},
})



-- Building Function: Goat Fold (pasture) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_GOATBARN",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_GOATBARN_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_BARN",
        Behavior = "BEHAVIOR_FARMER",
    },
    -- InputInventoryCapacity = {
	-- 	{ Resource = "WATER", Quantity = 5 },
	-- 	-- { Resource = "DUNG_RESOURCE", Quantity = 5 }
	-- },
    ResourceListNeeded = {
		-- { Resource = "RESOURCE_GOAT", Quantity = 1 },
		{ Resource = "MILK", Quantity = 1 },
	},
	ResourceProduced = {
		-- { Resource = "RESOURCE_GOAT", Quantity = 1 },
		{ Resource = "MILK", Quantity = 2 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {1, 2},
	GrowDuration = {2, 3},
	GrowWaitDuration = {3, 6},
	HarvestDuration = {6, 20},
	RestDuration = {20, 21},

    QuantityToHarvestPerStep = 1,
	HarvestStepsCount = 1,
	QuantityToPlantPerStep = 1,
	PlantingStepsCount = 1,
	ResourceValuePerGather = 1,

    CropFieldConfig = "FARM_FIELD_CONFIG_LIVESTOCKFARM_GOAT",
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_SOWING", 
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_GROWING", 
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_GOAT_HARVEST"
})



-- Spawn goats in pasture -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_LIVESTOCK_GOAT_PASTURE", { DataType = "COMP_ENFORCE_RADIUS", Radius = 3 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCK_GOAT_PASTURE", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_GOATSPAWNER", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_GOAT_PASTURE", AnimalCount = 1 } )
