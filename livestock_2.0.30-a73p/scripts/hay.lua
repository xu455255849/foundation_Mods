local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Hay1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/Hay1.fbx/Prefab/HayStack.Part.001", "PREFAB_LIVESTOCKFARM_HAYSTACK1")
mod:registerAssetId("models/Hay1.fbx/Prefab/HayStack.Part.002", "PREFAB_LIVESTOCKFARM_HAYSTACK2")
mod:registerAssetId("models/Hay1.fbx/Prefab/HayStack.Part.003", "PREFAB_LIVESTOCKFARM_HAYSTACK3")

-- Models used for the plants must have only a single Mesh and a single Material, otherwise planting will crash
mod:registerAssetId("models/Hay1.fbx/Prefab/Hay", "PREFAB_LIVESTOCKFARM_HAY")
mod:registerAssetId("models/Hay1.fbx/Prefab/Hat.Part", "PREFAB_LIVESTOCKFARM_HAT") -- BROWN - UNISEX hat, hair

mod:registerAssetId("models/textures/Grass.tif", "TEXTURE_LIVESTOCKFARM_HAY_GREEN")
mod:registerAssetId("models/textures/GrassDry.tif", "TEXTURE_LIVESTOCKFARM_HAY_DRY")



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.001/Hay.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.001/Log.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.001/Log.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.001/Log.003", {DataType = "COMP_GROUNDED"})

mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.002/Hay.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.002/Log.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.002/Log.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.002/Log.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.002/Log.007", {DataType = "COMP_GROUNDED"})

mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.003/Hay.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.003/Log.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/HayStack.Part.003/Log.009", {DataType = "COMP_GROUNDED"})



-- Building part type -------------------------------------------------------------------------------------
mod:registerEnumValue("BUILDING_PART_TYPE", "HAY")



-- Transparency -------------------------------------------------------------------------------------
mod:registerAssetId("models/Hay1.fbx/Materials/Material.Hay1", "MATERIAL_LIVESTOCKFARM_HAY1")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_HAY1",
    HasAlphaTest = true
})

mod:registerAssetId("models/Hay1.fbx/Materials/Material.Grass", "MATERIAL_LIVESTOCKFARM_GRASS")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_GRASS",
    HasAlphaTest = true
})

mod:registerAssetId("models/Hay1.fbx/Materials/Material.Grass.Short", "MATERIAL_LIVESTOCKFARM_GRASS_SHORT")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_GRASS_SHORT",
    HasAlphaTest = true
})



-- Collider Platform (climbable mesh) -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/Roman1.fbx/", { "PLATFORM" })



-- Crop Field Element -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/Hay", { DataType = "COMP_CROP_FIELD_ELEMENT" })



-- Plantable -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Hay1.fbx/Prefab/Hay", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 0.5 })

mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_LIVESTOCKFARM_HAY",
    Name = "PLANTABLE_LIVESTOCKFARM_HAY_NAME",
    PlantPrefab = "PREFAB_LIVESTOCKFARM_HAY",
    Icon = "ICON_HAY",
    MinimumScale = 0.85, -- min size at full growth
    MaximumScale = 1.15 -- max size at full growth
})



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "models/Hay1.fbx/Prefab/Hay", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_HAY",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 2.00, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})



-- Zone -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ZONE",
    Id = "ZONE_LIVESTOCKFARM_HAY",
    Name = "ZONE_LIVESTOCKFARM_HAY_NAME",
    Description = "ZONE_LIVESTOCKFARM_HAY_NAME",
    Icon = "ICON_HAY",
    HoverIcon = "ICON_HAY",
    SelectionIcon = "ICON_HAY",
    Color = {1.00, 1.70, 0.60, 0.9}, -- RGB A = 
    DesirabilityLayerToShow = "DESIRABILITY_FERTILITY"
})



-- Farm Field Config -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_LIVESTOCKFARM_HAY",
    ZoneType = "ZONE_LIVESTOCKFARM_HAY",
    PlantPrefab = "PREFAB_LIVESTOCKFARM_HAY",
    HasPlantingCycle = true,
    IsScaling = true,
    RowDistance = 0.425,
    ItemDistance = 0.425,
    RandomOrientation = {0, 360},
    -- RandomPositionOffset = {0, 0},
    RandomPositionOffset = {-0.2, 0.2},
    SourceMaterial = "MATERIAL_LIVESTOCKFARM_GRASS",
    GrowingMaterial = "MATERIAL_LIVESTOCKFARM_GRASS",
    HarvestedMaterial = "MATERIAL_LIVESTOCKFARM_GRASS_SHORT",
    GrowingTextureList = {
        "TEXTURE_LIVESTOCKFARM_HAY_GREEN",
    },
    HarvestingTextureList = {
        "TEXTURE_LIVESTOCKFARM_HAY_DRY",
    },
    AlphaTestThreshold = 0.5
})



-- Sowing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_SOWING",
    PurposeList = {
        "WORK",
    },
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
                    Model = "PREFAB_TOOL_FARMER_SEED_BAG",
                    WorkAttachName = "SeedBag_Anchor",
                    WalkAttachName = "SeedBag_Anchor",
                    KeepObjectOnWalkCycle = true,
                },
                WalkAnimation = "SEED_WALK",
                IdleAnimation = "SEED",
            },
        },
	},
})



-- Growing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_GROWING",
    PurposeList = {
        "WORK",
    },
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
                WalkAnimation = "WALKING",
                IdleAnimation = "GRAPE_CARING"
            },
        },
	},
})



-- Harvest Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_HARVEST",
    PurposeList = {
        "WORK",
    },
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
                RightHandObject = {
                    Model = "PREFAB_TOOL_FARMER_SICKLE",
                    KeepObjectOnWalkCycle = false,
                    WorkAttachName = "Sickle_Anchor",
                    WalkAttachName = "Sickle_Anchor",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "SCYTHE",
            },
        },
	},
})



-- Building Function: Hay Meadow -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_HAY",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_HAY_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 0.1,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_HAY",
        Behavior = "BEHAVIOR_FARMER",
    },
    ResourceListNeeded = {
		{ Resource = "RESOURCE_HAY", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_HAY", Quantity = 2 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 6},
	GrowDuration = {6, 10},
	GrowWaitDuration = {10, 12},
	HarvestDuration = {12, 18},
	RestDuration = {18, 21},

    QuantityToHarvestPerStep = 30,
	HarvestStepsCount = 20,
	QuantityToPlantPerStep = 25,
	PlantingStepsCount = 20,
	ResourceValuePerGather = 0.017,

    CropFieldConfig = "FARM_FIELD_CONFIG_LIVESTOCKFARM_HAY",
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_SOWING",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_GROWING",
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_LIVESTOCKFARM_HAY_HARVEST",
})



-- Building Part: Hay stack -------------------------------------------------------------------------------------

for i=1, 3, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_HAYSTACK" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_HAYSTACK" .. i .. "_NAME", 
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_HAYSTACK" .. i,
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0.6, -12 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 25.0
            },
        },
    })

end

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_HAYSTACK",
	Name = "BUILDING_PART_LIVESTOCKFARM_HAYSTACK_NAME",
    Category = "OTHER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_HAYSTACK1",
			"BUILDING_PART_LIVESTOCKFARM_HAYSTACK2",
			"BUILDING_PART_LIVESTOCKFARM_HAYSTACK3",
		},
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0.6, -12 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 1.85, {0, 0}, 10 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    -- IsMovableWhenBuilt = true,
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_HAY",
    Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
            },
        },
    },
})



-- Job: Hay -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_HAY",
	JobName = "JOB_LIVESTOCKFARM_HAY_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_HAY_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_FARMER",
    -- ProductionDelay = 0.1, -- default 30
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
--         "JOB_LIVESTOCKFARM_HAY",
--     },
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_HAY",
    },
})
