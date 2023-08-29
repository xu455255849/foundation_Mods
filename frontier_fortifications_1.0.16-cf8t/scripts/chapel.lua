local mod = ...



-- Building Asset Processor ------------------------------------------------------------------
mod:registerAssetProcessor("models/FrontierChurch1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1EndPart", "PREFAB_FRONTIER_CHURCH_CORE1_END")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1Tiling1Part", "PREFAB_FRONTIER_CHURCH_CORE1_TILING1")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1Tiling2Part", "PREFAB_FRONTIER_CHURCH_CORE1_TILING2")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1BasementPart", "PREFAB_FRONTIER_CHURCH_CORE1_BASEMENT")

mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1EndConstruction", "PREFAB_FRONTIER_CHURCH_CORE1_END_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1Tiling1Construction", "PREFAB_FRONTIER_CHURCH_CORE1_TILING1_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1Tiling2Construction", "PREFAB_FRONTIER_CHURCH_CORE1_TILING2_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1BasementConstruction", "PREFAB_FRONTIER_CHURCH_CORE1_BASEMENT_CONSTR")

mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1EndPart", "PREFAB_FRONTIER_CHURCH_EXTENSION1_END")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1Tiling1Part", "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING1")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1Tiling2Part", "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING2")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1BasementPart", "PREFAB_FRONTIER_CHURCH_EXTENSION1_BASEMENT")

mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1EndConstruction", "PREFAB_FRONTIER_CHURCH_EXTENSION1_END_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1Tiling1Construction", "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING1_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1Tiling2Construction", "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING2_CONSTR")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1BasementConstruction", "PREFAB_FRONTIER_CHURCH_EXTENSION1_BASEMENT_CONSTR")

mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Door1Part", "PREFAB_FRONTIER_CHURCH_DOOR1")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/CrossPart", "PREFAB_FRONTIER_CHURCH_CROSS")
mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/RootPart", "PREFAB_FRONTIER_CHURCH_ROOT")

-- mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Core1Construction", "PREFAB_FRONTIER_CHURCH_CORE1_CONSTR")
-- mod:registerAssetId("models/FrontierChurch1.fbx/Prefab/Extension1Construction", "PREFAB_FRONTIER_CHURCH_EXTENSION1_CONSTR")



-- Building Part Type ------------------------------------------------------------------
mod:registerEnumValue("BUILDING_PART_TYPE", "EXTENSION")
mod:registerEnumValue("ATTACH_NODE_TYPE", "EXTENSION")

mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/CrossPart", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "MINOR"
})

mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Door1Part", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "DOOR"
})

mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Extension1BasementPart", {
	DataType = "COMP_BUILDING_PART",
	BuildingPartType = "EXTENSION"
})



-- Attach nodes
for i = 1, 8, 1 do
    mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Core1BasementPart/Attach_Extension." .. string.sub("000" .. i, -3), { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "EXTENSION" }, AllowedAngles = {-45, 45} })
    -- mod:log("models/FrontierChurch1.fbx/Prefab/Core1BasementPart/Attach_Extension." .. string.sub("000" .. i, -3))
end

for i = 9, 12, 1 do
    mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Extension1BasementPart/Attach_Extension." .. string.sub("000" .. i, -3), { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "EXTENSION" }, AllowedAngles = {-45, 45} })
    -- mod:log("models/FrontierChurch1.fbx/Prefab/Extension1BasementPart/Attach_Extension." .. string.sub("000" .. i, -3))
end

-- force doors and windows to be built after their attached building part
mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Door1Part/Attach_Door.001", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "DOOR", "BUILD_ORDER_DEPENDENCY" }})
mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/CrossPart/Attach_Minor.001", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "MINOR", "BUILD_ORDER_DEPENDENCY" }})



-- Grounding
mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Door1Part", {DataType = "COMP_GROUNDED"})

-- for i=1, 4, 1 do
-- 	mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Core1Construction/Step_0." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- for i=1, 8, 1 do
-- 	mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Extension1Construction/Step_0." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- for i=5, 8, 1 do
-- 	mod:registerPrefabComponent("models/FrontierChurch1.fbx/Prefab/Extension1Construction/Step_0." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
-- mod:configurePrefabFlagList("models/FrontierKeep1.fbx/Prefab/KeepPart", { "PLATFORM" })



-- Building: Frontier Chapel -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING", 
	Id = "BUILDING_FRONTIER_CHURCH",
	Name = "BUILDING_FRONTIER_CHURCH_NAME",
	Description = "BUILDING_FRONTIER_CHURCH_DESC",
	BuildingType = "SERVICE",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_CHURCH",
	AssetBuildingPartList = {
        "BUILDING_PART_FRONTIER_CHURCH_CORE1",
        "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1",
        "BUILDING_PART_FRONTIER_CHURCH_DOOR1",
        "BUILDING_PART_FRONTIER_CHURCH_CROSS",
    },
	RequiredPartList = {
		{ Category = "CORE", Min = 1 },
		{ Category = "DOOR", Min = 1 },
	},
	IsEditable = true,
})



-- Building Part: Core Basement -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CORE1_BASEMENT",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_CORE1_BASEMENT",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_CORE1_BASEMENT_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 8 },
            },
		},
	},
})



-- Building Part: Core 1 Tiling 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CORE1_TILING1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_CORE1_TILING1",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_CORE1_TILING1_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Core 1 Tiling 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CORE1_TILING2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_CORE1_TILING2",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_CORE1_TILING2_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Core 1 End -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CORE1_END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_CORE1_END"
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_CORE1_END_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 30 },
            },
		},
	},
})



-- Building Part: Core 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CORE1",
	Name = "BUILDING_PART_FRONTIER_CHURCH_CORE1_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_ROOT",
		EndPart = "BUILDING_PART_FRONTIER_CHURCH_CORE1_END",
		FillerList = {
		    "BUILDING_PART_FRONTIER_CHURCH_CORE1_TILING1",
		    "BUILDING_PART_FRONTIER_CHURCH_CORE1_TILING2",
    	},
		BasementFillerList = {
		    "BUILDING_PART_FRONTIER_CHURCH_CORE1_BASEMENT",
       	},
		MinimumScale = 2,
		IsVertical = true,
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {7.8, 11}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
    Capacity = 20,
    Category = "CORE",
    -- AssetBuildingFunction = "BUILDING_FUNCTION_PUBLIC_LOUNGE_ROOM",
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 15 } },
	},
})



-- Building Part: Extension 1 Basement -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_BASEMENT",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_EXTENSION1_BASEMENT",
	},
    ConstructionVisual = "PREFAB_FRONTIER_CHURCH_EXTENSION1_BASEMENT_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		},
	},
})



-- Building Part: Extension 1 Tiling 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_TILING1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING1",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING1_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 5 },
            },
		},
	},
})



-- Building Part: Extension 1 Tiling 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_TILING2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING2",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_EXTENSION1_TILING2_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 5 },
            },
		},
	},
})



-- Building Part: Extension 1 End -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_END",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_EXTENSION1_END",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CHURCH_EXTENSION1_END_CONSTR",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 15 },
            },
		},
	},
})



-- Building Part: Extension 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1",
	Name = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_SCALER",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_ROOT",
		EndPart = "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_END",
		FillerList = {
		    "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_TILING1",
		    "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_TILING2",
    	},
		BasementFillerList = {
		    "BUILDING_PART_FRONTIER_CHURCH_EXTENSION1_BASEMENT",
       	},
		MinimumScale = 1,
		IsVertical = true,
	},
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {4.2, 6.2}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
    Capacity = 10,
    Category = "EXTENSION",
    -- AssetBuildingFunction = "BUILDING_FUNCTION_PUBLIC_LOUNGE_ROOM",
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
	},
})



-- Building Part: Door 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_DOOR1",
	Name = "BUILDING_PART_FRONTIER_CHURCH_DOOR1_NAME",
    Category = "DOOR",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_DOOR1",
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 1 },
            },
		},
	},
})



-- Building Part: Cross -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CHURCH_CROSS",
	Name = "BUILDING_PART_FRONTIER_CHURCH_CROSS_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CHURCH_CROSS",
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 1 },
            },
		},
	},
})


