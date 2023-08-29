local mod = ...


--[[

    This mod allows warehouse and granary parts to be embedded in other buildings.

    It works using two tricks:
    1. The original warehouse or granary gets assembled with a parent part that has a scaled attach point. The scaling shrinks the warehouse or granary but preserves its storage sockets.
    2. Using a random part constructor removes a building zone from a building part. This is the only way to remove the building zones from vanilla warehouses or granaries.

]]



-- Building Asset Processor
mod:registerAssetProcessor("models/Storage1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset
mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.001", "PREFAB_STORAGE_GRANARY1")
mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.001", "PREFAB_STORAGE_WAREHOUSE1")

mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.002", "PREFAB_STORAGE_GRANARY2")
mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.002.Constr", "PREFAB_STORAGE_GRANARY2_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.003", "PREFAB_STORAGE_GRANARY3")
mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.003.Constr", "PREFAB_STORAGE_GRANARY3_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.004", "PREFAB_STORAGE_GRANARY4")
mod:registerAssetId("models/Storage1.fbx/Prefab/Granary.Part.004.Constr", "PREFAB_STORAGE_GRANARY4_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.002", "PREFAB_STORAGE_WAREHOUSE2")
mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.002.Constr", "PREFAB_STORAGE_WAREHOUSE2_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.003", "PREFAB_STORAGE_WAREHOUSE3")
mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.003.Constr", "PREFAB_STORAGE_WAREHOUSE3_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.004", "PREFAB_STORAGE_WAREHOUSE4")
mod:registerAssetId("models/Storage1.fbx/Prefab/Warehouse.Part.004.Constr", "PREFAB_STORAGE_WAREHOUSE4_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Combined.Part.001", "PREFAB_STORAGE_COMBINED1")
mod:registerAssetId("models/Storage1.fbx/Prefab/Combined.Part.001.Constr", "PREFAB_STORAGE_COMBINED1_CONSTR")

mod:registerAssetId("models/Storage1.fbx/Prefab/Door.Part.001", "PREFAB_STORAGE_DOOR1")
mod:registerAssetId("models/Storage1.fbx/Prefab/Door.Part.002", "PREFAB_STORAGE_DOOR2")
mod:registerAssetId("models/Storage1.fbx/Prefab/Door.Part.003", "PREFAB_STORAGE_DOOR3")
mod:registerAssetId("models/Storage1.fbx/Prefab/Door.Part.004", "PREFAB_STORAGE_DOOR4")



-- Building Part Type -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR1", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR2", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR3", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR4", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })



-- Attach Node -------------------------------------------------------------------------------------
-- forces doors and windows to be built after their attached building part
mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Door.Part.001/Attach_Door.021", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }, ForbidRotation = true, } )
mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Door.Part.002/Attach_Door.022", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }, ForbidRotation = true, } )
mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Door.Part.003/Attach_Door.023", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }, ForbidRotation = true, } )
mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Door.Part.004/Attach_Door.016", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }, ForbidRotation = true, } )



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Granary.Part.002/Side.001", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR1", { DataType = "COMP_GROUNDED" })
mod:registerPrefabComponent("PREFAB_STORAGE_DOOR3", { DataType = "COMP_GROUNDED" })

for i = 1, 8 do
    mod:registerPrefabComponent("models/Storage1.fbx/Prefab/Warehouse.Part.003/Box.00" .. i, { DataType = "COMP_GROUNDED" })
end



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/Storage1.fbx/Prefab/Door.Part.002", { "PLATFORM" })



-- -- Storage component
-- mod:registerPrefabComponent("PREFAB_STORAGE_GRANARY1", { DataType = "COMP_STORAGE_ASSEMBLAGE", Function = "BUILDING_FUNCTION_STORAGE_GRANARY_LOWCAPACITY" } )
-- mod:registerPrefabComponent("PREFAB_STORAGE_WAREHOUSE1", { DataType = "COMP_STORAGE_ASSEMBLAGE", Function = "BUILDING_FUNCTION_STORAGE_WAREHOUSE_LOWCAPACITY" } )



-- Material -------------------------------------------------------------------------------------
mod:registerAssetId("models/Storage1.fbx/Materials/Material.Thatch2", "MATERIAL_STORAGE_THATCH")
mod:overrideAsset({
    Id = "MATERIAL_STORAGE_THATCH",
    HasAlphaTest = true,
})



-- Building -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_STORAGE1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_STORAGE2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_STORAGE3")

-- Small Granary
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE_GRANARY_SMALL",
	Name = "BUILDING_STORAGE_GRANARY_SMALL_NAME",
	Description = "BUILDING_PART_GRANARY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_STORAGE_GRANARY2",
        "BUILDING_PART_STORAGE_GRANARY3",
    },
	IsEditable = true,
})

-- Large Granary
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE_GRANARY_LARGE",
	Name = "BUILDING_STORAGE_GRANARY_LARGE_NAME",
	Description = "BUILDING_PART_GRANARY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_STORAGE_GRANARY4",
        "BUILDING_PART_STORAGE_DOOR3",
    },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "CORE",
            Min = 1,
        },
        {
            Category = "DOOR",
            Min = 1,
        },
    },
})

-- Small Warehouse
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE_WAREHOUSE_SMALL",
	Name = "BUILDING_STORAGE_WAREHOUSE_SMALL_NAME",
	Description = "BUILDING_PART_WAREHOUSE_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_STORAGE_WAREHOUSE2",
        "BUILDING_PART_STORAGE_WAREHOUSE4",
        "BUILDING_PART_STORAGE_DOOR3",
    },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "CORE",
            Min = 1,
        },
        {
            Category = "DOOR",
            Min = 1,
        },
    },
})

-- Large Warehouse
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE_WAREHOUSE_LARGE",
	Name = "BUILDING_STORAGE_WAREHOUSE_LARGE_NAME",
	Description = "BUILDING_PART_WAREHOUSE_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_STORAGE_WAREHOUSE3",
    },
	IsEditable = true,
})

-- Tithe Barn
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE_TITHEBARN",
	Name = "BUILDING_PART_STORAGE_BARN_NAME",
	Description = "BUILDING_PART_COMBINED_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_STORAGE_COMBINED1",
        "BUILDING_PART_STORAGE_DOOR3",
    },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "CORE",
            Min = 1,
        },
        {
            Category = "DOOR",
            Min = 1,
        },
    },
})

-- Final
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_STORAGE",
	Name = "BUILDING_STORAGE_NAME",
	Description = "BUILDING_STORAGE_DESC",
    BuildingType = "LOGISTICS",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE3",
    -- SubAssetBuildingList = {
    --     "BUILDING_STORAGE_GRANARY_SMALL",
    --     "BUILDING_STORAGE_GRANARY_LARGE",
    --     "BUILDING_STORAGE_WAREHOUSE_SMALL",
    --     "BUILDING_STORAGE_WAREHOUSE_LARGE",
    --     "BUILDING_STORAGE_TITHE_BARN",
    -- },
    -- AssetBuildingPartList = {
        -- "BUILDING_PART_STORAGE_GRANARY2",
        -- "BUILDING_PART_STORAGE_GRANARY3",
        -- "BUILDING_PART_GRANARY",
        -- "BUILDING_PART_STORAGE_GRANARY4",

        -- "BUILDING_PART_STORAGE_WAREHOUSE2",
        -- "BUILDING_PART_STORAGE_WAREHOUSE4",
        -- "BUILDING_PART_WAREHOUSE",
        -- "BUILDING_PART_STORAGE_WAREHOUSE3",

        -- "BUILDING_PART_STORAGE_DOOR3",
        -- "BUILDING_PART_STORAGE_COMBINED1",

        -- "BUILDING_PART_STORAGE_GRANARY1",
        -- "BUILDING_PART_STORAGE_WAREHOUSE1",
    -- },
})



-- Unlockable -------------------------------------------------------------------------------------------------------------

-- Small Storage
mod:registerAssetId("icons/UnlockableSmall.png", "ICON_UNLOCKABLE_BUILDING_STORAGE_SMALL", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_STORAGE_SMALL",
    Name = "BUILDING_STORAGE_SMALL_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_STORAGE_SMALL",
    DataCost = {
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 100,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_STORAGE",
                },
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_STORAGE",
                        SubBuildingList = {
                            "BUILDING_STORAGE_GRANARY_SMALL",
                            "BUILDING_STORAGE_WAREHOUSE_SMALL",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_STORAGE_SMALL",
    },
})

-- Large Storage
mod:registerAssetId("icons/UnlockableLarge.png", "ICON_UNLOCKABLE_BUILDING_STORAGE_LARGE", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_STORAGE_LARGE",
    Name = "BUILDING_STORAGE_LARGE_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_STORAGE_LARGE",
    DataCost = {
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 200,
            },
        },
    },
    PrerequisiteUnlockableList = {
        "UNLOCKABLE_BUILDING_STORAGE_SMALL",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_STORAGE",
                        SubBuildingList = {
                            "BUILDING_STORAGE_GRANARY_LARGE",
                            "BUILDING_STORAGE_WAREHOUSE_LARGE",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_STORAGE_LARGE",
    },
})

-- Tithe Barn
mod:registerAssetId("icons/UnlockableTitheBarn.png", "ICON_UNLOCKABLE_BUILDING_STORAGE_TITHEBARN", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_STORAGE_TITHEBARN",
    Name = "BUILDING_PART_STORAGE_BARN_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_STORAGE_TITHEBARN",
    DataCost = {
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 250,
            },
        },
    },
    PrerequisiteUnlockableList = {
        "UNLOCKABLE_BUILDING_STORAGE_SMALL",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_STORAGE",
                        SubBuildingList = {
                            "BUILDING_STORAGE_TITHEBARN",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T4",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_STORAGE_TITHEBARN",
    },
})

-- -- Unlockable
-- mod:registerAsset({
--     DataType = "UNLOCKABLE",
--     Id = "UNLOCKABLE_STORAGE",
--     ActionList = {
--         {
--             DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
--             BuildingProgressData = {
--                 AssetBuildingList = {
--                     "BUILDING_STORAGE",
--                 },
--             },
--         },
--     },
-- })

-- mod:overrideAsset({
--     Id = "DEFAULT_BALANCING",
--     EventList = {
--         Action = "APPEND",
--         "EVENT_STORAGE_START",
--     },
-- })

-- mod:registerAsset({
-- 	DataType = "EVENT",
--     Id = "EVENT_STORAGE_START",
--     DaysToFirst = 1,
--     Delay = 1,
-- 	ConditionList = {
-- 		{
--             DataType = "GAME_CONDITION_BUILDING_BUILT",
--             AssetBuilding = "BUILDING_GRANARY",
-- 		},
-- 		{
--             DataType = "GAME_CONDITION_BUILDING_BUILT",
--             AssetBuilding = "BUILDING_WAREHOUSE",
-- 		},
-- 	},
-- 	ActionList = {
--         {
--             DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
--             BuildingProgressData = {
--                 AssetBuildingList = {
--                     "BUILDING_STORAGE",
--                 },
--             },
--         },
--     },
-- })



-- Overrides -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BUILDING_PART_GRANARY",
    Name = "BUILDING_PART_GRANARY_NAME",
    Category = "CORE",
})

mod:overrideAsset({
    Id = "BUILDING_PART_WAREHOUSE",
    Name = "BUILDING_PART_WAREHOUSE_NAME",
    Category = "CORE",
})

mod:overrideAsset({
    Id = "BUILDING_FUNCTION_WAREHOUSE",
    WorkerCapacity = 2,
    SocketCapacity = 100,
})

mod:overrideAsset({
    Id = "BUILDING_FUNCTION_GRANARY",
    WorkerCapacity = 2,
    SocketCapacity = 100,
})



-- -- Building Function -----------------------------------------------------------------
-- local function registerFunctionWarehouse(name, workers, capacity, prefab)

--     mod:registerAsset({
--         DataType = "BUILDING_FUNCTION_WAREHOUSE",
--         Id = "BUILDING_FUNCTION_STORAGE_WAREHOUSE_" .. name,
--         Name = "BUILDING_PART_WAREHOUSE_NAME",
--         WorkerCapacity = workers,
--         SocketCapacity = capacity,
--         SocketCount = 4,
--         DefaultResourceVisual = prefab,
--         AllowedResourceTypeList = {
--             {
--                 ResourceType = "RESOURCE",
--                 ShowInDescription = true,
--             },
--             {
--                 ResourceType = "GOODS",
--                 ShowInDescription = true,
--             },
--             {
--                 ResourceType = "LUXURY",
--                 ShowInDescription = true,
--             },
--         },
--         RelatedJob = {
--             Job = "TRANSPORTER",
--             Behavior = "BEHAVIOR_TRANSPORT"
--         },
--     })

-- end

-- registerFunctionWarehouse("LOWCAPACITY", 2, 50, "PREFAB_RESOURCE_VISUAL_CRATE")
-- registerFunctionWarehouse("MEDCAPACITY", 3, 100, "PREFAB_RESOURCE_VISUAL_CRATE")
-- registerFunctionWarehouse("HIGHCAPACITY", 4, 200, "PREFAB_RESOURCE_VISUAL_CRATE")



-- local function registerFunctionGranary(name, workers, capacity, prefab)

--     mod:registerAsset({
--         DataType = "BUILDING_FUNCTION_WAREHOUSE",
--         Id = "BUILDING_FUNCTION_STORAGE_GRANARY_" .. name,
--         Name = "BUILDING_PART_GRANARY_NAME",
--         WorkerCapacity = workers,
--         SocketCapacity = capacity,
--         SocketCount = 4,
--         DefaultResourceVisual = prefab,
--         AllowedResourceTypeList = {
--             {
--                 ResourceType = "RESOURCE_FOOD",
--                 ShowInDescription = true,
--             },
--             {
--                 ResourceType = "FOOD",
--                 ShowInDescription = true,
--             },
--             {
--                 ResourceType = "LUXURY_FOOD",
--                 ShowInDescription = true,
--             },
--             {
--                 ResourceType = "GRANARY",
--                 ShowInDescription = false,
--             },
--         },
--         RelatedJob = {
--             Job = "TRANSPORTER",
--             Behavior = "BEHAVIOR_TRANSPORT"
--         },
--     })

-- end

-- registerFunctionGranary("LOWCAPACITY", 2, 50, "PREFAB_RESOURCE_VISUAL_FLOUR_BAG")
-- registerFunctionGranary("MEDCAPACITY", 3, 100, "PREFAB_RESOURCE_VISUAL_FLOUR_BAG")
-- registerFunctionGranary("HIGHCAPACITY", 4, 200, "PREFAB_RESOURCE_VISUAL_FLOUR_BAG")



local function registerStorage(type, name)

    -- type should be WAREHOUSE or GRANARY
    -- attach_major in the parent prefab should be the same as parameter "name", e.g. Attach_Major.GRANARY1 if name = GRANARY1

    -- Remove the building zone and building cost
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_STORAGE_" .. name .. "_BARE",
        Name = "BUILDING_PART_" .. type .. "_NAME",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
            RandomPartList = {
                "BUILDING_PART_" .. type,
            },
        },
        AssetBuildingFunction = "BUILDING_FUNCTION_" .. type,
        -- AssetBuildingFunction = "BUILDING_FUNCTION_STORAGE_WAREHOUSE_LOWCAPACITY",
    })

    -- Attach to the parent prefab, which will shrink the vanilla prefab
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_STORAGE_" .. name .. "_ASSEMBLAGE",
        Name = "BUILDING_PART_" .. type .. "_NAME",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
            CoreRandomBuildingPartList = { "PREFAB_STORAGE_" .. type .. "1" },
            MandatoryBuildingPartList = {
                { BuildingPart = "BUILDING_PART_STORAGE_" .. name .. "_BARE", OptionalAttachNodeString = "Attach_Major." .. type .. "1" },
            },
        },
    })

    -- Final building part
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_STORAGE_" .. name,
        Name = "BUILDING_PART_" .. type .. "_NAME",
        Description = "BUILDING_PART_" .. type .. "_DESC",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
            RandomPartList = {
                "BUILDING_PART_STORAGE_" .. name .. "_ASSEMBLAGE",
            },
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 0.0
            },
        },
    })

end

-- registerStorage("GRANARY", "LOWCAPACITY")
-- registerStorage("GRANARY", "MEDCAPACITY")
-- registerStorage("GRANARY", "HIGHCAPACITY")
-- registerStorage("WAREHOUSE", "LOWCAPACITY")
-- registerStorage("WAREHOUSE", "MEDCAPACITY")
-- registerStorage("WAREHOUSE", "HIGHCAPACITY")

registerStorage("GRANARY", "GRANARY1")
registerStorage("WAREHOUSE", "WAREHOUSE1")




-- Building Part: Granary 2 (root cellar) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY2_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_GRANARY2_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_GRANARY2" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.002" },
            { BuildingPart = "BUILDING_PART_STORAGE_DOOR1", OptionalAttachNodeString = "Attach_Door.002" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY2",
    Name = "BUILDING_PART_STORAGE_GRANARY2_NAME",
    Description = "BUILDING_PART_GRANARY_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_GRANARY2_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 1.5, -23 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_GRANARY2_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {4.8, 7.0}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false }
            },
            {
                Polygon = polygon.createRectangle( {3.0, 2.8}, {0.0, 2.6}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false }
            },
        }
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "STONE", Quantity = 4 },
                { Resource = "PLANK", Quantity = 4 },
            },
		}
    },
})



-- Building Part: Granary 3 (corn crib) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY3_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_GRANARY3_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_GRANARY3" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.003" },
            { BuildingPart = "BUILDING_PART_STORAGE_DOOR2", OptionalAttachNodeString = "Attach_Door.003" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY3",
    Name = "BUILDING_PART_STORAGE_GRANARY3_NAME",
    Description = "BUILDING_PART_GRANARY_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_GRANARY3_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_GRANARY3_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {6.5, 3.5}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createRectangle( {2, 2}, {0.0, 2.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "STONE", Quantity = 6 },
                { Resource = "PLANK", Quantity = 12 },
            },
		},
    },
})



-- Building Part: Granary 4 (barn) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY4_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_GRANARY4_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_GRANARY4" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.004" },
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.005" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_GRANARY4",
    Name = "BUILDING_PART_STORAGE_GRANARY4_NAME",
    Description = "BUILDING_PART_GRANARY_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_GRANARY4_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_GRANARY4_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {6.0, 8.1}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 10 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 12 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "PLANK", Quantity = 20 },
            },
		},
    },
})



-- Building Part: Warehouse 2 (shed) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE2_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE2_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_WAREHOUSE2" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.006" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE2",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE2_NAME",
    Description = "BUILDING_PART_WAREHOUSE_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_WAREHOUSE2_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_WAREHOUSE2_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5.5, 5.0}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "STONE", Quantity = 6 },
                { Resource = "PLANK", Quantity = 6 },
            },
		},
    },
})




-- Building Part: Warehouse 3 (Storehouse) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE3_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE3_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_WAREHOUSE3" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.007" },
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.008" },
            { BuildingPart = "BUILDING_PART_STORAGE_DOOR4", OptionalAttachNodeString = "Attach_Door.015" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE3",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE3_NAME",
    Description = "BUILDING_PART_WAREHOUSE_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_WAREHOUSE3_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_WAREHOUSE3_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {7.2, 7.2}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 10 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 20 },
            },
		},
    },
})



-- Building Part: Warehouse 4 (Warehouse) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE4_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE4_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_WAREHOUSE4" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.009" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_WAREHOUSE4",
    Name = "BUILDING_PART_STORAGE_WAREHOUSE4_NAME",
    Description = "BUILDING_PART_WAREHOUSE_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_WAREHOUSE4_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_WAREHOUSE4_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.9, 5.3}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 8 },
            },
		},
    },
})



-- Building Part: Combined 1 (Tithe Barn) -----------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_COMBINED1_ASSEMBLAGE",
    Name = "BUILDING_PART_STORAGE_COMBINED1_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_STORAGE_COMBINED1" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.010" },
            { BuildingPart = "BUILDING_PART_STORAGE_WAREHOUSE1", OptionalAttachNodeString = "Attach_Major.011" },
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.012" },
            { BuildingPart = "BUILDING_PART_STORAGE_GRANARY1", OptionalAttachNodeString = "Attach_Major.013" },
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_COMBINED1_CONSTR",
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_COMBINED1",
    Name = "BUILDING_PART_STORAGE_COMBINED1_NAME",
    Description = "BUILDING_PART_COMBINED_DESC",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_STORAGE_COMBINED1_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
    ConstructionVisual = "PREFAB_STORAGE_COMBINED1_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {10.5, 16.5}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
        },
	},
	Cost = {
		BuildRightTaxes = { { Resource = "GOLD", Quantity = 25 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 25 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 40 },
                { Resource = "WOOD", Quantity = 30 },
                { Resource = "PLANK", Quantity = 30 },
            },
		},
    },
})



-- Building Part: Door 1 -----------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_DOOR1",
    Name = "BUILDING_PART_STORAGE_DOOR_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_STORAGE_DOOR1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
})



-- Building Part: Door 2 -----------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_DOOR2",
    Name = "BUILDING_PART_STORAGE_DOOR_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_STORAGE_DOOR2",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
})



-- Building Part: Door 3 -----------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_DOOR3",
    Name = "BUILDING_PART_STORAGE_DOOR_NAME",
    Category = "DOOR",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_STORAGE_DOOR3",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
	Cost = {
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
            },
		},
    },
})



-- Building Part: Door 4 -----------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_STORAGE_DOOR4",
    Name = "BUILDING_PART_STORAGE_DOOR_NAME",
    Category = "DOOR",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_STORAGE_DOOR4",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0,
        },
    },
})



