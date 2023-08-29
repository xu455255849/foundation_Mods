local mod = ...


-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Tree1RootPart", "PREFAB_TREEFOLK_TREE1ROOT")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Tree1TilingPart", "PREFAB_TREEFOLK_TREE1TILING")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Tree1EndPart", "PREFAB_TREEFOLK_TREE1END")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Tree2EndPart", "PREFAB_TREEFOLK_TREE2END")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Tree3EndPart", "PREFAB_TREEFOLK_TREE3END")

mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Water1Part", "PREFAB_TREEFOLK_WATER1")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Sacred1Part", "PREFAB_TREEFOLK_SACRED1")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part", "PREFAB_TREEFOLK_MARKET1")

mod:registerAssetId("models/TreeFolk1.fbx/Prefab/TreeHouse1EndPart", "PREFAB_TREEFOLK_TREEHOUSE1END")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/TreeHouse1RootPart", "PREFAB_TREEFOLK_TREEHOUSE1ROOT")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/TreeHouse1TilingPart", "PREFAB_TREEFOLK_TREEHOUSE1TILING")

mod:registerAssetId("models/TreeFolk1.fbx/Prefab/DruidFemale", "PREFAB_TREEFOLK_DRUIDFEMALE")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/DruidMale", "PREFAB_TREEFOLK_DRUIDMALE")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/DruidStaff", "PREFAB_TREEFOLK_DRUIDSTAFF")

mod:registerAssetId("models/TreeFolk2.fbx/Prefab/Stair1Part", "PREFAB_TREEFOLK_STAIR1")

mod:registerAssetId("models/TreeFolk3.fbx/Prefab/Bridge1Part", "PREFAB_TREEFOLK_BRIDGE1")

mod:registerAssetId("models/TreeFolk4.fbx/Prefab/Platform1EndPart", "PREFAB_TREEFOLK_PLATFORM1END")

mod:registerAssetId("models/TreeFolk5.fbx/Prefab/Snare1Part", "PREFAB_TREEFOLK_SNARE1")

mod:registerAssetId("models/TreeFolk6.fbx/Prefab/Mushroom1Part", "PREFAB_TREEFOLK_MUSHROOM_001")
mod:registerAssetId("models/TreeFolk6.fbx/Prefab/Hut1Part", "PREFAB_TREEFOLK_MUSHROOMHUT1")
mod:registerAssetId("models/TreeFolk6.fbx/Prefab/Hut1Part", "PREFAB_TREEFOLK_MUSHROOMHUT1")
mod:registerAssetId("models/TreeFolk6.fbx/Prefab/Hut1Part", "PREFAB_TREEFOLK_MUSHROOMHUT1")
mod:registerAssetId("models/TreeFolk6.fbx/Prefab/HatPart1", "PREFAB_HAT_FARMER1")
mod:registerAssetId("models/TreeFolk6.fbx/Prefab/HatPart2", "PREFAB_HAT_FARMER2")

mod:registerAssetId("models/TreeFolk7.fbx/Prefab/Forester1EndPart", "PREFAB_TREEFOLK_FORESTER1END")

mod:registerAssetId("models/TreeFolk8.fbx/Prefab/Nest1EndPart", "PREFAB_TREEFOLK_NEST1END")



-- Material (transparency) -------------------------------------------------------------------------------------
mod:registerAssetId("models/TreeFolk1.fbx/Materials/Material.Tree1", "MATERIAL_TREEFOLK_TREE1")
mod:registerAssetId("models/TreeFolk1.fbx/Materials/Material.Tree2", "MATERIAL_TREEFOLK_TREE2")
mod:registerAssetId("models/TreeFolk1.fbx/Materials/Material.Tree3", "MATERIAL_TREEFOLK_TREE3")
mod:registerAssetId("models/TreeFolk5.fbx/Materials/Material.Tree3", "MATERIAL_TREEFOLK_TREE4")
mod:registerAssetId("models/TreeFolk5.fbx/Materials/Material.Net1", "MATERIAL_TREEFOLK_NET1")
mod:registerAssetId("models/TreeFolk8.fbx/Materials/Material.Tree2", "MATERIAL_TREEFOLK_TREE5")

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_TREE1",
    HasAlphaTest = true
})

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_TREE2",
    HasAlphaTest = true
})

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_TREE3",
    HasAlphaTest = true
})

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_TREE4",
    HasAlphaTest = true
})

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_NET1",
    HasAlphaTest = true
})

mod:overrideAsset({
    Id = "MATERIAL_TREEFOLK_TREE5",
    HasAlphaTest = true
})



-- Comp Building Part -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/TreeFolk2.fbx/Prefab/Stair1Part", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "DOOR"
})

-- mod:registerPrefabComponent("models/TreeFolk3.fbx/Prefab/Bridge1Part", {
-- 	DataType = "COMP_BUILDING_PART",
-- 	BuildingPartType = "MINOR"
-- })

mod:registerPrefabComponent("models/TreeFolk5.fbx/Prefab/Snare1Part", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MINOR"
})

mod:registerEnumValue("BUILDING_PART_TYPE", "MUSHROOM")
mod:registerEnumValue("ATTACH_NODE_TYPE", "MUSHROOM")

mod:registerPrefabComponent("models/TreeFolk6.fbx/Prefab/Mushroom1Part", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MUSHROOM"
})



-- Attach nodes -------------------------------------------------------------------------------------
for i = 1, 1, 1 do
    mod:registerPrefabComponent("models/TreeFolk6.fbx/Prefab/Hut1Part/Attach_Mushroom." .. string.sub("000" .. i, -3), { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "MUSHROOM" } })
end

-- force doors and windows to be built after their attached building part
mod:registerPrefabComponent("models/TreeFolk2.fbx/Prefab/Stair1Part/Attach_Door.002", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }})



-- Platform  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/TreeFolk1.fbx/Prefab/TreeHouse1EndPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk2.fbx/Prefab/Stair1Part", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk3.fbx/Prefab/Bridge1Part", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk4.fbx/Prefab/Platform1EndPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk5.fbx/Prefab/Snare1Part", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk6.fbx/Prefab/Hut1Part", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk7.fbx/Prefab/Forester1EndPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/TreeFolk8.fbx/Prefab/Nest1EndPart", { "PLATFORM" })



-- Grounding
mod:registerPrefabComponent("models/TreeFolk7.fbx/Prefab/Forester1EndPart/Log.001", {DataType = "COMP_GROUNDED"})

for i=1, 20, 1 do
	mod:registerPrefabComponent("models/TreeFolk6.fbx/Prefab/Hut1Part/Attach_Mushroom." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end



-- Paths: Market -------------------------------------------------------------------------------------
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_R_1", "PATH_TREEFOLK_MARKET1_SELL1")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_S_1", "PATH_TREEFOLK_MARKET1_SELL2")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_RS_2", "PATH_TREEFOLK_MARKET1_SELL3")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_T_1", "PATH_TREEFOLK_MARKET1_BUY1")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_U_1", "PATH_TREEFOLK_MARKET1_BUY2")
mod:registerAssetId("models/TreeFolk1.fbx/Prefab/Market1Part/PATH_V_1", "PATH_TREEFOLK_MARKET1_BUY3")

mod:registerPrefabComponent("models/TreeFolk1.fbx/Prefab/Market1Part", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_TREEFOLK_MARKET1_SELL1", "PATH_TREEFOLK_MARKET1_SELL3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_TREEFOLK_MARKET1_SELL2", "PATH_TREEFOLK_MARKET1_SELL3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_TREEFOLK_MARKET1_BUY1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_TREEFOLK_MARKET1_BUY2" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_TREEFOLK_MARKET1_BUY3" }
        },
    }
})



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/TreeFolk1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk3.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk4.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk5.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk6.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk7.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/TreeFolk8.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Resource container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "models/TreeFolk6.fbx/Prefab/Mushroom1Part", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_MUSHROOM",
    IsReplenishable = true,
    ReplenishDurationInDays = 7,
    ReplenishQuantity = 2,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 2, -- maximum container stock
    Radius = 1.0, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = false
})



-- Job: Druid -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TREEFOLK_DRUID",
	JobName = "JOB_TREEFOLK_DRUID_NAME",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 20.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_TREEFOLK_DRUIDMALE",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_TREEFOLK_DRUIDFEMALE",
                },
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TREEFOLK_DRUIDSTAFF"
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
--         "JOB_TREEFOLK_DRUID"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TREEFOLK_DRUID",
    },
})



-- Job: Forager -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TREEFOLK_FORAGER",
	JobName = "JOB_TREEFOLK_FORAGER_NAME",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_GATHER",
    -- ProductionDelay = 16.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_HAT_FARMER2",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_HAT_FARMER1",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "GATHER",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TREEFOLK_FORAGER",
    },
})



-- Job: Hunter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_TREEFOLK_WILDFOWL",
	JobName = "JOB_TREEFOLK_WILDFOWL_NAME",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 16.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                LeftHandObject = {
                    Model = "PREFAB_TOOL_FARMER_SEED_BAG",
                    WorkAttachName = "SeedBag_Anchor",
                    WalkAttachName = "SeedBag_Anchor",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "MARKET_TENDER",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_TREEFOLK_WILDFOWL",
    },
})



-- Building Function: Wildfowl snare -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_TREEFOLK_SNARE",
    Name = "BUILDING_PART_TREEFOLK_SNARE_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 16,
    RelatedJob = {
        Job = "JOB_TREEFOLK_WILDFOWL",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_POULTRY", Quantity = 1 },
	},
})



-- Building: Tree Folk -------------------------------------------------------------------------------------

-- Exclude the well part if the Deserts mod is loaded
local wellPart = nil
if not foundation.isModLoaded("724718b2-551b-404f-912f-9b29dde53a31") then
    wellPart = "BUILDING_PART_TREEFOLK_WATER1"
end

-- Building
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_TREEFOLK",
	Name = "BUILDING_TREEFOLK_NAME",
	Description = "BUILDING_TREEFOLK_DESC",
	BuildingType = "MODS",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_TREEFOLK_TREE1",
        "BUILDING_PART_TREEFOLK_TREE2",
        "BUILDING_PART_TREEFOLK_TREE3",
        "BUILDING_PART_TREEFOLK_TREEHOUSE1",
        "BUILDING_PART_TREEFOLK_PLATFORM1",
        "BUILDING_PART_TREEFOLK_STAIR1",

        wellPart,
        "BUILDING_PART_TREEFOLK_FORESTER1",
        "BUILDING_PART_TREEFOLK_SACRED1",
        "BUILDING_PART_TREEFOLK_SNARE1",
        "BUILDING_PART_TREEFOLK_NEST1",
        "BUILDING_PART_TREEFOLK_MUSHROOM1",
        "BUILDING_PART_TREEFOLK_MARKET1",
    },
	IsEditable = true,
    IsClearTrees = false,
})

-- Unlockable
mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_BUILDING_TREEFOLK", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_TREEFOLK",
    Name = "BUILDING_TREEFOLK_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_TREEFOLK",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "LABOUR",
                Quantity = 15,
            },
        },
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
                    "BUILDING_TREEFOLK",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_LABOUR_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_TREEFOLK",
    },
})



-- Building Part: Tree 1 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE1END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1END"
	},
})

-- Tiling
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE1TILING",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1TILING"
	},
	Cost = {
	}
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE1",
	Name = "BUILDING_PART_TREEFOLK_TREE_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_TREE1END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true,
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -2,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2.8, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
			},
		}
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 10 } },
	}
})



-- Building Part: Tree 2 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE2END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE2END"
	},
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE2",
	Name = "BUILDING_PART_TREEFOLK_TREE_NAME", 
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_TREE2END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true,
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -2,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 2.8, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		}
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 10 } },
	},
})



-- Building Part: Tree 3 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE3END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE3END"
	},
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREE3",
	Name = "BUILDING_PART_TREEFOLK_TREE_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_TREE3END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true,
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -2,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0,
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2.8, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 10 } },
	},
})



-- Building Part: Tree House 1 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREEHOUSE1END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREEHOUSE1END"
	},
	-- ConstructionVisual = "PREFAB_TREEFOLK_TREEHOUSE1END_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 12 },
            },
		},
	},
})

-- Tiling
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREEHOUSE1TILING",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREEHOUSE1TILING"
	},
	Cost = {
	}
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_TREEHOUSE1",
	Name = "BUILDING_PART_TREEFOLK_TREEHOUSE_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREEHOUSE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_TREEHOUSE1END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREEHOUSE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true,
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -90,
            CameraPitchOffset = 0.0
        },
	},
    Capacity = 4,
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2.6, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
			},
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_TREEFOLK_TREEHOUSE1",
	Cost = {
	}
})

-- House Setup -------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "HOUSE_SETUP",
    Id = "HOUSE_SETUP_TREEFOLK_TREEHOUSE1",
    HouseStatusList = {
        {
            DataType = "HOUSE_STATUS",
            RequiredDesirability = DESIRABILITY_LEVEL.LOW,
            ResourceGenerated = "HOUSING_LEVEL_1",
            HouseDensityPartList = { 
                "BUILDING_PART_TREEFOLK_TREEHOUSE1",
            }
        },
    }
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_HOUSE",
    Id = "BUILDING_FUNCTION_TREEFOLK_TREEHOUSE1",
    RelatedZone = "RESIDENTIAL",
    RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
    AssetHouseSetup = "HOUSE_SETUP_TREEFOLK_TREEHOUSE1"
})



-- Building Part: Platform 1 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_PLATFORM1END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_PLATFORM1END"
	},
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_PLATFORM1",
	Name = "BUILDING_PART_TREEFOLK_PLATFORM_NAME", 
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_PLATFORM1END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2.6, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
			},
		}
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
            },
        }
	}
})



-- Building Part: Stair 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_STAIR1",
	Name = "BUILDING_PART_TREEFOLK_STAIR_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_STAIR1"
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {5.0, 0.9}, {-0.5, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
			},
		},
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		}
	}
})



-- Building Part: Bridge 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_BRIDGE1",
	Name = "BUILDING_PART_TREEFOLK_BRIDGE_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_BRIDGE1",
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {14.0, 0.9}, {0.0, 0} ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {2.0, 0.9}, {-5.0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {2.0, 0.9}, {5.0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		},
	},
})



-- Building Part: Water 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_WATER1",
	Name = "BUILDING_PART_TREEFOLK_WATER_NAME",
    Category = "PRODUCTION",
    AssetBuildingFunction = "BUILDING_FUNCTION_WELL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_WATER1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -1.5,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = {
                    {-2.3, 0},
                    {-2, 1},
                    {-1, 1.6},
                    {0, 1.8},
                    {1, 1.3},
                    {2, 0.4},
                    {2.2, -0.4},
                    {2.1, -1.3},
                    {1.6, -1.7},
                    {0.6, -1.9},
                    {-0.8, -1.6},
                    {-2, -1},
                },
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createCircle( 1.5, {0.0, 0}, 10 ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 10 } },
	},
})



-- Building Part: Forester / Woodcutter combo 1 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_FORESTER1END",
    Name = "BUILDING_PART_TREEFOLK_FORESTER_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_FORESTER1END"
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_WOODCUTTER",
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_FORESTER1",
	Name = "BUILDING_PART_TREEFOLK_FORESTER_NAME",
    Category = "PRODUCTION",
    Description = "BUILDING_PART_TREEFOLK_FORESTER_DESC",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_FORESTER1END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true,
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -1,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 45,
            CameraPitchOffset = 0.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = {
                    {-1.7, -1.5},
                    {-2.5, -3.1},
                    {-1.0, -4},
                    {-.2, -2.4},

                    {0.2, -2.4},
                    {1, -3.4},
                    {2, -3.4},
                    {2.3, -3},
                    {2.3, -2.2},
                    {1.7, 1.5},

                    {2, -0.8},
                    {4.1, -0.8},
                    {4.1, 0.8},
                    {2, 0.8},
 
                    {1.5, 1.5},
                    {1, 1.8},
                    {0, 2.1},

                    {-.5, 2},
                    {-1.7, 3.8},
                    {-3, 2.8},
                    {-1.8, 1.1},

                    {-2, 1},
                    {-2.2, 0},
                    {-2, -1},
                },
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_FORESTER",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 3 },
            },
		},
	},
})



-- Building Function: Sacred Tree -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_TREEFOLK_SACRED",
    Name = "BUILDING_PART_TREEFOLK_SACRED_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "JOB_TREEFOLK_DRUID",
        Behavior = "BEHAVIOR_WORK",
	},
	TypeList = { "RESOURCE_TYPE_PAGANISM" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 10,
  	ResourceProduced = {
		{ Resource = "RESOURCE_PAGANISM", Quantity = 1 },
	},
})



-- Building Part: Sacred Tree 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_SACRED1",
	Name = "BUILDING_PART_TREEFOLK_SACRED_NAME",
    Category = "OTHER",
    AssetBuildingFunction = "BUILDING_FUNCTION_TREEFOLK_SACRED",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_SACRED1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -1.5,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 3.7, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 10 } }
	},
})



-- Building Part: Snare 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_SNARE1",
	Name = "BUILDING_PART_TREEFOLK_SNARE_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_SNARE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -1.5,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 1.5, {0.0, 0}, 12 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
    IsOnlyAttached = true,
    AssetBuildingFunction = "BUILDING_FUNCTION_TREEFOLK_SNARE",
	Cost = {
        BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 6 } },
	},
})



-- Building Function: Forager -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_TREEFOLK_MUSHROOM",
    Name = "BUILDING_PART_TREEFOLK_MUSHROOM_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 16,
    RelatedJob = { 
        Job = "JOB_TREEFOLK_FORAGER",
        Behavior = "BEHAVIOR_GATHER",
	},
	InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_MUSHROOM", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_MUSHROOM", Quantity = 1 },
	},
})



-- Building Part: individual mushrooms -------------------------------------------------------------------------------------
for i=1, 1, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_TREEFOLK_MUSHROOM_" .. string.sub("000" .. i, -3),
        Name = "BUILDING_PART_TREEFOLK_MUSHROOM_" .. string.sub("000" .. i, -3) .. "_NAME", 
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_TREEFOLK_MUSHROOM_" .. string.sub("000" .. i, -3)
        }
    })

end



-- Building Part: Mushroom Hut 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_MUSHROOM1_ASSEMBLAGE",
	Name = "BUILDING_PART_TREEFOLK_MUSHROOM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_TREEFOLK_MUSHROOMHUT1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.001" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.002" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.003" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.004" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.005" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.006" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.007" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.008" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.009" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.010" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.011" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.012" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.013" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.014" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.015" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.016" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.017" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.018" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.019" },
			{ BuildingPart = "BUILDING_PART_TREEFOLK_MUSHROOM_001", OptionalAttachNodeString = "Attach_Mushroom.020" },
		}
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_MUSHROOM1",
	Name = "BUILDING_PART_TREEFOLK_MUSHROOM_NAME", 
    Category = "PRODUCTION",
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
            "BUILDING_PART_TREEFOLK_MUSHROOM1_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 4,
            CameraPosition = { 0, 8, -30 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0,
        },
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_TREEFOLK_MUSHROOM",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 1.0, {0.0, 0}, 12 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 8 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 16 },
            },
		},
    },
})



-- Building Part: Market 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_MARKET1",
	Name = "BUILDING_PART_TREEFOLK_MARKET_NAME", 
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_MARKET1",
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {3.0, 2.8}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_FOOD_MARKET",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		},
    },
})



-- Building Function: Wildfowl nests -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_TREEFOLK_NEST",
    Name = "BUILDING_PART_TREEFOLK_NEST_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_TREEFOLK_WILDFOWL",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
    ResourceProduced = {
		{ Resource = "BV1_EGG", Quantity = 1 },
	}
})



-- Building Part: Nest 1 -------------------------------------------------------------------------------------

-- End
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_NEST1END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_TREEFOLK_NEST1END"
	},
})

-- Final
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_TREEFOLK_NEST1",
	Name = "BUILDING_PART_TREEFOLK_NEST_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_TREEFOLK_TREE1ROOT",
		EndPart = "BUILDING_PART_TREEFOLK_NEST1END",
		FillerList = {
		    "BUILDING_PART_TREEFOLK_TREE1TILING",
    	},
		BasementFillerList = {
       	},
		MinimumScale = 0,
		IsVertical = true
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 1.6, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_TREEFOLK_NEST",
	Cost = {
        BuildRightTaxes = {	{ Resource = "WOOD", Quantity = 8 } },
	},
})
