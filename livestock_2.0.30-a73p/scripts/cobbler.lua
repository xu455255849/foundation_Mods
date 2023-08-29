local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Cobbler2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Cobbler2.fbx/Prefab/Cobbler.Part", "PREFAB_LIVESTOCKFARM_COBBLER")
mod:registerAssetId("models/Cobbler2.fbx/Prefab/Cobbler.Part.Constr", "PREFAB_LIVESTOCKFARM_COBBLER_CONSTR")



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Cobbler2.fbx/Prefab/Cobbler.Part/Door.001", {DataType = "COMP_GROUNDED"})



-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_COBBLER",
	JobName = "JOB_LIVESTOCKFARM_COBBLER_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_COBBLER_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 30.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_BLACKSMITH_HAMMER",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "MIXING",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_COBBLER"
--     }
-- })

-- mod:overrideAsset({
--     Id = "SERF",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_COBBLER"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_COBBLER"
    }
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_COBBLER"
    }
})



-- Building Function -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_LIVESTOCKFARM_COBBLER",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_COBBLER_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_COBBLER",
        Behavior = "BEHAVIOR_WORK",
    },
	InputInventoryCapacity = {
		{ Resource = "LEATHER", Quantity = 25 },
		-- { Resource = "WOOD", Quantity = 25 },
	},
    ResourceListNeeded = {
		{ Resource = "LEATHER", Quantity = 1 },
		-- { Resource = "WOOD", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_SHOES", Quantity = 2 },
	},
})



-- Building: ------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_COBBLER",
	Name = "BUILDING_LIVESTOCKFARM_COBBLER_NAME",
	Description = "BUILDING_LIVESTOCKFARM_COBBLER_DESC",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_LIVESTOCKFARM_COBBLER",
})

-- Unlockable
mod:registerAssetId("icons/UnlockableCobbler.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_COBBLER", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_LIVESTOCKFARM_COBBLER",
    Name = "LEATHER",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_COBBLER",
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
                    "BUILDING_LIVESTOCKFARM_TANNER",
                    "BUILDING_LIVESTOCKFARM_COBBLER",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_LIVESTOCKFARM_COBBLER",
    },
})


-- Building Part -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_COBBLER",
	Name = "BUILDING_PART_LIVESTOCKFARM_COBBLER_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_COBBLER",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 2.5, -22 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0,
        },
	},
	ConstructionVisual = "PREFAB_LIVESTOCKFARM_COBBLER_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {4.6, 6.0}, {0.0, -0.2} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_COBBLER",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD", Quantity = 25 },
        },
        UpkeepCost = {
            { Resource = "GOLD", Quantity = 10 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "WOOD", Quantity = 14 },
            },
            {
                { Resource = "PLANK", Quantity = 18 },
                { Resource = "TOOL", Quantity = 10 },
            },
		},
	},
})



