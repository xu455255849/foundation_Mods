local mod = ...



-- Job: Abbot -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_ABBOT_MONASTERY",
	JobName = "JOB_AUTHORITY_ABBOT_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_ABBOT_MONASTERY_DESC",
    IsLockedByDefault = false,
    Hidden = true,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

mod:overrideAsset({
    Id = "MONK_PRIOR",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_ABBOT_MONASTERY",
    },
})

-- Job: Abbess -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_ABBESS_MONASTERY",
	JobName = "JOB_AUTHORITY_ABBESS_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_ABBESS_MONASTERY_DESC",
    IsLockedByDefault = false,
    Hidden = true,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

mod:overrideAsset({
    Id = "MONK_PRIOR",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_ABBESS_MONASTERY",
    },
})



-- Building Function: Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_ABBOT_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ABBOT_MONASTERY_NAME",
    IsPrivate = true,
	-- HasMaximumInstance = true,
	-- MaximumInstanceAllowed = 1,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 20,
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
        Job = "JOB_AUTHORITY_ABBOT_MONASTERY",
        Behavior = "BEHAVIOR_WORK",
    },
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 3 },
    },
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_ABBESS_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ABBESS_MONASTERY_NAME",
    IsPrivate = true,
	-- HasMaximumInstance = true,
	-- MaximumInstanceAllowed = 1,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 20,
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
        Job = "JOB_AUTHORITY_ABBESS_MONASTERY",
        Behavior = "BEHAVIOR_WORK",
    },
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 3 },
    },
})



-- Building: Monastery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_ABBOT_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ABBOT_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_ABBOT_MONASTERY",
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
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_ABBESS_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ABBESS_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_ABBESS_MONASTERY",
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
})



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Abbot.png", "ICON_AUTHORITY_ABBOT_MONASTERY", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_ABBOT_MONASTERY",
    Name = "UNLOCKABLE_BUILDING_AUTHORITY_ABBOT_ABBESS_NAME",
    UnlockableImage = "ICON_AUTHORITY_ABBOT_MONASTERY",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "CLERGY",
                Quantity = 20,
            },
        },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 400,
            },
        },
    },
    PrerequisiteUnlockableList = {
        "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD_MONASTERY",
        "UNLOCKABLE_BUILDING_AUTHORITY_ARCHIVIST_MONASTERY",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_MONASTERY",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_ABBOT_MONASTERY",
                            "BUILDING_AUTHORITY_ABBESS_MONASTERY",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_CLERGY_T4",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_ABBOT_MONASTERY",
    },
})