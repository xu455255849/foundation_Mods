local mod = ...



-- Job: Steward -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_STEWARD_MONASTERY",
	JobName = "JOB_AUTHORITY_STEWARD_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_STEWARD_MONASTERY_DESC",
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
    Id = "MONK",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_STEWARD_MONASTERY"
    }
})

-- mod:overrideAsset({
--     Id = "NUN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_AUTHORITY_STEWARD_MONASTERY"
--     }
-- })



-- Building Function: Steward's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_STEWARD_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_STEWARD_MONASTERY_NAME",
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    IsPrivate = true,
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 10,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_STEWARD_MONASTERY",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "PLANK", Quantity = 20 },
        -- { Resource = "TOOL", Quantity = 20 },
        { Resource = "POLISHED_STONE", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "PLANK", Quantity = 1 },
        -- { Resource = "TOOL", Quantity = 1 },
        { Resource = "POLISHED_STONE", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building: Monastery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_STEWARD_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_STEWARD_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_STEWARD_MONASTERY",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
    },
})



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/HouseholdMonastery.png", "ICON_AUTHORITY_HOUSEHOLD_MONASTERY", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD_MONASTERY",
    Name = "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD_MONASTERY_NAME",
    UnlockableImage = "ICON_AUTHORITY_HOUSEHOLD_MONASTERY",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "CLERGY",
                Quantity = 10,
            },
        },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 100,
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
                        OwnerBuilding = "MONUMENT_MONASTERY",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_STEWARD_MONASTERY",
                            "BUILDING_AUTHORITY_CELLARER_MONASTERY",
                            "BUILDING_AUTHORITY_CHAMBERLAIN_MONASTERY",
                            "BUILDING_AUTHORITY_GARDEN_MONASTERY",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_CLERGY_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD_MONASTERY",
    },
})