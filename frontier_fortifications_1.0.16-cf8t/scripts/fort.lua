local mod = ...



-- Asset -------------------------------------------------------------------------------------
mod:registerAssetId("models/FrontierKeep1.fbx/Prefab/KeepPart", "PREFAB_FRONTIER_KEEP1")
mod:registerAssetId("models/FrontierKeep1.fbx/Prefab/LadderPart", "PREFAB_FRONTIER_LADDER1")
mod:registerAssetId("models/FrontierTower1.fbx/Prefab/TowerPart", "PREFAB_FRONTIER_TOWER1")
mod:registerAssetId("models/FrontierTower2.fbx/Prefab/TowerPart", "PREFAB_FRONTIER_TOWER2")
mod:registerAssetId("models/FrontierGate1.fbx/Prefab/GatePart", "PREFAB_FRONTIER_GATE1")
mod:registerAssetId("models/FrontierGate2.fbx/Prefab/GatePart", "PREFAB_FRONTIER_GATE2")
mod:registerAssetId("models/FrontierGate3.fbx/Prefab/GatePart", "PREFAB_FRONTIER_GATE3")
mod:registerAssetId("models/FrontierGate4.fbx/Prefab/GatePart", "PREFAB_FRONTIER_GATE4")
mod:registerAssetId("models/FrontierCabin1.fbx/Prefab/Cabin1Part", "PREFAB_FRONTIER_CABIN1")
mod:registerAssetId("models/FrontierCabin1.fbx/Prefab/Cabin2Part", "PREFAB_FRONTIER_CABIN2")

mod:registerAssetId("models/FrontierKeep1.fbx/Prefab/KeepConstruction", "PREFAB_CONSTR_FRONTIER_KEEP1")
mod:registerAssetId("models/FrontierTower1.fbx/Prefab/TowerConstruction", "PREFAB_CONSTR_FRONTIER_TOWER1")
mod:registerAssetId("models/FrontierTower2.fbx/Prefab/TowerConstruction", "PREFAB_CONSTR_FRONTIER_TOWER2")
mod:registerAssetId("models/FrontierGate1.fbx/Prefab/GateConstruction", "PREFAB_CONSTR_FRONTIER_GATE1")
mod:registerAssetId("models/FrontierGate4.fbx/Prefab/GateConstruction", "PREFAB_CONSTR_FRONTIER_GATE4")
mod:registerAssetId("models/FrontierCabin1.fbx/Prefab/Cabin1Construction", "PREFAB_FRONTIER_CABIN1_CONSTR")
mod:registerAssetId("models/FrontierCabin1.fbx/Prefab/Cabin2Construction", "PREFAB_FRONTIER_CABIN2_CONSTR")



-- Building Asset Processor
mod:registerAssetProcessor("models/FrontierKeep1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/FrontierTower1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/FrontierTower2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/FrontierGate1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/FrontierGate4.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/FrontierCabin1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Grounding
mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin1Part/Door.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin2Part/Door.002", {DataType = "COMP_GROUNDED"})



-- Collider Platform (climbable mesh)  -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/FrontierKeep1.fbx/Prefab/KeepPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/FrontierTower1.fbx/Prefab/TowerPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/FrontierTower2.fbx/Prefab/TowerPart", { "PLATFORM" })
mod:configurePrefabFlagList("models/FrontierGate1.fbx/Prefab/GatePart", { "PLATFORM" })
mod:configurePrefabFlagList("models/FrontierGate4.fbx/Prefab/GatePart", { "PLATFORM" })



-- Smoke Emitter -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin1Part/SmokeEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin1Part/SmokeEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})

mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin2Part/SmokeEmitter.002", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_HOUSING_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/FrontierCabin1.fbx/Prefab/Cabin2Part/SmokeEmitter.002", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false
})



-- Building: Frontier Fortifications -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_FRONTIER1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_FRONTIER2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_FRONTIER3")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_FRONTIER4")

-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_FRONTIER",
-- 	Name = "BUILDING_FRONTIER_NAME",
-- 	Description = "BUILDING_FRONTIER_DESC",
-- 	BuildingType = "SERVICE",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetMiniatureBuildingPart = "BUILDING_PART_FRONTIER_CABIN1",
--     SubAssetBuildingList = {
--         "BUILDING_FRONTIER_FORTIFICATION",
--         "BUILDING_FRONTIER_CHURCH",
--         "BUILDING_FRONTIER_HOUSE",
--     },
-- 	IsEditable = true,
-- })

-- Building: Fort
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_FRONTIER_FORTIFICATION",
	Name = "CATEGORY_BUILDING_SET_FRONTIER1",
    Description = "BUILDING_FRONTIER_DESC",
	BuildingType = "ADMINISTRATION",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_FRONTIER_KEEP1",
        "BUILDING_PART_FRONTIER_TOWER1",
        "BUILDING_PART_FRONTIER_TOWER2",
        "BUILDING_PART_FRONTIER_LADDER1",
        "BUILDING_PART_FRONTIER_GATE4",
        "BUILDING_PART_FRONTIER_GATE1",
        "BUILDING_PART_FRONTIER_GATE2",
        "BUILDING_PART_FRONTIER_GATE3",
    },
	IsEditable = true,
})

-- Building: Houses
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_FRONTIER_HOUSE",
	Name = "CATEGORY_BUILDING_SET_FRONTIER4",
	BuildingType = "SERVICE",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
	AssetBuildingPartList = {
        "BUILDING_PART_FRONTIER_CABIN1",
        "BUILDING_PART_FRONTIER_CABIN2",
    },
	IsEditable = true,
})



-- Building Part: Keep -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_KEEP1",
	Name = "BUILDING_PART_FRONTIER_KEEP1_NAME",
    Category = "BUILDING_SET_FRONTIER1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_KEEP1",
	},
	ConstructionVisual = "PREFAB_CONSTR_FRONTIER_KEEP1",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {7, 7}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {2.0, 1.5}, {4.5, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 50 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
            },
            {
                { Resource = "WOOD", Quantity = 20 },
            },
            {
                { Resource = "WOOD", Quantity = 20 },
            },
		},
	},
})



-- Building Part: Tower 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_TOWER1",
	Name = "BUILDING_PART_FRONTIER_TOWER1_NAME",
    Category = "BUILDING_SET_FRONTIER1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_TOWER1"
	},
	ConstructionVisual = "PREFAB_CONSTR_FRONTIER_TOWER1",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.5, 3.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 15 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Tower 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_TOWER2",
	Name = "BUILDING_PART_FRONTIER_TOWER2_NAME",
    Category = "BUILDING_SET_FRONTIER1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_TOWER2",
	},
	ConstructionVisual = "PREFAB_CONSTR_FRONTIER_TOWER2",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.5, 3.5}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 15 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Gate 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_GATE1",
	Name = "BUILDING_PART_FRONTIER_GATE1_NAME",
    Category = "BUILDING_SET_FRONTIER2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_GATE1",
	},
	ConstructionVisual = "PREFAB_CONSTR_FRONTIER_GATE1",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {4.75, 3.75}, {0.0, -4.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {4.75, 3.75}, {0.0, 4.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 25 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 5 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
            },
		},
	},
})



-- Building Part: Gate 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_GATE2",
	Name = "BUILDING_PART_FRONTIER_GATE2_NAME",
    Category = "BUILDING_SET_FRONTIER2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_GATE2",
	},
	-- ConstructionVisual = "PREFAB_CONSTR_FRONTIER_GATE2",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {0.6, 1.0}, {0.0, -2.25} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {0.6, 1.0}, {0.0, 2.25} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 1 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
            },
		},
	},
})



-- Building Part: Gate 3 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_GATE3",
	Name = "BUILDING_PART_FRONTIER_GATE3_NAME",
    Category = "BUILDING_SET_FRONTIER2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_GATE3",
	},
	-- ConstructionVisual = "PREFAB_CONSTR_FRONTIER_GATE2",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {0.6, 0.4}, {-1.4, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {0.6, 0.4}, {1.4, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 2 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 2 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
            },
		},
	},
})



-- Building Part: Gate 4 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_GATE4",
	Name = "BUILDING_PART_FRONTIER_GATE4_NAME",
    Category = "BUILDING_SET_FRONTIER2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_GATE4",
	},
	ConstructionVisual = "PREFAB_CONSTR_FRONTIER_GATE4",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {0.4, 1.2}, {0, 2.6} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createRectangle( {0.4, 1.2}, {0, -2.6} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
        UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
            },
		},
	},
})



-- Building Part: Cabin 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CABIN1",
	Name = "BUILDING_PART_FRONTIER_CABIN1_NAME",
    Category = "BUILDING_SET_FRONTIER4",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CABIN1",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CABIN1_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {6.2, 7.2}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
    Capacity = 4,
	AssetBuildingFunction = "BUILDING_FUNCTION_FRONTIER_CABIN1",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
            },
		},
	},
})



-- Building Part: Cabin 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_CABIN2",
	Name = "BUILDING_PART_FRONTIER_CABIN2_NAME",
    Category = "BUILDING_SET_FRONTIER4",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_CABIN2",
	},
	ConstructionVisual = "PREFAB_FRONTIER_CABIN2_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5.8, 5.4}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
    Capacity = 2,
	AssetBuildingFunction = "BUILDING_FUNCTION_FRONTIER_CABIN2",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
            },
		},
	},
})



-- Building Part: Ladder -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FRONTIER_LADDER1",
	Name = "BUILDING_PART_FRONTIER_LADDER1_NAME",
    Category = "BUILDING_SET_FRONTIER2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FRONTIER_LADDER1",
	},
	-- ConstructionVisual = "PREFAB_CONSTR_FRONTIER_LADDER1",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {1, 1}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	Cost = {
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 1 },
            },
		},
	},
})



-- House Setup: Cabin 1 -------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "HOUSE_SETUP",
    Id = "HOUSE_SETUP_FRONTIER_CABIN1",
    HouseStatusList = {
        {
            DataType = "HOUSE_STATUS",
            RequiredDesirability = DESIRABILITY_LEVEL.LOW,
            ResourceGenerated = "HOUSING_LEVEL_1",
            HouseDensityPartList = {
                "BUILDING_PART_FRONTIER_CABIN1",
            },
        },
    },
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_HOUSE",
    Id = "BUILDING_FUNCTION_FRONTIER_CABIN1",
    RelatedZone = "RESIDENTIAL",
    RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
    AssetHouseSetup = "HOUSE_SETUP_FRONTIER_CABIN1",
})



-- House Setup: Cabin 2 -------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "HOUSE_SETUP",
    Id = "HOUSE_SETUP_FRONTIER_CABIN2",
    HouseStatusList = {
        {
            DataType = "HOUSE_STATUS",
            RequiredDesirability = DESIRABILITY_LEVEL.LOW,
            ResourceGenerated = "HOUSING_LEVEL_1",
            HouseDensityPartList = {
                "BUILDING_PART_FRONTIER_CABIN2",
            },
        },
    },
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_HOUSE",
    Id = "BUILDING_FUNCTION_FRONTIER_CABIN2",
    RelatedZone = "RESIDENTIAL",
    RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
    AssetHouseSetup = "HOUSE_SETUP_FRONTIER_CABIN2",
})



-- House: add to Taxable -------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "TAXATION_FUNCTION_HOUSING",
    AssetBuildingList = {
        Action = "APPEND",
        "BUILDING_FRONTIER_HOUSE",
    },
})



-- Unlockable -------------------------------------------------------------------------------------------
mod:registerAssetId("icons/Unlockable.png", "ICON_UNLOCKABLE_FRONTIER", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_FRONTIER",
    Name = "BUILDING_FRONTIER_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_FRONTIER",
    DataCost = {
        -- DataInfluenceCostList = {
        --     {
        --         Estate = "KINGDOM",
        --         Quantity = 5,
        --     },
        -- },
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 50,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    -- "BUILDING_FRONTIER",
                    "BUILDING_FRONTIER_FORTIFICATION",
                    "BUILDING_FRONTIER_HOUSE",
                    "BUILDING_FRONTIER_CHURCH",
                },
                WallList = {
                    "WALL_FRONTIER_PALISADE",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T1",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_FRONTIER",
    },
})
