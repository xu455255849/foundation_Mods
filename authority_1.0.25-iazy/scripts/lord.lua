local mod = ...



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleFront", "PREFAB_AUTHORITY_LORD_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleHat", "PREFAB_AUTHORITY_LORD_MALE_HAT")

mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleBelt", "PREFAB_AUTHORITY_LORD_FEMALE_BELT")
mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleFront", "PREFAB_AUTHORITY_LORD_FEMALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleHat", "PREFAB_AUTHORITY_LORD_FEMALE_HAT")




-- Job: Lord -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_LORD",
	JobName = "JOB_AUTHORITY_LORD_NAME",
	JobDescription = "JOB_AUTHORITY_LORD_DESC",
    IsLockedByDefault = false,
    -- Hidden = true,
    Hidden = false,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 160.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_AUTHORITY_LORD_MALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_BLANK",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_LORD_MALE_FRONT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_FRONT",
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
        "JOB_AUTHORITY_LORD",
    },
})



-- Job: Lady -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_LADY",
	JobName = "JOB_AUTHORITY_LADY_NAME",
	JobDescription = "JOB_AUTHORITY_LADY_DESC",
    IsLockedByDefault = false,
    Hidden = false,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 160.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_AUTHORITY_LORD_MALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_BLANK",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_LORD_MALE_FRONT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_HAT",
                },
                BeltList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_LORD_FEMALE_FRONT",
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
        "JOB_AUTHORITY_LADY",
    },
})



-- Building Function: Lord's Chamber -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_LORD",
	Name = "BUILDING_FUNCTION_AUTHORITY_LORD_NAME",
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = {
		{
			Resource = "GOLD_COINS",
			Quantity = 30,
		},
	},
    -- GameRuleModifierList = {
    --     {
    --         DataType = "GAME_RULE_MODIFIER_CROP_YIELDS",
    --         IsUntilRemoval = true,
    --         ResourceList = {
    --             "RESOURCE_AUTHORITY",
    --         },
    --         YieldPercentage = 1.10,
    --     },
    -- },
    RelatedJob = {
        Job = "JOB_AUTHORITY_LORD",
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



-- Building Function: Lady's Chamber -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_LADY",
	Name = "BUILDING_FUNCTION_AUTHORITY_LADY_NAME",
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = {
		{
			Resource = "GOLD_COINS",
			Quantity = 30,
		},
	},
    -- GameRuleModifierList = {
    --     {
    --         DataType = "GAME_RULE_MODIFIER_CROP_YIELDS",
    --         IsUntilRemoval = true,
    --         ResourceList = {
    --             "RESOURCE_AUTHORITY",
    --         },
    --         YieldPercentage = 1.10,
    --     },
    -- },
    RelatedJob = {
        Job = "JOB_AUTHORITY_LADY",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 3 },
    },
})



-- Building: Lord Manor -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_LORD",
	Name = "BUILDING_FUNCTION_AUTHORITY_LORD_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_LORD",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 2,
        },
        {
            Category = "DECORATION",
            Min = 5,
        },
        {
            Category = "DECORATIVE_ESTATE",
            Min = 2,
        },
    },
    -- DataConstructionValidationConditionList = {
    --     {
    --         DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
    --         VillagerStatusQuantityPair = {
    --             Status = "CITIZEN",
    --             Quantity = 10,
    --         },
    --     },
    -- },
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_LADY",
	Name = "BUILDING_FUNCTION_AUTHORITY_LADY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_LADY",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 2,
        },
        {
            Category = "DECORATION",
            Min = 5,
        },
        {
            Category = "DECORATIVE_ESTATE",
            Min = 2,
        },
    },
    -- DataConstructionValidationConditionList = {
    --     {
    --         DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
    --         VillagerStatusQuantityPair = {
    --             Status = "CITIZEN",
    --             Quantity = 10,
    --         },
    --     },
    -- },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_RUSTIC_LORD_MANOR",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_LORD",
--         "BUILDING_AUTHORITY_LADY",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Lord.png", "ICON_AUTHORITY_LORD", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_LORD",
    Name = "UNLOCKABLE_AUTHORITY_LORD_LADY",
    UnlockableImage = "ICON_AUTHORITY_LORD",
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
                Quantity = 500,
            },
        },
    },
    PrerequisiteUnlockableList = {
        "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD",
        "UNLOCKABLE_BUILDING_AUTHORITY_COUNCILLOR",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_RUSTIC_LORD_MANOR",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_LORD",
                            "BUILDING_AUTHORITY_LADY",
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
        "UNLOCKABLE_BUILDING_AUTHORITY_LORD",
    },
})