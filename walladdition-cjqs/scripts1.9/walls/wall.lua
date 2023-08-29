local WallAddition = ...

WallAddition:registerAssetProcessor("models/utility/wallMaterials.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
WallAddition:registerAssetProcessor("models/utility/floorGroundMaterials.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/murChateau", WallAdditionPrefix .. "_DECORATION_STONE_MANOR_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/brownMonasteryWall", WallAdditionPrefix .. "_DECORATION_BROWN_MONASTERY_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/blueMonasteryWall", WallAdditionPrefix .. "_DECORATION_BLUE_MONASTERY_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/purpleMonasteryWall", WallAdditionPrefix .. "_DECORATION_PURPLE_MONASTERY_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/redStoneWall", WallAdditionPrefix .. "_DECORATION_RED_STONE_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/sandStoneWall", WallAdditionPrefix .. "_DECORATION_SAND_STONE_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/giantGateWall", WallAdditionPrefix .. "_DECORATION_GIANT_GATE_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/whiteChalkWall", WallAdditionPrefix .. "_DECORATION_WHITE_CHALK_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/creamWall", WallAdditionPrefix .. "_DECORATION_CREAM_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/woodWall", WallAdditionPrefix .. "_DECORATION_WOOD_WALL_MATERIAL")
WallAddition:registerAssetId("models/utility/wallMaterials.fbx/Materials/americanShingleWall", WallAdditionPrefix .. "_DECORATION_AMERICAN_SHINGLE_WALL_MATERIAL")

WallAddition:registerAssetId("models/utility/floorGroundMaterials.fbx/Materials/whiteStoneGround", WallAdditionPrefix .. "_DECORATION_WHITE_STONE_FLOOR_GROUND_MATERIAL")
WallAddition:registerAssetId("models/utility/floorGroundMaterials.fbx/Materials/woodGround", WallAdditionPrefix .. "_DECORATION_WOOD_FLOOR_GROUND_MATERIAL")
WallAddition:registerAssetId("models/utility/floorGroundMaterials.fbx/Materials/roseSandGround", WallAdditionPrefix .. "_DECORATION_RED_STONE_FLOOR_GROUND_MATERIAL")
WallAddition:registerAssetId("models/utility/floorGroundMaterials.fbx/Materials/waterGround", WallAdditionPrefix .. "_DECORATION_WATER_FLOOR_GROUND_MATERIAL")

local _CrenationMaterial = ""
if _CustomCrenellationMaterial == "STONE_MANOR" then
elseif _CustomCrenellationMaterial == "BROWN_MONASTERY" then _CrenationMaterial = "_brownMonastery"
elseif _CustomCrenellationMaterial == "BLUE_MONASTERY" then _CrenationMaterial = "_blueMonastery"
elseif _CustomCrenellationMaterial == "PURPLE_MONASTERY" then _CrenationMaterial = "_purpleMonastery"
elseif _CustomCrenellationMaterial == "RED_STONE" then _CrenationMaterial = "_redStone"
elseif _CustomCrenellationMaterial == "GIANT_GATE" then _CrenationMaterial = "_giantGate"
elseif _CustomCrenellationMaterial == "WHITE_CHALK" then _CrenationMaterial = "_whiteChalk"
elseif _CustomCrenellationMaterial == "SAND_STONE" then _CrenationMaterial = "_sandStone"
elseif _CustomCrenellationMaterial == "CREAM" then _CrenationMaterial = "_cream"
end

function registerWall(_wallFbxName, _wallPartName, _wallAssetId, _crenationDistance, _deltaHeight)
-- Register crenation model asset
WallAddition:registerAssetId("models/walls/" .. _wallFbxName .. ".fbx/Prefab/step_2_rampart_" .. _wallPartName .. "/rampart" .. _CrenationMaterial .. "_" .. _wallPartName, WallAdditionPrefix .. "_CRENATION_" .. _wallAssetId .. string.upper(_CrenationMaterial) .."_PREFAB")

-- Register the wall asset
WallAddition:registerAsset({
	DataType = "WALL_CONFIG",
	Id = WallAdditionPrefix .. "_" .. _wallAssetId,
      BuildingType = "MODS",
	WallConfigName = WallAdditionPrefix .. "_" .. _wallAssetId .. "_NAME",
	IsManuallyUnlocked = false,
	Material = WallAdditionPrefix .. "_DECORATION_" .. _CustomWallMaterial .. "_WALL_MATERIAL",
	MaterialTop = WallAdditionPrefix .. "_DECORATION_" .. _CustomGroundMaterial .. "_FLOOR_GROUND_MATERIAL",
	Crenation = WallAdditionPrefix .. "_CRENATION_" .. _wallAssetId .. string.upper(_CrenationMaterial) .."_PREFAB",
	CrenationDistance = _crenationDistance,
	StepLength = 4,
	Width = 2,
	Height = _deltaHeight,
	UvTillingWall = 0.28,
	UvTillingTop = 0.28,
	WallOffsetY = 0,
	CrenationOffsetY = 1.25 + _deltaHeight,
	CrenationOffsetZ = 0.18
})
end

registerWall( "crenationSimple", "wasr", "SIMPLE", 1.8, 4.85 )
registerWall( "crenationHoardings", "Wall_HoardingsPart", "HOARDINGS", 7.17, 7.16 )
registerWall( "crenationMachicolation", "wam", "MACHICOLATION", 1.8, 12 )
registerWall( "crenationWoodenMachicolation", "wawm", "WOODEN_MACHICOLATION", 1.8, 12 )
registerWall( "crenationTiledMachicolation", "watm", "TILED_MACHICOLATION", 1.8, 12 )

WallAddition:registerAsset({
    DataType = "EVENT",
    Id = WallAdditionPrefix .. "_EVENT_START",
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
                WallList = {
                    WallAdditionPrefix .. "_" .. "SIMPLE",
                    WallAdditionPrefix .. "_" .. "HOARDINGS",
                    WallAdditionPrefix .. "_" .. "MACHICOLATION",
                    WallAdditionPrefix .. "_" .. "WOODEN_MACHICOLATION",
                    WallAdditionPrefix .. "_" .. "TILED_MACHICOLATION",
               },
            },
        }
    }
})

WallAddition:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        WallAdditionPrefix .. "_EVENT_START",
    }
})
