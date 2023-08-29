local mod = ...



-- Job: CHAMBERLAIN_MONASTERY -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY",
	JobName = "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY_DESC",
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
        "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY"
    }
})

-- mod:overrideAsset({
--     Id = "NUN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY"
--     }
-- })



-- Building Function: CHAMBERLAIN_MONASTERY's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_MONASTERY_NAME",
    IsPrivate = true,
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
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
        Job = "JOB_AUTHORITY_CHAMBERLAIN_MONASTERY",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "CANDLE", Quantity = 20 },
        { Resource = "COMMON_WARES", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "CANDLE", Quantity = 1 },
        { Resource = "COMMON_WARES", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 2 },
    },
})



-- Building: Monastery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_CHAMBERLAIN_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_MONASTERY",
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
    },
})

