local mod = ...



-- Job: Chamberlain -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_CHAMBERLAIN",
	JobName = "JOB_AUTHORITY_CHAMBERLAIN_NAME",
	JobDescription = "JOB_AUTHORITY_CHAMBERLAIN_DESC",
    IsLockedByDefault = false,
    Hidden = false,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                BeltList = {
                    "PREFAB_AUTHORITY_BLANK",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_CHAMBERLAIN_MALE_FRONT",
                },
            },
            { -- FEMALE
                BeltList = {
                    "PREFAB_AUTHORITY_CHAMBERLAIN_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_CHAMBERLAIN_FEMALE_FRONT",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "SERF",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_AUTHORITY_CHAMBERLAIN"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_CHAMBERLAIN"
    }
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_CHAMBERLAIN",
    },
})




-- Building Function: Chamberlain's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN",
	Name = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_NAME",
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
        Job = "JOB_AUTHORITY_CHAMBERLAIN",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "RESOURCE_AUTHORITY_CHAMBERLAIN", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "RESOURCE_AUTHORITY_CHAMBERLAIN", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building Function: Storehouse -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_STOREHOUSE",
	Name = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_STOREHOUSE_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 10,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 5,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_SERVANT",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "CLOTHES", Quantity = 20 },
        { Resource = "COMMON_WARES", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "CLOTHES", Quantity = 1 },
        { Resource = "COMMON_WARES", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY_CHAMBERLAIN", Quantity = 2 },
    },
})



-- Building: Lord Manor -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_CHAMBERLAIN",
	Name = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_CHAMBERLAIN",
    AssetBuildingPartList = {
        Action = "APPEND",
        "BUILDING_PART_AUTHORITY_STORAGE1_CHAMBERLAIN",
        "BUILDING_PART_AUTHORITY_STORAGE2_CHAMBERLAIN",
    },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
        {
            Category = "RESOURCE_DEPOT",
            Min = 1,
            Max = 2,
        },
    },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_RUSTIC_LORD_MANOR",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_CHAMBERLAIN",
--     },
-- })