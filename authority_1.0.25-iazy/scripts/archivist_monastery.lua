local mod = ...



-- Job: Steward -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_ARCHIVIST_MONASTERY",
	JobName = "JOB_AUTHORITY_ARCHIVIST_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_ARCHIVIST_MONASTERY_DESC",
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
        "JOB_AUTHORITY_ARCHIVIST_MONASTERY"
    }
})

-- mod:overrideAsset({
--     Id = "NUN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_AUTHORITY_ARCHIVIST_MONASTERY"
--     }
-- })



-- Building Function: Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_ARCHIVIST_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ARCHIVIST_MONASTERY_NAME",
    IsPrivate = true,
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30,
    WorkCycleNeededToProduceOnce = 2,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 20,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_ARCHIVIST_MONASTERY",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "MANUSCRIPT", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "MANUSCRIPT", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 2 },
    },
})



-- Building: Monastery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_ARCHIVIST_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_ARCHIVIST_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_ARCHIVIST_MONASTERY",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
    },
})



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Archivist.png", "ICON_AUTHORITY_ARCHIVIST_MONASTERY", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_ARCHIVIST_MONASTERY",
    Name = "JOB_AUTHORITY_ARCHIVIST_MONASTERY_NAME",
    UnlockableImage = "ICON_AUTHORITY_ARCHIVIST_MONASTERY",
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
                            "BUILDING_AUTHORITY_ARCHIVIST_MONASTERY",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_CLERGY_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_ARCHIVIST_MONASTERY",
    },
})