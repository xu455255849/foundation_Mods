local coveredBridge = ...

function registerBridge(_nameFbxFile, _option)
    -- Register IDs for all prefab nodes referenced here
    coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/CenterPart", CoveredBridgePrefix .. _option .. "_CENTER_PREFAB")
    coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/RootPart", CoveredBridgePrefix .. _option .. "_CENTER_ROOT_PREFAB")
    coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/TilingPart", CoveredBridgePrefix .. _option .. "_TILING_PREFAB")

    -- Register bridge tiling (the pillar part that extends to the ground)
    coveredBridge:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = CoveredBridgePrefix .. _option .. "_TILING_PART",
	  ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = CoveredBridgePrefix .. _option .. "_TILING_PREFAB"
	  },
	  Cost = {
		DataType = "BUILDING_PART_COST",
		ResourceNeededList = {{
			{ Resource = "STONE", Quantity = _NoSandbox*1 }
		}}
	  },
    })

    function registerExtremity(_nameFbx, _extremity, _upperAttachType, _lowerAttachType)
        coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/" .. _nameFbx .. "SlopePart", CoveredBridgePrefix .. _option .. "_SLOPE_" .. _extremity .. "_PREFAB")
        coveredBridge:registerAssetId(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/" .. _nameFbx .. "Part", CoveredBridgePrefix .. _option .. "_" .. _extremity .. "_PREFAB")

        -- Register bridge extremity part
        coveredBridge:registerAsset({
	      DataType = "BUILDING_PART",
	      Id = CoveredBridgePrefix .. _option .. "_" .. _extremity .. "_PART",
            Name = CoveredBridgePrefix .. _option .. "_" .. _extremity .. "_NAME",
            BuildingZone = _BridgeBuildingZone,
	      ConstructorData = {
		    DataType = "BUILDING_CONSTRUCTOR_SLOPE",
		    CoreObjectPrefab = CoveredBridgePrefix .. _option .. "_" .. _extremity .. "_PREFAB",
		    SlopePartList = {
			  CoveredBridgePrefix .. _option .. "_SLOPE_" .. _extremity .. "_PART"
		    },
		    CoreBasementPartList = {
			  CoveredBridgePrefix .. _option .. "_TILING_PART"
		    },
		    UpperAttachType = _upperAttachType,
		    LowerAttachType = _lowerAttachType
            },
	      Cost = {
		    DataType = "BUILDING_PART_COST",
		    ResourceNeededList = {{
			  { Resource = "STONE", Quantity = _NoSandbox*5 }
		    }}
	      }
        })

        -- Register bridge extremity slope part
        coveredBridge:registerAsset({
	      DataType = "BUILDING_PART",
	      Id = CoveredBridgePrefix .. _option .. "_SLOPE_" .. _extremity .. "_PART",
            Name = CoveredBridgePrefix .. _option .. "_SLOPE_" .. _extremity .. "_NAME",
            BuildingZone = _BridgeBuildingZone,
	      ConstructorData = {
		    DataType = "BUILDING_CONSTRUCTOR_BASEMENT",
		    CoreObjectPrefab = CoveredBridgePrefix .. _option .. "_SLOPE_" .. _extremity .. "_PREFAB",
		    FillerList = {
			  CoveredBridgePrefix .. _option .. "_TILING_PART"
		    }
	      },
	      Cost = {
		    DataType = "BUILDING_PART_COST",
		    ResourceNeededList = {{
			  { Resource = "STONE", Quantity = _NoSandbox*1 }
		    }}
	      }
        })
    end

    registerExtremity("Start", "START", ATTACH_NODE_TYPE.RIGHT, ATTACH_NODE_TYPE.LEFT)
    registerExtremity("End", "END", ATTACH_NODE_TYPE.LEFT, ATTACH_NODE_TYPE.RIGHT)

    -- Register bridge center top part
    coveredBridge:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = CoveredBridgePrefix .. _option .. "_CENTER_TOP_PART",
        Name = CoveredBridgePrefix .. _option .. "_CENTER_TOP_NAME",
        BuildingZone = _BridgeBuildingZone,
	  ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = CoveredBridgePrefix .. _option .. "_CENTER_PREFAB"
	  },
	  Cost = {
		DataType = "BUILDING_PART_COST",
		ResourceNeededList = {{
			{ Resource = "STONE", Quantity = _NoSandbox*5 },
			{ Resource = "PLANK", Quantity = _NoSandbox*1 }
		}}
	  }
    })

    -- Register the center root part (the scalable part that places multiple center top parts)
    coveredBridge:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = CoveredBridgePrefix .. _option .. "_CENTER_CORE_PART",
        Name = CoveredBridgePrefix .. _option .. "_CENTER_CORE_NAME",
        BuildingZone = _BridgeBuildingZone,
	  ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = CoveredBridgePrefix .. _option .. "_CENTER_ROOT_PREFAB",
		EndPart = CoveredBridgePrefix .. _option .. "_CENTER_TOP_PART",
		FillerList = {
			CoveredBridgePrefix .. _option .. "_TILING_PART"
		}	},
	  Cost = {
		DataType = "BUILDING_PART_COST",
		ResourceNeededList = {{
			{ Resource = "STONE", Quantity = _NoSandbox*2 }
		}}
	  }
    })

    -- Register the core part (the part with the bridge mover)
    coveredBridge:registerAsset({
	  DataType = "BUILDING_PART",
	  Id = CoveredBridgePrefix .. _option .. "_CORE_PART",
	  Name = CoveredBridgePrefix .. _option .. "_CORE_NAME",
	  ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_BRIDGE",
		StartPart = CoveredBridgePrefix .. _option .. "_START_PART",
		EndPart = CoveredBridgePrefix .. _option .. "_END_PART",
		FillerList = {
			CoveredBridgePrefix .. _option .. "_CENTER_CORE_PART"
		},
		MinimumScale = 1,
                MinimumHeightAboveGround = 0
	  },
	  AssetBuildingFunction = CoveredBridgePrefix .. _option .. "_FUNCTION"
    })
    coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_BRIDGE",
            Id = CoveredBridgePrefix .. _option .. "_FUNCTION"
    })

    -- Configure all BRIDGE colliders

    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/CenterPart", { "BRIDGE" })
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/StartPart", { "BRIDGE" })
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/EndPart", { "BRIDGE" })
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/StartSlopePart", { "BRIDGE" })
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/" .. _nameFbxFile .. ".fbx/Prefab/coveredBridge/EndSlopePart", { "BRIDGE" })
    coveredBridge:configurePrefabFlagList(_modelsFolder .. "/coveredBridgeGate.fbx/Prefab/coveredBridge/Gate/step_3_TopPart", { "PLATFORM" })
end

registerBridge("coveredBridge", "")
registerBridge("coveredBridgeLarge", "_LARGE")


