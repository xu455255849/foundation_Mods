local mod = ...



-- Asset
-- mod:registerAssetId("models/Butcher2.fbx/Prefab/ButcherPart", "PREFAB_LIVESTOCKFARM_BUTCHER")
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart", "PREFAB_LIVESTOCKFARM_BUTCHERMARKET")



-- -- Construction Asset
-- mod:registerAssetId("models/Butcher2.fbx/Prefab/ConstructionSteps", "PREFAB_LIVESTOCKFARM_BUTCHER_CONSTR")



-- Building Asset Processor
mod:registerAssetProcessor("models/Butcher2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- -- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/Butcher2.fbx/Prefab/ButcherPart", { "PLATFORM" })



-- Grounding
mod:registerPrefabComponent("models/Butcher2.fbx/Prefab/CounterPart", {DataType = "COMP_GROUNDED"})



-- Paths: Sales counter -------------------------------------------------------------------------------------
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart/PATH_B_1", "PATH_LIVESTOCKFARM_BUTCHER_B1")
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart/PATH_B_2", "PATH_LIVESTOCKFARM_BUTCHER_B2")
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart/PATH_B_3", "PATH_LIVESTOCKFARM_BUTCHER_B3")
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart/PATH_C_1", "PATH_LIVESTOCKFARM_BUTCHER_C1")
mod:registerAssetId("models/Butcher2.fbx/Prefab/CounterPart/PATH_D_1", "PATH_LIVESTOCKFARM_BUTCHER_D1")

mod:registerPrefabComponent("models/Butcher2.fbx/Prefab/CounterPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_LIVESTOCKFARM_BUTCHER_B1", "PATH_LIVESTOCKFARM_BUTCHER_B2", "PATH_LIVESTOCKFARM_BUTCHER_B3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_LIVESTOCKFARM_BUTCHER_C1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_LIVESTOCKFARM_BUTCHER_D1" }
        },
    }
})



-- -- Job -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "JOB",
-- 	Id = "JOB_LIVESTOCKFARM_BUTCHER",
-- 	JobName = "JOB_LIVESTOCKFARM_BUTCHER_NAME",
-- 	JobDescription = "JOB_LIVESTOCKFARM_BUTCHER_DESC",
-- 	IsLockedByDefault = false,
-- 	DefaultBehavior = "BEHAVIOR_WORK",
--     -- ProductionDelay = 70.0, -- default 30
-- 	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
-- 	CharacterSetup = {
--         CharacterSetupDataGendered = {
--             { -- MALE
--             },
--             { -- FEMALE
--             },
--             { -- ALL
--                 WalkAnimation = "WALKING",
--                 IdleAnimation = "IDLE",
--             },
--         },
-- 	},
-- })

-- mod:overrideAsset({
--     Id = "COMMONER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_BUTCHER"
--     }
-- })

-- mod:overrideAsset({
--     Id = "CITIZEN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_BUTCHER"
--     }
-- })



-- -- Building Function: Butcher -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHER",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHER_NAME",
--     WorkerCapacity = 2,
--     ProductionCycleDurationInSec = 70,
--     RelatedJob = { 
--         Job = "JOB_LIVESTOCKFARM_BUTCHER",
--         Behavior = "BEHAVIOR_WORK",
--     },
-- 	InputInventoryCapacity = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 25 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 1 },
-- 	},
-- 	ResourceProduced = {
-- 		{ Resource = "BV1_MEAT", Quantity = 5 },
-- 	},
-- })



-- Building Function: Butcher Sales Counter -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHERMARKET",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHERMARKET_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING"
    },
	TypeList = { "BUTCHER_RESOURCE_TYPE" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "BV1_MEAT", Quantity = 25 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "BV1_MEAT", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	{ Resource = "BV1_MEAT", Quantity = 10 },
	-- }
})



-- -- Building: Butcher's Shop -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_BUTCHER",
-- 	Name = "BUILDING_LIVESTOCKFARM_BUTCHER_NAME",
-- 	Description = "BUILDING_LIVESTOCKFARM_BUTCHER_DESC",
-- 	BuildingType = "FOOD_PRODUCTION",
-- 	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
-- 	AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_BUTCHER",
--         "BUILDING_PART_LIVESTOCKFARM_BUTCHERMARKET",
-- 	},
-- 	IsEditable = true,
--     RequiredPartList = {
--         {
--             Category = "PRODUCTION",
--             Min = 1,
--             Max = 1,
--         },
--     },
-- })



-- Unlockable
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        OwnerBuilding = "BUILDING_MARKETCART",
        AssetBuildingPartList = {
            "BUILDING_PART_LIVESTOCKFARM_BUTCHERMARKET",
        },
    }
end

-- mod:registerAssetId("icons/UnlockableButcher.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_BUTCHER", "ATLAS_CELL")
-- mod:registerAsset({
--     DataType = "UNLOCKABLE",
--     Id = "UNLOCKABLE_LIVESTOCKFARM_BUTCHER",
--     Name = "BUILDING_PART_SETLIST_LIVESTOCKFARM_BUTCHER1_NAME",
--     UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_BUTCHER",
--     DataCost = {
--         -- DataInfluenceCostList = {
--         --     {
--         --         Estate = "LABOUR",
--         --         Quantity = 5,
--         --     },
--         -- },
--         ResourceCollection = {
--             {
--                 Resource = "GOLD_COINS",
--                 Quantity = 200,
--             },
--         },
--     },
--     PrerequisiteUnlockableList = {},
--     ActionList = {
--         {
--             DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
--             BuildingProgressData = {
--                 AssetBuildingList = {
--                     "BUILDING_LIVESTOCKFARM_BUTCHER",
--                 },
--                 AdditionalBuildingUnlockList = {
--                     {
--                         OwnerBuilding = "BUILDING_LIVESTOCKFARM_CATTLE_PROCESS",
--                         AssetBuildingPartList = {
--                             "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER",
--                         },
--                     },
--                     {
--                         OwnerBuilding = "BUILDING_LIVESTOCKFARM_SHEEP_PROCESS",
--                         AssetBuildingPartList = {
--                             "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
--                         },
--                     },
--                     {
--                         OwnerBuilding = "BUILDING_LIVESTOCKFARM_PIG_PROCESS",
--                         AssetBuildingPartList = {
--                             "BUILDING_PART_LIVESTOCKFARM_PIGPEN",
--                         },
--                     },
--                     {
--                         OwnerBuilding = "BUILDING_LIVESTOCKFARM_GOAT_PROCESS",
--                         AssetBuildingPartList = {
--                             "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER",
--                         },
--                     },
--                     marketCart,
--                 },
--             },
--         },
--     },
-- })

-- mod:overrideAsset({
--     Id = "PROGRESS_TIER_COMMON_T4",
--     UnlockableList = {
--         Action = "APPEND",
--         "UNLOCKABLE_LIVESTOCKFARM_BUTCHER",
--     },
-- })


-- -- Building Part: Core -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_BUTCHER",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_BUTCHER_NAME",
-- 	Category = "PRODUCTION",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
-- 		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_BUTCHER",
--         MiniatureConfig = {
--             ClipUnderGround = true,
--             GroupHeight = 0.0,
--             CameraPosition = { -0.5, 3, -27 },
--             OrientationOffset = 0,
--             CameraPitchOffset = 0.0
--         },
-- 	},
-- 	ConstructionVisual = "PREFAB_LIVESTOCKFARM_BUTCHER_CONSTR",
-- 	BuildingZone = {
--         ZoneEntryList = {
--             {
--                 Polygon = polygon.createRectangle( {5.5, 7.5}, {0.0, 0.0} ),
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
-- 			},
-- 		},
-- 	},
-- 	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHER",
-- 	Cost = {
-- 		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
-- 		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
-- 		ResourceNeededList = {
--             {
--                 { Resource = "STONE", Quantity = 8 },
--                 { Resource = "WOOD", Quantity = 10 },
--                 { Resource = "PLANK", Quantity = 10 },
--                 { Resource = "TOOL", Quantity = 10 },
--             },
-- 		},
-- 	},
-- })



-- Building Part: Sales Counter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_BUTCHERMARKET",
	Name = "BUILDING_PART_LIVESTOCKFARM_BUTCHERMARKET_NAME",
	Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_BUTCHERMARKET",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	-- ConstructionVisual = "PREFAB_CONSTR_BUTCHERCOUNTER",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {2, 1.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_BUTCHERMARKET",
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
		Value = 0.5,
	} },
})


