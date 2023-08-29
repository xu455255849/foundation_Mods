local mod = ...



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/GentryMaleFront", "PREFAB_AUTHORITY_GENTRY_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GentryFemaleBelt", "PREFAB_AUTHORITY_GENTRY_FEMALE_BELT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GentryFemaleFront", "PREFAB_AUTHORITY_GENTRY_FEMALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GentryFemaleHat", "PREFAB_AUTHORITY_GENTRY_FEMALE_HAT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GentryMaleHat", "PREFAB_AUTHORITY_GENTRY_MALE_HAT")



-- Job: GENTRY -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_GENTRY",
	JobName = "JOB_AUTHORITY_GENTRY_NAME",
	JobDescription = "JOB_AUTHORITY_GENTRY_DESC",
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                BeltList = {
                    "PREFAB_AUTHORITY_BLANK",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_GENTRY_MALE_FRONT",
                },
                HatList = {
                    "PREFAB_AUTHORITY_GENTRY_MALE_HAT",
                },
            },
            { -- FEMALE
                BeltList = {
                    "PREFAB_AUTHORITY_GENTRY_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_GENTRY_FEMALE_FRONT",
                },
                HatList = {
                    "PREFAB_AUTHORITY_GENTRY_FEMALE_HAT",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
    },
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_GENTRY",
    },
})



-- Building Function: GENTRY's Chamber -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_GENTRY",
	Name = "BUILDING_FUNCTION_AUTHORITY_GENTRY_NAME",
	-- HasMaximumInstance = true,
	-- MaximumInstanceAllowed = 6,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = {
		{
			Resource = "GOLD_COINS",
			Quantity = 20,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_GENTRY",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 2 },
    },
})



-- Building: Manor -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_GENTRY",
	Name = "BUILDING_FUNCTION_AUTHORITY_GENTRY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_GENTRY",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 2,
        },
        {
            Category = "DECORATION",
            Min = 3,
        },
        {
            Category = "DECORATIVE_ESTATE",
            Min = 1,
        },
    },
    -- DataConstructionValidationConditionList = {
    --     {
    --         DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
    --         VillagerStatusQuantityPair = {
    --             Status = "CITIZEN",
    --             Quantity = 15,
    --         },
    --     },
    -- },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_RUSTIC_GENTRY_MANOR",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_GENTRY",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Gentry.png", "ICON_AUTHORITY_GENTRY", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_GENTRY",
    Name = "JOB_AUTHORITY_GENTRY_NAME",
    UnlockableImage = "ICON_AUTHORITY_GENTRY",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "LABOUR",
                Quantity = 40,
            },
        },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 500,
            },
        },
    },
    PrerequisiteUnlockableList = {
        "UNLOCKABLE_BUILDING_AUTHORITY_LORD",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_RUSTIC_LORD_MANOR",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_GENTRY",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_LABOUR_T4",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_GENTRY",
    },
})