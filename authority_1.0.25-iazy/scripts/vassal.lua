local mod = ...



-- Job: VASSAL -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_VASSAL",
	JobName = "JOB_AUTHORITY_VASSAL_NAME",
	JobDescription = "JOB_AUTHORITY_VASSAL_DESC",
    IsLockedByDefault = false,
    Hidden = false,
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
    Id = "SOLDIER_KNIGHT",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_VASSAL",
    },
})



-- Building Function: VASSAL's Tower -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_VASSAL",
	Name = "BUILDING_FUNCTION_AUTHORITY_VASSAL_NAME",
	HasMaximumInstance = false,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 40,
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
        Job = "JOB_AUTHORITY_VASSAL",
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



-- Building: Keep -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_VASSAL",
	Name = "BUILDING_FUNCTION_AUTHORITY_VASSAL_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_VASSAL",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 2,
        },
        {
            Category = "DECORATION",
            Min = 6,
        },
        {
            Category = "DECORATIVE_ESTATE",
            Min = 2,
        },
    },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_WOODEN_KEEP",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_VASSAL",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Vassal.png", "ICON_AUTHORITY_VASSAL", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_VASSAL",
    Name = "JOB_AUTHORITY_VASSAL_NAME",
    UnlockableImage = "ICON_AUTHORITY_VASSAL",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "KINGDOM",
                Quantity = 40,
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
        "UNLOCKABLE_BUILDING_AUTHORITY_BARRACKS",
        "UNLOCKABLE_BUILDING_AUTHORITY_ARMORER",
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_WOODEN_KEEP",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_VASSAL",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_KINGDOM_T4",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_VASSAL",
    },
})