local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Tannery1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Tannery1.fbx/Prefab/Tanner.Part", "PREFAB_LIVESTOCKFARM_TANNER")
mod:registerAssetId("models/Tannery1.fbx/Prefab/Tanner.Part.Constr", "PREFAB_LIVESTOCKFARM_TANNER_CONSTR")



-- Material -------------------------------------------------------------------------------------
mod:registerAssetId("models/Tannery1.fbx/Materials/Material.Thatch.Edge", "MATERIAL_LIVESTOCK_THATCH")
mod:overrideAsset({ Id = "MATERIAL_LIVESTOCK_THATCH", HasAlphaTest = true, })



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Tannery1.fbx/Prefab/Tanner.Part/Tub.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Tannery1.fbx/Prefab/Tanner.Part/Block.001", {DataType = "COMP_GROUNDED"})



-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_TANNER",
	JobName = "JOB_LIVESTOCKFARM_TANNER_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_TANNER_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 50.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- ALL
                LeftHandObject = {
                    Model = "PREFAB_TOOL_WINE_MAKER_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "MIXING",
            },
        },
	}
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_TANNER",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_TANNER",
    },
})

mod:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_TANNER",
    },
})

-- mod:overrideAsset({
--     Id = "CITIZEN",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_LIVESTOCKFARM_TANNER",
--     },
-- })



-- Building Function -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_LIVESTOCKFARM_TANNER",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_TANNER_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 50,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_TANNER",
        Behavior = "BEHAVIOR_WORK",
    },
	InputInventoryCapacity = {
		{ Resource = "RESOURCE_HIDE", Quantity = 25 },
		-- { Resource = "WOOD", Quantity = 25 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
		-- { Resource = "WOOD", Quantity = 1 },
	},
	ResourceProduced = {
		{ Resource = "LEATHER", Quantity = 1 },
	},
})



-- Building: ------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_TANNER",
	Name = "BUILDING_LIVESTOCKFARM_TANNER_NAME",
	Description = "BUILDING_LIVESTOCKFARM_TANNER_DESC",
	BuildingType = "GOODS_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_LIVESTOCKFARM_TANNER",
})



-- Building Part -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_TANNER",
	Name = "BUILDING_PART_LIVESTOCKFARM_TANNER_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_TANNER",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 1.5, -16 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
	ConstructionVisual = "PREFAB_LIVESTOCKFARM_TANNER_CONSTR",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {5.5, 5.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
			}
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_TANNER",
	Cost = {
		BuildRightTaxes = {
            { Resource = "GOLD", Quantity = 25 },
        },
		UpkeepCost = {
            { Resource = "GOLD", Quantity = 10 },
        },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 4 },
            },
		},
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "SUBSTRACT",
		Radius = 20.0,
		Value = 0.5
	} }
})



