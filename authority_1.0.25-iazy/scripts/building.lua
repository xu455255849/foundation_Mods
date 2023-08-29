local mod = ...



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall1Part", "PREFAB_AUTHORITY_HALL1")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall1ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_HALL1")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall2Part", "PREFAB_AUTHORITY_HALL2")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall2ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_HALL2")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall3Part", "PREFAB_AUTHORITY_HALL3")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall3ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_HALL3")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall4Part", "PREFAB_AUTHORITY_HALL4")
mod:registerAssetId("models/Authority1.fbx/Prefab/Hall4ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_HALL4")

mod:registerAssetId("models/Authority1.fbx/Prefab/DoorPart", "PREFAB_AUTHORITY_DOOR")

-- mod:registerAssetId("models/Authority1.fbx/Prefab/KitchenPart", "PREFAB_AUTHORITY_KITCHEN")
-- mod:registerAssetId("models/Authority1.fbx/Prefab/KitchenConstructionSteps", "PREFAB_CONSTR_AUTHORITY_KITCHEN")
mod:registerAssetId("models/Authority1.fbx/Prefab/StoragePart1", "PREFAB_AUTHORITY_STORAGE1")
mod:registerAssetId("models/Authority1.fbx/Prefab/Storage1ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_STORAGE1")
mod:registerAssetId("models/Authority1.fbx/Prefab/StoragePart2", "PREFAB_AUTHORITY_STORAGE2")
mod:registerAssetId("models/Authority1.fbx/Prefab/Storage2ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_STORAGE2")

-- mod:registerAssetId("models/Authority1.fbx/Prefab/MessagePart1", "PREFAB_AUTHORITY_MESSAGE1")
-- mod:registerAssetId("models/Authority1.fbx/Prefab/Message1ConstructionSteps", "PREFAB_CONSTR_AUTHORITY_MESSAGE1")
-- mod:registerAssetId("models/Authority1.fbx/Prefab/MessagePart2/MessagePost", "PREFAB_AUTHORITY_MESSAGEPOST")

-- mod:registerAssetId("models/Authority1.fbx/Prefab/AssistantTablePart", "PREFAB_AUTHORITY_ASSISTANT")

-- mod:registerAssetId("models/Authority1.fbx/Prefab/GardenPart1", "PREFAB_AUTHORITY_GARDENSHED")
-- mod:registerAssetId("models/Authority1.fbx/Prefab/GardenConstructionSteps", "PREFAB_CONSTR_AUTHORITY_GARDENSHED")
mod:registerAssetId("models/Authority1.fbx/Prefab/GardenPart2/GardenPost", "PREFAB_AUTHORITY_GARDENPOST")



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Authority1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/Authority1.fbx/Prefab/GardenPart1", { "PLATFORM" })



-- Grounding  -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/KitchenPart", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/GardenPart1", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/GardenPart1", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("PREFAB_AUTHORITY_STORAGE1", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("PREFAB_AUTHORITY_STORAGE2", {DataType = "COMP_GROUNDED"})



-- Output storage capacity --------------------------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_AUTHORITY_STORAGE1", {
	DataType = "COMP_RESOURCE_DEPOT",
	Capacity = 20,
	OutgoingReservedResources = {},
	IncomingReservedResources = {}
})

mod:registerPrefabComponent("PREFAB_AUTHORITY_STORAGE2", {
	DataType = "COMP_RESOURCE_DEPOT",
	Capacity = 20,
	OutgoingReservedResources = {},
	IncomingReservedResources = {}
})


-- -- Resource: Message -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/Document.png", "ICON_MESSAGE", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_MESSAGE",
-- 	ResourceName = "RESOURCE_MESSAGE_NAME",
-- 	Icon = "ICON_MESSAGE",
-- 	ResourceTypeList = { "RESOURCE_TYPE_AUTHORITY" },
-- 	IsTradable = false,
--     DisplayInInventory = false,
-- 	DisplayInToolbar = false,
-- 	OrderId = 0
-- })



-- -- Resource Container: Message -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent( "models/Authority1.fbx/Prefab/AssistantTablePart/Table.001", {
--     DataType = "COMP_RESOURCE_CONTAINER",
--     ResourceData = "RESOURCE_MESSAGE",
--     IsReplenishable = true,
-- 	ReplenishDurationInDays = 1,
-- 	ReplenishQuantity = 5,
--     ResourceValue = 1.0, -- how many are gathered with each pick
--     AvailableQuantity = 1, -- maximum container stock?
--     Radius = 0, -- distance from container that the villager will stand to pick
--     IsDestroyWhenEmpty = false
--     -- HasMaximumWorkstation = true -- not sure what this does, hoping it keeps them from using each other's patrol points
-- })

-- -- Plantable -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/AssistantTablePart/Table.001", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 1.0 })

-- -- Building Part
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/AssistantTablePart/Table.001", { DataType = "COMP_BUILDING_PART" })



-- Building Part Type -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Authority1.fbx/Prefab/DoorPart", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/AssistantTablePart", { DataType = "COMP_BUILDING_PART", BuildingPartType = "INNER_BOTTOM" })



-- Attach Node -------------------------------------------------------------------------------------
-- forces doors and windows to be built after their attached building part
mod:registerPrefabComponent("models/Authority1.fbx/Prefab/DoorPart/Attach_Door.015", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }})



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Authority1.fbx/Prefab/DoorPart", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/AssistantTablePart", {DataType = "COMP_GROUNDED"})



-- -- Smoke Emitter -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/KitchenPart/SmokeEmitter.001", {
-- 	DataType = "COMP_PARTICLE_EMITTER",
-- 	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
-- 	IsPlaying = true,
-- 	IsEmitting = true
-- })

-- mod:registerPrefabComponent("models/Authority1.fbx/Prefab/KitchenPart/SmokeEmitter.001", {
-- 	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
-- 	Enabled = false
-- })



-- Building: Lord Manor (OVERRIDE) -------------------------------------------------------------------------------------
mod:overrideAsset({
	Id = "MONUMENT_RUSTIC_LORD_MANOR",
	AssetBuildingPartList = {
		Action = "APPEND",
        "BUILDING_PART_AUTHORITY_HALL1",
        "BUILDING_PART_AUTHORITY_HALL2",
        "BUILDING_PART_AUTHORITY_HALL3",
        "BUILDING_PART_AUTHORITY_HALL4",
        "BUILDING_PART_AUTHORITY_DOOR",
    },
})



-- Building Part: Hall 1 (Wood) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_HALL1",
	Name = "BUILDING_PART_AUTHORITY_HALL1_NAME",
	Category = "ROOM",
	Capacity = 10,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_HALL1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 0.0
        },
	},
	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_HALL1",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {6, 7}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
			}
		}
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 6 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "WOOD", Quantity = 5 },
                { Resource = "PLANK", Quantity = 25 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 20.0,
		Value = 0.5
	} },
	EstateSplendor = {
		{
			Estate = "LABOUR",
			Quantity = 1
		}
	}
})



-- Building Part: Hall 2 (Wood Beam & Plaster Infill) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_HALL2",
	Name = "BUILDING_PART_AUTHORITY_HALL2_NAME",
	Category = "ROOM",
	Capacity = 10,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_HALL2",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 0.0,
        },
	},
	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_HALL2",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {6, 7}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 6 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "WOOD", Quantity = 5 },
                { Resource = "PLANK", Quantity = 25 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 20.0,
		Value = 0.5,
	} },
	EstateSplendor = {
		{
			Estate = "LABOUR",
			Quantity = 1,
		},
	},
})



-- Building Part: Hall 3 (Lime Plaster) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_HALL3",
	Name = "BUILDING_PART_AUTHORITY_HALL3_NAME",
	Category = "ROOM",
	Capacity = 10,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_HALL3",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 0.0,
        },
	},
	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_HALL3",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5.5, 8}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 6 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 5 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 20.0,
		Value = 0.5,
	} },
	EstateSplendor = {
		{
			Estate = "LABOUR",
			Quantity = 1,
		},
	},
})



-- Building Part: Hall 4 (Stone) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_HALL4",
	Name = "BUILDING_PART_AUTHORITY_HALL4_NAME",
	Category = "ROOM",
	Capacity = 10,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_HALL4",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 0.0,
        },
	},
	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_HALL4",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {6, 6.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 6 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 25 },
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 20.0,
		Value = 0.5,
	} },
	EstateSplendor = {
		{
			Estate = "LABOUR",
			Quantity = 1,
		},
	},
})



-- Building Part: Door -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_DOOR",
	Name = "BUILDING_PART_AUTHORITY_DOOR_NAME",
	Category = "DOOR",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_DOOR",
	},
	-- ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_DOOR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1, 1}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		-- BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
		-- UpkeepCost = { { Resource = "GOLD", Quantity = 50 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 20.0,
		Value = 0.5,
	} },
})



-- -- Building Part: Kitchen -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_AUTHORITY_KITCHEN",
-- 	Name = "BUILDING_PART_AUTHORITY_KITCHEN_NAME", 
-- 	Category = "ROOM",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
-- 		CoreObjectPrefab = "PREFAB_AUTHORITY_KITCHEN",
--         MiniatureConfig = {
--             ClipUnderGround = true,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 75.0,
--             CameraPitchOffset = 0.0
--         },
-- 	},
-- 	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_KITCHEN",
-- 	BuildingZone = { 
--         ZoneEntryList = {
--             { 
--                 Polygon = polygon.createRectangle( {4, 6}, {0.0, 0.0} ),
--                 Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
-- 			},
--             { 
--                 Polygon = polygon.createRectangle( {3.5, 3.5}, {-2.25, -1.9} ),
--                 Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
-- 			}
-- 		}
-- 	},
-- 	AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_KITCHEN",
-- 	Cost = {
-- 		-- BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
-- 		ResourceNeededList = {
--             {
--                 { Resource = "STONE", Quantity = 6 },
--                 { Resource = "WOOD", Quantity = 4 },
--                 { Resource = "PLANK", Quantity = 10 },
--             },
-- 		},
-- 	}
-- })



-- Building Part: Storage 1 -------------------------------------------------------------------------------------
local function registerStorage1(name, func)
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_AUTHORITY_STORAGE1_" .. name,
        Name = "BUILDING_FUNCTION_AUTHORITY_" .. name .. "_STOREHOUSE_NAME",
        Category = "RESOURCE_DEPOT",
        Capacity = 2,
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_AUTHORITY_STORAGE1",
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = -90.0,
                CameraPitchOffset = 0.0
            },
        },
        ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_STORAGE1",
        BuildingZone = {
            ZoneEntryList = {
                {
                    Polygon = polygon.createRectangle( {4.0, 5.25}, {0.0, 0.0} ),
                    Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
                },
            },
        },
        AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_" .. name .. "_STOREHOUSE",
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                },
            },
        },
    })
end

registerStorage1("STEWARD")
registerStorage1("BUTLER")
registerStorage1("CHAMBERLAIN")
registerStorage1("GARDEN")
registerStorage1("QUARTERMASTER")



-- Building Part: Storage 2 -------------------------------------------------------------------------------------
local function registerStorage2(name)
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_AUTHORITY_STORAGE2_" .. name,
        Name = "BUILDING_FUNCTION_AUTHORITY_" .. name .. "_STOREHOUSE_NAME",
        Category = "RESOURCE_DEPOT",
        Capacity = 2,
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_AUTHORITY_STORAGE2",
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = -90.0,
                CameraPitchOffset = 0.0
            },
        },
        ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_STORAGE2",
        BuildingZone = { 
            ZoneEntryList = {
                { 
                    Polygon = polygon.createRectangle( {4.5, 4.75}, {0.0, 0.0} ),
                    Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
                },
            }
        },
        AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_" .. name .. "_STOREHOUSE",
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                },
            },
        }
    })
end

registerStorage2("STEWARD")
registerStorage2("BUTLER")
registerStorage2("CHAMBERLAIN")
registerStorage2("GARDEN")
registerStorage2("QUARTERMASTER")



-- -- Building Part: Assistant Table -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_AUTHORITY_ASSISTANT",
-- 	Name = "BUILDING_PART_AUTHORITY_ASSISTANT_NAME", 
-- 	-- Category = "CORE",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
-- 		CoreObjectPrefab = "PREFAB_AUTHORITY_ASSISTANT"
-- 	},
-- 	BuildingZone = { 
--         ZoneEntryList = {
--             { 
--                 Polygon = polygon.createRectangle( {1, 1}, {0.0, 0.0} ),
--                 Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
-- 			},
-- 		}
-- 	},
-- 	IsOnlyAttached = true,
-- 	AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_AUTHORITY_ASSISTANT",
-- 	Cost = {
-- 	}
-- })



-- -- Building Part: Garden Shed -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_AUTHORITY_GARDENSHED",
-- 	Name = "BUILDING_PART_AUTHORITY_GARDENSHED_NAME", 
-- 	Category = "ROOM",
-- 	Capacity = 2,
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
-- 		CoreObjectPrefab = "PREFAB_AUTHORITY_GARDENSHED"
-- 	},
-- 	ConstructionVisual = "PREFAB_CONSTR_AUTHORITY_GARDENSHED",
-- 	BuildingZone = { 
--         ZoneEntryList = {
--             { 
--                 Polygon = polygon.createRectangle( {3.5, 4.00}, {0.0, 0.0} ),
--                 Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true } 
-- 			},
-- 		}
-- 	},
-- 	AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_GARDENSHED",
-- 	Cost = {
-- 		-- BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
-- 		ResourceNeededList = {
--             {
--                 { Resource = "STONE", Quantity = 4 },
--                 { Resource = "WOOD", Quantity = 1 },
--                 { Resource = "PLANK", Quantity = 4 },
--                 { Resource = "TOOL", Quantity = 1 },
--             },
-- 		},
-- 	}
-- })



-- Building Part: Gardener Post -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_AUTHORITY_GARDEN_POST",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_SPOT_NAME",
	Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_AUTHORITY_GARDENPOST",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1, 1}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_GARDEN_SPOT",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 1 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
	},
	IsVisibleWhenBuilt = false,
	IsMovableWhenBuilt = true,
})
