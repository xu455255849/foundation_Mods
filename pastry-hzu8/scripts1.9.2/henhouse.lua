local Henhouse = ...

-- Apply building asset processor
Henhouse:registerAssetProcessor("models/henhouse.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})

function registerRecipe(_recipeNumber, _recipeList, _buildingPartList )
    Henhouse:registerAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
            Id = _PastryPrefix .. "_HENHOUSE_RECIPE_" .. _recipeNumber .. "_FUNCTION",
            Name = _PastryPrefix .. "_HENHOUSE_RECIPE_" .. _recipeNumber .. "_FUNCTION_NAME",
		WorkerCapacity = 1,
            RelatedJob = { Job = _PastryPrefix .. "_HEN_BREEDER", Behavior = "BEHAVIOR_WORK" },
            ResourceProduced = {
			{ Resource = _CommonEgg, Quantity = 4 }
            }
    })

    for i, resourceItem in ipairs(_recipeList) do
        Henhouse:overrideAsset({
		DataType = "BUILDING_FUNCTION_WORKPLACE",
                Id = _PastryPrefix .. "_HENHOUSE_RECIPE_" .. _recipeNumber .. "_FUNCTION",
                InputInventoryCapacity = { 
                            Action = "APPEND",
			    { Resource = resourceItem, Quantity = 2 }
                },
                ResourceListNeeded = {
                            Action = "APPEND",
			    { Resource = resourceItem, Quantity = 1 }
                }
        })
    end

    registerSubBuilding("HENHOUSE_RECIPE_" .. _recipeNumber, _PastryPrefix .. "_HENHOUSE_RECIPE_" .. _recipeNumber .. "_FUNCTION", _buildingPartList)
end

registerRecipe( "1", { "WHEAT" }, { _PastryPrefix .. "_HENHOUSE_PART" })
registerRecipe( "2", { "RESOURCE_CORN" }, { _PastryPrefix .. "_HENHOUSE_PART" })

Henhouse:dofile(_scriptFolder .. "/compHenHouse.lua")

-- Register prefab nodes (currently only one core model)
Henhouse:registerAssetId("models/henhouse.fbx/Prefab/henhousePart", _PastryPrefix .. "_HENHOUSE_PREFAB")

-- Register the henhouse workplace part
Henhouse:registerAsset({
	DataType = "BUILDING_PART",
	Id = _PastryPrefix .. "_HENHOUSE_PART",
      Name = _PastryPrefix .. "_HENHOUSE_NAME",
      BuildingZone = { ZoneEntryList = {
            { Polygon = polygon.createRectangle( {4, 4} ),
              Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } }
      }},
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = _PastryPrefix .. "_HENHOUSE_PREFAB"
	},
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {{ -- List of RESOURCE_QUANTITY_PAIR
			{ Resource = "WOOD", Quantity = _NoSandbox*5 }
		}}
	},
})

-- Register grass clearing components

Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart", {
	DataType = "COMP_DIRT_RECTANGLE",
	Size = {5, 5}
})

Henhouse:registerAssetId("models/henhouse.fbx/Prefab/henhousePart/step_1/door", _PastryPrefix .. "_HENHOUSE_DOOR_PREFAB")

Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart", {
	DataType = "COMP_BUILDING_PART",
	FeedbackComponentListToActivate = {
		{ _PastryPrefix .. "_HENHOUSE_DOOR_PREFAB", _PastryPrefix .. "_HENHOUSE_DOOR_COMP" }
	}
})

Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart/step_1/door", {
	DataType = _PastryPrefix .. "_HENHOUSE_DOOR_COMP",
	Enabled = false
})
Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart/step_1/door", {
	DataType = "COMP_GROUNDED"
})

--------------------------------------------------------------------------
function registerHen(_henNumber)
    Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart/poule" .. _henNumber .. "/groupMove" .. _henNumber, {
	DataType = _PastryPrefix .. "_HENHOUSE_COMP",
	Enabled = true
    })
    Henhouse:registerPrefabComponent("models/henhouse.fbx/Prefab/henhousePart/poule" .. _henNumber, {
	DataType = "COMP_GROUNDED"
    })
end

registerHen(1)
registerHen(2)
registerHen(3)
