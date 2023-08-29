local mod = ...


-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/Pond1.fbx/Prefab/PondPart", "PREFAB_POND1")
mod:registerAssetId("models/Pond1.fbx/Prefab/FisherPart1", "PREFAB_POND1_FISHER1")

mod:registerAssetId("models/Pond2.fbx/Prefab/PondPart", "PREFAB_POND2")
mod:registerAssetId("models/Pond2.fbx/Prefab/FisherPart1", "PREFAB_POND2_FISHER1")
mod:registerAssetId("models/Pond2.fbx/Prefab/FisherPart2", "PREFAB_POND2_FISHER2")

mod:registerAssetId("models/Pond3.fbx/Prefab/PondPart", "PREFAB_POND3")
mod:registerAssetId("models/Pond3.fbx/Prefab/FisherPart1", "PREFAB_POND3_FISHER1")
mod:registerAssetId("models/Pond3.fbx/Prefab/FisherPart2", "PREFAB_POND3_FISHER2")



-- Building Asset Processor
mod:registerAssetProcessor("models/Pond1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Pond2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Pond3.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/Pond1.fbx/Prefab/PondPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/Pond2.fbx/Prefab/PondPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/Pond3.fbx/Prefab/PondPart", { "PLATFORM" })



-- Building: Fish Pond -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_FISHPOND",
	Name = "BUILDING_FISHPOND_NAME",
	Description = "BUILDING_FISHPOND_DESC",
    BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_FISHPOND_POND1",
	AssetBuildingPartList = {
        "BUILDING_PART_FISHPOND_POND1",
        "BUILDING_PART_FISHPOND_POND2",
        "BUILDING_PART_FISHPOND_POND3",
    },
})

mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_BUILDING_FISHPOND", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_FISHPOND",
    Name = "BUILDING_FISHPOND_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_FISHPOND",
    DataCost = {
        -- DataInfluenceCostList = {
        --     {
        --         Estate = "KINGDOM",
        --         Quantity = 5,
        --     },
        -- },
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
                    "BUILDING_FISHPOND",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_FISHPOND",
    },
})



-- Building part: Pond 1 -------------------------------------------------------------------------------------

-- Fishers
for i = 1, 1 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_FISHPOND_POND1_FISHER" .. i,
        Name = "BUILDING_PART_FISHPOND_POND1_NAME",
        BuildingFunction = "BUILDING_FUNCTION_FISHPOND1",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_POND1_FISHER" .. i,
        },
    })

end

-- Assemblage
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND1_ASSEMBLAGE",
    Name = "BUILDING_PART_FISHPOND_POND1_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_POND1" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_FISHPOND_POND1_FISHER1" },
        },
    },
})

-- Random
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND1",
    Name = "BUILDING_PART_FISHPOND_POND1_NAME",
    Category = "CORE",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 9.5, {-0.5, 1.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createCircle( 7.0, {-0.5, 1.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
        RandomPartList = {
            "BUILDING_PART_FISHPOND_POND1_ASSEMBLAGE"
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, -48 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 35.0,
        },
    },
	Cost = {
		BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 60 },
            { Resource = "FISH", Quantity = 40 },
        },
		UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
    },
    DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 28.0,
		Value = 0.5
	} }
})



-- Building part: Pond 2 -------------------------------------------------------------------------------------

-- Fishers
for i = 1, 2 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_FISHPOND_POND2_FISHER" .. i,
        Name = "BUILDING_PART_FISHPOND_POND2_NAME",
        BuildingFunction = "BUILDING_FUNCTION_FISHPOND1",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_POND2_FISHER" .. i,
        },
    })

end

-- Assemblage
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND2_ASSEMBLAGE",
    Name = "BUILDING_PART_FISHPOND_POND2_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_POND2" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_FISHPOND_POND2_FISHER1" },
            { BuildingPart = "BUILDING_PART_FISHPOND_POND2_FISHER2" },
        },
    },
})

-- Random
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND2",
    Name = "BUILDING_PART_FISHPOND_POND2_NAME",
    Category = "CORE",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 7.5, {2.0, -2.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
            },
            {
                Polygon = polygon.createCircle( 8.5, {-5.0, 4.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
            },
            {
                Polygon = polygon.createCircle( 8.5, {-11.0, -1.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
            },

            {
                Polygon = polygon.createCircle( 4.5, {2.5, -1.5}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
            {
                Polygon = polygon.createCircle( 2.5, {-2.0, -2.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
            {
                Polygon = polygon.createCircle( 2.5, {-0.5, 3.5}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
            {
                Polygon = polygon.createCircle( 5.5, {-5.0, 4.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
            {
                Polygon = polygon.createCircle( 5.2, {-11.0, -1.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
        },
    },
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
        RandomPartList = {
            "BUILDING_PART_FISHPOND_POND2_ASSEMBLAGE"
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 5, 0, -62 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 30.0,
        },
    },
	Cost = {
		BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 100 },
            { Resource = "FISH", Quantity = 60 },
        },
		UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 6 },
        },
    },
    DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 35.0,
		Value = 0.5
	} },
})



-- Building part: Pond 3 -------------------------------------------------------------------------------------

-- Fishers
for i = 1, 2 do

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_FISHPOND_POND3_FISHER" .. i,
        Name = "BUILDING_PART_FISHPOND_POND3_NAME",
        BuildingFunction = "BUILDING_FUNCTION_FISHPOND1",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_POND3_FISHER" .. i,
        },
    })

end

-- Assemblage
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND3_ASSEMBLAGE",
    Name = "BUILDING_PART_FISHPOND_POND3_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
        CoreRandomBuildingPartList = { "PREFAB_POND3" },
        MandatoryBuildingPartList = {
            { BuildingPart = "BUILDING_PART_FISHPOND_POND3_FISHER1" },
            { BuildingPart = "BUILDING_PART_FISHPOND_POND3_FISHER2" },
        },
    },
})

-- Random
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_FISHPOND_POND3",
    Name = "BUILDING_PART_FISHPOND_POND3_NAME",
    Category = "CORE",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 13.5, {-0.5, 1.0}, 16 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false } 
            },
            {
                Polygon = polygon.createCircle( 8.5, {-0.5, 1.0}, 12 ), -- first number moves left and right, second moves up and down (with X forward)
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
            },
        },
    },
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
        RandomPartList = {
            "BUILDING_PART_FISHPOND_POND3_ASSEMBLAGE"
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, -58 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 30.0,
        },
    },
    Cost = {
		BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 100 },
            { Resource = "FISH", Quantity = 60 },
        },
		UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 6 },
        },
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "ADD",
        Radius = 35.0,
        Value = 0.5,
    } },
})



-- Building Function: Fish Pond (1 worker) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_FISHPOND1",
    Name = "BUILDING_FUNCTION_FISHPOND1_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "FISHERMAN",
        Behavior = "BEHAVIOR_WORK",
    },
    ResourceProduced = {{ Resource = "FISH", Quantity = 1 }},
})


-- Building Function: Fish Pond (2 workers) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_FISHPOND2",
    Name = "BUILDING_FUNCTION_FISHPOND2_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 20,
    RelatedJob = {
        Job = "FISHERMAN",
        Behavior = "BEHAVIOR_WORK",
    },
    ResourceProduced = {{ Resource = "FISH", Quantity = 1 }},
})


