local mod = ...



-- Building: Pottery's Kiln -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_POTTER",
	Name = "BUILDING_BASIC_POTTER_NAME",
	Description = "BUILDING_BASIC_POTTER_DESC",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
	IsEditable = true,
	AssetBuildingPartList = {
        "BUILDING_PART_BASIC_POTTERCART",
    },
    SubAssetBuildingList = {
        "BUILDING_BASIC_POTTERKILN_WOOD_POTTERY",
        "BUILDING_BASIC_POTTERKILN_COAL_POTTERY",
        "BUILDING_BASIC_POTTERKILN_WOOD_TILE",
        "BUILDING_BASIC_POTTERKILN_COAL_TILE",
    },
})

-- Wood -> Pottery
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_POTTERKILN_WOOD_POTTERY",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN1_NAME",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_BASIC_POTTERKILN",
    },
    AssetMiniatureBuildingPart = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
    AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_POTTERKILN1",
	IsEditable = true,
})

-- Coal -> Pottery
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_POTTERKILN_COAL_POTTERY",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN2_NAME",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_BASIC_POTTERKILN",
    },
    AssetMiniatureBuildingPart = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
    AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_POTTERKILN2",
	IsEditable = true,
})

-- Wood -> Tile
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_POTTERKILN_WOOD_TILE",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN3_NAME",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_BASIC_POTTERKILN",
    },
    AssetMiniatureBuildingPart = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
    AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_POTTERKILN3",
	IsEditable = true,
})

-- Coal -> Tile
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_BASIC_POTTERKILN_COAL_TILE",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN4_NAME",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_BASIC_POTTERKILN",
    },
    AssetMiniatureBuildingPart = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
    AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_POTTERKILN4",
	IsEditable = true,
})



-- Building Part: Potter's Kiln -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_BASIC_POTTERKILN",
    Name = "BUILDING_PART_BASIC_POTTERKILN_NAME",
    Category = "PRODUCTION",
    Capacity = 1,
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_BASIC_POTTERKILN",
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 3, {0, 0}, 10 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createCircle( 2, {0, 0}, 10 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
            },
        },
    },
    Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 5 } },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
        ResourceNeededList = {
            {
                { Resource = "RESOURCE_CLAY", Quantity = 20 },
                { Resource = "WOOD", Quantity = 10 },
            },
        },
    },
})



-- Building Part: Potter's Kiln preview -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_POTTERKILN_PREVIEW",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_BASIC_POTTERKILN",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0,
            CameraPosition = { 0.7, 2.2, -19 },
            OrientationOffset = 0,
            CameraPitchOffset = 0.0
        },
	},
})



-- Building Part: Pottery Cart -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_POTTERCART",
	Name = "BUILDING_PART_BASIC_POTTERCART_NAME",
    Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_BASIC_POTTERCART",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createRectangle( {1, 1}, {0, 0} ),
				Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_POTTERCART",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
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



-- Job: Potter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_BASIC_POTTER",
	JobName = "JOB_BASIC_POTTER_NAME",
	JobDescription = "JOB_BASIC_POTTER_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
	UseWorkplaceBehavior = true,
    -- ProductionDelay = 30.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_COAL_BURNER_SHOVEL",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "OVEN",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_BASIC_POTTER",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_BASIC_POTTER",
    },
})

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_BASIC_POTTER",
    },
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_BASIC_POTTER",
    },
})



-- Building Function: Pottery (Wood + Clay) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_POTTERKILN1",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN1_NAME",
	IsPrivate = false,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_BASIC_POTTER",
        Behavior = "BEHAVIOR_WORK",
	},
	InputInventoryCapacity = {
		{ Resource = "RESOURCE_CLAY", Quantity = 20 },
		{ Resource = "WOOD", Quantity = 20 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CLAY", Quantity = 1 },
		{ Resource = "WOOD", Quantity = 2 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_POTTERY", Quantity = 1 },
	},
})



-- Building Function: Pottery (Coal + Clay) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_POTTERKILN2",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN2_NAME",
	IsPrivate = false,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 25,
    RelatedJob = {
        Job = "JOB_BASIC_POTTER",
        Behavior = "BEHAVIOR_WORK",
	},
	InputInventoryCapacity = {
		{ Resource = "RESOURCE_CLAY", Quantity = 20 },
		{ Resource = "COAL", Quantity = 20 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CLAY", Quantity = 1 },
		{ Resource = "COAL", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_POTTERY", Quantity = 1 },
	},
})



-- Building Function: Tile (Wood + Clay) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_POTTERKILN3",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN3_NAME",
	IsPrivate = false,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_BASIC_POTTER",
        Behavior = "BEHAVIOR_WORK",
	},
	InputInventoryCapacity = {
		{ Resource = "RESOURCE_CLAY", Quantity = 20 },
		{ Resource = "WOOD", Quantity = 20 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CLAY", Quantity = 1 },
		{ Resource = "WOOD", Quantity = 2 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_TILE", Quantity = 1 },
	},
})



-- Building Function: Tile (Coal + Clay) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_BASIC_POTTERKILN4",
	Name = "BUILDING_FUNCTION_BASIC_POTTERKILN4_NAME",
	IsPrivate = false,
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 25,
    RelatedJob = {
        Job = "JOB_BASIC_POTTER",
        Behavior = "BEHAVIOR_WORK",
	},
	InputInventoryCapacity = {
		{ Resource = "RESOURCE_CLAY", Quantity = 20 },
		{ Resource = "COAL", Quantity = 20 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CLAY", Quantity = 1 },
		{ Resource = "COAL", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "RESOURCE_TILE", Quantity = 1 },
	},
})



-- -- Building Function Assignable: Potter's Kiln -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_ASSIGNABLE",
--     Id = "BUILDING_FUNCTION_ASSIGNABLE_BASIC_POTTER",
--     AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_BASIC_POTTER",
-- })

-- mod:registerAsset({
--     DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
--     Id = "BUILDING_FUNCTION_LIST_BASIC_POTTER",
--     AssetFunctionList = {
--         "BUILDING_FUNCTION_BASIC_POTTERKILN1",
--         "BUILDING_FUNCTION_BASIC_POTTERKILN2",
--         "BUILDING_FUNCTION_BASIC_POTTERKILN3",
--         "BUILDING_FUNCTION_BASIC_POTTERKILN4",
--     },
-- })



-- Building Function: Pottery Cart -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_BASIC_POTTERCART",
    Name = "BUILDING_FUNCTION_BASIC_POTTERCART_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING",
    },
	TypeList = { "RESOURCE_TYPE_POTTERY" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "RESOURCE_POTTERY", Quantity = 25 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "RESOURCE_POTTERY", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	{ Resource = "RESOURCE_POTTERY", Quantity = 10 },
	-- }
})
