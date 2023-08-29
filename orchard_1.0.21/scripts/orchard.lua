local mod = ...


-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/FarmPart", "PREFAB_ORCHARD_FARM1")
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/CartPart", "PREFAB_ORCHARD_CART")
mod:registerAssetId("models/TreeApple3.fbx/Prefab/Tree", "PREFAB_ORCHARD_APPLE1")



-- Construction visual
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/ConstructionSteps", "PREFAB_CONSTR_ORCHARD_FARM1")



-- Grounding  -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/OrchardFarm1.fbx/Prefab/FarmPart/Ladder", {DataType = "COMP_GROUNDED"})

for i=1, 6, 1 do
	mod:registerPrefabComponent("models/OrchardFarm1.fbx/Prefab/FarmPart/Barrel." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end



-- Paths: Apple Cart
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/CartPart/PATH_A_1.RESOURCE_FRUIT", "PATH_ORCHARD_CART_1")
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/CartPart/PATH_B_1.RESOURCE_FRUIT", "PATH_ORCHARD_CART_2")
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/CartPart/PATH_C_1.RESOURCE_FRUIT", "PATH_ORCHARD_CART_3")
mod:registerAssetId("models/OrchardFarm1.fbx/Prefab/CartPart/PATH_D_1.RESOURCE_FRUIT", "PATH_ORCHARD_CART_4")

mod:registerPrefabComponent("models/OrchardFarm1.fbx/Prefab/CartPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_ORCHARD_CART_1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_ORCHARD_CART_2" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_ORCHARD_CART_3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_ORCHARD_CART_4" }
        },
    }
})



-- Resource Container: Tree  -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_ORCHARD_APPLE1", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_FRUIT",
    IsReplenishable = true,
    ReplenishDurationInDays = 7,
    ReplenishQuantity = 1,
    IsDestroyWhenEmpty = false, 
    AvailableQuantity = 1, -- initial quantity per tree
    ResourceValue = 1, -- amount in each picking action
    Radius = 1.5 -- distance from the container to stand
})



-- Plantable -------------------------------------------------------------------------------------
-- This model must have only a single Mesh and a single Material!
mod:registerPrefabComponent("PREFAB_ORCHARD_APPLE1", {
    DataType = "COMP_PLANTABLE",
    MinSpaceBetweenPlant = 15.0
})

mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_APPLE1",
    Name = "RESOURCE_FRUIT_NAME",
    PlantPrefab = "PREFAB_ORCHARD_APPLE1",
    Icon = "ICON_FRUIT",
    MinimumScale = 0.90,
    MaximumScale = 1.10
})



-- Crop Field Element -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_ORCHARD_APPLE1", { DataType = "COMP_CROP_FIELD_ELEMENT" })



-- Alpha material (transparency) -------------------------------------------------------------------------------------
mod:registerAssetId("models/TreeApple3.fbx/Materials/Material.Tree", "MATERIAL_ORCHARD_APPLE")

mod:overrideAsset({
    Id = "MATERIAL_ORCHARD_APPLE",
    HasAlphaTest = true
})



-- Building Asset Processor  -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/OrchardFarm1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Zone -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ZONE",
    Id = "ZONE_ORCHARD_FARM",
    Name = "BUILDING_ORCHARD_NAME",
    Description = "BUILDING_ORCHARD_DESC",
    Icon = "ICON_FRUIT",
    HoverIcon = "ICON_FRUIT",
    SelectionIcon = "ICON_FRUIT",
    Color = {2.20, 2.50, 1.70, 0.9}, -- RGB A = Light green
    DesirabilityLayerToShow = "DESIRABILITY_FERTILITY",
})



-- Farm Field Config -------------------------------------------------------------------------------------

mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_ORCHARD_FARM_APPLE",
    ZoneType = "ZONE_ORCHARD_FARM",
    PlantPrefab = "PREFAB_ORCHARD_APPLE1",
    HasPlantingCycle = false,
    IsScaling = false, -- use my own scaling component so that I can vary the height and width separately
    StartScaleValue = 0.90,
    RowDistance = 4.9,
    ItemDistance = 4.9,
    RandomOrientation = {0, 360},
    RandomPositionOffset = {-.5, .5},
    SourceMaterial = "MATERIAL_ORCHARD_APPLE",
    GrowingMaterial = "MATERIAL_ORCHARD_APPLE",
    HarvestedMaterial = "MATERIAL_ORCHARD_APPLE",
    GrowingTextureList = {
        -- "TEXTURE_ORCHARD_APPLE",
        -- "TEXTURE_TREE_POPLAR",
    },
    HarvestingTextureList = {
        -- "TEXTURE_ORCHARD_APPLE",
        -- "TEXTURE_TREE_POPLAR",
    },
    AlphaTestThreshold = 0.5
})



-- Growing Setup -------------------------------------------------------------------------------------

mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_GROWING",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "MARKET_TENDER"
            },
        },
	},
})



-- Sowing Setup -------------------------------------------------------------------------------------

mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_SOWING",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "MARKET_TENDER",
            },
        },
	},
})



-- Harvest Setup -------------------------------------------------------------------------------------

mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_HARVEST",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "MARKET_TENDER",
            },
        },
	},
})



-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_ORCHARD",
	JobName = "JOB_ORCHARD_NAME",
	JobDescription = "JOB_ORCHARD_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_FARMER",
    -- ProductionDelay = 15.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "MARKET_TENDER",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_ORCHARD"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_ORCHARD"
    }
})

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_ORCHARD"
    }
})



-- Building Function: Orchard -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_ORCHARD",
    Name = "BUILDING_ORCHARD_NAME",
    WorkerCapacity = 3,
    RelatedJob = {
        Job = "JOB_ORCHARD",
        Behavior = "BEHAVIOR_FARMER",
    },
    ProductionCycleDurationInSec = 15,
    -- InputInventoryCapacity = {
		-- { Resource = "WATER", Quantity = 5 },
		-- { Resource = "RESOURCE_DUNG", Quantity = 5 }
	-- },
    ResourceListNeeded = {
		{ Resource = "RESOURCE_FRUIT", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_FRUIT", Quantity = 4 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 1},
	GrowDuration = {1, 2},
	GrowWaitDuration = {2, 6},
	HarvestDuration = {6, 18},
	RestDuration = {18, 21},

    QuantityToHarvestPerStep = 1,
	HarvestStepsCount = 1,
	ResourceValuePerGather = 1,

    QuantityToPlantPerStep = 0,
	PlantingStepsCount = 0,

    CropFieldConfig = "FARM_FIELD_CONFIG_ORCHARD_FARM_APPLE",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_GROWING", 
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_SOWING", 
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_ORCHARD_FARM_HARVEST"
})



-- Building: Orchard -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_ORCHARD",
	Name = "BUILDING_ORCHARD_NAME",
	Description = "BUILDING_ORCHARD_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_ORCHARD_FARM1",
        "BUILDING_PART_ORCHARD_CART",
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
                "BUILDING_PART_ORCHARD_CART",
            },
        },
    }
end

mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_BUILDING_ORCHARD", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_ORCHARD",
    Name = "BUILDING_ORCHARD_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_ORCHARD",
    DataCost = {
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 100,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_ORCHARD",
                    "BUILDING_CIDERPRESS",
                },
                WallList = {
                    "FENCE_PICKET",
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
        "UNLOCKABLE_BUILDING_ORCHARD",
    },
})



-- Building part: Orchard Farm -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_ORCHARD_FARM1",
    Name = "BUILDING_ORCHARD_NAME",
    Category = "PRODUCTION",
    AssetBuildingFunction = "BUILDING_FUNCTION_ORCHARD",
	BuildingZone = {
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {6, 7}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
            { 
                Polygon = polygon.createRectangle( {5, 6}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
            },
		},
	},
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_ORCHARD_FARM1",
    },
    ConstructionVisual = "PREFAB_CONSTR_ORCHARD_FARM1",
    Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 6 },
            },
		},
    },
})



-- Building Part: Apple Cart -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_ORCHARD_CART",
	Name = "BUILDING_PART_ORCHARD_CART_NAME",
    Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_ORCHARD_CART",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createRectangle( {1, 1}, {0, 0} ),
				Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_ORCHARD_CART",
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 5 } },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 2 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 25.0,
		Value = 0.5,
	} },
})



-- Building Function: Apple Cart -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FRUIT" )
-- mod:overrideAsset({ Id = "RESOURCE_FRUIT", ResourceTypeList = { "RESOURCE_FOOD", "FOOD", "FOOD_SELLABLE" } })
mod:overrideAsset({ Id = "RESOURCE_FRUIT", ResourceTypeList = { "RESOURCE_FOOD", "FOOD", "RESOURCE_TYPE_FRUIT" } })

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_ORCHARD_CART",
	Name = "BUILDING_FUNCTION_ORCHARD_CART_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING"
    },
	TypeList = { "RESOURCE_TYPE_FRUIT" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "RESOURCE_FRUIT", Quantity = 50 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "RESOURCE_FRUIT", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	-- { Resource = "RESOURCE_FRUIT_SELL", Quantity = 10 },
	-- 	{ Resource = "RESOURCE_FRUIT", Quantity = 10 },
	-- }
})

