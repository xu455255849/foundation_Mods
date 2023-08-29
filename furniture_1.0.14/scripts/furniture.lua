local mod = ...



-- Job: Joiner -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_FURNITURE_JOINER",
	JobName = "JOB_FURNITURE_JOINER_NAME",
	JobDescription = "JOB_FURNITURE_JOINER_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
	-- UseWorkplaceBehavior = true,
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

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_FURNITURE_JOINER"
--     }
-- })

-- mod:overrideAsset({
--     Id = "SERF",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_FURNITURE_JOINER"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_FURNITURE_JOINER"
    }
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_FURNITURE_JOINER"
    }
})



-- Resource Type: Furniture
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FURNITURE" )



-- Assets
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/CounterPart/Chair.001", "PREFAB_JOINERWORKSHOPCHAIR")

mod:registerAssetId("models/JoinerWorkshop1.fbx/Prefab/WorkshopPart", "PREFAB_JOINERWORKSHOP1")
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/WorkshopPart", "PREFAB_JOINERWORKSHOP2")
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/CounterPart", "PREFAB_JOINERWORKSHOPCOUNTER")



-- Building Asset Processor
mod:registerAssetProcessor("models/JoinerWorkshop1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/JoinerWorkshop2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Construction visual
mod:registerAssetId("models/JoinerWorkshop1.fbx/Prefab/ConstructionSteps", "PREFAB_CONSTR_JOINERWORKSHOP1")
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/ConstructionSteps", "PREFAB_CONSTR_JOINERWORKSHOP2")



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/JoinerWorkshop1.fbx/Prefab/WorkshopPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/JoinerWorkshop2.fbx/Prefab/WorkshopPart", { "PLATFORM" })



-- Grounding
mod:registerPrefabComponent("models/JoinerWorkshop2.fbx/Prefab/CounterPart/Bench.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/JoinerWorkshop2.fbx/Prefab/CounterPart/Table.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/JoinerWorkshop2.fbx/Prefab/CounterPart/Chair.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/JoinerWorkshop2.fbx/Prefab/CounterPart/Chair.002", {DataType = "COMP_GROUNDED"})



-- Paths: Sales counter -------------------------------------------------------------------------------------
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/CounterPart/PATH_B_1", "PATH_FURNITURE_B1")
mod:registerAssetId("models/JoinerWorkshop2.fbx/Prefab/CounterPart/PATH_C_1", "PATH_FURNITURE_C1")

mod:registerPrefabComponent("models/JoinerWorkshop2.fbx/Prefab/CounterPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_FURNITURE_C1", "PATH_FURNITURE_C1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_FURNITURE_B1", "PATH_FURNITURE_B1" }
        },
    }
})



-- Grounding construction visuals
-- for i=1, 4, 1 do
-- 	mod:registerPrefabComponent("models/WillowCoppice.fbx/Prefab/ConstructionSteps/Step_0." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end



-- Grounding coppice stumps
-- for i=1, 50, 1 do
-- 	mod:registerPrefabComponent("models/WillowCoppice.fbx/Prefab/CoppicePart/Coppice." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end



-- Building part type
mod:registerEnumValue("BUILDING_PART_TYPE", "COUNTER")



-- Building Function: Furniture  -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_FURNITURE",
    Name = "BUILDING_FUNCTION_FURNITURE_NAME",
    -- WorkerCapacity = 2,
    WorkerRatioFromCapacity = 1,
    ProductionCycleDurationInSec = 30.0,
    WorkCycleNeededToProduceOnce = 2,
    RelatedJob = {
        Job = "JOB_FURNITURE_JOINER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "PLANK", Quantity = 25 },
		{ Resource = "WOOLEN_CLOTH", Quantity = 25 },
	},
    ResourceListNeeded = {
		{ Resource = "PLANK", Quantity = 1 },
		{ Resource = "WOOLEN_CLOTH", Quantity = 1 },
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_FURNITURE", Quantity = 1 },
	},
})



-- Building Function: Sales Counter -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_FURNITURE_CART",
    Name = "BUILDING_FUNCTION_FURNITURE_CART_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING"
    },
	TypeList = { "RESOURCE_TYPE_FURNITURE" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "RESOURCE_FURNITURE", Quantity = 30 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "RESOURCE_FURNITURE", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	{ Resource = "RESOURCE_FURNITURE", Quantity = 10 },
	-- }
})



-- Building: Joiner's Workshop -------------------------------------------------------------------------------------

-- Building
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_FURNITURE",
	Name = "BUILDING_FURNITURE_NAME",
	Description = "BUILDING_FURNITURE_DESC",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_FURNITURE_JOINER1",
        "BUILDING_PART_FURNITURE_JOINER2",
        "BUILDING_PART_FURNITURE_JOINER_CART",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- Unlockable
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        {
            OwnerBuilding = "BUILDING_MARKETCART",
            AssetBuildingPartList = {
                "BUILDING_PART_FURNITURE_JOINER_CART",
            },
        },
    }
end

mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_BUILDING_FURNITURE", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_FURNITURE",
    Name = "RESOURCE_FURNITURE_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_FURNITURE",
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
                Quantity = 75,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_FURNITURE",
                },
                AdditionalBuildingUnlockList = marketCart,
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_FURNITURE",
    },
})



-- Building Part: Joiner's Workshop model 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FURNITURE_JOINER1",
	Name = "BUILDING_PART_FURNITURE_JOINER1_NAME",
	Description = "BUILDING_PART_FURNITURE_JOINER_DESC",
	Category = "PRODUCTION",
    Capacity = 2,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_JOINERWORKSHOP1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 3.5, -30 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 0.0,
        },
	},
	ConstructionVisual = "PREFAB_CONSTR_JOINERWORKSHOP1",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {7.0, 9.0}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_FURNITURE",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 20 },
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 25 },
                { Resource = "TOOL", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Joiner's Workshop model 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FURNITURE_JOINER2",
	Name = "BUILDING_PART_FURNITURE_JOINER1_NAME",
	Description = "BUILDING_PART_FURNITURE_JOINER_DESC",
	Category = "PRODUCTION",
    Capacity = 1,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_JOINERWORKSHOP2"
	},
	ConstructionVisual = "PREFAB_CONSTR_JOINERWORKSHOP2",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {7.0, 9.0}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_FURNITURE",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 50 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 2 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 15 },
                { Resource = "TOOL", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Sales counter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FURNITURE_JOINER_CART",
	Name = "BUILDING_PART_FURNITURE_JOINER_CART_NAME",
	Description = "BUILDING_PART_FURNITURE_JOINER_CART_DESC",
	Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_JOINERWORKSHOPCOUNTER",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 1, 0.7, -6 },
            OrientationOffset = -90.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1.5, 2.5}, {-0.5, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_FURNITURE_CART",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 4 },
            },
		},
	},
	DesirabilityModifiers = {
        {
            Desirability = "DESIRABILITY_RESIDENTIAL",
            Type = "ADD",
            Radius = 25.0,
            Value = 0.5,
    	},
    },
})

