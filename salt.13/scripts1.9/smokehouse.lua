local SmokeHouse = ...

SmokeHouse:registerAssetId("models/smokehouse.fbx/Materials/carbonRoof", SmokeHousePrefix .. "_CARBON_ROOF_MATERIAL")
SmokeHouse:registerAssetId("models/smokehouse.fbx/Materials/brownRoof", SmokeHousePrefix .. "_BROWN_ROOF_MATERIAL")
SmokeHouse:registerAssetId("models/smokehouse.fbx/Materials/orangeRoof", SmokeHousePrefix .. "_ORANGE_ROOF_MATERIAL")

SmokeHouse:registerAsset({
    DataType = "BUILDING",
    Id = SmokeHousePrefix,
    Name = SmokeHousePrefix .. "_NAME",
    Description = SmokeHousePrefix .. "_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = { SmokeHousePrefix .. "_PART" },
    SubAssetBuildingList = {
		SmokeHousePrefix .. "_FISH",
		SmokeHousePrefix .. "_BOAR",
		SmokeHousePrefix .. "_CARCASS",
    },
    MaterialSetList = {
            {
                SetName = SmokeHousePrefix .. "_CARBON_ROOF", -- default materials
                MaterialList = {
                    SmokeHousePrefix .. "_CARBON_ROOF_MATERIAL"
                }           
            },
            {
                SetName = SmokeHousePrefix .. "_BROWN_ROOF",
                MaterialList = {
                    SmokeHousePrefix .. "_BROWN_ROOF_MATERIAL"
                }           
            },
            {
                SetName = SmokeHousePrefix .. "_ORANGE_ROOF",
                MaterialList = {
                    SmokeHousePrefix .. "_ORANGE_ROOF_MATERIAL"
                }           
            }
    }
})

function registerSubBuilding(_suffix, _buildingFunction)
	SmokeHouse:registerAsset({
		DataType = "BUILDING",
		Id = SmokeHousePrefix .. "_" .. _suffix,
		Name = _buildingFunction .. "_NAME",
		Description = _buildingFunction .. "_DESC",
		BuildingType = "FOOD_PRODUCTION",
            AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
            AssetBuildingPartList = {},
		AssetBuildingFunction = _buildingFunction,
		IsManuallyUnlocked = false,
		IsDestructible = true,
		IsEditable = false,
		IsClearTrees = true,
	})
end
registerSubBuilding("FISH", SmokeHousePrefix .. "_FISH_FUNCTION")
registerSubBuilding("BOAR", SmokeHousePrefix .. "_BOAR_FUNCTION")
registerSubBuilding("CARCASS", SmokeHousePrefix .. "_CARCASS_FUNCTION")

SmokeHouse:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = SmokeHousePrefix .. "_FISH_FUNCTION",
                Name = SmokeHousePrefix .. "_FISH_FUNCTION_NAME",
		WorkerCapacity = 1,
                RelatedJob = { Job = "FISHERMAN", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = "FISH", Quantity = 50 },
                	{ Resource = CommonResourceSalt, Quantity = 50 },
                	{ Resource = "WOOD", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "FISH", Quantity = 1 },
                	{ Resource = CommonResourceSalt, Quantity = 1 },
                	{ Resource = "WOOD", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = SmokeHousePrefix .. "_SALTING", Quantity = 1 }
                }
})

SmokeHouse:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = SmokeHousePrefix .. "_BOAR_FUNCTION",
                Name = SmokeHousePrefix .. "_BOAR_FUNCTION_NAME",
		WorkerCapacity = 1,
                RelatedJob = { Job = "HUNTER", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = "BOAR", Quantity = 50 },
                	{ Resource = CommonResourceSalt, Quantity = 50 },
                	{ Resource = "WOOD", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "BOAR", Quantity = 1 },
                	{ Resource = CommonResourceSalt, Quantity = 1 },
                	{ Resource = "WOOD", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = SmokeHousePrefix .. "_SALTING", Quantity = 1 }
                }
})

SmokeHouse:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = SmokeHousePrefix .. "_CARCASS_FUNCTION",
                Name = SmokeHousePrefix .. "_CARCASS_FUNCTION_NAME",
		WorkerCapacity = 1,
                RelatedJob = { Job = "SHEPHERD", Behavior = "BEHAVIOR_WORK" },
                InputInventoryCapacity = {
			{ Resource = CommonResourceCarcass, Quantity = 50 },
                	{ Resource = CommonResourceSalt, Quantity = 50 },
                	{ Resource = "WOOD", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = CommonResourceCarcass, Quantity = 1 },
                	{ Resource = CommonResourceSalt, Quantity = 1 },
                	{ Resource = "WOOD", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = SmokeHousePrefix .. "_SALTING", Quantity = 1 }
                }
})

-- Register prefab nodes (currently only one core model)
SmokeHouse:registerAssetId("models/smokehouse.fbx/Prefab/smokeHousePart", SmokeHousePrefix .. "_PREFAB")

-- Register the smoke house part
SmokeHouse:registerAsset({
	DataType = "BUILDING_PART",
	Id = SmokeHousePrefix .. "_PART",
	Name = SmokeHousePrefix .. "_NAME",
	Description = SmokeHousePrefix .. "_DESC",
	Category = "CORE",
        BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {8, 8} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
        }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = SmokeHousePrefix .. "_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*1 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "PLANK", Quantity = _NoSandbox*10 }
		}}
	},
        VillagerCapacity = 1,
--  	AssetBuildingFunction = SmokeHousePrefix .. "_ASSIGNABLE_FUNCTION"
})

-- Register air vent particle system
SmokeHouse:registerAssetId("models/smokehouse.fbx/Prefab/smokeHousePart/step_2/cheminee/SmokeEmitter", SmokeHousePrefix .. "_EMITTER_PREFAB")
 
SmokeHouse:registerPrefabComponent("models/smokehouse.fbx/Prefab/smokeHousePart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
                 { SmokeHousePrefix .. "_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

SmokeHouse:registerPrefabComponent("models/smokehouse.fbx/Prefab/smokeHousePart/step_2/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = false
})

SmokeHouse:registerPrefabComponent("models/smokehouse.fbx/Prefab/smokeHousePart/step_2/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})

SmokeHouse:registerAsset({
    DataType = "EVENT",
    Id = SmokeHousePrefix .. "_EVENT_START",
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
                    SmokeHousePrefix,
                },
            },
        }
    }
})

SmokeHouse:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        SmokeHousePrefix .. "_EVENT_START",
    }
})