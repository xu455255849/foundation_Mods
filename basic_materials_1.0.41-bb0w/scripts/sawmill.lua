local mod = ...



-- Building Function: Shingles -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_BASIC_SHINGLE",
-- 	Name = "BUILDING_FUNCTION_BASIC_SHINGLE_NAME",
-- 	IsPrivate = false,
--     WorkerCapacity = 3,
--     ProductionCycleDurationInSec = 30,
--     RelatedJob = {
--         Job = "CARPENTER",
--         Behavior = "BEHAVIOR_WORK",
-- 	},
-- 	InputInventoryCapacity = {
-- 		{ Resource = "WOOD", Quantity = 50 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "WOOD", Quantity = 1 },
-- 	},
-- 	ResourceProduced = {
-- 		{ Resource = "RESOURCE_SHINGLE", Quantity = 1 },
-- 	},
-- })

mod:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = "BUILDING_FUNCTION_BASIC_SHINGLE",
	Name = "BUILDING_FUNCTION_BASIC_SHINGLE_NAME",
    GameRuleModifierList = {
        {
            DataType = "GAME_RULE_MODIFIER_WORKPLACE_RECIPE",
            ResourceListNeededToAdd = {
                {
                    Resource = "WOOD",
                    Quantity = 1,
                },
            },
            ResourceProducedToAdd = {
                {
                    Resource = "RESOURCE_SHINGLE",
                    Quantity = 1,
                },
            },
        },
    },
})




-- -- Building Function Assignable: Sawmill -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_ASSIGNABLE",
--     Id = "BUILDING_FUNCTION_ASSIGNABLE_BASIC_SAWMILL",
--     AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_BASIC_SAWMILL",
-- })

-- mod:registerAsset({
--     DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
--     Id = "BUILDING_FUNCTION_LIST_BASIC_SAWMILL",
--     AssetFunctionList = {
--         "BUILDING_FUNCTION_SAWMILL",
--         "BUILDING_FUNCTION_BASIC_SHINGLE",
--     },
-- })



-- Building Part: Shingle Maker -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BASIC_SAWMILL_SHINGLE",
	Name = "BUILDING_FUNCTION_BASIC_SHINGLE_NAME",
    Category = "OTHER",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_BASIC_SHINGLE",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0.6, -15 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0,
        },
	},
	BuildingZone = {
		ZoneEntryList = {
			{
				Polygon = polygon.createCircle( 1.8, {0, 0}, 9 ),
				Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_SHINGLE",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 25 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 }
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 6 },
            },
        },
	},
})



-- -- Building Part: Sawmill (Override) -------------------------------------------------------------------------------------
-- mod:overrideAsset({
-- 	Id = "BUILDING_PART_SAWMILL",
-- 	-- AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_BASIC_SAWMILL",
-- 	AssetBuildingFunction = "",
-- })



-- -- Building Function: Sawmill (Override) -------------------------------------------------------------------------------------
-- mod:overrideAsset({
-- 	Id = "BUILDING_FUNCTION_SAWMILL",
-- 	Name = "BUILDING_FUNCTION_SAWMILL_NAME",
-- })



-- Building: Sawmill -------------------------------------------------------------------------------------
mod:overrideAsset({
	Id = "BUILDING_SAWMILL",
    Description = "BUILDING_BASIC_SAWMILL_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	IsEditable = true,
    AssetMiniatureBuildingPart = "BUILDING_PART_SAWMILL",
	AssetBuildingPartList = {
        Action = "APPEND",
        "BUILDING_PART_SAWMILL",
        "BUILDING_PART_BASIC_SAWMILL_SHINGLE",
    },
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- mod:overrideAsset({
-- 	Id = "BUILDING_SAWMILL",
--     Description = "BUILDING_BASIC_SAWMILL_DESC",
-- 	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
-- 	IsEditable = true,
--     AssetMiniatureBuildingPart = "BUILDING_PART_SAWMILL",
-- 	AssetBuildingPartList = {},
--     SubAssetBuildingList = {
--         "BUILDING_SAWMILL_PLANK",
--         "BUILDING_SAWMILL_RESOURCE_SHINGLE",
--     },
-- })

-- -- Planks
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_SAWMILL_PLANK",
-- 	Name = "BUILDING_FUNCTION_SAWMILL_NAME",
-- 	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingFunction = "BUILDING_FUNCTION_SAWMILL",
-- 	IsEditable = true,
-- 	AssetBuildingPartList = {
--         "BUILDING_PART_SAWMILL",
--     },
-- })

-- -- Shingles
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_SAWMILL_RESOURCE_SHINGLE",
-- 	Name = "BUILDING_FUNCTION_BASIC_SHINGLE_NAME",
-- 	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingFunction = "BUILDING_FUNCTION_BASIC_SHINGLE",
-- 	IsEditable = true,
-- 	AssetBuildingPartList = {
--         "BUILDING_PART_SAWMILL",
--     },
-- })
