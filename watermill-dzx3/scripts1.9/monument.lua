local WaterMill = ...

WaterMill:registerEnumValue ("BUILDING_PART_TYPE", "EXTENSION")

-- Particle system
WaterMill:dofile(_scriptFolder .. "/flow.lua")

-- Register all water mill building parts and their properties
WaterMill:dofile(_scriptFolder .. "/waterMillParts.lua")

-- Register all snapped to ground decorations parts and their properties
WaterMill:dofile(_scriptFolder .. "/decoration.lua", WaterMillPrefix)

WaterMill:registerAsset({
    Id = WaterMillPrefix .. "_MONUMENT",
    DataType = "BUILDING",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    Name = WaterMillPrefix .. "_SET_NAME",
    Description = WaterMillPrefix .. "_SET_DESC",
    BuildingType = "RESOURCE_PRODUCTION",
    AssetMiniatureBuildingPart = WaterMillPrefix .. "_EXTENSION_LEFT_BANK_PART",
    AssetBuildingPartList = {},
    SubAssetBuildingList = {
		WaterMillPrefix .. "_FLOUR_RECIPE3",
		WaterMillPrefix .. "_FLOUR_RECIPE2",
		WaterMillPrefix .. "_TEXTILE_RECIPE3",
		WaterMillPrefix .. "_TEXTILE_RECIPE2",
		WaterMillPrefix .. "_PLANKS_RECIPE3",
		WaterMillPrefix .. "_PLANKS_RECIPE2",
    },
    MaterialSetList = {
            {
                SetName = WaterMillPrefix .. "_YELLOW_ROOF", -- default materials
                MaterialList = {
                    WaterMillPrefix .. "_YELLOW_ROOF_MATERIAL"
                }           
            },
            {
                SetName = WaterMillPrefix .. "_GREEN_ROOF",
                MaterialList = {
                    WaterMillPrefix .. "_GREEN_ROOF_MATERIAL"
                }           
            },
            {
                SetName = WaterMillPrefix .. "_BROWN_ROOF",
                MaterialList = {
                    WaterMillPrefix .. "_BROWN_ROOF_MATERIAL"
                }           
            },
            {
                SetName = WaterMillPrefix .. "_BLUE_ROOF",
                MaterialList = {
                    WaterMillPrefix .. "_BLUE_ROOF_MATERIAL"
                }           
            },
            {
                SetName = WaterMillPrefix .. "_RED_ROOF",
                MaterialList = {
                    WaterMillPrefix .. "_RED_ROOF_MATERIAL"
                }           
            },
            {
                SetName = WaterMillPrefix .. "_THATCHED_ROOF",
                MaterialList = {
                    WaterMillPrefix .. "_THATCHED_ROOF_MATERIAL"
                }           
            }

    },
    RequiredPartList = {
		-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
		{ Category = "CORE", Quantity = 1 },
		{ Category = "EXTENSION", Quantity = 1 }
    },
    IsEditable = true
})

function registerSubBuilding(_suffix, _buildingFunction, _assetBuildingPartList)
	WaterMill:registerAsset({
		DataType = "BUILDING",
		Id = WaterMillPrefix .. "_" .. _suffix,
		Name = _buildingFunction .. "_NAME",
		Description = _buildingFunction .. "_DESC",
		BuildingType = BUILDING_TYPE.MONUMENT,
		AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
		AssetBuildingPartList = _assetBuildingPartList,
		RequiredPartList = {
			-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
			{ Category = "CORE", Min = 1 },
			{ Category = "EXTENSION", Min = 1 },
		},
		AssetBuildingFunction = _buildingFunction,
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
end

-- Register the mithril factory mining sub-buildings
    local _AssetBuildingPartListFlour = {
		WaterMillPrefix .. "_CORE_FLOUR_PART",
		WaterMillPrefix .. "_EXTENSION_LEFT_BANK_PART",
		WaterMillPrefix .. "_EXTENSION_RIGHT_BANK_PART",
		WaterMillPrefix .. "_SMALL_BOAT_PART",
		WaterMillPrefix .. "_SACS_PART",
    }
    local _AssetBuildingPartListTextile = {
		WaterMillPrefix .. "_CORE_TEXTILE_PART",
		WaterMillPrefix .. "_EXTENSION_LEFT_BANK_PART",
		WaterMillPrefix .. "_EXTENSION_RIGHT_BANK_PART",
		WaterMillPrefix .. "_SMALL_BOAT_PART",
    }
    local _AssetBuildingPartListPlanks = {
		WaterMillPrefix .. "_CORE_PLANKS_PART",
		WaterMillPrefix .. "_EXTENSION_LEFT_BANK_PART",
		WaterMillPrefix .. "_EXTENSION_RIGHT_BANK_PART",
		WaterMillPrefix .. "_PLANKS_PART",
		WaterMillPrefix .. "_SMALL_BOAT_PART",
    }

registerSubBuilding("FLOUR_RECIPE1", WaterMillPrefix .. "_FUNCTION_FLOUR_WHEAT_FLOUR", _AssetBuildingPartListFlour)
registerSubBuilding("FLOUR_RECIPE2", WaterMillPrefix .. "_FUNCTION_FLOUR_RESOURCE_CORN_FLOUR", _AssetBuildingPartListFlour)
registerSubBuilding("FLOUR_RECIPE3", "BUILDING_FUNCTION_WINDMILL", _AssetBuildingPartListFlour)
registerSubBuilding("TEXTILE_RECIPE1", WaterMillPrefix .. "_FUNCTION_TEXTILE_WOOL_WOOLEN_CLOTH", _AssetBuildingPartListTextile)
registerSubBuilding("TEXTILE_RECIPE2", WaterMillPrefix .. "_FUNCTION_TEXTILE_RESOURCE_FLAX_WOOLEN_CLOTH", _AssetBuildingPartListTextile)
registerSubBuilding("TEXTILE_RECIPE3", "BUILDING_FUNCTION_WEAVER_HUT", _AssetBuildingPartListTextile)
registerSubBuilding("PLANKS_RECIPE1", WaterMillPrefix .. "_FUNCTION_PLANKS_WOOD_PLANK", _AssetBuildingPartListPlanks)
registerSubBuilding("PLANKS_RECIPE2", WaterMillPrefix .. "_FUNCTION_PLANKS_WOOD_RESOURCE_SHINGLE", _AssetBuildingPartListPlanks)
registerSubBuilding("PLANKS_RECIPE3", "BUILDING_FUNCTION_SAWMILL", _AssetBuildingPartListPlanks)
    
WaterMill:overrideAsset({
        Id = "TAXATION_FUNCTION_PRODUCTION_FLOUR",
        AssetBuildingList = {
            Action = "APPEND",
            WaterMillPrefix .. "_FLOUR_RECIPE2",
            WaterMillPrefix .. "_FLOUR_RECIPE3",
        },
})

--[[
WaterMill:registerAsset({
	DataType = "UNLOCKABLE",
	Id = WaterMillPrefix .. "_UNLOCKABLE",
	Name = WaterMillPrefix .. "_UNLOCKABLE_NAME",
	Description = WaterMillPrefix .. "_UNLOCKABLE_DESC",
	DataCost = {
		DataInfluenceCostList = {},
		ResourceCollection = {
			{ Resource = "GOLD_COINS", Quantity = 0 },
		}
	},
	PrerequisiteUnlockableList = {},
	ActionList = {
		{
			DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
			BuildingProgressData = {
				AssetBuildingList = {
					WaterMillPrefix .. "_MONUMENT",
				},
			},
		},
	},
})

-- Override default common progress tiers
WaterMill:overrideAsset({
	Id = "PROGRESS_TIER_COMMON_T1",
	UnlockableList = {
		Action = "APPEND",
		WaterMillPrefix .."_UNLOCKABLE",
	},
})
--]]

WaterMill:registerAsset({
    DataType = "EVENT",
    Id = WaterMillPrefix .. "_EVENT_START",
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
                    WaterMillPrefix .. "_MONUMENT",
                },
            },
        }
    }
})

WaterMill:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        WaterMillPrefix .. "_EVENT_START",
    }
})
