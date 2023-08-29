local mod = ...




-- Asset -------------------------------------------------------------------------------------
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleFront", "PREFAB_AUTHORITY_LORD_MALE_FRONT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleHat", "PREFAB_AUTHORITY_LORD_MALE_HAT")

-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleBelt", "PREFAB_AUTHORITY_LORD_FEMALE_BELT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleFront", "PREFAB_AUTHORITY_LORD_FEMALE_FRONT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleHat", "PREFAB_AUTHORITY_LORD_FEMALE_HAT")




-- Job: CAPTAIN -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_CAPTAIN",
	JobName = "JOB_AUTHORITY_CAPTAIN_NAME",
	JobDescription = "JOB_AUTHORITY_CAPTAIN_DESC",
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
        "JOB_AUTHORITY_CAPTAIN"
    }
})



-- Building Function: CAPTAIN's Tower -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_CAPTAIN",
	Name = "BUILDING_FUNCTION_AUTHORITY_CAPTAIN_NAME",
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
        Job = "JOB_AUTHORITY_CAPTAIN",
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



-- Building: Keep -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_CAPTAIN",
	Name = "BUILDING_FUNCTION_AUTHORITY_CAPTAIN_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_CAPTAIN",
    AssetBuildingPartList = {
        Action = "APPEND",
        "BUILDING_PART_GATE_ROUND_WATCHTOWER",
        "BUILDING_PART_GATE_WATCHTOWER",
    },
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
--         "BUILDING_AUTHORITY_CAPTAIN",
--     },
-- })