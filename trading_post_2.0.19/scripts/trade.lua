local mod = ...



-- Building Asset Processor
mod:registerAssetProcessor("models/TradingPost1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TradingPost2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Prefab -----------------------------------------------------------------------------------------------------------
mod:registerAssetId("models/TradingPost1.fbx/Prefab/TradingPost.Part.Old", "PREFAB_TRADINGPOST")
-- mod:registerAssetId("models/TradingPost1.fbx/Prefab/ImportPart", "PREFAB_TRADINGPOST_IMPORT")

mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyCart1Part", "PREFAB_TRADINGPOST_DONKEYCART1")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyCart2Part", "PREFAB_TRADINGPOST_DONKEYCART2")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyCart3Part", "PREFAB_TRADINGPOST_DONKEYCART3")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyTrain1Part", "PREFAB_TRADINGPOST_DONKEYTRAIN1")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyTrain2Part", "PREFAB_TRADINGPOST_DONKEYTRAIN2")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DonkeyTrain3Part", "PREFAB_TRADINGPOST_DONKEYTRAIN3")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/OxCartPart", "PREFAB_TRADINGPOST_OXCART")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DecoOxPart", "PREFAB_TRADINGPOST_DECOOX")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DecoDonkeyPart", "PREFAB_TRADINGPOST_DECODONKEY")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DecoOxCartPart", "PREFAB_TRADINGPOST_DECOOXCART")
mod:registerAssetId("models/TradingPost2.fbx/Prefab/DecoDonkeyCartPart", "PREFAB_TRADINGPOST_DECODONKEYCART")

mod:registerAssetId("models/TradingPost1.fbx/Prefab/TradingPost.Part.001", "PREFAB_TRADINGPOST_POST1")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/TradingPost.Part.001.Constr", "PREFAB_TRADINGPOST_POST1_CONSTR")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/TradingYard.Part.001", "PREFAB_TRADINGPOST_YARD1")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/Stable.Part.001", "PREFAB_TRADINGPOST_STABLE1")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/Stable.Part.001.Constr", "PREFAB_TRADINGPOST_STABLE1_CONSTR")

mod:registerAssetId("models/TradingPost1.fbx/Prefab/ImportYard.Part.001", "PREFAB_TRADINGPOST_IMPORTYARD1")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/ExportYard.Part.001", "PREFAB_TRADINGPOST_EXPORTYARD1")

mod:registerAssetId("models/TradingPost1.fbx/Prefab/ImportContainer", "PREFAB_TRADINGPOST_IMPORTCONTAINER")

mod:registerAssetId("models/TradingPost1.fbx/Prefab/Hat.Part.001", "PREFAB_TRADINGPOST_HAT1")
mod:registerAssetId("models/TradingPost1.fbx/Prefab/Hat.Part.002", "PREFAB_TRADINGPOST_HAT2")



-- Limit Output Inventory -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "PREFAB_TRADINGPOST_POST1", {
    DataType = "COMP_RESOURCE_DEPOT",
    Capacity = 20,
    OutgoingReservedResources = {},
    IncomingReservedResources = {},
})



-- Materials -------------------------------------------------------------------------------------
mod:registerAssetId("models/TradingPost1.fbx/Materials/Material.Thatch.Edge", "MATERIAL_TRADINGPOST_THATCHEDGE")
mod:overrideAsset({
    Id = "MATERIAL_TRADINGPOST_THATCHEDGE",
    HasAlphaTest = true
})



-- Grounding  -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/TradingYard.Part.001/Gate.001", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/Stable.Part.001/DungHeap.001", { DataType = "COMP_GROUNDED" })

mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ImportYard.Part.001/Attach_Minor.021", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ImportYard.Part.001/Attach_Ground_Accessory.002", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ExportYard.Part.001/Attach_Minor.022", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ExportYard.Part.001/Attach_Ground_Accessory.003", { DataType = "COMP_GROUNDED" })

for i = 1, 8, 1 do
    mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/TradingPost.Part.Old/Attach_Minor." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" })
end

for i = 1, 20, 1 do
    mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/TradingYard.Part.001/Palisade." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" })
end

mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/TradingPost.Part.001/Door.001", { DataType = "COMP_GROUNDED" })

for i = 10, 19, 1 do
    mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/TradingYard.Part.001/Attach_Minor." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" })
end

for i = 1, 10, 1 do
    mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/Stable.Part.001/ImportBoxPosition." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" })
end

for i = 1, 7, 1 do
    mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ExportYard.Part.001/ExportBoxPosition." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" })
end



-- Collider Platform -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/Ship1.fbx/Prefab/ShipPart1", { "PLATFORM" })



-- Attach Node Type -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/Stable.Part.001", { DataType = "COMP_BUILDING_PART", BuildingPartType = "EXTERNAL" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ImportYard.Part.001", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })
mod:registerPrefabComponent("models/TradingPost1.fbx/Prefab/ExportYard.Part.001", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "models/TradingPost1.fbx/Prefab/ImportContainer", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_TRADINGPOST_IMPORT",
    IsReplenishable = false,
    ResourceValue = 1, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 1.25, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
})



-- Building: Trading Post -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_TRADINGPOST1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_TRADINGPOST2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_TRADINGPOST3")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_TRADINGPOST4")

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_TRADINGPOST",
	Name = "BUILDING_TRADINGPOST_NAME",
	Description = "BUILDING_TRADINGPOST_DESC",
	BuildingType = "LOGISTICS",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_TRADINGPOST_POST1",
	AssetBuildingPartList = {
        "BUILDING_PART_TRADINGPOST_POST1",
        "BUILDING_PART_TRADINGPOST_YARD1",
        "BUILDING_PART_TRADINGPOST_STABLE1",

        "BUILDING_PART_TRADINGPOST_EXPORTFOOD",
        "BUILDING_PART_TRADINGPOST_EXPORTGOODS",
        -- "BUILDING_PART_TRADINGPOST_EXPORTMATERIALS",

        "BUILDING_PART_TRADINGPOST_IMPORTFOOD",
        "BUILDING_PART_TRADINGPOST_IMPORTGOODS",
        -- "BUILDING_PART_TRADINGPOST_IMPORTMATERIALS",

        "BUILDING_PART_TRADINGPOST_DECODONKEY",
        "BUILDING_PART_TRADINGPOST_DECODONKEYCART",
        "BUILDING_PART_TRADINGPOST_DECOOXCART",
    },
	IsEditable = true,
})

-- Unlockable
mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_BUILDING_TRADINGPOST", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_TRADINGPOST",
    Name = "BUILDING_TRADINGPOST_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_TRADINGPOST",
    DataCost = {
        -- DataInfluenceCostList = {
        --     {
        --         Estate = "LABOUR",
        --         Quantity = 5,
        --     },
        -- },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 200,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_TRADINGPOST",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_TRADINGPOST",
    },
})



-- Building Part: Post 1 (wooden) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_POST1",
	Name = "BUILDING_PART_TRADINGPOST_POST_NAME", 
	Description = "BUILDING_PART_TRADINGPOST_POST_DESC",
    Category = "BUILDING_SET_TRADINGPOST1",
	Capacity = 6,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_POST1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 8, -30 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
	},
    ConstructionVisual = "PREFAB_TRADINGPOST_POST1_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {6.25, 6.25}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_TRADINGPOST_MERCHANT",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 100 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 20 },
                { Resource = "WOOD", Quantity = 12 },
                { Resource = "PLANK", Quantity = 12 },
                { Resource = "TOOL", Quantity = 6 },
            },
		},
	},
})



-- Building Part: Yard 1 (wooden) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_YARD1",
	Name = "BUILDING_PART_TRADINGPOST_YARD_NAME",
	Description = "BUILDING_PART_TRADINGPOST_YARD_DESC",
    Category = "BUILDING_SET_TRADINGPOST1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_YARD1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1, 18}, {-10.5, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {1, 18}, {10.5, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {22, 1}, {0, -9} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {9.5, 1}, {6.25, 9} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {9.5, 1}, {-6.25, 9} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 40 },
            },
		},
	},
})



-- Building Part: Stable 1 (wooden) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_STABLE1",
	Name = "BUILDING_PART_TRADINGPOST_STABLE_NAME",
	Description = "BUILDING_PART_TRADINGPOST_STABLE_DESC",
    Category = "BUILDING_SET_TRADINGPOST1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_STABLE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
	},
    ConstructionVisual = "PREFAB_TRADINGPOST_STABLE1_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5, 5}, {0, -1.45} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.5, 8}, {-2.5, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.5, 8}, {2.5, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 100 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 40 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "TOOL", Quantity = 20 },
            },
		},
	},
})



-- Building Part: Food Export -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_EXPORTFOOD_ASSEMBLAGE",
	Name = "BUILDING_PART_TRADINGPOST_EXPORTFOOD_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_TRADINGPOST_EXPORTYARD1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_SEED2", OptionalAttachNodeString = "Attach_Ground_Accessory.003" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_EXPORTFOOD",
	Name = "BUILDING_PART_TRADINGPOST_EXPORTFOOD_NAME",
    Category = "BUILDING_SET_TRADINGPOST2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_TRADINGPOST_EXPORTFOOD_ASSEMBLAGE",
		},
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.15, 2.25}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.7, 0.7}, {1, 1.7} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_EXPORT_FOOD",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 2 },
            },
        },
	},
})



-- Building Part: Goods Export -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_EXPORTGOODS_ASSEMBLAGE",
	Name = "BUILDING_PART_TRADINGPOST_EXPORTGOODS_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_TRADINGPOST_EXPORTYARD1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_SEED2", OptionalAttachNodeString = "Attach_Ground_Accessory.003" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_EXPORTGOODS",
	Name = "BUILDING_PART_TRADINGPOST_EXPORTGOODS_NAME",
    Category = "BUILDING_SET_TRADINGPOST2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_TRADINGPOST_EXPORTGOODS_ASSEMBLAGE",
		},
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.15, 2.25}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.7, 0.7}, {1, 1.7} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_EXPORT_GOODS",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 2 },
            },
        }
	},
})



-- Building Part: Food Import -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_SEED1",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"SHIPMENT_MIX1_PART",
			"SHIPMENT_FOOD_PART",
			"SHIPMENT_GRAIN_PART",
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_SEED2",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BASKET_BERRIES_PART",
			"BASKET_GRAPES_PART",
			"BASKET_HOPS_PART",
			"BARREL_BERRIES_PART",
			"BARREL_GRAPES_PART",
			"BARREL_FISH_PART",
			"BARREL_HONEY_PART",
			"SACK_GRAIN_PART",
			"SACK_GRAIN_SIDE_PART",
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_ASSEMBLAGE",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_TRADINGPOST_IMPORTYARD1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_SEED1", OptionalAttachNodeString = "Attach_Major.001" },
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_SEED2", OptionalAttachNodeString = "Attach_Ground_Accessory.002" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTFOOD_NAME",
    Category = "BUILDING_SET_TRADINGPOST3",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_TRADINGPOST_IMPORTFOOD_ASSEMBLAGE",
		},
	},
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.15, 2.25}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.7, 0.7}, {1, 1.7} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_IMPORT_FOOD",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 2 },
            },
        },
	},
    -- IsMovableWhenBuilt = true,
})



-- Building Part: Goods Import -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_SEED1",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"SHIPMENT_MIX2_PART",
			"SHIPMENT_GOODS_PART",
			"SHIPMENT_SPOOLS_PART",
			"SHIPMENT_PLANKS_PART",
			"SHIPMENT_BRICKS_PART",
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_SEED2",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"CLOTH_SPOOL1_PART",
			"CHAIR_WOOD2_PART",
			"CRATE1_PART",
			"CRATE_ROPE_PART",
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_ASSEMBLAGE",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_TRADINGPOST_IMPORTYARD1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_SEED1", OptionalAttachNodeString = "Attach_Major.001" },
			{ BuildingPart = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_SEED2", OptionalAttachNodeString = "Attach_Ground_Accessory.002" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS",
	Name = "BUILDING_PART_TRADINGPOST_IMPORTGOODS_NAME",
    Category = "BUILDING_SET_TRADINGPOST3",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_TRADINGPOST_IMPORTGOODS_ASSEMBLAGE",
		}
	},
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.15, 2.25}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {0.7, 0.7}, {1, 1.7} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_IMPORT_GOODS",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 2 },
            },
        },
	},
    -- IsMovableWhenBuilt = true,
})



-- Job: Merchant -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TRADINGPOST_MERCHANT",
	JobName = "JOB_TRADINGPOST_MERCHANT_NAME",
	JobDescription = "JOB_TRADINGPOST_MERCHANT_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
	UseWorkplaceBehavior = false,
    -- ProductionDelay = 10,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT2",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT2",
                },
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_ENVOY_SCROLL_LONG",
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
--         "JOB_TRADINGPOST_MERCHANT",
--     },
-- })

-- mod:overrideAsset({
--     Id = "SERF",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_TRADINGPOST_MERCHANT",
--     },
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TRADINGPOST_MERCHANT",
    },
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TRADINGPOST_MERCHANT",
    },
})



-- Job: Import -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TRADINGPOST_IMPORT",
	JobName = "JOB_TRADINGPOST_IMPORT_NAME",
	JobDescription = "JOB_TRADINGPOST_IMPORT_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_GATHER",
	-- UseWorkplaceBehavior = true,
    -- ProductionDelay = 1, --300.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT1",
                },
            },
            { -- ALL
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
--         "JOB_TRADINGPOST_IMPORT",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TRADINGPOST_IMPORT",
    },
})



-- Job: Export -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TRADINGPOST_EXPORT",
	JobName = "JOB_TRADINGPOST_EXPORT_NAME",
	JobDescription = "JOB_TRADINGPOST_EXPORT_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_TRADINGPOST_EXPORT",
	UseWorkplaceBehavior = true,
    -- ProductionDelay = 10, --300.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_TRADINGPOST_HAT1",
                },
            },
            { -- ALL
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
--         "JOB_TRADINGPOST_EXPORT",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TRADINGPOST_EXPORT",
    },
})



-- Function: Import/Export -------------------------------------------------------------------------------------
local function registerImportExport(_resource, _qty)

	-- Export
	mod:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
		Id = "BUILDING_FUNCTION_TRADINGPOST_EXPORT_" .. _resource,
		Name = "BUILDING_FUNCTION_TRADINGPOST_EXPORT_" .. _resource .. "_NAME",
		WorkerCapacity = 1,
        ProductionCycleDurationInSec = 10,
		RelatedJob = {
			Job = "JOB_TRADINGPOST_EXPORT",
			Behavior = "BEHAVIOR_TRADINGPOST_EXPORT",
		},
		InputInventoryCapacity = {
			{ Resource = "RESOURCE_TRADINGPOST_COMMAND", Quantity = 1 },
			{ Resource = _resource, Quantity = _qty },
		},
		ResourceListNeeded = {
			{ Resource = "RESOURCE_TRADINGPOST_COMMAND", Quantity = 1 },
			{ Resource = _resource, Quantity = _qty },
		},
		ResourceProduced = {
			{ Resource = "RESOURCE_TRADINGPOST_EXPORT", Quantity = 0 }, -- the actual exports are tracked in a component
		},
	})


	-- Import
	mod:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
		Id = "BUILDING_FUNCTION_TRADINGPOST_IMPORT_" .. _resource,
		Name = "BUILDING_FUNCTION_TRADINGPOST_IMPORT_" .. _resource .. "_NAME",
		WorkerCapacity = 1,
        ProductionCycleDurationInSec = 11,
		RelatedJob = {
			Job = "JOB_TRADINGPOST_IMPORT",
			Behavior = "BEHAVIOR_GATHER",
		},
		InputInventoryCapacity = {
			-- { Resource = "RESOURCE_TRADINGPOST_IMPORT", Quantity = 2 },
		},
		ResourceListNeeded = {
			{ Resource = "RESOURCE_TRADINGPOST_IMPORT", Quantity = 1 },
		},
		ResourceProduced = {
			{ Resource = _resource, Quantity = _qty },
		},
	})

end



-- Building Part: Donkey (Decorative) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_DECODONKEY",
	Name = "BUILDING_PART_TRADINGPOST_DECODONKEY_NAME",
    Category = "BUILDING_SET_TRADINGPOST4",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_DECODONKEY",
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1.1, 2.2}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 10 } },
	},
})



-- Building Part: Ox Cart (Decorative) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_DECOOXCART",
	Name = "BUILDING_PART_TRADINGPOST_DECOOXCART_NAME",
    Category = "BUILDING_SET_TRADINGPOST4",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_DECOOXCART",
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {2.7, 3.8}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        -- BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 100 } },
        -- UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 50 } },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 4 },
            },
		},
	},
})




-- Building Part: Donkey Cart (Decorative) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TRADINGPOST_DECODONKEYCART",
	Name = "BUILDING_PART_TRADINGPOST_DECODONKEYCART_NAME",
    Category = "BUILDING_SET_TRADINGPOST4",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TRADINGPOST_DECODONKEYCART",
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1.7, 3.1}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        -- BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 100 } },
        -- UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 50 } },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 2 },
            },
		},
	},
})



-- Resource Type  -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_TRADE" )



-- Resource: Command -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Command.png", "ICON_COMMAND", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_TRADINGPOST_COMMAND",
	ResourceName = "RESOURCE_TRADINGPOST_COMMAND_NAME",
	Icon = "ICON_COMMAND",
	ResourceTypeList = { "RESOURCE_TYPE_TRADE" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = false,
	DisplayInToolbar = false,
	OrderId = 0,
})



-- Resource: Export -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Import.png", "ICON_TRADINGPOST_IMPORT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_TRADINGPOST_EXPORT",
	ResourceName = "RESOURCE_TRADINGPOST_EXPORT_NAME",
	Icon = "ICON_TRADINGPOST_IMPORT",
	ResourceTypeList = { "RESOURCE_TYPE_TRADE" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = false,
	DisplayInToolbar = false,
	OrderId = 0,
})



-- Resource: Import -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Import.png", "ICON_TRADINGPOST_IMPORT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_TRADINGPOST_IMPORT",
	ResourceName = "RESOURCE_TRADINGPOST_IMPORT_NAME",
	Icon = "ICON_TRADINGPOST_IMPORT",
	ResourceTypeList = { "RESOURCE_TYPE_TRADE" },
	IsTradable = false,
    DisplayInInventory = false,
	DisplayInToolbar = false,
	OrderId = 0,
})



-- Building Function: Merchant -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_TRADINGPOST_MERCHANT",
	Name = "BUILDING_FUNCTION_TRADINGPOST_MERCHANT_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 10,
    RelatedJob = {
        Job = "JOB_TRADINGPOST_MERCHANT",
        Behavior = "BEHAVIOR_WORK",
	},
	-- HasMaximumInstance = true,
	-- MaximumInstanceAllowed = 2,
	InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_TRADINGPOST_COMMAND", Quantity = 1 },
	}
})



-- Setup -------------------------------------------------------------------------------------
registerImportExport("BEER", 8)
registerImportExport("RESOURCE_CIDER", 8)
registerImportExport("WINE", 4)
registerImportExport("RESOURCE_FRUIT", 13)
registerImportExport("BREAD", 8)
registerImportExport("BV1_BUTTER", 13)
registerImportExport("CHEESE", 13)
registerImportExport("FISH", 13)
registerImportExport("BOAR", 5)
registerImportExport("RESOURCE_MUSHROOM", 50)
registerImportExport("CANDLE", 8)
registerImportExport("CLOTHES", 4)
registerImportExport("COMMON_WARES", 3)
registerImportExport("RESOURCE_POTTERY", 13)
registerImportExport("RESOURCE_SHOES", 4)
registerImportExport("HONEY", 13)
registerImportExport("JEWELRY", 1)
registerImportExport("BV1_SALT", 8)
registerImportExport("BV1_SUGAR", 6)
registerImportExport("RESOURCE_FEED", 5)
registerImportExport("RESOURCE_FUR", 13)
registerImportExport("RESOURCE_HIDE", 8)
registerImportExport("WOOLEN_CLOTH", 13)
registerImportExport("RESOURCE_FLAX", 25)
registerImportExport("FLOUR", 17)
registerImportExport("RESOURCE_FURNITURE", 3)
registerImportExport("GEMS", 1)
registerImportExport("GLASS", 3)
registerImportExport("RESOURCE_HAY", 25)
registerImportExport("HOP", 25)
registerImportExport("IRON", 5)
registerImportExport("LEATHER", 13)
registerImportExport("TOOL", 3)
registerImportExport("WHEAT", 25)
registerImportExport("WOOL", 25)
registerImportExport("SPEAR", 1)
registerImportExport("SWORD", 2)



-- Building Function: Export Food ASSIGNABLE -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_ASSIGNABLE",
    Id = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_EXPORT_FOOD",
    AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_TRADINGPOST_EXPORT_FOOD",
})

mod:registerAsset({
    DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
    Id = "BUILDING_FUNCTION_LIST_TRADINGPOST_EXPORT_FOOD",
    AssetFunctionList = {
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_FEED",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_FRUIT",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BEER",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BOAR",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BREAD",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BV1_BUTTER",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_CHEESE",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_CIDER",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_FISH",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_FLOUR",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_HONEY",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BV1_SALT",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_BV1_SUGAR",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_WHEAT",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_WINE",
    },
})



-- Building Function: Export Goods ASSIGNABLE -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_ASSIGNABLE",
	Id = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_EXPORT_GOODS",
    AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_TRADINGPOST_EXPORT_GOODS",
})

mod:registerAsset({
    DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
    Id = "BUILDING_FUNCTION_LIST_TRADINGPOST_EXPORT_GOODS",
    AssetFunctionList = {
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_FUR",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_HIDE",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_CANDLE",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_WOOLEN_CLOTH",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_CLOTHES",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_COMMON_WARES",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_FLAX",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_FURNITURE",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_GEMS",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_GLASS",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_HAY",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_HOP",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_IRON",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_JEWELRY",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_LEATHER",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_POTTERY",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_RESOURCE_SHOES",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_SPEAR",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_SWORD",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_TOOL",
        "BUILDING_FUNCTION_TRADINGPOST_EXPORT_WOOL",
    },
})



-- Building Function: Import Food ASSIGNABLE -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_ASSIGNABLE",
    Id = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_IMPORT_FOOD",
    AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_TRADINGPOST_IMPORT_FOOD",
})

mod:registerAsset({
    DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
    Id = "BUILDING_FUNCTION_LIST_TRADINGPOST_IMPORT_FOOD",
    AssetFunctionList = {
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_FEED",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_FRUIT",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BEER",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BOAR",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BREAD",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BV1_BUTTER",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_CHEESE",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_CIDER",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_FISH",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_FLOUR",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_HONEY",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BV1_SALT",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_BV1_SUGAR",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_WHEAT",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_WINE",
    },
})



-- Building Function: Import Goods ASSIGNABLE -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_ASSIGNABLE",
	Id = "BUILDING_FUNCTION_ASSIGNABLE_TRADINGPOST_IMPORT_GOODS",
    AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_TRADINGPOST_IMPORT_GOODS",
})

mod:registerAsset({
    DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
    Id = "BUILDING_FUNCTION_LIST_TRADINGPOST_IMPORT_GOODS",
    AssetFunctionList = {
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_FUR",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_HIDE",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_CANDLE",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_WOOLEN_CLOTH",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_CLOTHES",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_COMMON_WARES",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_FLAX",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_FURNITURE",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_GEMS",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_GLASS",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_HAY",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_HOP",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_IRON",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_JEWELRY",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_LEATHER",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_POTTERY",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_RESOURCE_SHOES",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_SPEAR",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_SWORD",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_TOOL",
        "BUILDING_FUNCTION_TRADINGPOST_IMPORT_WOOL",
    },
})

