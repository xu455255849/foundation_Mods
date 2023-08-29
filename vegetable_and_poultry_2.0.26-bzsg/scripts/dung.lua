local mod = ...



-- Assets
mod:registerAssetId("models/DungHeap2.fbx/Prefab/DungHeapPart", "PREFAB_POULTRYFARM_DUNGHEAP")



-- Building Asset Processor
mod:registerAssetProcessor("models/DungHeap2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Grounding
mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart/Basket.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart/Basket.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart/Basket.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart/Basket.004", {DataType = "COMP_GROUNDED"})



-- Paths -------------------------------------------------------------------------------------
mod:registerAssetId("models/DungHeap2.fbx/Prefab/DungHeapPart/PATH_A_1", "PATH_POULTRYFARM_DUNG1")
mod:registerAssetId("models/DungHeap2.fbx/Prefab/DungHeapPart/PATH_B_1", "PATH_POULTRYFARM_DUNG2")

mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_POULTRYFARM_DUNG1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_POULTRYFARM_DUNG2" }
        },
    }
})



-- -- Resource Generator -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/DungHeap2.fbx/Prefab/DungHeapPart/Basket.001", { DataType = "COMP_POULTRYFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_POULTRYFARM_COMPOST", })



-- Building Function: Dung heap  -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_DUNG",
    Name = "BUILDING_FUNCTION_POULTRYFARM_DUNG_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 8,
    RelatedJob = {
        Job = "JOB_POULTRYFARM_DUNG",
        Behavior = "BEHAVIOR_WORK",
	},
    InputInventoryCapacity = {{ Resource = "RESOURCE_DUNG", Quantity = 50 }},
    ResourceListNeeded = {{ Resource = "RESOURCE_DUNG", Quantity = 10 }},
    ResourceProduced = {{ Resource = "RESOURCE_COMPOST", Quantity = 4 }},
})



-- Building Part: Dung heap -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DUNGHEAP",
	Name = "BUILDING_PART_POULTRYFARM_DUNGHEAP_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DUNGHEAP",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = -0.5,
            CameraPosition = { -0.4, 0, -13 },
            OrientationOffset = -15,
            CameraPitchOffset = 15.0
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 1.85, {0.0, 0.0}, 12 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createCircle( 1.0, {0.0, 2.75}, 12 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
		ResourceNeededList = {
            {
                { Resource = "TOOL", Quantity = 1 },
            },
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_DUNG",
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "SUBSTRACT",
		Radius = 15.0,
		Value = 1.0
	} },
})



-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_POULTRYFARM_DUNG",
	JobName = "JOB_POULTRYFARM_DUNG_NAME",
	JobDescription = "JOB_POULTRYFARM_DUNG_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 20.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_COAL_BURNER_SHOVEL",
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
--         "JOB_POULTRYFARM_DUNG"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_POULTRYFARM_DUNG"
    }
})

