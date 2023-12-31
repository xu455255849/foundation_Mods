local coveredBridge = ...

-- Register the center coverage decoration part
coveredBridge:registerAsset({
	DataType = "BUILDING_PART",
	Id = CoveredBridgePrefix .. "_CENTER_COVERAGE_PART",
	Name = CoveredBridgePrefix .. "_CENTER_COVERAGE_NAME",
	Description = CoveredBridgePrefix .. "_CENTER_COVERAGE_DESC",
	Category = "DECORATION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = CoveredBridgePrefix .. "_CENTER_COVERAGE_PREFAB",
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
			{ Resource = "PLANK", Quantity = _NoSandbox*5 }
		}}
	}
--]]
})

-- Register the start or end coverage decoration part
coveredBridge:registerAsset({
	DataType = "BUILDING_PART",
	Id = CoveredBridgePrefix .. "_START_END_COVERAGE_PART",
	Name = CoveredBridgePrefix .. "_START_END_COVERAGE_NAME",
	Description = CoveredBridgePrefix .. "_START_END_COVERAGE_DESC",
	Category = "DECORATION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = CoveredBridgePrefix .. "_START_END_COVERAGE_PREFAB",
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
			{ Resource = "PLANK", Quantity = _NoSandbox*2 }
		}}
	}
--]]
})

--------------------------------------------------------------------------

-- Override building part components properties (generated by the building asset processor) to add building zones
--[[
coveredBridge:registerPrefabComponent(_modelsFolder .. "/coveredBridgeDecoration.fbx/Prefab/coveredBridge/CenterCoveragePart", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MINOR" -- Snaps the decoration only on minor attach nodes
})

coveredBridge:registerPrefabComponent(_modelsFolder .. "/coveredBridgeDecoration.fbx/Prefab/coveredBridge/StartEndCoveragePart", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MINOR" -- Snaps the decoration only on minor attach nodes
})
--]]
