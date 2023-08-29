local mod = ...




-- Asset -------------------------------------------------------------------------------------
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleFront", "PREFAB_AUTHORITY_LORD_MALE_FRONT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordMaleHat", "PREFAB_AUTHORITY_LORD_MALE_HAT")

-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleBelt", "PREFAB_AUTHORITY_LORD_FEMALE_BELT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleFront", "PREFAB_AUTHORITY_LORD_FEMALE_FRONT")
-- mod:registerAssetId("models/Authority2.fbx/Prefab/LordFemaleHat", "PREFAB_AUTHORITY_LORD_FEMALE_HAT")




-- Job: QUARTERMASTER -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_QUARTERMASTER",
	JobName = "JOB_AUTHORITY_QUARTERMASTER_NAME",
	JobDescription = "JOB_AUTHORITY_QUARTERMASTER_DESC",
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
        "JOB_AUTHORITY_QUARTERMASTER"
    }
})



-- Building Function: QUARTERMASTER's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER",
	Name = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER_NAME",
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
        Job = "JOB_AUTHORITY_QUARTERMASTER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "RESOURCE_AUTHORITY_QUARTERMASTER", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "RESOURCE_AUTHORITY_QUARTERMASTER", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building Function: Storehouse -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER_STOREHOUSE",
	Name = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER_STOREHOUSE_NAME",
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
        { Resource = "BREAD", Quantity = 20 },
        { Resource = "FISH", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "BREAD", Quantity = 1 },
        { Resource = "FISH", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY_QUARTERMASTER", Quantity = 2 },
    },
})



-- Building: Keep -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_QUARTERMASTER",
	Name = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER_STOREHOUSE_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_QUARTERMASTER",
    AssetBuildingPartList = {
        Action = "APPEND",
        "BUILDING_PART_AUTHORITY_STORAGE1_QUARTERMASTER",
        "BUILDING_PART_AUTHORITY_STORAGE2_QUARTERMASTER",
        "BUILDING_PART_AUTHORITY_DOOR",
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
--     Id = "MONUMENT_WOODEN_KEEP",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_QUARTERMASTER",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Barracks.png", "ICON_AUTHORITY_BARRACKS", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_BARRACKS",
    Name = "UNLOCKABLE_BUILDING_AUTHORITY_BARRACKS_NAME",
    UnlockableImage = "ICON_AUTHORITY_BARRACKS",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "KINGDOM",
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
                        OwnerBuilding = "MONUMENT_WOODEN_KEEP",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_QUARTERMASTER",
                            "BUILDING_AUTHORITY_SERGEANT",
                            "BUILDING_AUTHORITY_CAPTAIN",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_KINGDOM_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_BARRACKS",
    },
})