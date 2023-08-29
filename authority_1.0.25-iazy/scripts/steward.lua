local mod = ...




-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/ChamberlainMaleFront", "PREFAB_AUTHORITY_CHAMBERLAIN_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/ChamberlainFemaleBelt", "PREFAB_AUTHORITY_CHAMBERLAIN_FEMALE_BELT")
mod:registerAssetId("models/Authority2.fbx/Prefab/ChamberlainFemaleFront", "PREFAB_AUTHORITY_CHAMBERLAIN_FEMALE_FRONT")

mod:registerAssetId("models/Authority2.fbx/Prefab/ChancellorMaleFront", "PREFAB_AUTHORITY_CHANCELLOR_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/ChancellorFemaleBelt", "PREFAB_AUTHORITY_CHANCELLOR_FEMALE_BELT")
mod:registerAssetId("models/Authority2.fbx/Prefab/ChancellorFemaleFront", "PREFAB_AUTHORITY_CHANCELLOR_FEMALE_FRONT")


-- Job: Steward -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_STEWARD",
	JobName = "JOB_AUTHORITY_STEWARD_NAME",
	JobDescription = "JOB_AUTHORITY_STEWARD_DESC",
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
                    "PREFAB_AUTHORITY_CHANCELLOR_MALE_FRONT",
                },
            },
            { -- FEMALE
                BeltList = {
                    "PREFAB_AUTHORITY_CHANCELLOR_FEMALE_BELT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_CHANCELLOR_FEMALE_FRONT",
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
--         "JOB_AUTHORITY_STEWARD"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_STEWARD"
    }
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_STEWARD",
    },
})




-- Building Function: Steward's Hall -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_STEWARD",
	Name = "BUILDING_FUNCTION_AUTHORITY_STEWARD_NAME",
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
        Job = "JOB_AUTHORITY_STEWARD",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "RESOURCE_AUTHORITY_STEWARD", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "RESOURCE_AUTHORITY_STEWARD", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building Function: Storehouse -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_STEWARD_STOREHOUSE",
	Name = "BUILDING_FUNCTION_AUTHORITY_STEWARD_STOREHOUSE_NAME",
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
        { Resource = "STONE", Quantity = 20 },
        { Resource = "PLANK", Quantity = 20 },
        -- { Resource = "TOOL", Quantity = 20 },
	},
    ResourceListNeeded = {
        { Resource = "STONE", Quantity = 1 },
        { Resource = "PLANK", Quantity = 1 },
        -- { Resource = "TOOL", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY_STEWARD", Quantity = 2 },
    },
})



-- Building: Lord Manor -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_STEWARD",
	Name = "BUILDING_FUNCTION_AUTHORITY_STEWARD_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_STEWARD",
    AssetBuildingPartList = {
        Action = "APPEND",
        "BUILDING_PART_AUTHORITY_STORAGE1_STEWARD",
        "BUILDING_PART_AUTHORITY_STORAGE2_STEWARD",
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
--         "BUILDING_AUTHORITY_STEWARD",
--     },
-- })



-- Unlockable ----------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Household.png", "ICON_AUTHORITY_HOUSEHOLD", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD",
    Name = "UNLOCKABLE_AUTHORITY_HOUSEHOLD_NAME",
    UnlockableImage = "ICON_AUTHORITY_HOUSEHOLD",
    DataCost = {
        DataInfluenceCostList = {
            {
                Estate = "LABOUR",
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
                        OwnerBuilding = "MONUMENT_RUSTIC_LORD_MANOR",
                        SubBuildingList = {
                            "BUILDING_AUTHORITY_STEWARD",
                            "BUILDING_AUTHORITY_BUTLER",
                            "BUILDING_AUTHORITY_CHAMBERLAIN",
                            "BUILDING_AUTHORITY_GARDEN",
                        },
                    },
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_LABOUR_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_AUTHORITY_HOUSEHOLD",
    },
})