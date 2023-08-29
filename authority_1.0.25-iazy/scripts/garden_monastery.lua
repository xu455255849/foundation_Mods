local mod = ...



-- Job: GARDENER_MONASTERY -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_GARDENER_MONASTERY",
	JobName = "JOB_AUTHORITY_GARDENER_MONASTERY_NAME",
	JobDescription = "JOB_AUTHORITY_GARDENER_MONASTERY_DESC",
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
        "JOB_AUTHORITY_GARDENER_MONASTERY",
    },
})

-- mod:overrideAsset({
--     Id = "NUN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_AUTHORITY_GARDENER_MONASTERY",
--     },
-- })



-- Building Function: Garden -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_AUTHORITY_GARDEN_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_MONASTERY_NAME",
    IsPrivate = true,
	HasMaximumInstance = true,
	MaximumInstanceAllowed = 1,
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30,
    UpkeepPerWorker = { -- this doesn't work as of 30/09/22, but may be fixed by devs
		{
			Resource = "GOLD_COINS",
			Quantity = 5,
		},
	},
    RelatedJob = {
        Job = "JOB_AUTHORITY_GARDENER_MONASTERY",
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
        { Resource = "RESOURCE_AUTHORITY", Quantity = 1 },
    },
})



-- Building: Monastery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_AUTHORITY_GARDEN_MONASTERY",
	Name = "BUILDING_FUNCTION_AUTHORITY_GARDEN_MONASTERY_NAME",
    IsManuallyUnlocked = true,
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_AUTHORITY_GARDEN_MONASTERY",
    AssetBuildingPartList = {
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
            Category = "ROOM",
            Min = 1,
            Max = 1,
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
