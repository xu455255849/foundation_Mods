local pastry = ...

function registerSubBuilding(_suffix, _buildingFunction, _buildingPartList)
	pastry:registerAsset({
		DataType = "BUILDING",
		Id = _PastryPrefix .. "_" .. _suffix,
		Name = _buildingFunction .. "_NAME",
		Description = _buildingFunction .. "_DESC",
		BuildingType = "FOOD_PRODUCTION",
            AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
            AssetBuildingPartList = _buildingPartList,
		AssetBuildingFunction = _buildingFunction,
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
end

-- Resources and their assets (icons)
pastry:dofile(_scriptFolder .. "/jobs.lua")
-- workplace
pastry:dofile(_scriptFolder .. "/henhouse.lua")
pastry:dofile(_scriptFolder .. "/creamery.lua")
pastry:dofile(_scriptFolder .. "/pastry.lua")

pastry:registerAsset({
    DataType = "BUILDING",
    Id = _PastryPrefix .. "_MONUMENT",
    Name = _PastryPrefix .. "_MONUMENT_NAME",
    Description = _PastryPrefix .. "_MONUMENT_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = _PastryPrefix .. "_PASTRY_WORKPLACE_PART",
    AssetBuildingPartList = {},
    SubAssetBuildingList = {
		_PastryPrefix .. "_HENHOUSE_RECIPE_1",
		_PastryPrefix .. "_HENHOUSE_RECIPE_2",
            _PastryPrefix .. "_CREAMERY",
		_PastryPrefix .. "_PASTRY_RECIPE_1",
		_PastryPrefix .. "_PASTRY_RECIPE_2",
    },
})

pastry:registerAsset({
    DataType = "EVENT",
    Id = _PastryPrefix .. "_EVENT_START",
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
                    _PastryPrefix .. "_MONUMENT",
                },
            },
        }
    }
})

pastry:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        _PastryPrefix .. "_EVENT_START",
    }
})

