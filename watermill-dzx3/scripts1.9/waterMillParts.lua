local WaterMill = ...

-- Apply building asset processor
WaterMill:registerAssetProcessor("models/waterMill.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitJaune", WaterMillPrefix .. "_YELLOW_ROOF_MATERIAL")
WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitVert", WaterMillPrefix .. "_GREEN_ROOF_MATERIAL")
WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitBrun", WaterMillPrefix .. "_BROWN_ROOF_MATERIAL")
WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitBleu", WaterMillPrefix .. "_BLUE_ROOF_MATERIAL")
WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitRouge", WaterMillPrefix .. "_RED_ROOF_MATERIAL")
WaterMill:registerAssetId("models/waterMill.fbx/Materials/toitChaume", WaterMillPrefix .. "_THATCHED_ROOF_MATERIAL")

function registerMill(_nameFbx, _nameAsset, _nameJob, _nameResource, _nameProduction) 
    -- Register core prefab nodes
    WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/Core" .. _nameFbx .. "Part", WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_PREFAB")

    -- Register the water mill Core part
    WaterMill:registerAsset({
	DataType = "BUILDING_PART",
	Id = WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_PART",
	Name = WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_NAME",
	Description = WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_DESC",
	Category = "CORE",
	BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 8} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
        }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*2 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 }
		}}
	},
    })

    -- Register grass clearing components
    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Core" .. _nameFbx .. "Part", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {4, 8}
    })

    -- Register particle system
    WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/Core" .. _nameFbx .. "Part/step_0/SmokeEmitter", WaterMillPrefix .. "_CORE_" .. _nameAsset .. "_SMOKE_EMITTER_PREFAB")

    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Core" .. _nameFbx .. "Part/step_0/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = false
    })

    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Core" .. _nameFbx .. "Part/step_0/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false,
    })
end

registerMill( "Flour", "FLOUR", "MILLER", "WHEAT", "FLOUR")
registerMill( "Textile", "TEXTILE", "WEAVER", "WOOL", "WOOLEN_CLOTH")
registerMill( "Planks", "PLANKS", "CARPENTER", "WOOD", "PLANK")

function registerWorkplace(_nameAsset, _nameJob, _nameResource, _nameProduction)
    WaterMill:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = WaterMillPrefix .. "_FUNCTION_" .. _nameAsset .. "_" .. _nameResource .. "_" .. _nameProduction,
                Name = WaterMillPrefix .. "_FUNCTION_" .. _nameAsset .. "_" .. _nameResource .. "_" .. _nameProduction .. "_NAME",
		WorkerCapacity = 2,
                RelatedJob = { Job = _nameJob, Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = _nameResource, Quantity = 10 }
                },
                ResourceListNeeded = {
			{ Resource = _nameResource, Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = _nameProduction, Quantity = 1 }
                }
    })
end

registerWorkplace( "FLOUR", "MILLER", "WHEAT", "FLOUR")
registerWorkplace( "FLOUR", "MILLER", "RESOURCE_CORN", "FLOUR")
registerWorkplace( "TEXTILE", "WEAVER", "WOOL", "WOOLEN_CLOTH")
registerWorkplace( "TEXTILE", "WEAVER", "RESOURCE_FLAX", "WOOLEN_CLOTH")
registerWorkplace( "PLANKS", "CARPENTER", "WOOD", "PLANK")
registerWorkplace( "PLANKS", "CARPENTER", "WOOD", "RESOURCE_SHINGLE")

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CoreFlourPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ WaterMillPrefix .. "_CORE_FLOUR_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CoreTextilePart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ WaterMillPrefix .. "_CORE_TEXTILE_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSmokeEmitter", WaterMillPrefix .. "_CORE_PLANKS_SAW_SMOKE_EMITTER_PREFAB")

WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSparkEmitter", WaterMillPrefix .. "_CORE_PLANKS_SAW_SPARK_EMITTER_PREFAB")


WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ WaterMillPrefix .. "_CORE_PLANKS_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" },
		{ WaterMillPrefix .. "_CORE_PLANKS_SAW_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" },
		{ WaterMillPrefix .. "_CORE_PLANKS_SAW_SPARK_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SAWMILL_SMOKE",
	IsPlaying = true,
	IsEmitting = false
})

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false,
})

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSparkEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SAWMILL_SPARK",
	IsPlaying = true,
	IsEmitting = false
})

WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/CorePlanksPart/step_0/SawSparkEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false,
})

-- Components
WaterMill:dofile(_scriptFolder .. "/compCheckWheel.lua")
WaterMill:dofile(_scriptFolder .. "/compWheel.lua")
    
function registerWheel(_nameFbx, _nameAsset)
    -- Register extension wheel prefab nodes
    WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part", WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_PREFAB")
    WaterMill:registerAssetId("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part/step_8_roue", WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "WHEEL_PREFAB")

    -- Register the water mill Extension Wheel part
    WaterMill:registerAsset({
	DataType = "BUILDING_PART",
	Id = WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_PART",
	Name = WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_NAME",
	Description = WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_DESC",
	Category = "EXTENSION",
	BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 6} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
        }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_PREFAB",
                MiniatureConfig = {
                        DataType = "BUILDING_MINIATURE_CONFIG",
                        ClipUnderGround = false
                }
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 }
		}}
	}
    })

    -- Register air vent particle system (flow)
    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part/FlowEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = WaterMillPrefix .. "_FLOW_PARTICLE_SYSTEM",
	IsPlaying = true,
	IsEmitting = true
    })

    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part", {
	    DataType = "COMP_BUILDING_PART",
	    FeedbackComponentListToActivate = {
		{ WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "_PREFAB", WaterMillPrefix .. "_COMP_CHECK_WHEEL" },
		{ WaterMillPrefix .. "_EXTENSION_" .. _nameAsset .. "WHEEL_PREFAB", WaterMillPrefix .. "_COMP_WHEEL" }
	    }
    })

    -- Register check wheel component
    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part", {
	    DataType = WaterMillPrefix .. "_COMP_CHECK_WHEEL",
	    Enabled = true,
    })

    -- Register wheel component
    WaterMill:registerPrefabComponent("models/waterMill.fbx/Prefab/waterMill/Extension" .. _nameFbx .. "Part/step_8_roue", {
	    DataType = WaterMillPrefix .. "_COMP_WHEEL",
	    Enabled = false,
    })
end

registerWheel("LeftBank", "LEFT_BANK")
registerWheel("RightBank", "RIGHT_BANK")
