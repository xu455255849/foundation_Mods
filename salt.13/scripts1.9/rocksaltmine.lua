local RockSaltMine = ...

RockSaltMine:overrideAsset({
    DataType = "GAME_RULE_MINERAL",
    Id = "GAME_RULE_MINERAL_DEFAULT",
    MineralCategoryList = {
        Action = "APPEND",
        { 
          DataType = "MINERAL_CATEGORY",
          MineralAssetBuildingList = {RockSaltMinePrefix .. "_BUILDING_QUARRY_SALT_DEPOSIT"},
          Percentage = 1.0,
          FirstDiscoveryProspectionCount = 0,
        },
    }
})
RockSaltMine:registerAsset({
    DataType = "BUILDING",
    Id = RockSaltMinePrefix .. "_BUILDING_QUARRY_SALT_DEPOSIT",
    Name = RockSaltMinePrefix .. "_NAME",
    Description = RockSaltMinePrefix .. "_DESC",
    BuildingType = "MONUMENT",
    AssetCoreBuildingPart = "BUILDING_PART_QUARRY_MARBLE_DEPOSIT",
    AssetBuildingPartList = {
             RockSaltMinePrefix .. "_BUILDING_PART_QUARRY_SALT_QUARRY",
             "BUILDING_PART_QUARRY_CART",
             "BUILDING_PART_QUARRY_CRANE",
             "BUILDING_PART_QUARRY_SMALL_CRANE",
    },
    IsDestructible = false,
    IsEditable = true,
    IsClearTrees = true,
    IsHidden = true,
    RequiredPartList = {
        {
            Category = "QUARRY",
            Min = 1
        },
        {
            Category = "RESOURCE_DEPOT",
            Min = 1
        }
    }
})

RockSaltMine:registerAsset({
	DataType = "BUILDING_PART",
	Id = RockSaltMinePrefix .. "_BUILDING_PART_QUARRY_SALT_QUARRY",
	Name = RockSaltMinePrefix .. "_BUILDING_PART_QUARRY_SALT_QUARRY_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = RockSaltMinePrefix .. "_PREFAB"
	},
        Category = "QUARRY",
        Capacity = 1,
        IsOnlyAttached = true,
	AssetBuildingFunction = RockSaltMinePrefix .. "_BUILDING_FUNCTION_QUARRY_SALT"
})
RockSaltMine:registerPrefabComponent("models/rocksaltmine.fbx/Prefab/rocksaltminePart", {
	DataType = "COMP_GROUNDED"
})

RockSaltMine:registerAsset({
    DataType = "BUILDING_FUNCTION_QUARRY",
    Id = RockSaltMinePrefix .. "_BUILDING_FUNCTION_QUARRY_SALT",
    HasResourceDepot = false,
    WorkerCapacity = 2,
    RelatedJob = { Job = "MINER", Behavior = "BEHAVIOR_WORK" },
    ResourceProduced = {
			{ Resource = CommonResourceBrine, Quantity = 1 }
    },
    RandomResourceToSpawn = CommonResourceBrine,
    SpawnPercentage = 0
})

-- Register common prefab nodes
RockSaltMine:registerAssetId("models/rocksaltmine.fbx/Prefab/rocksaltminePart", RockSaltMinePrefix .. "_PREFAB")

RockSaltMine:registerPrefabComponent("models/rocksaltmine.fbx/Prefab/rocksaltminePart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {6, 4}
})

RockSaltMine:registerAsset({
    DataType = "EVENT",
    Id = RockSaltMinePrefix .. "_EVENT_START",
    DaysToFirst = 1,
    ConditionList = {
        {
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTER",
        },
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    RockSaltMinePrefix .. "_BUILDING_QUARRY_SALT_DEPOSIT",
                },
            },
        }
    }
})

RockSaltMine:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        RockSaltMinePrefix .. "_EVENT_START",
    }
})