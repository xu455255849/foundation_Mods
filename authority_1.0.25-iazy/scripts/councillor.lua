local mod = ...



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorMaleFront", "PREFAB_AUTHORITY_COUNCILLOR_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorMaleHat", "PREFAB_AUTHORITY_COUNCILLOR_MALE_HAT")

mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorFemaleFront", "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorFemaleBelt", "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_BELT")
mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorFemaleHat", "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_HAT")

mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorAssistantMaleHat", "PREFAB_AUTHORITY_COUNCILLOR_ASSISTANT_MALE_HAT")
mod:registerAssetId("models/Authority2.fbx/Prefab/CouncillorAssistantFemaleHat", "PREFAB_AUTHORITY_COUNCILLOR_ASSISTANT_FEMALE_HAT")




-- Job: Councillor -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_COUNCILLOR",
	JobName = "JOB_AUTHORITY_COUNCILLOR_NAME",
	JobDescription = "JOB_AUTHORITY_COUNCILLOR_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_AUTHORITY_COUNCILLOR_MALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_BLANK",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_COUNCILLOR_MALE_FRONT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_COUNCILLOR_FEMALE_FRONT",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	}
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_COUNCILLOR",
    },
})



-- Building Function: COUNCILLOR's Chamber -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_COUNCILLOR",
	Name = "BUILDING_FUNCTION_AUTHORITY_COUNCILLOR_NAME",
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 3,
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
        Job = "JOB_AUTHORITY_COUNCILLOR",
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
	Id = "BUILDING_AUTHORITY_COUNCILLOR",
	Name = "BUILDING_FUNCTION_AUTHORITY_COUNCILLOR_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_COUNCILLOR",
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
    --             Quantity = 5,
    --         },
    --     },
    -- },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_RUSTIC_LORD_MANOR",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_COUNCILLOR",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Councillor.png", "ICON_AUTHORITY_COUNCILLOR", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_COUNCILLOR",
    Name = "JOB_AUTHORITY_COUNCILLOR_NAME",
    UnlockableImage = "ICON_AUTHORITY_COUNCILLOR",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "LABOUR",
                Quantity = 20,
            },
        },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 200,
            },
        },
    },
    PrerequisiteUnlockableList = {
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_RUSTIC_LORD_MANOR",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_COUNCILLOR",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_LABOUR_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_COUNCILLOR",
    },
})