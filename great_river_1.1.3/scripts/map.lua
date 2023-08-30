local mod = ...



-- Balancing -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    StartingTileResourceRequirement = {
        {
            Resource = "BERRIES",
            Quantity = 2
        },
        {
            Resource = "STONE",
            Quantity = 2
        },
        {
            Resource = "WOOD",
            Quantity = 50
        },
    },
    -- PlantableList = {
    --     Action = "APPEND",
    --     "PLANTABLE_PREFAB_GREATRIVER_BERRY1",
    --     "PLANTABLE_PREFAB_GREATRIVER_BERRY2",
    --     "PLANTABLE_PREFAB_GREATRIVER_SAPLING1",
    --     "PLANTABLE_PREFAB_GREATRIVER_SAPLING2",
    --     "PLANTABLE_PREFAB_GREATRIVER_SAPLING3",
    --     "PLANTABLE_PREFAB_GREATRIVER_SAPLING4",
    --     "PLANTABLE_PREFAB_GREATRIVER_SAPLING5",
    --     "PLANTABLE_PREFAB_GREATRIVER_BUSH1",
    --     "PLANTABLE_PREFAB_GREATRIVER_BUSH2",
    --     "PLANTABLE_PREFAB_GREATRIVER_BUSH3",
    --     "PLANTABLE_PREFAB_GREATRIVER_BUSH4",
    --     "PLANTABLE_PREFAB_GREATRIVER_BUSH5",
    -- },
    EventList = {
        Action = "APPEND", 
        "EVENT_GREATRIVER_START",
    },
})

mod:overrideAsset({
    Id = "BUILDING_FUNCTION_FORESTER",
    PlantableAssetList = {
        Action = "APPEND",
        "PLANTABLE_PREFAB_GREATRIVER_BERRY1",
        "PLANTABLE_PREFAB_GREATRIVER_BERRY2",
        "PLANTABLE_PREFAB_GREATRIVER_SAPLING1",
        "PLANTABLE_PREFAB_GREATRIVER_SAPLING2",
        "PLANTABLE_PREFAB_GREATRIVER_SAPLING3",
        "PLANTABLE_PREFAB_GREATRIVER_SAPLING4",
        "PLANTABLE_PREFAB_GREATRIVER_SAPLING5",
        "PLANTABLE_PREFAB_GREATRIVER_BUSH1",
        "PLANTABLE_PREFAB_GREATRIVER_BUSH2",
        "PLANTABLE_PREFAB_GREATRIVER_BUSH3",
        "PLANTABLE_PREFAB_GREATRIVER_BUSH4",
        "PLANTABLE_PREFAB_GREATRIVER_BUSH5",
    },
})


-- Event: Start ---------------------------------------------------------------------------------------------
mod:registerAssetId("models/Notification.png", "TEXTURE_GREATRIVER_NOTIFICATION")

-- Narrative Panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_GREATRIVER_START",
    Title = "EVENT_GREATRIVER_START_TITLE",
    Description = "EVENT_GREATRIVER_START_DESC",
    PanelVisual = "TEXTURE_GREATRIVER_NOTIFICATION",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_GREATRIVER_CHOICE_1",
            EventActionList = {
                {
                    DataType = "EVENT_ACTION_IGNORE",
                },
            },
        },
    },
})

mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_GREATRIVER_START",
    Title = "EVENT_GREATRIVER_START_TITLE",
    Description = "EVENT_GREATRIVER_START_DESC",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysToFirst = 1,
    ConditionList = {
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_GREATRIVER_START",
        },
    },
})



-- Vegetation, Stones, Bushes -------------------------------------------------------------------------------------
local function registerPlant(meshName, prefabName, resourceName, plantingDistance, radiusDistance, resourceQty, availableQty)

    mod:registerAssetId("models/Bush1.fbx/Prefab/" .. meshName, prefabName)
    mod:registerPrefabComponent("models/Bush1.fbx/Prefab/" .. meshName, { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = plantingDistance })
    mod:registerPrefabComponent("models/Bush1.fbx/Prefab/" .. meshName, { DataType = "COMP_TREE" })

    mod:registerAsset({
        DataType = "PLANTABLE",
        Id = "PLANTABLE_" .. prefabName,
        Name = "PLANTABLE_" .. prefabName,
        PlantPrefab = prefabName,
        Icon = "ICON_RESOURCE_" .. resourceName,
        MinimumScale = 0.85, -- min size at full growth
        MaximumScale = 1.15 -- max size at full growth
    })

    mod:registerPrefabComponent( "models/Bush1.fbx/Prefab/" .. meshName, {
        DataType = "COMP_RESOURCE_CONTAINER",
        ResourceData = resourceName,
        IsReplenishable = false,
        ResourceValue = resourceQty, -- how many are gathered with each pick
        AvailableQuantity = availableQty, -- maximum container stock
        Radius = radiusDistance, -- distance from container that the villager will stand to pick
        IsDestroyWhenEmpty = true,
    })

end

registerPlant("Bush.001", "PREFAB_GREATRIVER_BUSH1", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Bush.002", "PREFAB_GREATRIVER_BUSH2", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Bush.003", "PREFAB_GREATRIVER_BUSH3", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Bush.004", "PREFAB_GREATRIVER_BUSH4", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Bush.005", "PREFAB_GREATRIVER_BUSH5", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Sapling.001", "PREFAB_GREATRIVER_SAPLING1", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Sapling.002", "PREFAB_GREATRIVER_SAPLING2", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Sapling.003", "PREFAB_GREATRIVER_SAPLING3", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Sapling.004", "PREFAB_GREATRIVER_SAPLING4", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Sapling.005", "PREFAB_GREATRIVER_SAPLING5", "WOOD", 2, 1.2, 0.5, 1)
registerPlant("Stone.001", "PREFAB_GREATRIVER_STONE1", "STONE", 1, 1.2, 1, 10)
registerPlant("Stone.002", "PREFAB_GREATRIVER_STONE2", "STONE", 1, 1.2, 1, 14)
registerPlant("Stone.003", "PREFAB_GREATRIVER_STONE3", "STONE", 1, 1.2, 1, 8)
registerPlant("Stone.004", "PREFAB_GREATRIVER_STONE4", "STONE", 1, 1.2, 1, 10)
registerPlant("Stone.005", "PREFAB_GREATRIVER_STONE5", "STONE", 1, 1.2, 1, 16)



-- Berry Bushes -------------------------------------------------------------------------------------
local function registerBerry(meshName, prefabName, resourceName, plantingDistance, radiusDistance, resourceQty, availableQty)

    mod:registerAssetId("models/Bush1.fbx/Prefab/" .. meshName, prefabName)
    mod:registerPrefabComponent("models/Bush1.fbx/Prefab/" .. meshName, { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = plantingDistance })
    mod:registerPrefabComponent("models/Bush1.fbx/Prefab/" .. meshName, { DataType = "COMP_TREE" })

    mod:registerAsset({
        DataType = "PLANTABLE",
        Id = "PLANTABLE_" .. prefabName,
        Name = "PLANTABLE_" .. prefabName,
        PlantPrefab = prefabName,
        Icon = "ICON_RESOURCE_" .. resourceName,
        MinimumScale = 0.85, -- min size at full growth
        MaximumScale = 1.15 -- max size at full growth
    })

    mod:registerPrefabComponent( "models/Bush1.fbx/Prefab/" .. meshName, {
        DataType = "COMP_RESOURCE_CONTAINER",
        ResourceData = resourceName,
        IsReplenishable = true,
        ReplenishDurationInDays = 7,
        ReplenishQuantity = availableQty,
        ResourceValue = resourceQty, -- how many are gathered with each pick
        AvailableQuantity = availableQty, -- maximum container stock
        Radius = radiusDistance, -- distance from container that the villager will stand to pick
        IsDestroyWhenEmpty = false,
    })

end

registerBerry("BerryBush.001", "PREFAB_GREATRIVER_BERRY1", "BERRIES", 2, 1.2, 2, 10)
registerBerry("BerryBush.002", "PREFAB_GREATRIVER_BERRY2", "BERRIES", 2, 1.2, 2, 10)



-- Fertility inhibitor -------------------------------------------------------------------------------------
mod:registerAssetId("models/Bush1.fbx/Prefab/Blank", "PREFAB_GREATRIVER_BLANK")
mod:registerPrefabComponent("models/Bush1.fbx/Prefab/Blank", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 20 })
mod:registerPrefabComponent("models/Bush1.fbx/Prefab/Blank", { DataType = "COMP_TREE" })

mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_BLANK",
    Name = "PLANTABLE_BLANK_NAME",
    PlantPrefab = "PREFAB_GREATRIVER_BLANK",
    Icon = "ICON_RESOURCE_WOOD",
    MinimumScale = 1, -- min size at full growth
    MaximumScale = 1 -- max size at full growth
})

mod:registerPrefabComponent( "models/Bush1.fbx/Prefab/Blank", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "WATER",
    IsReplenishable = false,
    ResourceValue = 0, -- how many are gathered with each pick
    AvailableQuantity = 0, -- maximum container stock
    Radius = 1.25, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
})



-- Materials -------------------------------------------------------------------------------------
mod:registerAssetId("models/Bush1.fbx/Materials/Material.Bush1", "MATERIAL_GREATRIVER_BUSH1")
mod:registerAssetId("models/Bush1.fbx/Materials/Material.Bush2", "MATERIAL_GREATRIVER_BUSH2")
mod:registerAssetId("models/Bush1.fbx/Materials/Material.Bush3", "MATERIAL_GREATRIVER_BUSH3")
mod:registerAssetId("models/Bush1.fbx/Materials/Material.Tree1", "MATERIAL_GREATRIVER_TREE1")

mod:overrideAsset({ Id = "MATERIAL_GREATRIVER_BUSH1", HasAlphaTest = true, })
mod:overrideAsset({ Id = "MATERIAL_GREATRIVER_BUSH2", HasAlphaTest = true, })
mod:overrideAsset({ Id = "MATERIAL_GREATRIVER_BUSH3", HasAlphaTest = true, })
mod:overrideAsset({ Id = "MATERIAL_GREATRIVER_TREE1", HasAlphaTest = true, })



-- Maps -------------------------------------------------------------------------------------
mod:registerAssetId("maps/heightmap.png", "HEIGHT_MAP")
mod:registerAssetId("maps/material_mask.png", "MATERIAL_MASK")
mod:registerAssetId("maps/fish_density.png", "FISH_DENSITY_MAP")
mod:registerAssetId("maps/bush_density.png", "BUSH_MAP")
mod:registerAssetId("maps/sapling_density.png", "SAPLING_MAP")
mod:registerAssetId("maps/tree_density.png", "TREE_MAP")
mod:registerAssetId("maps/stone_density.png", "STONE_MAP")



-- Register custom map
mod:registerAsset({
	DataType = "CUSTOM_MAP",
	Id = "MAP_GREATRIVER",
	HeightMap = "HEIGHT_MAP",
	MaterialMask = "MATERIAL_MASK",
	MinHeight = -18,
	MaxHeight = 70,
	VillagePathList = {
		{
			Entrance = { 12, 0, 1012 }, -- upper left corner of map, large northern section
			Exit = { 24, 0, 1012 },
		},
		{
			Entrance = { 20, 0, 1012 },
			Exit = { 30, 0, 1012 },
		},
		{
			Entrance = { 30, 0, 1012 },
			Exit = { 40, 0, 1012 },
		},
		{
			Entrance = { 40, 0, 1012 },
			Exit = { 50, 0, 1012 },
		},
		{
			Entrance = { 50, 0, 1012 },
			Exit = { 60, 0, 1012 },
		},
		{
			Entrance = { 60, 0, 1012 },
			Exit = { 70, 0, 1012 },
		},
		{
			Entrance = { 70, 0, 1012 },
			Exit = { 80, 0, 1012 },
		},
		{
			Entrance = { 80, 0, 1012 },
			Exit = { 90, 0, 1012 },
		},
		{
			Entrance = { 90, 0, 1012 },
			Exit = { 100, 0, 1012 },
		},
		{
			Entrance = { 100, 0, 1012 },
			Exit = { 110, 0, 1012 },
		},
		{
			Entrance = { 110, 0, 1012 },
			Exit = { 120, 0, 1012 },
		},
----
		{
			Entrance = { 1012, 0, 730 }, -- large middle section of land
			Exit = { 1012, 0, 740 },
		},
		{
			Entrance = { 1012, 0, 725 }, -- large middle section of land
			Exit = { 1012, 0, 735 },
		},
		{
			Entrance = { 1012, 0, 720 }, -- large middle section of land
			Exit = { 1012, 0, 730 },
		},
		{
			Entrance = { 1012, 0, 715 }, -- large middle section of land
			Exit = { 1012, 0, 725 },
		},
		{
			Entrance = { 1012, 0, 710 }, -- large middle section of land
			Exit = { 1012, 0, 720 },
		},
		{
			Entrance = { 1012, 0, 705 }, -- large middle section of land
			Exit = { 1012, 0, 715 },
		},
		{
			Entrance = { 1012, 0, 700 }, -- large middle section of land
			Exit = { 1012, 0, 710 },
		},
		{
			Entrance = { 1012, 0, 695 }, -- large middle section of land
			Exit = { 1012, 0, 705 },
		},
		{
			Entrance = { 1012, 0, 690 }, -- large middle section of land
			Exit = { 1012, 0, 700 },
		},
		{
			Entrance = { 1012, 0, 685 }, -- large middle section of land
			Exit = { 1012, 0, 695 },
		},
 ----
        {
			Entrance = { 12, 0, 475 }, -- left middle small section
			Exit = { 12, 0, 465 },
		},
        {
			Entrance = { 10, 0, 470 }, -- left middle small section
			Exit = { 16, 0, 460 },
		},
        {
			Entrance = { 12, 0, 465 }, -- left middle small section
			Exit = { 12, 0, 455 },
		},
        {
			Entrance = { 10, 0, 460 }, -- left middle small section
			Exit = { 16, 0, 450 },
		},
        {
			Entrance = { 12, 0, 455 }, -- left middle small section
			Exit = { 12, 0, 445 },
		},
        {
			Entrance = { 10, 0, 450 }, -- left middle small section
			Exit = { 16, 0, 440 },
		},
        {
			Entrance = { 12, 0, 445 }, -- left middle small section
			Exit = { 12, 0, 435 },
		},
        {
			Entrance = { 10, 0, 440 }, -- left middle small section
			Exit = { 16, 0, 430 },
		},
        {
			Entrance = { 12, 0, 435 }, -- left middle small section
			Exit = { 12, 0, 425 },
		},
        {
			Entrance = { 10, 0, 430 }, -- left middle small section
			Exit = { 16, 0, 420 },
		},
----
		{
			Entrance = { 460, 0, 12 }, -- island in the south
			Exit = { 465, 0, 12 },
		},
		{
			Entrance = { 465, 0, 12 }, -- island in the south
			Exit = { 470, 0, 12 },
		},
		{
			Entrance = { 470, 0, 12 }, -- island in the south
			Exit = { 475, 0, 12 },
		},
		{
			Entrance = { 475, 0, 12 }, -- island in the south
			Exit = { 480, 0, 12 },
		},
		{
			Entrance = { 480, 0, 12 }, -- island in the south
			Exit = { 485, 0, 12 },
		},
		{
			Entrance = { 485, 0, 12 }, -- island in the south
			Exit = { 490, 0, 12 },
		},
		{
			Entrance = { 490, 0, 12 }, -- island in the south
			Exit = { 495, 0, 12 },
		},
		{
			Entrance = { 495, 0, 12 }, -- island in the south
			Exit = { 500, 0, 12 },
		},
		{
			Entrance = { 500, 0, 12 }, -- island in the south
			Exit = { 505, 0, 12 },
		},
		{
			Entrance = { 505, 0, 12 }, -- island in the south
			Exit = { 510, 0, 12 },
		},

	},

    SpawnList = {
		{
			-- creating Mineral Deposit 1
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 820 , 10 , 530 },
			Orientation = { 0.0, -0.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 2
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 797 , 7 , 543 },
			Orientation = { 0.0, 60.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 3
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 843 , 8 , 539 },
			Orientation = { 0.0, -80.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 4
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 847 , 4 , 570 },
			Orientation = { 0.0, -100.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 5
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 895 , 4 , 553 },
			Orientation = { 0.0, 90.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 6
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 883 , 8 , 532 },
			Orientation = { 0.0, 60.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		},
		{
			-- creating Mineral Deposit 7
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 913 , 5 , 521 },
			Orientation = { 0.0, 30.0 , 0.0},
			PatchBeforeVersion = "1.1.0"
		}
	},

    DensitySpawnList = {

		-- {
		-- 	-- Infertility (farms will never grow crops here)
		-- 	DensityMap = "INFERTILITY_MAP",
		-- 	Density = 1.0,
		-- 	PrefabConfigList = {
		-- 		{
        --             PrefabList = { "PREFAB_GREATRIVER_BLANK" },
        --             RandomWeight = 1.0,
        --             OffsetSizeRange = {
        --                 Min = 1.0,
        --                 Max = 1.0
        --             },
        --             OrientationRange = {
        --                 Min = { 0, 0, 0 },
        --                 Max = { 0, 0, 0 }
        --             },
        --             ScaleRange = {
        --                 Min = 1,
        --                 Max = 1
        --             },
        --             ColorRange = {
        --                 Min = { 1, 1, 1, 1 },
        --                 Max = { 1, 1, 1, 1 }
        --             }
        --         }
		-- 	}
		-- },

		{
			-- Bushes (small amount of wood, inhibits farming until cleared)
			DensityMap = "BUSH_MAP",
			Density = 0.5,
			PrefabConfigList = {
				{
                    PrefabList = { "PREFAB_GREATRIVER_BUSH1" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.50,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BUSH2" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.50,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BUSH3" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.50,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BUSH4" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.50,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BUSH5" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.50,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BERRY1" },
                    RandomWeight = 0.3,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 1.0,
                        Max = 1.1,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_BERRY2" },
                    RandomWeight = 0.3,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 1.0,
                        Max = 1.1,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
			}
		},

        {
			-- Saplings (small amount of wood, inhibits farming until cleared)
			DensityMap = "SAPLING_MAP",
			Density = 0.7,
			PrefabConfigList = {
				{
                    PrefabList = { "PREFAB_GREATRIVER_SAPLING1" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.75,
                        Max = 1.25,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_SAPLING2" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.75,
                        Max = 1.25,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_SAPLING3" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.75,
                        Max = 1.25,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_SAPLING4" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.75,
                        Max = 1.25,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_SAPLING5" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.75,
                        Max = 1.25,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
			}
		},

        {
			-- Trees
			DensityMap = "TREE_MAP",
			Density = 0.9,
			PrefabConfigList = {
				{
                    PrefabList = { "PREFAB_TREE_PINE" },
                    RandomWeight = 5.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_TREE_OAK" },
                    RandomWeight = 2.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_TREE_POPLAR" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_TREE_SYCAMORE" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
			}
		},

        
		{
			-- Stones (small amount of stone, inhibits farming until cleared)
			DensityMap = "STONE_MAP",
			Density = 0.6,
			PrefabConfigList = {
				{
                    PrefabList = { "PREFAB_GREATRIVER_STONE1" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_STONE2" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_STONE3" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_STONE4" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
				{
                    PrefabList = { "PREFAB_GREATRIVER_STONE5" },
                    RandomWeight = 1.0,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1.00,
                    },
                    OrientationRange = {
                        Min = { 0, -90, 0 },
                        Max = { 0, 90, 0 },
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15,
                    },
                    ColorRange = {
                        Min = { 1, 1, 1, 1 },
                        Max = { 1, 1, 1, 1 },
                    },
                },
			}
		},

        -- {
		-- 	-- Create rock outcrops - stone resource
		-- 	DensityMap = "ROCK_DENSITY_MAP",
		-- 	Density =0.9,
		-- 	PrefabConfigList = {
		-- 		{
		-- 				PrefabList = { "PREFAB_RESOURCE_ROCK" },
		-- 				RandomWeight = 0.1,
		-- 				OffsetSizeRange = {
		-- 					Min = 0.75,
		-- 					Max = 1.0
		-- 			},
		-- 				OrientationRange = {
		-- 					Min = { 0, -180, 0 },
		-- 					Max = { 0, 180, 0 }
		-- 			},
		-- 				ScaleRange = {
        --                     Min = 1.10,
        --                     Max = 1.20,
        --                 },
		-- 				ColorRange = {
		-- 					Min = { 0.8, 0.8, 0.8, 1 },
		-- 					Max = { 1, 1, 1, 1 }
		-- 			}
		-- 		}
		-- 	}
		-- },

        {
			-- Fish
			DensityMap = "FISH_DENSITY_MAP",
			Density = 0.9,
			PrefabConfigList = {
				{
						PrefabList = { "PREFAB_RESOURCE_FISH" },
						RandomWeight = 0.1,
						OffsetSizeRange = {
                            Min = 0.75,
                            Max = 1.00,
                        },
						OrientationRange = {
							Min = { 0, -180, 0 },
							Max = { 0, 180, 0 }
					},
						ScaleRange = {
							Min = 0.85,
							Max = 1.15
					},
						ColorRange = {
							Min = { 0.8, 0.8, 0.8, 1 },
							Max = { 1, 1, 1, 1 }
					}
				}
			}
		}
	}
})



