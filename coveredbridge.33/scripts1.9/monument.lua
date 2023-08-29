local coveredBridge = ...

_modelsFolder = "models1.9"

-- Apply building asset processor
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridge.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridgeLarge.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridgeDecoration.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridgeGate.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridgeAddition.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
coveredBridge:registerAssetProcessor(_modelsFolder .. "/coveredBridgeLargeHouse.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

_BridgeBuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {1, 1} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
}}
_GateBuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {8, 4} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
}}
_GateTowerBuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createCircle( 3.3, { 0, 0 }, 16 ),
              Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true } }
}}
coveredBridge:registerEnumValue ("BUILDING_PART_TYPE", "DECORATION")

-- Register all covered bridge building parts and their properties
coveredBridge:dofile(_scriptFolder .. "/bridge_parts.lua")
coveredBridge:dofile(_scriptFolder .. "/soldierBehaviorTree.lua")
coveredBridge:dofile(_scriptFolder .. "/gate_parts.lua")
coveredBridge:dofile(_scriptFolder .. "/building_parts.lua")
coveredBridge:dofile(_scriptFolder .. "/decoration_parts.lua")

function setAssetBuildingPartList(_option, _level)
    if _option == "" then
        return {
		            CoveredBridgePrefix .. _level  .. "_HOUSE_PART",
                        CoveredBridgePrefix .. _level  .. "_RED_PART",
                        CoveredBridgePrefix .. _level  .. "_GREEN_A_PART",
		            CoveredBridgePrefix .. _level  .. "_GREEN_B_PART",
                        CoveredBridgePrefix .. _level  .. "_BLUE_PART",
		            CoveredBridgePrefix .. _level  .. "_RED_WINE_PART",
		            CoveredBridgePrefix .. _level  .. "_CARBON_PART",
        }
    else
        return {
		            CoveredBridgePrefix .. _level  .. "_HOUSE_PART",
                        CoveredBridgePrefix .. _level  .. "_RED_PART",
                        CoveredBridgePrefix .. _level  .. "_GREEN_A_PART",
		            CoveredBridgePrefix .. _level  .. "_GREEN_B_PART",
                        CoveredBridgePrefix .. _level  .. "_BLUE_PART",
		            CoveredBridgePrefix .. _level  .. "_RED_WINE_PART",
		            CoveredBridgePrefix .. _level  .. "_CARBON_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_TOWER1_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_MIDDLE1_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_MIDDLE2_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_TOWER2_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_MIDDLE3_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_TOWER3_PART",
		            CoveredBridgePrefix .. _level  .. "_HOUSE_MIDDLE4_PART",
        }
    end
end 
function setSubBuildingHousing(_option, _level)
	coveredBridge:registerAsset({
		DataType = "BUILDING",
		Id = CoveredBridgePrefix .. _option .. _level,
		Name = CoveredBridgePrefix .. "_BUILDING_FUNCTION" .. _level  .. "_NAME",
		Description = CoveredBridgePrefix .. "_BUILDING_FUNCTION" .. _level  .. "_DESC",
		BuildingType = BUILDING_TYPE.MONUMENT,
		AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
		AssetBuildingPartList = setAssetBuildingPartList(_option, _level),
		RequiredPartList = {
			-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
			{ Category = "CORE", Min = 1 },
		},
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
      coveredBridge:overrideAsset({
            Id = "TAXATION_FUNCTION_HOUSING",
            AssetBuildingList = {
                Action = "APPEND",
                CoveredBridgePrefix .. _option .. _level,
            },
      })
      return CoveredBridgePrefix .._option .. _level 
end

function setSubBuildingFunction(_option, _function)
	coveredBridge:registerAsset({
		DataType = "BUILDING",
		Id = CoveredBridgePrefix .. _option .. "_" .. _function,
		Name = _function .. "_NAME",
		Description = _function .. "_DESC",
		BuildingType = BUILDING_TYPE.MONUMENT,
		AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
		AssetBuildingPartList = setAssetBuildingPartList(_option, ""),
            AssetBuildingFunction = _function, 
		RequiredPartList = {
			-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
			{ Category = "CORE", Min = 1 },
		},
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
      return CoveredBridgePrefix .._option .. "_" .. _function
end

function registerSubBuildingGate(_function)
	coveredBridge:registerAsset({
		DataType = "BUILDING",
		Id = CoveredBridgePrefix .. "_" .. _function,
		Name = _function .. "_NAME",
		Description = _function .. "_DESC",
		BuildingType = BUILDING_TYPE.MONUMENT,
		AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
		AssetBuildingPartList = {
		            CoveredBridgePrefix .. "_GATE_ROOT_PART",
		            CoveredBridgePrefix .. "_GATE_TOWER_ROOT_PART",
                        "BUILDING_PART_TRAINING_DUMMY",
            },
            AssetBuildingFunction = _function, 
		RequiredPartList = {
			-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
			{ Category = "CORE", Min = 1 },
		},
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
end
registerSubBuildingGate(CoveredBridgePrefix .. "_GATE_FUNCTION")

function setSubBuildingList(_option)
    return {
         setSubBuildingFunction(_option, CoveredBridgePrefix .. "_TAILOR_FUNCTION"),
         setSubBuildingFunction(_option, "BUILDING_FUNCTION_FOOD_MARKET"),
         setSubBuildingFunction(_option, "BUILDING_FUNCTION_GOODS_MARKET"),
         setSubBuildingFunction(_option, "BUILDING_FUNCTION_LUXURY_MARKET"),
         setSubBuildingHousing(_option, "_HOUSING_LVL1"),
         setSubBuildingHousing(_option, "_HOUSING_LVL2"),
         CoveredBridgePrefix .. "_" .. CoveredBridgePrefix .. "_GATE_FUNCTION",
    }
end

-- Register default roof material
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeAddition.fbx/Materials/toitHat", CoveredBridgePrefix .. "_ADDITION_HAT_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeAddition.fbx/Materials/toitKnife", CoveredBridgePrefix .. "_ADDITION_KNIFE_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Materials/toitFood", CoveredBridgePrefix .. "_DECORATION_FOOD_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Materials/toitGoods", CoveredBridgePrefix .. "_DECORATION_GOODS_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Materials/toitLuxury", CoveredBridgePrefix .. "_DECORATION_LUXURY_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Materials/toitTailor", CoveredBridgePrefix .. "_DECORATION_TAILOR_DEFAULT_MATERIAL")
--coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Materials/chambranle", CoveredBridgePrefix .. "_DECORATION_CHAMBRANLE_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeGate.fbx/Materials/toitRouge", CoveredBridgePrefix .. "_GATE_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeLargeHouse.fbx/Materials/toitCharcoal", CoveredBridgePrefix .. "_LARGE_HOUSE_CHARCOAL_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeLargeHouse.fbx/Materials/toitLieDeVin", CoveredBridgePrefix .. "_LARGE_HOUSE_LIEDEVIN_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeLargeHouse.fbx/Materials/toitRouge", CoveredBridgePrefix .. "_LARGE_HOUSE_ROUGE_DEFAULT_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeLargeHouse.fbx/Materials/toitTailor", CoveredBridgePrefix .. "_LARGE_HOUSE_TAILOR_DEFAULT_MATERIAL")

-- Register optional materials
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/redRoof", CoveredBridgePrefix .. "_DECORATION_RED_TILE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/blueRoof", CoveredBridgePrefix .. "_DECORATION_BLUE_TILE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/brownRoof", CoveredBridgePrefix .. "_DECORATION_BROWN_TILE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/greyRoof", CoveredBridgePrefix .. "_DECORATION_LIGHT_GREY_TILE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/grey2Roof", CoveredBridgePrefix .. "_DECORATION_DARK_GREY_TILE_ROOF_MATERIAL")

coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wRedRoof", CoveredBridgePrefix .. "_DECORATION_RED_SHINGLE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wBlueRoof", CoveredBridgePrefix .. "_DECORATION_BLUE_SHINGLE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wBrownRoof", CoveredBridgePrefix .. "_DECORATION_BROWN_SHINGLE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wYellowRoof", CoveredBridgePrefix .. "_DECORATION_YELLOW_SHINGLE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wGreenRoof", CoveredBridgePrefix .. "_DECORATION_GREEN_SHINGLE_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wManorRoof", CoveredBridgePrefix .. "_DECORATION_WOODEN_MANOR_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/wManor2Roof", CoveredBridgePrefix .. "_DECORATION_STONE_MANOR_ROOF_MATERIAL")

coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/brownMonasteryRoof", CoveredBridgePrefix .. "_DECORATION_BROWN_MONASTERY_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/blueMonasteryRoof", CoveredBridgePrefix .. "_DECORATION_BLUE_MONASTERY_ROOF_MATERIAL")
coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/purpleMonasteryRoof", CoveredBridgePrefix .. "_DECORATION_PURPLE_MONASTERY_ROOF_MATERIAL")

coveredBridge:registerAssetId(_modelsFolder .. "/utility/roofMaterials.fbx/Materials/strawRoof", CoveredBridgePrefix .. "_DECORATION_STRAW_ROOF_MATERIAL")

function configureMaterielSetList(_colorRoof, _isDefaultMaterial)
    function configureMaterial(_core, _colorMaterial)
        if _isDefaultMaterial then
            return  CoveredBridgePrefix .. "_" .. _core .. "_DEFAULT_MATERIAL"
        else
            return  CoveredBridgePrefix .. "_DECORATION_" .. _colorMaterial .. "_MATERIAL"
        end
    end
    return {
                SetName = CoveredBridgePrefix .. "_" .. _colorRoof,
                MaterialList = {
                    configureMaterial("ADDITION_HAT", _colorRoof),
                    configureMaterial("ADDITION_KNIFE", _colorRoof),
                    configureMaterial("DECORATION_FOOD", _colorRoof),
                    configureMaterial("DECORATION_GOODS", _colorRoof),
                    configureMaterial("DECORATION_LUXURY", _colorRoof),
                    configureMaterial("DECORATION_TAILOR", _colorRoof),
--                    configureMaterial("DECORATION_CHAMBRANLE", _colorRoof),
                    configureMaterial("GATE", _colorRoof),
                    configureMaterial("LARGE_HOUSE_CHARCOAL", _colorRoof),
                    configureMaterial("LARGE_HOUSE_LIEDEVIN", _colorRoof),
                    configureMaterial("LARGE_HOUSE_ROUGE", _colorRoof),
                    configureMaterial("LARGE_HOUSE_TAILOR", _colorRoof),
                }
    }
end


function registerBridgeMonument(_option)
    -- Register the covered bridge monument
    coveredBridge:registerAsset({
        Id = CoveredBridgePrefix .. _option ,
	  Name = CoveredBridgePrefix .. _option .. "_MONUMENT_NAME",
	  Description = CoveredBridgePrefix .. _option .. "_MONUMENT_DESC",
	  BuildingType = "MODS",
	  IsManuallyUnlocked = false,
	  IsDestructible = true,
	  IsEditable = true,
	  IsClearTrees = true,
        DataType = "BUILDING",
        AssetCoreBuildingPart = CoveredBridgePrefix .. _option .. "_CORE_PART",
        SubAssetBuildingList = setSubBuildingList(_option),
        AssetBuildingPartList = {
            CoveredBridgePrefix .. "_CENTER_COVERAGE_PART",
            CoveredBridgePrefix .. "_START_END_COVERAGE_PART",
        },
        MaterialSetList = {
            configureMaterielSetList("DEFAULT_ROOF", true), -- default material list
            configureMaterielSetList("RED_TILE_ROOF", false),
            configureMaterielSetList("BLUE_TILE_ROOF", false),
            configureMaterielSetList("BROWN_TILE_ROOF", false),
            configureMaterielSetList("LIGHT_GREY_TILE_ROOF", false),
            configureMaterielSetList("DARK_GREY_TILE_ROOF", false),
            configureMaterielSetList("RED_SHINGLE_ROOF", false),
            configureMaterielSetList("BLUE_SHINGLE_ROOF", false),
            configureMaterielSetList("BROWN_SHINGLE_ROOF", false),
            configureMaterielSetList("YELLOW_SHINGLE_ROOF", false),
            configureMaterielSetList("GREEN_SHINGLE_ROOF", false),
            configureMaterielSetList("WOODEN_MANOR_ROOF", false),
            configureMaterielSetList("STONE_MANOR_ROOF", false),
            configureMaterielSetList("BROWN_MONASTERY_ROOF", false),
            configureMaterielSetList("BLUE_MONASTERY_ROOF", false),
            configureMaterielSetList("PURPLE_MONASTERY_ROOF", false),
            configureMaterielSetList("STRAW_ROOF", false),
        },
    })
end
 
registerBridgeMonument("")
registerBridgeMonument("_LARGE")

function appendSubBuildingList(_option, _function)
    coveredBridge:overrideAsset({
        Id = CoveredBridgePrefix .. _option ,
        SubAssetBuildingList = {
            Action = "APPEND",
            setSubBuildingFunction(_option, _function),
        },
    })
end

coveredBridge:registerAsset({
    DataType = "EVENT",
    Id = CoveredBridgePrefix .. "_EVENT_START",
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
                    CoveredBridgePrefix,
                    CoveredBridgePrefix .. "_LARGE",
                },
            },
        }
    }
})

coveredBridge:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        CoveredBridgePrefix .. "_EVENT_START",
    }
})