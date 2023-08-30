local Saltworks = ...

Saltworks:registerAsset({
    DataType = "BUILDING",
    Id = SaltWorksPrefix,
    Name = SaltWorksPrefix .. "_NAME",
    Description = SaltWorksPrefix .. "_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = SaltWorksPrefix .. "_PART"
})

-- Register common prefab nodes
Saltworks:registerAssetId("models/saltworks.fbx/Prefab/saltworksPart", SaltWorksPrefix .. "_PREFAB")

-- Register the saltworks part
Saltworks:registerAsset({
	DataType = "BUILDING_PART",
	Id = SaltWorksPrefix .. "_PART",
        BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 6} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
        }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = SaltWorksPrefix .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 },
			{ Resource = "TOOL", Quantity = _NoSandbox*2 }
		}}
	},
	AssetBuildingFunction = SaltWorksPrefix .. "_FUNCTION"
})

Saltworks:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = SaltWorksPrefix .. "_FUNCTION",
		WorkerCapacity = 1,
                RelatedJob = { Job = SaltPrefix .. "_SALT_WORKER", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = CommonResourceBrine, Quantity = 50 },
			{ Resource = "WOOD", Quantity = 50 }
                },
                ResourceListNeeded = {
			{ Resource = CommonResourceBrine, Quantity = 3 },
                	{ Resource = "WOOD", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = CommonResourceSalt, Quantity = 1 }
                }
})

Saltworks:registerPrefabComponent("models/saltworks.fbx/Prefab/saltworksPart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {4, 6}
})

Saltworks:registerAssetId("models/saltworks.fbx/Prefab/saltworksPart/step_0/SmokeEmitter", SaltWorksPrefix .. "_SMOKE_EMITTER_PREFAB")

Saltworks:registerPrefabComponent("models/saltworks.fbx/Prefab/saltworksPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ SaltWorksPrefix .. "_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

-- Register particle system

Saltworks:registerPrefabComponent("models/saltworks.fbx/Prefab/saltworksPart/step_0/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = false
})

Saltworks:registerPrefabComponent("models/saltworks.fbx/Prefab/saltworksPart/step_0/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})


Saltworks:registerAsset({
    DataType = "EVENT",
    Id = SaltWorksPrefix .. "_EVENT_START",
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
                    SaltWorksPrefix,
                },
            },
        }
    }
})

Saltworks:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        SaltWorksPrefix .. "_EVENT_START",
    }
})