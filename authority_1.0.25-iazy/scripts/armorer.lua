local mod = ...



-- Job: ARMORER -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_ARMORER",
	JobName = "JOB_AUTHORITY_ARMORER_NAME",
	JobDescription = "JOB_AUTHORITY_ARMORER_DESC",
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
    Id = "SOLDIER_SOLDIER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_ARMORER"
    }
})



-- Building Function: ARMORER's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_ARMORER",
	Name = "BUILDING_FUNCTION_AUTHORITY_ARMORER_NAME",
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 20,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_ARMORER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "SWORD", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "SWORD", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 2 },
    },
})



-- Building: Keep -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_ARMORER",
	Name = "BUILDING_FUNCTION_AUTHORITY_ARMORER_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_ARMORER",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
        {
            Category = "DECORATION",
            Min = 2,
        },
        {
            Category = "DECORATIVE_ESTATE",
            Min = 1,
        },
    },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_WOODEN_KEEP",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_ARMORER",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Armorer.png", "ICON_AUTHORITY_ARMORER", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_ARMORER",
    Name = "JOB_AUTHORITY_ARMORER_NAME",
    UnlockableImage = "ICON_AUTHORITY_ARMORER",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "KINGDOM",
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
                        OwnerBuilding = "MONUMENT_WOODEN_KEEP",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_ARMORER",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_KINGDOM_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_ARMORER",
    },
})