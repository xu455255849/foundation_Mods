local coveredBridge = ...
--[[
function registerAssignableFunction(_assetPrefix, _assetId)
    coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_LIST",
            Id = _assetPrefix .. "_" .. _assetId .. "_FUNCTION_LIST",
            AssetFunctionList = {
                        CoveredBridgePrefix .. "_TAILOR_FUNCTION",
                        "BUILDING_FUNCTION_FOOD_MARKET",
                        "BUILDING_FUNCTION_GOODS_MARKET",
                        "BUILDING_FUNCTION_LUXURY_MARKET",
                        registerFunctionHouse(_assetPrefix, _assetId, "1"),
                        registerFunctionHouse(_assetPrefix, _assetId, "2")
            }
    })
    coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_ASSIGNABLE",
            Id = _assetPrefix .. "_" .. _assetId .. "_ASSIGNABLE_FUNCTION",
            AuthorizedFunctionList = _assetPrefix .. "_" .. _assetId .. "_FUNCTION_LIST"
    })
    return _assetPrefix .. "_" .. _assetId .. "_ASSIGNABLE_FUNCTION"
end
coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_ASSIGNABLE",
            Id = CoveredBridgePrefix .. "_ASSIGNABLE_FUNCTION",
            AuthorizedFunctionList = CoveredBridgePrefix .. "_FUNCTION_LIST"
})

coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_LIST",
            Id = CoveredBridgePrefix .. "_FUNCTION_LIST",
            AssetFunctionList = {
                        CoveredBridgePrefix .. "_TAILOR_FUNCTION",
                        "BUILDING_FUNCTION_FOOD_MARKET",
                        "BUILDING_FUNCTION_GOODS_MARKET",
                        "BUILDING_FUNCTION_LUXURY_MARKET"
            }
})
--]]
coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_MARKET",
            Id = CoveredBridgePrefix .. "_TAILOR_FUNCTION",
            Name = CoveredBridgePrefix .. "_TAILOR_FUNCTION_NAME",
            TypeList = { "GOODS" },
            IsOverrideCapacity = true,
            CapacityPerSlot = 20,
		WorkerCapacity = 1,
            RelatedJob = { Job = "TAILOR", Behavior = "BEHAVIOR_WORK" },
            HasResourceDepot = false,
            InputInventoryCapacity = {
			{ Resource = "WOOLEN_CLOTH", Quantity = 20 }
            },
            ResourceListNeeded = {
			{ Resource = "WOOLEN_CLOTH", Quantity = 1 }
            },
            ResourceProduced = {
			{ Resource = "CLOTHES", Quantity = 1 }
            }
})

coveredBridge:dofile(_scriptFolder .. "/compCoveredBridge.lua")

-- Register the house decoration part
function registerHousePartFunction(_nameFbx, _namePart, _nameAsset, _capacity, _material, _level)
    if (_level=="1") or (_level=="2") then
        coveredBridge:registerAsset({
	      DataType = "BUILDING_PART",
	      Id = CoveredBridgePrefix .. "_HOUSING_LVL" .. _level .. "_" .. _nameAsset .. "_PART",
	      Name = CoveredBridgePrefix .. "_" .. _nameAsset .. "_NAME",
	      Description = CoveredBridgePrefix .. "_" .. _nameAsset .. "_DESC",
	      Category = "CORE",
	      ConstructorData = {
		    DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		    CoreObjectPrefab = CoveredBridgePrefix .. "_" .. _nameAsset .. "_PREFAB",
                MiniatureConfig = {
                        DataType = "BUILDING_MINIATURE_CONFIG",
                        ClipUnderGround = false
                }
	      },
--[[ set to no costs as a workaround
-- waiting the builders can go across sub-buildings over water
	      Cost = {
		    UpkeepCost = {
			  { Resource = "GOLD", Quantity = _NoSandbox*0 }
		    },
		    ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			  { Resource = _material, Quantity = _NoSandbox*5 }
		    }}
	      },
--]]
            VillagerCapacity = _capacity,
  	      AssetBuildingFunction = registerFunctionHouse(CoveredBridgePrefix, _nameAsset, _level), 
        })
    else
        coveredBridge:registerAsset({
	      DataType = "BUILDING_PART",
	      Id = CoveredBridgePrefix .. "_" .. _nameAsset .. "_PART",
	      Name = CoveredBridgePrefix .. "_" .. _nameAsset .. "_NAME",
	      Description = CoveredBridgePrefix .. "_" .. _nameAsset .. "_DESC",
	      Category = "CORE",
	      ConstructorData = {
		    DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		    CoreObjectPrefab = CoveredBridgePrefix .. "_" .. _nameAsset .. "_PREFAB",
                MiniatureConfig = {
                        DataType = "BUILDING_MINIATURE_CONFIG",
                        ClipUnderGround = false
                }
	      },
--[[ set to no costs as a workaround
-- waiting the builders can go across sub-buildings over water

	      Cost = {
		    UpkeepCost = {
			  { Resource = "GOLD", Quantity = _NoSandbox*0 }
		    },
		    ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			  { Resource = _material, Quantity = _NoSandbox*5 }
		    }}
	      },
--]]
            VillagerCapacity = _capacity,
        })
    end
end
function registerHouseParts(_nameFbx, _namePart, _nameAsset, _capacity, _material)
    coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbx .. ".fbx/Prefab/coveredBridge/" .. _namePart .. "Part", CoveredBridgePrefix .. "_" .. _nameAsset .. "_PREFAB")

    registerHousePartFunction(_nameFbx, _namePart, _nameAsset, _capacity, _material, "")
    registerHousePartFunction(_nameFbx, _namePart, _nameAsset, _capacity, _material, "1")
    registerHousePartFunction(_nameFbx, _namePart, _nameAsset, _capacity, _material, "2")
--[[
    coveredBridge:registerPrefabComponent(_modelsFolder .. "/" .. _nameFbx .. ".fbx/Prefab/coveredBridge/" .. _namePart .. "Part", {
	  DataType = "COMP_BUILDING_PART",
	  BuildingPartType = "MINOR" -- Snaps the decoration only on minor attach nodes
    })
--]]
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbx .. ".fbx/Prefab/coveredBridge/" .. _namePart .. "Part", { "BRIDGE" })

    coveredBridge:registerPrefabComponent(_modelsFolder .. "/" .. _nameFbx .. ".fbx/Prefab/coveredBridge/" .. _namePart .. "Part/PATH_A_0", {
	  DataType = CoveredBridgePrefix .. "_PATH_COMP",
	  Enabled = true,
        Direction = 1
    })
    coveredBridge:registerPrefabComponent(_modelsFolder .. "/" .. _nameFbx .. ".fbx/Prefab/coveredBridge/" .. _namePart .. "Part/PATH_B_0", {
	  DataType = CoveredBridgePrefix .. "_PATH_COMP",
	  Enabled = true,
        Direction = -1
    })
end
registerHouseParts("coveredBridgeDecoration", "House", "HOUSE", 1, "PLANK")
registerHouseParts("coveredBridgeDecoration", "Food", "RED", 1, "PLANK")
registerHouseParts("coveredBridgeDecoration", "Goods", "GREEN_A", 1, "PLANK")
registerHouseParts("coveredBridgeDecoration", "Luxury", "BLUE", 1, "PLANK")
registerHouseParts("coveredBridgeDecoration", "Tailor", "GREEN_B", 1, "PLANK")
registerHouseParts("coveredBridgeAddition", "Hat", "RED_WINE", 1, "PLANK")
registerHouseParts("coveredBridgeAddition", "Knife", "CARBON", 1, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseTower1", "HOUSE_TOWER1", 3, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseMiddle1", "HOUSE_MIDDLE1", 4, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseMiddle2", "HOUSE_MIDDLE2", 4, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseTower2", "HOUSE_TOWER2", 3, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseMiddle3", "HOUSE_MIDDLE3", 4, "PLANK")
registerHouseParts("coveredBridgeLargeHouse", "HouseTower3", "HOUSE_TOWER3", 3, "STONE")
registerHouseParts("coveredBridgeLargeHouse", "HouseMiddle4", "HOUSE_MIDDLE4", 4, "STONE")
