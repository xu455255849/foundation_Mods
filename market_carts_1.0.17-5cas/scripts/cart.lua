local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/MarketCart1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Particle: Honey Cart bees -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/MarketCart1.fbx/Prefab/HONEY.PART/BeeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_BEEKEEPER_BEES",
	IsPlaying = true,
	IsEmitting = true,
})

mod:registerPrefabComponent("models/MarketCart1.fbx/Prefab/HONEY.PART/BeeEmitter", {
	DataType = "COMP_PARTICLE_EMITTER_TOGGLE",
	Enabled = false,
})



-- Register cart -------------------------------------------------------------------------------------
local function registerCart(idResource, nameSetList, typeResource, listPrereq)

    -- Resource
    mod:overrideAsset({
        Id = idResource,
        ResourceTypeList = { Action = "APPEND", typeResource },
    })

    -- Assets
    mod:registerAssetId("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART", "PREFAB_MARKETCART_" .. idResource)

    -- Paths
    mod:registerAssetId("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART/PATH_A_1." .. idResource, "PATH_MARKETCART_" .. idResource .. "_1")
    mod:registerAssetId("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART/PATH_B_1." .. idResource, "PATH_MARKETCART_" .. idResource .. "_3")
    mod:registerAssetId("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART/PATH_C_1." .. idResource, "PATH_MARKETCART_" .. idResource .. "_4")
    mod:registerAssetId("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART/PATH_D_1." .. idResource, "PATH_MARKETCART_" .. idResource .. "_5")

    mod:registerPrefabComponent("models/MarketCart1.fbx/Prefab/" .. idResource .. ".PART", {
        DataType = "COMP_BUILDING_PART",
        PathList = {
            {
                PathType = BUILDING_PATH_TYPE.DEFAULT,
                WayPointList = { "PATH_MARKETCART_" .. idResource .. "_1" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_MARKETCART_" .. idResource .. "_3" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_MARKETCART_" .. idResource .. "_4" }
            },
            {
                PathType = BUILDING_PATH_TYPE.PICKUP,
                WayPointList = { "PATH_MARKETCART_" .. idResource .. "_5" }
            },
        }
    })

    -- Building Function
    mod:registerAsset({
        DataType = "BUILDING_FUNCTION_MARKET",
        Id = "BUILDING_FUNCTION_MARKETCART_" .. idResource,
        Name = "BUILDING_FUNCTION_MARKETCART_" .. idResource .. "_NAME",
        WorkerCapacity = 1,
        RelatedJob = {
            Job = "MARKET_TENDER",
            Behavior = "BEHAVIOR_MARKET_TENDING"
        },
        TypeList = { typeResource },
        IsOverrideCapacity = true,
        CapacityPerSlot = 20,
    })

    -- Building part
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_MARKETCART_" .. idResource,
        Name = "BUILDING_PART_MARKETCART_" .. idResource .. "_NAME",
        Category = "MARKET_STALL",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_MARKETCART_" .. idResource,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0, 0, 0 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 20.0
            },
        },
        AssetBuildingFunction = "BUILDING_FUNCTION_MARKETCART_" .. idResource,
        BuildingZone = {
            ZoneEntryList = {
                {
                    Polygon = polygon.createRectangle( {1.1, 1.1}, {0, 0} ),
                    Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true }
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
            }
        },
        DesirabilityModifiers = { {
            Desirability = "DESIRABILITY_RESIDENTIAL",
            Type = "ADD",
            Radius = 25.0,
            Value = 0.5
        } }
    })
end

registerCart("BERRIES", "FOOD", "RESOURCE_TYPE_BERRIES", nil)
registerCart("BREAD", "FOOD", "RESOURCE_TYPE_BREAD", nil)
registerCart("CHEESE", "FOOD", "RESOURCE_TYPE_CHEESE", nil)
registerCart("FISH", "FOOD", "RESOURCE_TYPE_FISH", {"UNLOCKABLE_LABOUR_FISHING_HUT"})
registerCart("HONEY", "LUXURY", "RESOURCE_TYPE_HONEY", nil)



-- Unlock building parts ---------------------------------------------------------------------------------------------

-- Sub-Building: Market Carts
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_MARKETCART",
	Name = "BUILDING_MARKETCART_NAME",
    BuildingType = "LOGISTICS",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_MARKETCART_BERRIES",
    AssetBuildingPartList = {
        "BUILDING_PART_MARKETCART_BERRIES",
    },
	IsEditable = true,
})

mod:overrideAsset({
    Id = "MONUMENT_MARKET",
	SubAssetBuildingList = {
        Action = "APPEND",
        "BUILDING_MARKETCART",
    },
})

-- Bread cart
mod:overrideAsset({
    Id = "UNLOCKABLE_COMMON_FARMING_PRODUCTION",
	ActionList = {
        Action = "APPEND",
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_MARKETCART",
                        AssetBuildingPartList = {
                            "BUILDING_PART_MARKETCART_BREAD",
                        },
                    },
                },
            },
        },
    },
})

-- Cheese cart
mod:overrideAsset({
    Id = "UNLOCKABLE_COMMON_DAIRY_FARMING_PRODUCTION",
	ActionList = {
        Action = "APPEND",
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_MARKETCART",
                        AssetBuildingPartList = {
                            "BUILDING_PART_MARKETCART_CHEESE",
                        },
                    },
                },
            },
        },
    },
})

-- Fish cart
mod:overrideAsset({
    Id = "UNLOCKABLE_COMMON_FISHING_HUT",
	ActionList = {
        Action = "APPEND",
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_MARKETCART",
                        AssetBuildingPartList = {
                            "BUILDING_PART_MARKETCART_FISH",
                        },
                    },
                },
            },
        },
    },
})

-- Honey cart
mod:overrideAsset({
    Id = "UNLOCKABLE_CLERGY_MONASTERY_APIARY",
	ActionList = {
        Action = "APPEND",
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "BUILDING_MARKETCART",
                        AssetBuildingPartList = {
                            "BUILDING_PART_MARKETCART_HONEY",
                        },
                    },
                },
            },
        },
    },
})



-- Reciprocal code to add modded carts if they are loaded before this mod

-- Furniture
if foundation.isModLoaded("4a8d3ff2-60af-4c75-8950-33e990975862") then

    mod:overrideAsset({
        Id = "UNLOCKABLE_BUILDING_FURNITURE",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_FURNITURE_JOINER_CART",
                            },
                        },
                    },
                },
            },
        },
    })

end


-- Orchard
if foundation.isModLoaded("f252f14d-ca1d-4d02-97ca-46581d4b567d") then

    mod:overrideAsset({
        Id = "UNLOCKABLE_BUILDING_ORCHARD",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_ORCHARD_CART",
                            },
                        },
                    },
                },
            },
        },
    })

end


-- Basic Materials
if foundation.isModLoaded("d757c3ab-0148-4290-aa51-5559329f5640") then

    mod:overrideAsset({
        Id = "UNLOCKABLE_BUILDING_BASIC_CLAY",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_BASIC_POTTERCART",
                            },
                        },
                    },
                },
            },
        },
    })

end


-- Livestock
if foundation.isModLoaded("f6361b64-05d3-4ab5-a2db-b3b60dc4d307") then

    mod:overrideAsset({
        -- Id = "UNLOCKABLE_LIVESTOCKFARM_BUTCHER",
        Id = "UNLOCKABLE_COMMON_HUNTERS_HUT",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_LIVESTOCKFARM_BUTCHERMARKET",
                            },
                        },
                    },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "UNLOCKABLE_COMMON_DAIRY_FARMING_PRODUCTION",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_LIVESTOCKFARM_CREAMERYMARKET",
                            },
                        },
                    },
                },
            },
        },
    })

end


-- Vegetables and Poultry
if foundation.isModLoaded("c8b63172-5b6d-45eb-9fab-a40c8ecd9947") then

    mod:overrideAsset({
        Id = "UNLOCKABLE_BUILDING_POULTRYFARM",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_POULTRYFARM_MARKETCART_RESOURCE_POULTRY",
                                "BUILDING_PART_POULTRYFARM_MARKETCART_BV1_EGG",
                            },
                        },
                    },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "UNLOCKABLE_BUILDING_VEGETABLEFARM",
        ActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
                BuildingProgressData = {
                    AdditionalBuildingUnlockList = {
                        {
                            OwnerBuilding = "BUILDING_MARKETCART",
                            AssetBuildingPartList = {
                                "BUILDING_PART_VEGETABLEFARM_MARKETCART",
                            },
                        },
                    },
                },
            },
        },
    })

end