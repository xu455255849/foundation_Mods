local SaltMarshes = ...

SaltMarshes:registerAsset({
    DataType = "BUILDING",
    Id = SaltMarshesPrefix,
    Name = SaltMarshesPrefix .. "_NAME",
    Description = SaltMarshesPrefix .. "_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = SaltMarshesPrefix .. "_PART"
})

-- Register common prefab nodes
SaltMarshes:registerAssetId("models/saltmarshes.fbx/Prefab/saltmarshesPart", SaltMarshesPrefix .. "_PREFAB")

-- Register the saltner part
SaltMarshes:registerAsset({
	DataType = "BUILDING_PART",
	Id = SaltMarshesPrefix .. "_PART",
        BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {11, 15}, { 0, -4} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } },
            { Polygon = polygon.createRectangle( {11, 4}, { 0, 1} ),
              Type = { DEFAULT = false, GROUND_CONSTRAINT = true, GRASS_CLEAR = false } }
        }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = SaltMarshesPrefix .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*1 }
		}}
	},
	AssetBuildingFunction = SaltMarshesPrefix .. "_FUNCTION"
})

SaltMarshes:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = SaltMarshesPrefix .. "_FUNCTION",
		WorkerCapacity = 1,
                RelatedJob = { Job = SaltPrefix .. "_SALT_WORKER", Behavior = "BEHAVIOR_WORK" },
                ResourceProduced = {
			{ Resource = CommonResourceSalt, Quantity = 1 }
                }
})

SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {11, 7}
})


SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/marais1/sol", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {11, 11}
})

-- Register grounding components
SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/marais1", {
	DataType = "COMP_GROUNDED"
})
SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/cabane", {
	DataType = "COMP_GROUNDED"
})
SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/fleur", {
	DataType = "COMP_GROUNDED"
})
SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/grosSel1", {
	DataType = "COMP_GROUNDED"
})
SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/grosSel2", {
	DataType = "COMP_GROUNDED"
})

-- Register air vent particle system (water)

SaltMarshes:registerAssetId("models/saltmarshes.fbx/Prefab/saltmarshesPart/marais1/WaterEmitter1", SaltMarshesPrefix .. "_WATER_EMITTER_PREFAB")

SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
                 { SaltMarshesPrefix .. "_WATER_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/marais1/WaterEmitter1", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = SaltMarshesPrefix .. "_WATER_PARTICLE_SYSTEM",
	IsPlaying = true,
	IsEmitting = false
})

SaltMarshes:registerPrefabComponent("models/saltmarshes.fbx/Prefab/saltmarshesPart/marais1/WaterEmitter1", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})

SaltMarshes:registerAsset({
    DataType = "EVENT",
    Id = SaltMarshesPrefix .. "_EVENT_START",
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
                    SaltMarshesPrefix,
                },
            },
        }
    }
})

SaltMarshes:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        SaltMarshesPrefix .. "_EVENT_START",
    }
})