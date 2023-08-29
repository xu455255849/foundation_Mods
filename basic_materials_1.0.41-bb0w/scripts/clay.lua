local mod = ...



-- Building: Clay Pit -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_CLAYPIT",
	Name = "BUILDING_BASIC_CLAYPIT_NAME",
	Description = "BUILDING_BASIC_CLAYPIT_DESC",
	BuildingType = "RESOURCE_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_BASIC_CLAYPIT",
	IsEditable = true,
})

-- Unlockable
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        {
            OwnerBuilding = "BUILDING_MARKETCART",
            AssetBuildingPartList = {
                "BUILDING_PART_BASIC_POTTERCART",
            },
        },
    }
end

mod:registerAssetId("icons/UnlockableClay.png", "ICON_UNLOCKABLE_BUILDING_BASIC_CLAY", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_BASIC_CLAY",
    Name = "RESOURCE_CLAY_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_BASIC_CLAY",
    DataCost = {
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
                    "BUILDING_BASIC_CLAYPIT",
                    "BUILDING_BASIC_POTTER",
                },
                AdditionalBuildingUnlockList = marketCart,
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T1",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_BASIC_CLAY",
    },
})



-- Building Part: Clay Pit -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_CLAYPIT",
	Name = "BUILDING_PART_BASIC_CLAYPIT_NAME",
    Category = "CORE",
    AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_CLAYPIT",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_BASIC_CLAYPIT",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, -15 },
            OrientationOffset = -45.0,
            CameraPitchOffset = 25.0,
        },
    },
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createCircle( 3, {0, 0}, 10 ),
				Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
			{
				Polygon = polygon.createCircle( 2, {0, 0}, 10 ),
				Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "TOOL", Quantity = 4 },
            },
		},
	},
})



-- Job: Clay Digger -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_BASIC_CLAYPIT",
	JobName = "JOB_BASIC_CLAYPIT_NAME",
	JobDescription = "JOB_BASIC_CLAYPIT_DESC",
	IsLockedByDefault = false,
	-- DefaultBehavior = "BEHAVIOR_WORK",
	DefaultBehavior = "BEHAVIOR_GATHER",
	UseWorkplaceBehavior = true,
    -- ProductionDelay = 30.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_COAL_BURNER_SHOVEL",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GOLDSMELTER_SHOVELING",
            },
            { -- FEMALE
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_COAL_BURNER_SHOVEL",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GOLDSMELTER_SHOVELING",
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_COAL_BURNER_SHOVEL",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GOLDSMELTER_SHOVELING",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_BASIC_CLAYPIT"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_BASIC_CLAYPIT",
    },
})



-- Building Function: Clay Pit -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_CLAYPIT",
	Name = "BUILDING_FUNCTION_BASIC_CLAYPIT_NAME",
	IsPrivate = false,
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 14,
    RelatedJob = {
        Job = "JOB_BASIC_CLAYPIT",
        -- Behavior = "BEHAVIOR_WORK",
        Behavior = "BEHAVIOR_GATHER",
	},
	InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CLAY", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_CLAY", Quantity = 2 },
	},
})