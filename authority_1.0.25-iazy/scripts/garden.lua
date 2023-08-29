local mod = ...




-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/GardenerMaleFront", "PREFAB_AUTHORITY_GARDENER_MALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GardenerMaleHat", "PREFAB_AUTHORITY_GARDENER_MALE_HAT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GardenerFemaleFront", "PREFAB_AUTHORITY_GARDENER_FEMALE_FRONT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GardenerFemaleHat", "PREFAB_AUTHORITY_GARDENER_FEMALE_HAT")



-- -- Compost as a by-product -------------------------------------------------------------------------------------
-- local function registerCompost(func)
--     mod:overrideAsset({
--         Id = func,
--         ResourceProduced = {
--             Action = "APPEND",
--             { Resource = "RESOURCE_COMPOST", Quantity = 1 },
--         },
--     })
-- end

-- registerCompost("BUILDING_FUNCTION_FISHING_HUT")
-- registerCompost("BUILDING_FUNCTION_BREWERY")
-- registerCompost("BUILDING_FUNCTION_WINERY")
-- registerCompost("BUILDING_FUNCTION_KITCHEN")



-- Job: GARDENER -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_GARDENER",
	JobName = "JOB_AUTHORITY_GARDENER_NAME",
	JobDescription = "JOB_AUTHORITY_GARDENER_DESC",
    IsLockedByDefault = false,
    Hidden = false,
	IsDefinitive = true,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_AUTHORITY_GARDENER_MALE_HAT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_GARDENER_MALE_FRONT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_AUTHORITY_GARDENER_FEMALE_HAT",
                },
                FrontList = {
                    "PREFAB_AUTHORITY_GARDENER_FEMALE_FRONT",
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
--         "JOB_AUTHORITY_GARDENER",
--     },
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_GARDENER",
    },
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_GARDENER",
    },
})



-- Building Function: Garden -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_GARDEN_STOREHOUSE",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_STOREHOUSE_NAME",
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
        Job = "JOB_AUTHORITY_GARDENER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "RESOURCE_AUTHORITY_GARDENER", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "RESOURCE_AUTHORITY_GARDENER", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building Function: Garden Spot -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_GARDEN_SPOT",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_SPOT_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
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
        { Resource = "RESOURCE_COMPOST", Quantity = 15 },
        { Resource = "TOOL", Quantity = 5 },
	},
    ResourceListNeeded = {
        { Resource = "RESOURCE_COMPOST", Quantity = 2 },
        { Resource = "TOOL", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_AUTHORITY_GARDENER", Quantity = 1 },
    },
})



-- Building: Lord Manor -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BUILDING_PART_AUTHORITY_STORAGE1_GARDEN",
    AssetBuildingFunction = "",
})

mod:overrideAsset({
    Id = "BUILDING_PART_AUTHORITY_STORAGE2_GARDEN",
    AssetBuildingFunction = "",
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_GARDEN",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_STOREHOUSE_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_GARDEN_STOREHOUSE",
    AssetBuildingPartList = {
        "BUILDING_PART_AUTHORITY_STORAGE1_GARDEN",
        "BUILDING_PART_AUTHORITY_STORAGE2_GARDEN",
        "BUILDING_PART_AUTHORITY_DOOR",
        "BUILDING_PART_AUTHORITY_GARDEN_POST",
        "BUILDING_PART_DECORATIVE_BUSH",
        "BUILDING_PART_DECORATIVE_CYPRES",
        "BUILDING_PART_DECORATIVE_TREE",
        "BUILDING_PART_FENCE",
        "BUILDING_PART_FOUNTAIN",
        "BUILDING_PART_LUSH_GARDEN_BUSHES_PERGOLA",
        "BUILDING_PART_LUSH_GARDEN_FLOWER_BUSH",
        "BUILDING_PART_LUSH_GARDEN_FOUNTAIN",
        "BUILDING_PART_LUSH_GARDEN_LARGE_TREE",
        "BUILDING_PART_LUSH_GARDEN_MEDIUM_TREE",
        "BUILDING_PART_LUSH_GARDEN_OGIVE_BUSH",
        "BUILDING_PART_LUSH_GARDEN_OVALE_BUSH",
        "BUILDING_PART_LUSH_GARDEN_PILAR",
        "BUILDING_PART_LUSH_GARDEN_QUATREFOIL_FLOWERBED",
        "BUILDING_PART_LUSH_GARDEN_ROUND_BUSH",
        "BUILDING_PART_LUSH_GARDEN_ROUND_FLOWERBED",
        "BUILDING_PART_LUSH_GARDEN_SMALL_TREE",
        "BUILDING_PART_LUSH_GARDEN_STONE_BENCH",
        "BUILDING_PART_LUSH_GARDEN_WATER_BASIN",
    },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "RESOURCE_DEPOT",
            Min = 1,
            Max = 1,
        },
        {
            Category = "DOOR",
            Min = 1,
        },
        {
            Category = "PRODUCTION",
            Min = 3,
        },
        {
            Category = "PLANT",
            Min = 5,
        },
        {
            Category = "DECORATION",
            Min = 5,
        },
    },
})

-- mod:overrideAsset({
--     Id = "MONUMENT_RUSTIC_LORD_MANOR",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_AUTHORITY_GARDEN",
--     },
-- })