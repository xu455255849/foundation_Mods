local pastry = ...

-- Apply building asset processor
pastry:registerAssetProcessor("models/pastry.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

pastry:registerAssetId("models/pastry.fbx/Prefab/pastryPart", _PastryPrefix .. "_PASTRY_WORKPLACE_PREFAB")

function registerRecipe(_recipeNumber, _recipeList, _buildingPartList )
    pastry:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
            Id = _PastryPrefix .. "_RECIPE_" .. _recipeNumber .. "_FUNCTION",
            Name = _PastryPrefix .. "_RECIPE_" .. _recipeNumber .. "_FUNCTION_NAME",
		WorkerCapacity = 1,
            RelatedJob = { Job = "BAKER", Behavior = "BEHAVIOR_WORK" },
            ResourceProduced = {
			{ Resource = _CommonPastry, Quantity = 1 }
            }
    })

    for i, resourceItem in ipairs(_recipeList) do
        pastry:overrideAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
            Id = _PastryPrefix .. "_RECIPE_" .. _recipeNumber .. "_FUNCTION",
            InputInventoryCapacity = { 
                      Action = "APPEND",
			    { Resource = resourceItem, Quantity = 50 }
            },
            ResourceListNeeded = {
                      Action = "APPEND",
			    { Resource = resourceItem, Quantity = 1 }
            }
        })
    end

    registerSubBuilding("PASTRY_RECIPE_" .. _recipeNumber, _PastryPrefix .. "_RECIPE_" .. _recipeNumber .. "_FUNCTION", _buildingPartList)
end

registerRecipe( "1", { _CommonEgg, "FLOUR", _CommonButter, "BERRIES" }, { _PastryPrefix .. "_PASTRY_WORKPLACE_PART" })
registerRecipe( "2", { _CommonEgg, "FLOUR", _CommonButter, _CommonFruit }, { _PastryPrefix .. "_PASTRY_WORKPLACE_PART" })

pastry:registerAsset({
	DataType = "BUILDING_PART",
	Id = _PastryPrefix .. "_PASTRY_WORKPLACE_PART",
      BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 6} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
      }},
	Description = _PastryPrefix .. "_PASTRY_WORKPLACE_DESC",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = _PastryPrefix .. "_PASTRY_WORKPLACE_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{
			{ Resource = "WOOD", Quantity = _NoSandbox*10 }
		}}
	},
      VillagerCapacity = 1,
})

pastry:registerPrefabComponent("models/pastry.fbx/Prefab/pastryPart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {4, 6}
})

pastry:registerAssetId("models/pastry.fbx/Prefab/pastryPart/step_0/cheminee/SmokeEmitter", _PastryPrefix .. "_PASTRY_SMOKE_EMITTER_PREFAB")

pastry:registerPrefabComponent("models/pastry.fbx/Prefab/pastryPart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
                 { _PastryPrefix .. "_PASTRY_SMOKE_EMITTER_PREFAB", "COMP_PARTICLE_EMITTER_TOGGLE" }
	}
})

-- Register air vent particle system
pastry:registerPrefabComponent("models/pastry.fbx/Prefab/pastryPart/step_0/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = false
})

pastry:registerPrefabComponent("models/pastry.fbx/Prefab/pastryPart/step_0/cheminee/SmokeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})

