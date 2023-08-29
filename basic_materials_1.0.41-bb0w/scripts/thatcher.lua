local mod = ...



-- Building: Thatcher -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_THATCHER",
	Name = "BUILDING_BASIC_THATCHER_NAME",
	Description = "BUILDING_BASIC_THATCHER_DESC",
	BuildingType = "RESOURCE_PRODUCTION",
	-- AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetCoreBuildingPart = "BUILDING_PART_BASIC_THATCHER",
	IsEditable = true,
	-- AssetBuildingPartList = {
    --     "BUILDING_PART_BASIC_THATCHER",
    --     "BUILDING_PART_BASIC_REEDBED",
    -- },
})

-- Unlockable
mod:registerAssetId("icons/UnlockableThatch.png", "ICON_UNLOCKABLE_BUILDING_BASIC_THATCHER", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_BASIC_THATCHER",
    Name = "BUILDING_BASIC_THATCHER_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_BASIC_THATCHER",
    DataCost = {
        -- DataInfluenceCostList = {
        --     {
        --         Estate = "LABOUR",
        --         Quantity = 5,
        --     },
        -- },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 25,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_BASIC_THATCHER",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T1",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_BASIC_THATCHER",
    },
})



-- Building Part: Thatcher -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_THATCHER",
	Name = "BUILDING_PART_BASIC_THATCHER_NAME",
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_BASIC_THATCHER",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0.6, -15 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createCircle( 3, {0, 0}, 10 ),
				Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_THATCHER",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "TOOL", Quantity = 4 },
            },
        },
	},
})



-- Building Part: Reed bed -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_REEDBED",
	Name = "BUILDING_PART_BASIC_REEDBED_NAME", 
    Category = "CORE",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_BASIC_REEDBED"
    }
})



-- Job: Thatcher -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_BASIC_THATCHER",
	JobName = "JOB_BASIC_THATCHER_NAME",
	JobDescription = "JOB_BASIC_THATCHER_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_GATHER",
	UseWorkplaceBehavior = true,
    -- ProductionDelay = 2.5, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_FARMER_SICKLE",
                    WorkAttachName = "Sickle_Anchor",
                },
                -- WalkAnimation = "SCYTHE_WALK",
                IdleAnimation = "SCYTHE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_BASIC_THATCHER",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_BASIC_THATCHER",
    },
})



-- Building Function: Thatcher -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_THATCHER",
    Name = "BUILDING_FUNCTION_BASIC_THATCHER_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 10,
    RelatedJob = {
        Job = "JOB_BASIC_THATCHER",
        Behavior = "BEHAVIOR_GATHER",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_THATCH", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_THATCH", Quantity = 2 },
    },
})