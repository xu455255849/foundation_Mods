local coveredBridge = ...

coveredBridge:registerEnumValue ("ATTACH_NODE_TYPE", "GATETOWER")

-- Register IDs for all prefab nodes referenced here
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Prefab/coveredBridge/CenterCoveragePart", CoveredBridgePrefix .. "_CENTER_COVERAGE_PREFAB")
coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeDecoration.fbx/Prefab/coveredBridge/StartEndCoveragePart", CoveredBridgePrefix .. "_START_END_COVERAGE_PREFAB")

function registerGateBuilding(_nameFbx, _nameAsset, _buildingZone)
    coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/" .. _nameFbx .. "/step_0_RootPart", CoveredBridgePrefix .. "_" .. _nameAsset .. "_ROOT_PREFAB")
    coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/" .. _nameFbx .. "/step_3_TopPart", CoveredBridgePrefix .. "_" .. _nameAsset .. "_TOP_PREFAB")
    coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/" .. _nameFbx .. "/step_2_Tiling2Part", CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING2_PREFAB")
    coveredBridge:registerAssetId(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/" .. _nameFbx .. "/step_1_Tiling3Part", CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING3_PREFAB")

    -- Create default building part registering function 
    function registerDefaultBuildingPart(_nodePrefix)
	  coveredBridge:registerAsset({
	      DataType = "BUILDING_PART",
		Id = _nodePrefix .. "_PART",
            Name = _nodePrefix .. "_NAME",
		ConstructorData = {
                    DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
                    CoreObjectPrefab = _nodePrefix .. "_PREFAB"
            },
--[[ set to no costs as a workaround
-- waiting the builders can go across sub-buildings over water
	      Cost = {
		    UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*1 }
		    },
		    ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "STONE", Quantity = _NoSandbox*2 }
		    }}
	      },
--]]
	      EstateSplendor = {
		    { Estate = "KINGDOM", Quantity = 0.1 }
	      }
	  })
    end

    local defaultNodePrefixList = {
	  CoveredBridgePrefix .. "_" .. _nameAsset .. "_TOP",
	  CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING2",
	  CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING3"}

    -- Register simple building part assets
    for i, nodePrefix in ipairs(defaultNodePrefixList) do
	  registerDefaultBuildingPart(nodePrefix)
    end

    -- Register the stone watch tower (gate) part
    coveredBridge:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = CoveredBridgePrefix .. "_" .. _nameAsset .. "_ROOT_PART",
	  Name = CoveredBridgePrefix .. "_" .. _nameAsset .. "_ROOT_NAME",
	  Description = CoveredBridgePrefix .. "_" .. _nameAsset .. "_ROOT_DESC",
	  Category = "CORE",
        BuildingZone = _buildingZone,
        ConstructorData = {
	      DataType = "BUILDING_CONSTRUCTOR_SCALER", -- Since there are different types of building constructor, 'DataType' is necessary here
		CoreObjectPrefab = CoveredBridgePrefix .. "_" .. _nameAsset .. "_ROOT_PREFAB",
		EndPart = CoveredBridgePrefix .. "_" .. _nameAsset .. "_TOP_PART",
		FillerList = {
			CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING2_PART"
            },
		BasementFillerList = {
			CoveredBridgePrefix .. "_" .. _nameAsset .. "_TILING3_PART"
         	},
		MinimumScale = 0,
		IsVertical = true,
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
			{ Resource = "STONE", Quantity = _NoSandbox*2 }
		}}
	  },
--]]
	  EstateSplendor = {
		{ Estate = "KINGDOM", Quantity = 1 }
	  },
    })
end

registerGateBuilding("Gate", "GATE", _GateBuildingZone)
registerGateBuilding("GateTower", "GATE_TOWER", _GateTowerBuildingZone)

coveredBridge:registerPrefabComponent(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/GateTower/step_0_RootPart", {
        DataType = "COMP_BUILDING_PART",
        BuildingPartType = "GATETOWER"
})
coveredBridge:registerPrefabComponent(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/GateTower/step_0_RootPart/Attach_Minor_GateTower_DisableBasement_4", {
	    DataType = "COMP_BUILDING_ATTACH_NODE",
	    AttachNodeTypeList = { "GATETOWER" },
})
--[[
coveredBridge:registerPrefabComponent(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/Gate/step_0_RootPart", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MINOR" -- Snaps the decoration only on minor attach nodes
})
--]]
--[[
coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_ASSIGNABLE",
            Id = CoveredBridgePrefix .. "_ASSIGNABLE_SOLDIER_FUNCTION",
            AuthorizedFunctionList = CoveredBridgePrefix .. "_SOLDIER_FUNCTION_LIST"
})
coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_LIST",
            Id = CoveredBridgePrefix .. "_SOLDIER_FUNCTION_LIST",
            AssetFunctionList = {
                CoveredBridgePrefix .. "_GATE_FUNCTION2"
            }
})
--]]
coveredBridge:registerAsset({
        DataType = "BUILDING_FUNCTION_TRAINING_GROUND",
        Id = CoveredBridgePrefix .. "_GATE_FUNCTION",
        Name = CoveredBridgePrefix .. "_GATE_FUNCTION_NAME",
        WorkerCapacity = 1,
        RelatedJob = { Job = "SOLDIER", Behavior = "BEHAVIOR_SOLDIER" },
        TrainingBehaviorList = { "BEHAVIOR_SOLDIER_TRAINING", CoveredBridgePrefix .. "_BEHAVIOR_TREE" },
        VillagerProfile = "PROFILE_SOLDIER"
})
--[[
if _flagSecurity then
    coveredBridge:registerAsset({
        DataType = "BUILDING_FUNCTION_WORKPLACE",
        Id = CoveredBridgePrefix .. "_BUILDING_FUNCTION_SECURITY_GUARD_TOWER2",
        Name = "BUILDING_FUNCTION_SECURITY_GUARD_TOWER2_NAME",
        WorkerCapacity = 1,
        RelatedJob = { 
            Job = "JOB_SECURITY_GUARD_TOWER", 
            Behavior = CoveredBridgePrefix .. "_BEHAVIOR_TREE"
        },
        InputInventoryCapacity = {
	    },
        ResourceListNeeded = {
	    },
        ResourceProduced = {
            { Resource = "RESOURCE_REPORT", Quantity = 2 },
        }
    })
    coveredBridge:overrideAsset({
		DataType = "BUILDING_FUNCTION_LIST",
            Id = CoveredBridgePrefix .. "_SOLDIER_FUNCTION_LIST",
            AssetFunctionList = {
                        Action = "APPEND",
                        CoveredBridgePrefix .. "_BUILDING_FUNCTION_SECURITY_GUARD_TOWER2"
            }
    })
end
if _flagSecurity2 then
    -- Security generator
    function AttachSecurityGenerator(prefab, base, worker)
        coveredBridge:registerPrefabComponent(prefab, {
            DataType = "COMP_SECURITY_POINTS",
            BasePoints = base,
            WorkerPoints = worker
        })
        coveredBridge:registerPrefabComponent(prefab, {
            -- DataType = "COMP_SECURITY_OVERLAY"
            DataType = "COMP_SECURITY_OVERLAY_INIT"
        })
    end

    AttachSecurityGenerator(CoveredBridgePrefix .. "_GATE_TOP_PREFAB", 4, 2)

    coveredBridge:registerAsset({
        DataType = "BUILDING_FUNCTION_WORKPLACE",
        Id = CoveredBridgePrefix .. "_BUILDING_FUNCTION_SECURITY_GUARD2",
	  Name = "BUILDING_FUNCTION_SECURITY_GUARD_NAME",
        WorkerCapacity = 1,
        RelatedJob = { 
            Job = "JOB_SECURITY_GUARD", 
            Behavior = CoveredBridgePrefix .. "_BEHAVIOR_TREE"
	  },
	  InputInventoryCapacity = {
	  },
        ResourceListNeeded = {
	  },
	  ResourceProduced = {
		{ Resource = "RESOURCE_SECURITY", Quantity = 0 },
	  }
    })
    coveredBridge:overrideAsset({
		DataType = "BUILDING_FUNCTION_LIST",
            Id = CoveredBridgePrefix .. "_SOLDIER_FUNCTION_LIST",
            AssetFunctionList = {
                        Action = "APPEND",
                        CoveredBridgePrefix .. "_BUILDING_FUNCTION_SECURITY_GUARD2"
            }
    })
end
--]]

