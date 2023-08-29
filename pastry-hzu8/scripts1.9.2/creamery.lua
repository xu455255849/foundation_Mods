local creamery = ...

-- Apply building asset processor
creamery:registerAssetProcessor("models/creamery.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

registerSubBuilding("CREAMERY", _PastryPrefix .. "_CREAMERY_FUNCTION", { _PastryPrefix .. "_CREAMERY_PART" })

creamery:registerAssetId("models/creamery.fbx/Prefab/creameryPart", _PastryPrefix .. "_CREAMERY_PREFAB")

creamery:registerAsset({
	DataType = "BUILDING_PART",
	Id = _PastryPrefix .. "_CREAMERY_PART",
	Description = _PastryPrefix .. "_CREAMERY_DESC",
      BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 6} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
      }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = _PastryPrefix .. "_CREAMERY_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{
			{ Resource = "WOOD", Quantity = _NoSandbox*10 }
		}}
	},
})

creamery:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
            Id = _PastryPrefix .. "_CREAMERY_FUNCTION",
            Name = _PastryPrefix .. "_CREAMERY_FUNCTION_NAME",
		WorkerCapacity = 2,
            RelatedJob = { Job = _PastryPrefix .. "_DAIRY_MAID", Behavior = "BEHAVIOR_WORK" },
            InputInventoryCapacity = {
			{ Resource = "MILK", Quantity = 50 }
            },
            ResourceListNeeded = {
                	{ Resource = "MILK", Quantity = 3 }
            },
            ResourceProduced = {
			{ Resource =_CommonButter, Quantity = 1 }
            }
})

creamery:registerPrefabComponent("models/creamery.fbx/Prefab/creameryPart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {4, 6}
})

creamery:registerAssetId("models/creamery.fbx/Prefab/creameryPart/step_0/cheminee/SmokeEmitter", _PastryPrefix .. "_CREAMERY_SMOKE_EMITTER_PREFAB")

creamery:registerPrefabComponent("models/creamery.fbx/Prefab/creameryPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
                 { _PastryPrefix .. "_CREAMERY_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

-- Register air vent particle system
creamery:registerPrefabComponent("models/creamery.fbx/Prefab/creameryPart/step_0/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = false
})

creamery:registerPrefabComponent("models/creamery.fbx/Prefab/creameryPart/step_0/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})
