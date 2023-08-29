local mod = ...

-- Asset
mod:registerAssetId("models/Creamery2.fbx/Prefab/CreameryPart", "PREFAB_LIVESTOCKFARM_CREAMERY")
mod:registerAssetId("models/Creamery2.fbx/Prefab/TablePart", "PREFAB_LIVESTOCKFARM_CREAMERYMARKET")
mod:registerAssetId("models/Creamery2.fbx/Prefab/ConstructionSteps", "PREFAB_LIVESTOCKFARM_CREAMERY_CONSTR")



-- Attach Node Type -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/TablePart", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })



-- Paths: Sales counter -------------------------------------------------------------------------------------
mod:registerAssetId("models/Creamery2.fbx/Prefab/TablePart/PATH_B_1", "PATH_CREAMERY_B1")
mod:registerAssetId("models/Creamery2.fbx/Prefab/TablePart/PATH_C_1", "PATH_CREAMERY_C1")
mod:registerAssetId("models/Creamery2.fbx/Prefab/TablePart/PATH_D_1", "PATH_CREAMERY_D1")

mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/TablePart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_CREAMERY_B1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_CREAMERY_C1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_CREAMERY_D1" }
        },
    }
})



-- Building Asset Processor
mod:registerAssetProcessor("models/Creamery2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- -- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/Creamery2.fbx/Prefab/CreameryPart", { "PLATFORM" })



-- Grounding
mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/CreameryPart/Door.001" , {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/ConstructionSteps/Step_5.001" , {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/TablePart" , {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/CreameryPart/Attach_Minor.002" , {DataType = "COMP_GROUNDED"})

for i=1, 7, 1 do
    mod:registerPrefabComponent("models/Creamery2.fbx/Prefab/CreameryPart/Barrel." .. string.sub("000" .. i, -3) , {DataType = "COMP_GROUNDED"})
end


-- Resource Type: Creamery
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_BUTTER" )



-- Resource: Butter (OVERRIDE)
mod:overrideAsset({
    Id = "BV1_BUTTER",
	-- ResourceTypeList = { "FOOD", "FOOD_SELLABLE", "RESOURCE_TYPE_BUTTER" },
	ResourceTypeList = { "FOOD", "RESOURCE_TYPE_BUTTER" },
    ResourceVisualPrefab = "PREFAB_RESOURCE_VISUAL_MILK"
})



-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_CREAMERY",
	JobName = "JOB_LIVESTOCKFARM_CREAMERY_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_CREAMERY_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
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
                    Model = "PREFAB_TOOL_CHEESE_MAKER_SPOON",
                },
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
--         "JOB_LIVESTOCKFARM_CREAMERY"
--     }
-- })

-- mod:overrideAsset({
--     Id = "SERF",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_CREAMERY"
--     }
-- })

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_CREAMERY"
    }
})

mod:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_CREAMERY"
    }
})



-- Building Function: Creamery -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERY",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERY_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_CREAMERY",
        Behavior = "BEHAVIOR_WORK",
    },
	InputInventoryCapacity = {
		{ Resource = "MILK", Quantity = 50 },
	},
    ResourceListNeeded = {
		{ Resource = "MILK", Quantity = 3 },
	},
	ResourceProduced = {
		{ Resource = "BV1_BUTTER", Quantity = 2 },
	},
})



-- Building Function: Cheesemaker -------------------------------------------------------------------------------------
-- Bring this production in line with milk production from this mod
mod:overrideAsset({
	Id = "BUILDING_FUNCTION_CHEESE_MAKER",
    ProductionCycleDurationInSec = 30,
	InputInventoryCapacity = {
		{ Resource = "MILK", Quantity = 50 },
	},
    ResourceListNeeded = {
		{ Resource = "MILK", Quantity = 2 },
	},
	ResourceProduced = {
		{ Resource = "CHEESE", Quantity = 2 },
	},
})



-- Building Function: Sales Table -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERYMARKET",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERYMARKET_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING",
    },
	TypeList = { "RESOURCE_TYPE_BUTTER" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "BV1_BUTTER", Quantity = 25 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "BV1_BUTTER", Quantity = 5 },
	-- },
	-- ResourceProduced = {
	-- 	{ Resource = "BV1_BUTTER", Quantity = 5 },
	-- }
})



-- Building: Creamery ------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_CREAMERY",
	Name = "BUILDING_LIVESTOCKFARM_CREAMERY_NAME",
	Description = "BUILDING_LIVESTOCKFARM_CREAMERY_DESC",
	BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_CREAMERY",
        "BUILDING_PART_LIVESTOCKFARM_CREAMERYMARKET",
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



local poly1 = { -- y, x     looking from above, blender axis x pointing down: x is left/right, y is up/down
	{ -3.8, 2 },
	{ -2.5, 2.25 },
	{ -2.5, 2.35 },
	{ -1, 2.40 },
	{ -1, 3.25},
	{ -0.5, 3.5 },
	{ 0.25, 3.5 },
	{ 1, 3 },
	{ 3, 2.8 },
	{ 3.25, 2.25 },
	{ 3.8, 2 },
	{ 3.8, 0.5 },
	{ 4.1, 0.5 },
	{ 4.1, -1.2 },
	{ 3.8, -1.2 },
	{ 3.8, -2.7 },
	{ 0, -2.9 },
	{ -1, -3.8 },
	{ -2.9, -3.7 },
	{ -3.1, -2.9 },
	{ -3.8, -2.7 },

}

-- Building Part: Creamery -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CREAMERY",
	Name = "BUILDING_PART_LIVESTOCKFARM_CREAMERY_NAME",
	Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_CREAMERY",
	},
	ConstructionVisual = "PREFAB_LIVESTOCKFARM_CREAMERY_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = poly1,
                -- Polygon = polygon.createRectangle( {8.0, 7.1}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERY",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "STONE", Quantity = 12 },
                { Resource = "PLANK", Quantity = 8 },
                { Resource = "TOOL", Quantity = 6 },
            },
		},
	},
})



-- Building Part: Sales Counter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_CREAMERYMARKET",
	Name = "BUILDING_PART_LIVESTOCKFARM_CREAMERYMARKET_NAME",
	Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_CREAMERYMARKET",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {2, 2}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_CREAMERYMARKET",
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