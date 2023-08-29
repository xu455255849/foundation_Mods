local MarketAddition= ...

-- Apply building asset processor
MarketAddition:registerAssetProcessor("models/hatmaker.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
MarketAddition:registerAssetProcessor("models/knifegrinder.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

_StallBuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 2}, {0, -1} ),
              Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true } }
}}
MarketAddition:registerEnumValue ("BUILDING_PART_TYPE", "EXTENSION")

-- Register model for stocking asset
MarketAddition:registerAssetId("models/crate.fbx/Prefab/crate", MarketAdditionPrefix .. "_CRATE")
MarketAddition:dofile(_scriptFolder .. "/hatmaker.lua")
MarketAddition:dofile(_scriptFolder .. "/knifegrinder.lua")

MarketAddition:registerAssetId("models/hatmaker.fbx/Materials/woodenRoof", MarketAdditionPrefix .. "_WOODEN_ROOF_MATERIAL")
MarketAddition:registerAssetId("models/hatmaker.fbx/Materials/woodenRoofFront", MarketAdditionPrefix .. "_WOODEN_ROOF_FRONT_MATERIAL")
MarketAddition:registerAssetId("models/hatmaker.fbx/Materials/thatchedRoof", MarketAdditionPrefix .. "_THATCHED_ROOF_MATERIAL")
MarketAddition:registerAssetId("models/hatmaker.fbx/Materials/thatchedRoofFront", MarketAdditionPrefix .. "_THATCHED_ROOF_FRONT_MATERIAL")
MarketAddition:overrideAsset({
    Id = MarketAdditionPrefix .. "_THATCHED_ROOF_FRONT_MATERIAL",
    BackFaceVisible = true
})
MarketAddition:overrideAsset({
    Id = "MONUMENT_MARKET",
    SubAssetBuildingList = 
    {
                Action = "APPEND",
                MarketAdditionPrefix .. "_HAT_WORKSHOP",
                MarketAdditionPrefix .. "_KNIFE_GRINDER",
    }, 
    AssetBuildingPartList = {
                Action = "APPEND",
                MarketAdditionPrefix .. "_ROOF_CORNER_PART",
                MarketAdditionPrefix .. "_ROOF_ENTRANCE_PART",
    },
    MaterialSetList = {
            {
                SetName = MarketAdditionPrefix .. "_WOODEN_ROOF", -- default materials
                MaterialList = {
                    MarketAdditionPrefix .. "_WOODEN_ROOF_MATERIAL",
                    MarketAdditionPrefix .. "_WOODEN_ROOF_FRONT_MATERIAL",
                }           
            },
            {
                SetName = MarketAdditionPrefix .. "_THATCHED_ROOF",
                MaterialList = {
                    MarketAdditionPrefix .. "_THATCHED_ROOF_MATERIAL",
                    MarketAdditionPrefix .. "_THATCHED_ROOF_FRONT_MATERIAL",
                }           
            }
    }
})

MarketAddition:overrideAsset({
    Id = "BUILDING_MARKET_STALL_COURT",
    AssetBuildingPartList = {
                Action = "APPEND",
                MarketAdditionPrefix .. "_ROOF_CENTER_PART",
    },
})


MarketAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_MARKET",
                Id = MarketAdditionPrefix .. "_HATMAKER_FUNCTION",
                TypeList = { "GOODS" },
                IsOverrideCapacity = true,
                CapacityPerSlot = 10,
                HasResourceDepot = false,
		WorkerCapacity = 1,                
                RelatedJob = { Job = MarketAdditionPrefix .. "_HATMAKER", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = "WOOLEN_CLOTH", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "WOOLEN_CLOTH", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = MarketAdditionPrefix .. "_HAT", Quantity = 1 }
                }
})

MarketAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_MARKET",
                Id = MarketAdditionPrefix .. "_KNIFEGRINDER_FUNCTION",
                TypeList = { "GOODS" },
                IsOverrideCapacity = true,
                CapacityPerSlot = 10,
                HasResourceDepot = false,
		WorkerCapacity = 1,
                RelatedJob = { Job = MarketAdditionPrefix .. "_KNIFEGRINDER", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = "TOOL", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "TOOL", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = MarketAdditionPrefix .. "_KNIFE", Quantity = 1 }
                }
})

function registerMarketPart( _namePrefab, _nameAsset, _nameFunction)
    -- Register prefab nodes (currently only one core model)
    MarketAddition:registerAssetId("models/" .. _namePrefab .. "Part", MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB")

    -- Register the building part
    MarketAddition:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PART",
	  Name = MarketAdditionPrefix .. "_" .. _nameAsset .. "_NAME",
	  Description = MarketAdditionPrefix .. "_" .. _nameAsset .. "_DESC",
	  Category = _marketCategory, -- global parameter
        BuildingZone = _StallBuildingZone,
	  ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB"
	  },
	  Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*1 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 }
		}}
	  },
        AssetBuildingFunction = _nameFunction
    })

    -- Register grounding components
    MarketAddition:registerPrefabComponent("models/" .. _namePrefab .. "Part", {
        DataType = "COMP_GROUNDED"
    })
end

registerMarketPart( "hatmaker.fbx/Prefab/marketAddition/hatStall", "HAT_STALL", "BUILDING_FUNCTION_GOODS_MARKET")
registerMarketPart( "hatmaker.fbx/Prefab/marketAddition/hatWorkshop", "HAT_WORKSHOP", MarketAdditionPrefix .. "_HATMAKER_FUNCTION")
registerMarketPart( "knifegrinder.fbx/Prefab/marketAddition/knifeGrinder", "KNIFE_GRINDER", MarketAdditionPrefix .. "_KNIFEGRINDER_FUNCTION")

function registerSubBuilding(_suffix, _signPart)
    MarketAddition:registerAsset({
        DataType = "BUILDING",
	  Id = MarketAdditionPrefix .. "_" .. _suffix,
	  Name = MarketAdditionPrefix .. "_" .. _suffix .. "_NAME",
	  Description = MarketAdditionPrefix .. "_" .. _suffix .. "_DESC",
	  BuildingType = BUILDING_TYPE.MONUMENT,
	  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	  AssetBuildingPartList = {
            MarketAdditionPrefix .. "_" .. _suffix .. "_PART",
            MarketAdditionPrefix .. "_" .. _signPart .. "_PART",
            MarketAdditionPrefix .. "_ROOF_CENTER_PART",
        },
	  RequiredPartList = {
			-- Necessarily a list of 'MONUMENT_REQUIRED_PART_PAIR', no need to specify the DataType of each element of the list
			{ Category = _marketCategory, Min = 1 },
	  },
--	  AssetBuildingFunction = _buildingFunction,
	  IsManuallyUnlocked = false,
	  IsDestructible = true,
	  IsEditable = false,
	  IsClearTrees = true,
    })
end
function registerSubBuildingAddPart(_suffix, _signPart)
    MarketAddition:overrideAsset({
	  Id = MarketAdditionPrefix .. "_" .. _suffix,
	  AssetBuildingPartList = {
            Action = "APPEND",
            MarketAdditionPrefix .. "_" .. _signPart .. "_PART",
        },
    })
end

registerSubBuilding( "HAT_WORKSHOP", "HAT_SIGN")
registerSubBuildingAddPart( "HAT_WORKSHOP", "HAT_STALL")
registerSubBuilding( "KNIFE_GRINDER", "KNIFE_GRINDER_SIGN")

MarketAddition:registerAssetId("models/knifegrinder.fbx/Prefab/marketAddition/knifeGrinderPart/step_2_B_makg/meule_makg/SmokeEmitter_makg", MarketAdditionPrefix .. "_KNIFEGRINDER_SMOKE_EMITTER_PREFAB")

MarketAddition:registerPrefabComponent("models/knifegrinder.fbx/Prefab/marketAddition/knifeGrinderPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ MarketAdditionPrefix .. "_KNIFEGRINDER_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

-- Register particle system

MarketAddition:registerPrefabComponent("models/knifegrinder.fbx/Prefab/marketAddition/knifeGrinderPart/step_2_B_makg/meule_makg/SmokeEmitter_makg", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_BLACKSMITH_GRIND",
	IsPlaying = true,
	IsEmitting = false
})

MarketAddition:registerPrefabComponent("models/knifegrinder.fbx/Prefab/marketAddition/knifeGrinderPart/step_2_B_makg/meule_makg/SmokeEmitter_makg", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})


function registerRoofPart( _namePrefab, _nameAsset)
    -- Register prefab nodes (currently only one core model)
    MarketAddition:registerAssetId("models/" .. _namePrefab .. "Part", MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB")

    -- Register the roof part
    MarketAddition:registerAsset({
	DataType = "BUILDING_PART",
	Id = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PART",
	Name = MarketAdditionPrefix .. "_" .. _nameAsset .. "_NAME",
	Description = MarketAdditionPrefix .. "_" .. _nameAsset .. "_DESC",
	Category = "EXTENSION",
        BuildingZone = _StallBuildingZone,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = 0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 }
		}}
	}
    })
end

registerRoofPart( "hatmaker.fbx/Prefab/marketAddition/roofCenter", "ROOF_CENTER")
registerRoofPart( "hatmaker.fbx/Prefab/marketAddition/roofCorner", "ROOF_CORNER")

MarketAddition:overrideAsset({
    Id = MarketAdditionPrefix .. "_ROOF_CENTER_PART",
    AssetBuildingFunction = MarketAdditionPrefix .. "_UP_DEPOT_TO_50_FUNCTION",
})
MarketAddition:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = MarketAdditionPrefix .. "_UP_DEPOT_TO_50_FUNCTION",
    GameRuleModifierList = {
        { 
            DataType = "GAME_RULE_MODIFIER_RESOURCE_DEPOT_CAPACITY",
            CapacityQuantity = 40,
        },
    },
})
MarketAddition:overrideAsset({
    Id = "BUILDING_PART_MARKET_BLUE_TENT",
    AssetBuildingFunction = "FLAVIUS_UP_DEPOT_TO_30_FUNCTION",
})
MarketAddition:overrideAsset({
    Id = "BUILDING_PART_MARKET_GREEN_TENT",
    AssetBuildingFunction = "FLAVIUS_UP_DEPOT_TO_30_FUNCTION",
})
MarketAddition:overrideAsset({
    Id = "BUILDING_PART_MARKET_RED_TENT",
    AssetBuildingFunction = "FLAVIUS_UP_DEPOT_TO_30_FUNCTION",
})
MarketAddition:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = "FLAVIUS_UP_DEPOT_TO_30_FUNCTION",
    GameRuleModifierList = {
        { 
            DataType = "GAME_RULE_MODIFIER_RESOURCE_DEPOT_CAPACITY",
            CapacityQuantity = 30,
        },
    },
})
function registerEntrancePart( _namePrefab, _nameAsset)
    -- Register prefab nodes (currently only one core model)
    MarketAddition:registerAssetId("models/" .. _namePrefab .. "Part", MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB")

    -- Register the entrance part
    MarketAddition:registerAsset({
	DataType = "BUILDING_PART",
	Id = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PART",
	Name = MarketAdditionPrefix .. "_" .. _nameAsset .. "_NAME",
	Description = MarketAdditionPrefix .. "_" .. _nameAsset .. "_DESC",
	Category = "EXTENSION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = MarketAdditionPrefix .. "_" .. _nameAsset .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = 0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*3 }
		}}
	}
    })
end

registerEntrancePart( "hatmaker.fbx/Prefab/marketAddition/roofEntrance", "ROOF_ENTRANCE")
registerEntrancePart( "hatmaker.fbx/Prefab/marketAddition/hatSign", "HAT_SIGN")
registerEntrancePart( "knifegrinder.fbx/Prefab/marketAddition/knifeGrinderSign", "KNIFE_GRINDER_SIGN")


