local mod = ...



-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/Poultry2.fbx/Prefab/Hat.Part", "PREFAB_POULTRYFARM_HAT")

mod:registerAssetId("models/Poultry2.fbx/Prefab/Flock.Part.Chicken", "PREFAB_POULTRYFARM_CHICKEN_FLOCK")
mod:registerAssetId("models/Poultry2.fbx/Prefab/Flock.Part.Goose", "PREFAB_POULTRYFARM_GOOSE_FLOCK")
mod:registerAssetId("models/Poultry2.fbx/Prefab/Single.Part.Chicken", "PREFAB_POULTRYFARM_CHICKEN_SINGLE")
mod:registerAssetId("models/Poultry2.fbx/Prefab/Single.Part.Goose", "PREFAB_POULTRYFARM_GOOSE_SINGLE")
mod:registerAssetId("models/Poultry2.fbx/Prefab/SpawnPointChicken", "PREFAB_POULTRYFARM_SPAWNPOINT_CHICKEN")
mod:registerAssetId("models/Poultry2.fbx/Prefab/SpawnPointGoose", "PREFAB_POULTRYFARM_SPAWNPOINT_GOOSE")

mod:registerAssetId("models/Poultry2.fbx/Prefab/ChickenHouse.Part.001", "PREFAB_POULTRYFARM_CHICKENHOUSE1")
mod:registerAssetId("models/Poultry2.fbx/Prefab/ChickenHouse.Part.002", "PREFAB_POULTRYFARM_CHICKENHOUSE2")
mod:registerAssetId("models/Poultry2.fbx/Prefab/ChickenHouse.Part.003", "PREFAB_POULTRYFARM_CHICKENHOUSE3")
mod:registerAssetId("models/Poultry2.fbx/Prefab/ChickenHouse.Part.004", "PREFAB_POULTRYFARM_CHICKENHOUSE4")

mod:registerAssetId("models/Poultry2.fbx/Prefab/GooseHouse.Part.001", "PREFAB_POULTRYFARM_GOOSEHOUSE1")
mod:registerAssetId("models/Poultry2.fbx/Prefab/GooseHouse.Part.002", "PREFAB_POULTRYFARM_GOOSEHOUSE2")
mod:registerAssetId("models/Poultry2.fbx/Prefab/GooseHouse.Part.003", "PREFAB_POULTRYFARM_GOOSEHOUSE3")

mod:registerAssetId("models/Poultry2.fbx/Prefab/ResourcePoultryPart", "PREFAB_POULTRYFARM_RESOURCE_POULTRY")
mod:registerAssetId("models/Poultry2.fbx/Prefab/ResourceEggPart", "PREFAB_POULTRYFARM_RESOURCE_EGGS")

mod:registerAssetId("models/Dovecote4.fbx/Prefab/DovecotePart", "PREFAB_POULTRYFARM_DOVECOTE1")
mod:registerAssetId("models/Dovecote5.fbx/Prefab/DovecotePart", "PREFAB_POULTRYFARM_DOVECOTE2")
mod:registerAssetId("models/Dovecote6.fbx/Prefab/DovecotePart", "PREFAB_POULTRYFARM_DOVECOTE3")

mod:registerAssetId("models/DuckPond1.fbx/Prefab/DuckPond.Part.001", "PREFAB_POULTRYFARM_DUCKPOND1")
mod:registerAssetId("models/DuckPond1.fbx/Prefab/Duck.001", "PREFAB_POULTRYFARM_DUCK1")
mod:registerAssetId("models/DuckPond1.fbx/Prefab/Duck.002", "PREFAB_POULTRYFARM_DUCK2")

mod:registerAssetId("models/DuckPond2.fbx/Prefab/DuckPond.Part.002", "PREFAB_POULTRYFARM_DUCKPOND2")

for i=1, 10, 1 do

    -- Register
    mod:registerAssetId("models/Poultry2.fbx/Prefab/Chicken.Part." .. string.sub("000" .. i, -3), "PREFAB_POULTRYFARM_CHICKEN" .. i)
    mod:registerAssetId("models/Poultry2.fbx/Prefab/Goose.Part." .. string.sub("000" .. i, -3), "PREFAB_POULTRYFARM_GOOSE" .. i)

    -- Grounding
    mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/Flock.Part.Chicken/Attach_Minor." .. string.sub("000" .. i, -3), { DataType = "COMP_GROUNDED" } )
    mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/Flock.Part.Goose/Attach_Minor." .. string.sub("000" .. i + 10, -3), { DataType = "COMP_GROUNDED" } )

    -- Add movement and enforce radius for poultry
    mod:registerPrefabComponent("PREFAB_POULTRYFARM_CHICKEN" .. i, { DataType = "COMP_ENFORCE_RADIUS", Radius = 1 } )
    mod:registerPrefabComponent("PREFAB_POULTRYFARM_CHICKEN" .. i, { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )
    mod:registerPrefabComponent("PREFAB_POULTRYFARM_GOOSE" .. i, { DataType = "COMP_ENFORCE_RADIUS", Radius = 1 } )
    mod:registerPrefabComponent("PREFAB_POULTRYFARM_GOOSE" .. i, { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )

end



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "models/Poultry2.fbx/Prefab/SpawnPointChicken", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_CHICKEN",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 1.25, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
})

mod:registerPrefabComponent( "models/Poultry2.fbx/Prefab/SpawnPointGoose", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_GOOSE",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 1.25, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
})



-- Flock component -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_POULTRYFARM_CHICKEN_FLOCK", { DataType = "COMP_POULTRYFARM_FLOCK", FlockPoultryType = "CHICKEN" })
mod:registerPrefabComponent("PREFAB_POULTRYFARM_GOOSE_FLOCK", { DataType = "COMP_POULTRYFARM_FLOCK", FlockPoultryType = "GOOSE" })
mod:registerPrefabComponent("PREFAB_POULTRYFARM_CHICKEN_SINGLE", { DataType = "COMP_POULTRYFARM_FLOCK", FlockPoultryType = "CHICKEN" })
mod:registerPrefabComponent("PREFAB_POULTRYFARM_GOOSE_SINGLE", { DataType = "COMP_POULTRYFARM_FLOCK", FlockPoultryType = "GOOSE" })



-- SpawnPoint component -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_POULTRYFARM_SPAWNPOINT_CHICKEN" , { DataType = "COMP_POULTRYFARM_SPAWNPOINT", PoultryType = "CHICKEN" } )
mod:registerPrefabComponent("PREFAB_POULTRYFARM_SPAWNPOINT_GOOSE" , { DataType = "COMP_POULTRYFARM_SPAWNPOINT", PoultryType = "GOOSE" } )



-- Duck component -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCKPOND1", { DataType = "COMP_POULTRYFARM_DUCKPOND", AnimalCount = 3 })
mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCKPOND2", { DataType = "COMP_POULTRYFARM_DUCKPOND", AnimalCount = 2 })

mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCK1", { DataType = "COMP_ENFORCE_RADIUS", Radius = 1.3 } )
mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCK1", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0, WalkOnPlatform = true } )

mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCK2", { DataType = "COMP_ENFORCE_RADIUS", Radius = 1.3 } )
mod:registerPrefabComponent("PREFAB_POULTRYFARM_DUCK2", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0, WalkOnPlatform = true } )



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Poultry2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })

mod:registerAssetProcessor("models/Dovecote4.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Dovecote5.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/Dovecote6.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })

mod:registerAssetProcessor("models/DuckPond1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/DuckPond2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })

mod:registerAssetProcessor("models/PoultryCart2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Construction visual -------------------------------------------------------------------------------------
mod:registerAssetId("models/Dovecote4.fbx/Prefab/ConstructionSteps", "PREFAB_POULTRYFARM_DOVECOTE1_CONSTR")
mod:registerAssetId("models/Dovecote5.fbx/Prefab/ConstructionSteps", "PREFAB_POULTRYFARM_DOVECOTE2_CONSTR")
mod:registerAssetId("models/Dovecote6.fbx/Prefab/ConstructionSteps", "PREFAB_POULTRYFARM_DOVECOTE3_CONSTR")



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.001/Bucket.001", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.001/Thatch.001", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.001/StumpAxe.001", { DataType = "COMP_GROUNDED" } )

mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.002/StumpAxe.002", { DataType = "COMP_GROUNDED" } )

mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.003/Bucket.003", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.003/Thatch.003", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.003/StumpAxe.003", { DataType = "COMP_GROUNDED" } )

mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/ChickenHouse.Part.004/StumpAxe.004", { DataType = "COMP_GROUNDED" } )

mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/GooseHouse.Part.001/Bucket.005", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/GooseHouse.Part.002/Bucket.006", { DataType = "COMP_GROUNDED" } )
mod:registerPrefabComponent("models/Poultry2.fbx/Prefab/GooseHouse.Part.003/Bucket.007", { DataType = "COMP_GROUNDED" } )



-- Collider Platform (climbable mesh) -------------------------------------------------------------------------------------
mod:configurePrefabFlagList("models/Dovecote4.fbx/Prefab/DovecotePart", { "PLATFORM" })
mod:configurePrefabFlagList("models/Dovecote5.fbx/Prefab/DovecotePart", { "PLATFORM" })
mod:configurePrefabFlagList("models/Dovecote6.fbx/Prefab/DovecotePart", { "PLATFORM" })

mod:configurePrefabFlagList("models/DuckPond1.fbx/Prefab/DuckPond.Part.001", { "PLATFORM" })
mod:configurePrefabFlagList("models/DuckPond2.fbx/Prefab/DuckPond.Part.002", { "PLATFORM" })



-- Resource Type  -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_POULTRYFARM_POULTRY" )
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_POULTRYFARM_EGGS" )



-- Material -------------------------------------------------------------------------------------
mod:registerAssetId("models/Poultry2.fbx/Materials/Material.Colour", "MATERIAL_POULTRYFARM_COLOR")
mod:registerAssetId("models/Poultry2.fbx/Materials/Material.Transparent", "MATERIAL_POULTRYFARM_TRANSPARENT")

mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_TRANSPARENT", HasAlphaTest = true })

for i = 1, 2, 1 do
    mod:registerAssetId("models/DuckPond" .. i .. ".fbx/Materials/Material.Tree1", "MATERIAL_POULTRYFARM_TREE1" .. i)
    mod:registerAssetId("models/DuckPond" .. i .. ".fbx/Materials/Material.Tree2", "MATERIAL_POULTRYFARM_TREE2" .. i)
    mod:registerAssetId("models/DuckPond" .. i .. ".fbx/Materials/Material.Tree3", "MATERIAL_POULTRYFARM_TREE3" .. i)
    mod:registerAssetId("models/DuckPond" .. i .. ".fbx/Materials/Material.Grass1", "MATERIAL_POULTRYFARM_GRASS1" .. i)
    mod:registerAssetId("models/DuckPond" .. i .. ".fbx/Materials/Material.Bush1", "MATERIAL_POULTRYFARM_BUSH1" .. i)

    mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_TREE1" .. i, HasAlphaTest = true })
    mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_TREE2" .. i, HasAlphaTest = true })
    mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_TREE3" .. i, HasAlphaTest = true })
    mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_GRASS1" .. i, HasAlphaTest = true })
    mod:overrideAsset({ Id = "MATERIAL_POULTRYFARM_BUSH1" .. i, HasAlphaTest = true })
end


-- Resource: Eggs (Override) -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BV1_EGG",
    ResourceVisualPrefab = "PREFAB_POULTRYFARM_RESOURCE_EGGS",
})



-- Job: Dovecote -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_POULTRYFARM_DOVE",
	JobName = "JOB_POULTRYFARM_NAME",
	JobDescription = "JOB_POULTRYFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_POULTRY_WORK",
	-- DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 18.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GUARD",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_POULTRYFARM_DOVE"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_POULTRYFARM_DOVE",
    },
})



-- Job: Wildfowl -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_POULTRYFARM_WILDFOWL",
	JobName = "JOB_POULTRYFARM_WILDFOWL_NAME",
	JobDescription = "JOB_POULTRYFARM_WILDFOWL_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_POULTRY_WORK",
	-- DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 16.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_HUNTER_BOW",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_POULTRYFARM_WILDFOWL"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_POULTRYFARM_WILDFOWL",
    },
})



-- Job: Slaughter -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_POULTRYFARM_POULTRY",
	JobName = "JOB_POULTRYFARM_NAME",
	JobDescription = "JOB_POULTRYFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_POULTRY_GATHER",
    -- ProductionDelay = 8, -- default 30
	-- DefaultBehavior = "BEHAVIOR_GATHER",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    Model = "PREFAB_TOOL_CARPENTER_AXE",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_POULTRYFARM_POULTRY"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_POULTRYFARM_POULTRY",
    },
})



-- Job: Gather Eggs -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_POULTRYFARM_EGGS",
	JobName = "JOB_POULTRYFARM_NAME",
	JobDescription = "JOB_POULTRYFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_POULTRY_GATHER",
    -- ProductionDelay = 10, -- default 30
	-- DefaultBehavior = "BEHAVIOR_GATHER",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_POULTRYFARM_HAT",
                },
            },
            { -- ALL
                LeftHandObject = {
                    Model = "PREFAB_TOOL_DAIRY_FARMER_BUCKET",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

-- mod:overrideAsset({
--     Id = "NEWCOMER",
--     CompatibleJobList = {
--         Action = "APPEND",
--         "JOB_POULTRYFARM_EGGS"
--     }
-- })

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_POULTRYFARM_EGGS",
    },
})



-- Building Function: Chickens -> Poultry Meat -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_POULTRY",
    Name = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_POULTRY_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 8,
    RelatedJob = {
        Job = "JOB_POULTRYFARM_POULTRY",
        Behavior = "BEHAVIOR_POULTRY_GATHER",
        -- Behavior = "BEHAVIOR_GATHER",
    },
    UpkeepPerCapacity = {
		{ Resource = "GOLD_COINS", Quantity = 2 },
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CHICKEN", Quantity = 1 },
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_POULTRY", Quantity = 1 },
		{ Resource = "RESOURCE_DUNG", Quantity = 1 },
	},
})



-- Building Function: Chickens -> Eggs -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_EGGS",
    Name = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_EGGS_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 10,
    RelatedJob = {
        Job = "JOB_POULTRYFARM_EGGS",
        Behavior = "BEHAVIOR_POULTRY_GATHER",
        -- Behavior = "BEHAVIOR_GATHER",
    },
    UpkeepPerCapacity = {
		{ Resource = "GOLD_COINS", Quantity = 2 },
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_CHICKEN", Quantity = 1 },
	},
    ResourceProduced = {
		{ Resource = "BV1_EGG", Quantity = 2 },
		{ Resource = "RESOURCE_DUNG", Quantity = 1 },
	},
})



-- Building Function: Geese -> Poultry Meat -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_POULTRY",
    Name = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_POULTRY_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 8,
    RelatedJob = {
        Job = "JOB_POULTRYFARM_POULTRY",
        Behavior = "BEHAVIOR_POULTRY_GATHER",
        -- Behavior = "BEHAVIOR_GATHER",
    },
    UpkeepPerCapacity = {
		{ Resource = "GOLD_COINS", Quantity = 2 },
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_GOOSE", Quantity = 1 },
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_POULTRY", Quantity = 1 },
		{ Resource = "RESOURCE_DUNG", Quantity = 1 },
	},
})



-- Building Function: Dovecote  -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_DOVE",
    Name = "BUILDING_FUNCTION_POULTRYFARM_DOVE_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 18,
    RelatedJob = { 
        Job = "JOB_POULTRYFARM_DOVE",
        Behavior = "BEHAVIOR_POULTRY_WORK",
        -- Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "WATER", Quantity = 20 },
	},
    ResourceListNeeded = {
		{ Resource = "WATER", Quantity = 1 },
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_POULTRY", Quantity = 1 },
		{ Resource = "RESOURCE_DUNG", Quantity = 1 },
	},
})



-- Building Function: Ducks  -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_POULTRYFARM_WILDFOWL",
    Name = "BUILDING_FUNCTION_POULTRYFARM_WILDFOWL_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 16,
    RelatedJob = {
        Job = "JOB_POULTRYFARM_WILDFOWL",
        Behavior = "BEHAVIOR_POULTRY_WORK",
        -- Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
	},
    ResourceListNeeded = {
	},
    ResourceProduced = {
		{ Resource = "RESOURCE_POULTRY", Quantity = 1 },
	},
})



-- -- Building Function Assignable: Chicken -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_ASSIGNABLE",
--     Id = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_CHICKEN",
-- 	Name = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_CHICKEN_NAME",
-- 	AuthorizedFunctionList = "BUILDING_FUNCTION_LIST_POULTRYFARM_CHICKEN"
-- })



-- -- Building Function List: Chicken -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
--     Id = "BUILDING_FUNCTION_LIST_POULTRYFARM_CHICKEN",
-- 	AssetFunctionList = {
--         -- "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_COMBINE",
-- 		"BUILDING_FUNCTION_POULTRYFARM_CHICKEN_POULTRY",
--         "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_EGGS",
-- 	}
-- })



-- Building Function: Resource Generator -------------------------------------------------------------------------------------
-- Not actually used, included so that the user does not see birds as decorative in the UI
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
    Id = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_RESOURCEGENERATOR",
    Name = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_CHICKEN_NAME",
    ResourceGenerated = "RESOURCE_CHICKEN",
    IsInfinite = false,
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_DEFINED_RESOURCE_GENERATOR",
    Id = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_RESOURCEGENERATOR_DEFINED",
    Name = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_CHICKEN_NAME",
    ResourceGenerator = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_RESOURCEGENERATOR",
    MaxQuantity = 0,
    GrowRate = 0,
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
    Id = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_RESOURCEGENERATOR",
    Name = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_GOOSE_NAME",
    ResourceGenerated = "RESOURCE_GOOSE",
    IsInfinite = false,
})

mod:registerAsset({
    DataType = "BUILDING_FUNCTION_DEFINED_RESOURCE_GENERATOR",
    Id = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_RESOURCEGENERATOR_DEFINED",
    Name = "BUILDING_FUNCTION_ASSIGNABLE_POULTRYFARM_GOOSE_NAME",
    ResourceGenerator = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_RESOURCEGENERATOR",
    MaxQuantity = 0,
    GrowRate = 0,
})



-- Building: Poultry farm -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_POULTRYFARM_1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_POULTRYFARM_2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_POULTRYFARM_3")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_POULTRYFARM_4")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_SET_POULTRYFARM_5")

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM",
	Name = "BUILDING_POULTRYFARM_NAME",
	Description = "BUILDING_POULTRYFARM_DESC",
	BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
    SubAssetBuildingList = {
        "BUILDING_POULTRYFARM_CHICKEN_EGGS",
        "BUILDING_POULTRYFARM_CHICKEN_POULTRY",
        "BUILDING_POULTRYFARM_GOOSE",
        "BUILDING_POULTRYFARM_DOVE",
        "BUILDING_POULTRYFARM_DUCK",
        "BUILDING_POULTRYFARM_DUNG",
    },
    -- AssetBuildingPartList = {
    --     "BUILDING_PART_POULTRYFARM_CHICKENHOUSE",
    --     "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
    --     "BUILDING_PART_POULTRYFARM_GOOSEHOUSE",
    --     "BUILDING_PART_POULTRYFARM_GOOSE_FLOCK",
    --     "BUILDING_PART_POULTRYFARM_DOVECOTE1",
    --     "BUILDING_PART_POULTRYFARM_DOVECOTE2",
    --     "BUILDING_PART_POULTRYFARM_DOVECOTE3",
    --     "BUILDING_PART_POULTRYFARM_DUCKPOND",
    --     "BUILDING_PART_POULTRYFARM_DUNGHEAP",
    --     "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
    --     "BUILDING_PART_POULTRYFARM_MARKETCART_BV1_EGG",
	-- },
	IsEditable = true,
})

-- Chickens (eggs)
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_CHICKEN_EGGS",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_EGGS_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_EGGS",
        "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
        "BUILDING_PART_POULTRYFARM_MARKETCART_BV1_EGG",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 3,
        },
        {
            Category = "BUILDING_SET_POULTRYFARM_1",
            Min = 3,
        },
    },
})

-- Chickens (poultry)
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_CHICKEN_POULTRY",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_POULTRY_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_POULTRY",
        "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
        "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 3,
        },
        {
            Category = "BUILDING_SET_POULTRYFARM_1",
            Min = 3,
        },
    },
})

-- Geese (poultry)
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_GOOSE",
	Name = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_GOOSEHOUSE",
        "BUILDING_PART_POULTRYFARM_GOOSE_FLOCK",
        "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 3,
        },
        {
            Category = "BUILDING_SET_POULTRYFARM_2",
            Min = 3,
        },
    },
})

-- Dove
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_DOVE",
	Name = "BUILDING_PART_POULTRYFARM_DOVECOTE_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_DOVECOTE1",
        "BUILDING_PART_POULTRYFARM_DOVECOTE2",
        "BUILDING_PART_POULTRYFARM_DOVECOTE3",
        "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 3,
        },
    },
})

-- Duck
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_DUCK",
	Name = "BUILDING_PART_POULTRYFARM_DUCKPOND_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_DUCKPOND",
        "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 3,
        },
    },
})

-- Dung
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_POULTRYFARM_DUNG",
	Name = "BUILDING_PART_POULTRYFARM_DUNGHEAP_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_POULTRYFARM_DUNGHEAP",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "OTHER",
            Min = 1,
        },
    },
})

-- Unlockable
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        {
            OwnerBuilding = "BUILDING_MARKETCART",
            AssetBuildingPartList = {
                "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
                "BUILDING_PART_POULTRYFARM_MARKETCART_BV1_EGG",
            },
        },
    }
end

mod:registerAssetId("icons/UnlockablePoultry.png", "ICON_UNLOCKABLE_BUILDING_POULTRYFARM", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_POULTRYFARM",
    Name = "BUILDING_POULTRYFARM_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_POULTRYFARM",
    DataCost = {
        -- DataInfluenceCostList = {
        --     {
        --         Estate = "LABOUR",
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
                    "BUILDING_POULTRYFARM",
                },
                AdditionalBuildingUnlockList = marketCart,
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T1",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_POULTRYFARM",
    },
})



-- Building Part: Chicken Flock -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
	Name = "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK_NAME",
    Category = "BUILDING_SET_POULTRYFARM_1",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKEN_FLOCK",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_RESOURCEGENERATOR_DEFINED",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 2, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true } 
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 30 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
	},
})



-- Building Part: One Chicken -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKEN_SINGLE",
	Name = "BUILDING_PART_POULTRYFARM_CHICKEN_SINGLE_NAME", 
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKEN_SINGLE",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_RESOURCEGENERATOR_DEFINED",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 0.1, {0.0, 0.0}, 6 ),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true } 
			}
		}
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 3 } },
	},
})



-- Building Part: Chicken House -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE1",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKENHOUSE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE2",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKENHOUSE2",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 1.2, 1.4, -9 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE3",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKENHOUSE3",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 1.2, 1.4, -9 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE4",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_CHICKENHOUSE4",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 1.2, 1.4, -9 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_EGGS",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_EGGS_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE1",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE2",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE3",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE4",
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_EGGS",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.4, 3.4}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 6 },
                { Resource = "TOOL", Quantity = 1 },
            },
		},
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_POULTRY",
	Name = "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_POULTRY_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE1",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE2",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE3",
			"BUILDING_PART_POULTRYFARM_CHICKENHOUSE4",
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_CHICKEN_POULTRY",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.4, 3.4}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true }
			},
		},
	},
	Cost = {
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 6 },
                { Resource = "TOOL", Quantity = 1 },
            },
		},
	},
})



-- Building Part: Goose Flock -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSE_FLOCK",
	Name = "BUILDING_PART_POULTRYFARM_GOOSE_FLOCK_NAME",
    Category = "BUILDING_SET_POULTRYFARM_2",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_POULTRYFARM_GOOSE_FLOCK",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_RESOURCEGENERATOR_DEFINED",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 30 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
	},
})



-- Building Part: One Goose -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSE_SINGLE",
	Name = "BUILDING_PART_POULTRYFARM_GOOSE_SINGLE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_POULTRYFARM_GOOSE_SINGLE",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
    AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_RESOURCEGENERATOR_DEFINED",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 0.1, {0.0, 0.0}, 6 ),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true } 
			}
		}
	},
	Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 3 } },
	},
})



-- Building Part: Goose House -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE1",
	Name = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_GOOSEHOUSE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE2",
	Name = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE_NAME", 
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_GOOSEHOUSE2",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE3",
	Name = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_GOOSEHOUSE3",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 0.0
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE",
	Name = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_POULTRYFARM_GOOSEHOUSE1",
			"BUILDING_PART_POULTRYFARM_GOOSEHOUSE2",
			"BUILDING_PART_POULTRYFARM_GOOSEHOUSE3",
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_GOOSE_POULTRY",
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle( 2.2, {0, 0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true } 
			}
		}
	},
	Cost = {
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
            },
		}
	}
})



-- Building Part: Duck Pond -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DUCKPOND1",
	Name = "BUILDING_PART_POULTRYFARM_DUCKPOND_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DUCKPOND1",
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DUCKPOND2",
	Name = "BUILDING_PART_POULTRYFARM_DUCKPOND_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DUCKPOND2",
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DUCKPOND",
	Name = "BUILDING_PART_POULTRYFARM_DUCKPOND_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_POULTRYFARM_DUCKPOND1",
			"BUILDING_PART_POULTRYFARM_DUCKPOND2",
		},
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_WILDFOWL",
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 5, {0, 0}, 20 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
            {
                Polygon = polygon.createCircle( 3.5, {0, 0}, 20 ),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	Cost = {
        BuildRightTaxes = {	
            { Resource = "GOLD_COINS", Quantity = 60 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 8 } },
	},
})



-- Building Part: Dovecote 1: raised wooden box -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DOVECOTE1",
	Name = "BUILDING_PART_POULTRYFARM_DOVECOTE_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DOVECOTE1"
	},
	ConstructionVisual = "PREFAB_POULTRYFARM_DOVECOTE1_CONSTR",
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.6, 3.6}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_DOVE",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 50 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
            },
		},
	},
})



-- Building Part: Dovecote 2: stone silo -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DOVECOTE2",
	Name = "BUILDING_PART_POULTRYFARM_DOVECOTE_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DOVECOTE2",
	},
	ConstructionVisual = "PREFAB_POULTRYFARM_DOVECOTE2_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 2.75, {0, 0}, 14 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createCircle( 1.25, {0, 2.8}, 14 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_DOVE",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 50 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 2 },
            },
		},
	},
})



-- Building Part: Dovecote 3: wood silo -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_POULTRYFARM_DOVECOTE3",
	Name = "BUILDING_PART_POULTRYFARM_DOVECOTE_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_POULTRYFARM_DOVECOTE3",
	},
	ConstructionVisual = "PREFAB_POULTRYFARM_DOVECOTE3_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {3.7, 3.7}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
            {
                Polygon = polygon.createRectangle( {1.5, 2.5}, {0, 1.75} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_DOVE",
	Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 50 },
            -- { Resource = "BV1_EGG", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
		ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 4 },
                { Resource = "STONE", Quantity = 2 },
                { Resource = "TOOL", Quantity = 2 },
            },
		},
	},
})



-- Register cart -------------------------------------------------------------------------------------
local function registerCart(idResource, nameSetList, typeResource, listPrereq)

    -- Assets
    mod:registerAssetId("models/PoultryCart2.fbx/Prefab/" .. idResource .. ".PART", "PREFAB_POULTRYFARM_MARKETCART_" .. idResource)

    -- Paths
    mod:registerAssetId("models/PoultryCart2.fbx/Prefab/" .. idResource .. ".PART/PATH_A_1." .. idResource, "PATH_POULTRYCART_" .. idResource .. "_1")
    mod:registerAssetId("models/PoultryCart2.fbx/Prefab/" .. idResource .. ".PART/PATH_B_1." .. idResource, "PATH_POULTRYCART_" .. idResource .. "_2")
    mod:registerAssetId("models/PoultryCart2.fbx/Prefab/" .. idResource .. ".PART/PATH_C_1." .. idResource, "PATH_POULTRYCART_" .. idResource .. "_3")
    mod:registerAssetId("models/PoultryCart2.fbx/Prefab/" .. idResource .. ".PART/PATH_D_1." .. idResource, "PATH_POULTRYCART_" .. idResource .. "_4")

    mod:registerPrefabComponent("PREFAB_POULTRYFARM_MARKETCART_" .. idResource, {
        DataType = "COMP_BUILDING_PART",
        PathList = {
            {
                PathType = BUILDING_PATH_TYPE.DEFAULT,
                WayPointList = { "PATH_POULTRYCART_" .. idResource .. "_1" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_POULTRYCART_" .. idResource .. "_2" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_POULTRYCART_" .. idResource .. "_3" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_POULTRYCART_" .. idResource .. "_4" }
            },
        }
    })

    -- Building Function
    mod:registerAsset({
        DataType = "BUILDING_FUNCTION_MARKET",
        Id = "BUILDING_FUNCTION_POULTRYFARM_MARKETCART_" .. idResource,
        Name = "BUILDING_FUNCTION_POULTRYFARM_MARKETCART_" .. idResource .. "_NAME",
        WorkerCapacity = 1,
        RelatedJob = {
            Job = "MARKET_TENDER",
            Behavior = "BEHAVIOR_MARKET_TENDING",
        },
        TypeList = { typeResource },
        IsOverrideCapacity = true,
        CapacityPerSlot = 20,
    })

    -- Building Part
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_POULTRYFARM_MARKETCART_" .. idResource,
        Name = "BUILDING_PART_POULTRYFARM_MARKETCART_" .. idResource .. "_NAME",
        AssetBuildingFunction = "BUILDING_FUNCTION_POULTRYFARM_MARKETCART_" .. idResource,
        Category = "MARKET_STALL",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_POULTRYFARM_MARKETCART_" .. idResource,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 20.0,
            },
        },
        BuildingZone = {
            ZoneEntryList = {
                {
                    Polygon = polygon.createRectangle( {1, 1}, {0, 0} ),
                    Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
                },
            },
        },
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 5 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
            ResourceNeededList = {
                {
                    { Resource = "PLANK", Quantity = 2 },
                },
            },
        },
        DesirabilityModifiers = { {
            Desirability = "DESIRABILITY_RESIDENTIAL",
            Type = "ADD",
            Radius = 25.0,
            Value = 0.5,
        } },
    })

end

registerCart("RESOURCE_POULTRY", "FOOD", "POULTRYFARM_POULTRY_RESOURCE_TYPE", nil)
registerCart("BV1_EGG", "FOOD", "POULTRYFARM_EGG_RESOURCE_TYPE", nil)



-- -- Add chicken houses and birds to the House monuments ----------------------------------------------------------------------------------------------
-- mod:overrideAsset({
-- 	Id = "BUILDING_HOUSE",
-- 	AssetBuildingPartList = {
--         Action = "APPEND",
--         "BUILDING_PART_POULTRYFARM_CHICKENHOUSE_EGGS",
--         "BUILDING_PART_POULTRYFARM_CHICKEN_FLOCK",
--     },
-- })

