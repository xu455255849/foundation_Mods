local mod = ...


-- Market cart for butter -------------------------------------------------------------------------------------
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        OwnerBuilding = "BUILDING_MARKETCART",
        AssetBuildingPartList = {
            "BUILDING_PART_LIVESTOCKFARM_CREAMERYMARKET",
        },
    }
end



-- Building: Cattle Farm -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_SET1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_SET2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SETLIST_LIVESTOCKFARM_SET3")

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_CATTLE",
	Name = "BUILDING_LIVESTOCKFARM_CATTLE_NAME",
	Description = "BUILDING_LIVESTOCKFARM_CATTLE_DESC",
    BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_DAIRY_FARM",
    SubAssetBuildingList = {
        "BUILDING_LIVESTOCKFARM_CATTLE_YARD",
        "BUILDING_LIVESTOCKFARM_CATTLE_PASTURE",
        "BUILDING_LIVESTOCKFARM_PROCESS",
        -- "BUILDING_LIVESTOCKFARM_CATTLE_PROCESS",
        -- "BUILDING_LIVESTOCKFARM_HAYSTACK",
    },
	-- AssetBuildingPartList = {
    --     "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD",
    --     "BUILDING_PART_LIVESTOCKFARM_HAYSTACK",

    --     "BUILDING_PART_DAIRY_FARM",

    --     -- "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER",

    --     "BUILDING_PART_POULTRYFARM_DUNGHEAP",
    --     "BUILDING_PART_LIVESTOCKFARM_MILKCART",
    -- },
})

-- Intensive
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_CATTLE_YARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD_NAME",
    Description = "BUILDING_LIVESTOCKFARM_CATTLE_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_CATTLEYARD",
        "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- Pasture
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_CATTLE_PASTURE",
	Name = "BUILDING_PART_LIVESTOCKFARM_CATTLEPASTURE_NAME",
    Description = "BUILDING_LIVESTOCKFARM_CATTLE_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        -- "BUILDING_PART_LIVESTOCKFARM_CATTLEBARN",
        "BUILDING_PART_DAIRY_FARM",
        "BUILDING_PART_LIVESTOCKFARM_CATTLEPEN_SLAUGHTER",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
    -- DataConstructionValidationConditionList = {
    --     {
    --         DataType = "GAME_CONDITION_FAR_FROM_OTHER_BUILDINGS",
    --         MaxTestDistance = 20,
    --         TestedBuildingType = {
    --             GENERAL = true,
    --             MONUMENT = true,
    --             HOUSING = true,
    --             MASTERPIECE = true,
    --             WALL = true,
    --             RESOURCE_PRODUCTION = true,
    --             FOOD_PRODUCTION = true,
    --             GOODS_PRODUCTION = true,
    --             LOGISTICS = true,
    --             SERVICE = true,
    --             ADMINISTRATION = true,
    --             MODS = true,
    --             TRANSPORTATION = true,
    --         },
    --     },
    -- },
})

-- Processing
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_PROCESS",
	Name = "CATEGORY_BUILDING_PART_SETLIST_LIVESTOCKFARM_CATTLE4",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_HAYSTACK",
        "BUILDING_PART_POULTRYFARM_DUNGHEAP",
	},
	IsEditable = true,
})


-- Unlockable
mod:registerAssetId("icons/UnlockableCattle.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_CATTLE", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_LIVESTOCKFARM_CATTLE",
    Name = "BUILDING_LIVESTOCKFARM_CATTLE_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_CATTLE",
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
                Quantity = 100,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_LIVESTOCKFARM_CATTLE",
                    "BUILDING_LIVESTOCKFARM_CREAMERY",
                },
                AdditionalBuildingUnlockList = {
                    marketCart,
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_LIVESTOCKFARM_CATTLE",
    },
})



-- Update Dairy Farming Unlockable ----------------------------------------------------------------------------------------
mod:overrideAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_COMMON_DAIRY_FARMING_PRODUCTION",

    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_CHEESE_MAKER",
                },
            },
        },
    },
})



-- Building: Sheep Farm -------------------------------------------------------------------------------------

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_SHEEP",
	Name = "BUILDING_LIVESTOCKFARM_SHEEP_NAME",
	Description = "BUILDING_LIVESTOCKFARM_SHEEP_DESC",
    BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_SHEEP_FARM",
    SubAssetBuildingList = {
        "BUILDING_LIVESTOCKFARM_SHEEP_YARD",
        "BUILDING_LIVESTOCKFARM_SHEEP_PASTURE",
        "BUILDING_LIVESTOCKFARM_PROCESS",
        -- "BUILDING_LIVESTOCKFARM_SHEEP_PROCESS",
        -- "BUILDING_LIVESTOCKFARM_HAYSTACK",
    },
})

-- Intensive
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_SHEEP_YARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD_NAME",
    Description = "BUILDING_LIVESTOCKFARM_SHEEP_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD",
        "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
        "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- Pasture
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_SHEEP_PASTURE",
	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPASTURE_NAME",
    Description = "BUILDING_LIVESTOCKFARM_SHEEP_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        -- "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN",
        "BUILDING_PART_SHEEP_FARM",
        "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
        "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
    -- DataConstructionValidationConditionList = {
    --     {
    --         DataType = "GAME_CONDITION_FAR_FROM_OTHER_BUILDINGS",
    --         MaxTestDistance = 20,
    --         TestedBuildingType = {
    --             GENERAL = true,
    --             MONUMENT = true,
    --             HOUSING = true,
    --             MASTERPIECE = true,
    --             WALL = true,
    --             RESOURCE_PRODUCTION = true,
    --             FOOD_PRODUCTION = true,
    --             GOODS_PRODUCTION = true,
    --             LOGISTICS = true,
    --             SERVICE = true,
    --             ADMINISTRATION = true,
    --             MODS = true,
    --             TRANSPORTATION = true,
    --         },
    --     },
    -- },
})

-- -- Processing
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_SHEEP_PROCESS",
-- 	Name = "CATEGORY_BUILDING_PART_SETLIST_LIVESTOCKFARM_SET3",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK",
--         "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR",
--         "BUILDING_PART_POULTRYFARM_DUNGHEAP",
-- 	},
-- 	IsEditable = true,
-- })

-- Remove Sheep Farm from Clothing Unlockable
mod:overrideAsset({
    Id = "UNLOCKABLE_COMMON_CLOTHING_PRODUCTION",
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                UnlockName = "CLOTHING",
                AssetBuildingList = {
                    "BUILDING_WEAVER_HUT",
                    "BUILDING_TAILOR_WORKSHOP",
                },
            },
        },
    },
})

-- Unlockable
mod:registerAssetId("icons/UnlockableSheep.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_SHEEP", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_LIVESTOCKFARM_SHEEP",
    Name = "BUILDING_LIVESTOCKFARM_SHEEP_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_SHEEP",
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
                Quantity = 100,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_LIVESTOCKFARM_SHEEP",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_LIVESTOCKFARM_SHEEP",
    },
})



-- Building: Pig Farm -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_PIG",
	Name = "BUILDING_LIVESTOCKFARM_PIG_NAME",
	Description = "BUILDING_LIVESTOCKFARM_PIG_DESC",
    BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_LIVESTOCKFARM_PIGDECORATIVE",
    SubAssetBuildingList = {
        "BUILDING_LIVESTOCKFARM_PIG_YARD",
        "BUILDING_LIVESTOCKFARM_PIG_SILO",
    },
	-- AssetBuildingPartList = {
    --     "BUILDING_PART_LIVESTOCKFARM_PIGYARD",
    --     "BUILDING_PART_LIVESTOCKFARM_SILO",

    --     "BUILDING_PART_LIVESTOCKFARM_PIGPEN",

    --     "BUILDING_PART_POULTRYFARM_DUNGHEAP",
    --     "BUILDING_PART_LIVESTOCKFARM_PIGDECORATIVE",
    -- },
})

-- Intensive
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_PIG_YARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_PIGYARD_NAME",
    Description = "BUILDING_LIVESTOCKFARM_PIG_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_PIGYARD",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- Silo
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_PIG_SILO",
	Name = "BUILDING_PART_LIVESTOCKFARM_SILO_NAME",
    Description = "BUILDING_LIVESTOCKFARM_PIG_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_SILO1",
        "BUILDING_PART_LIVESTOCKFARM_SILO2",
	},
	IsEditable = true,
})

-- -- Processing
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_PIG_PROCESS",
-- 	Name = "CATEGORY_BUILDING_PART_SETLIST_LIVESTOCKFARM_SET3",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_PIGPEN",
--         "BUILDING_PART_POULTRYFARM_DUNGHEAP",
-- 	},
-- 	IsEditable = true,
-- })


-- Unlockable
mod:registerAssetId("icons/UnlockablePig.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_PIG", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_LIVESTOCKFARM_PIG",
    Name = "BUILDING_LIVESTOCKFARM_PIG_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_PIG",
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
                Quantity = 100,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_LIVESTOCKFARM_PIG",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T3",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_LIVESTOCKFARM_PIG",
    },
})



-- Building: Goat Farm -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_LIVESTOCKFARM_GOAT",
	Name = "BUILDING_LIVESTOCKFARM_GOAT_NAME",
	Description = "BUILDING_LIVESTOCKFARM_GOAT_DESC",
    BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_LIVESTOCKFARM_GOATSHED",
        "BUILDING_PART_LIVESTOCKFARM_GOATPEN_SLAUGHTER",
	},
    AssetMiniatureBuildingPart = "BUILDING_PART_LIVESTOCKFARM_GOATSHED",
    -- SubAssetBuildingList = {
    --     "BUILDING_LIVESTOCKFARM_GOATSHED",
    --     "BUILDING_LIVESTOCKFARM_GOAT_PROCESS",
    -- },
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- -- Barn
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_GOATSHED",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_GOATSHED_NAME",
--     Description = "BUILDING_LIVESTOCKFARM_GOAT_DESC",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_GOATSHED",
-- 	},
-- 	IsEditable = true,
--     RequiredPartList = {
--         {
--             Category = "PRODUCTION",
--             Min = 1,
--             Max = 1,
--         },
--     },
-- })

-- -- Processing
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_GOAT_PROCESS",
-- 	Name = "CATEGORY_BUILDING_PART_SETLIST_LIVESTOCKFARM_SET3",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_GOATPEN_MILK",
-- 	},
-- 	IsEditable = true,
-- })


-- Unlockable
mod:registerAssetId("icons/UnlockableGoat.png", "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_GOAT", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_LIVESTOCKFARM_GOAT",
    Name = "BUILDING_LIVESTOCKFARM_GOAT_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_GOAT",
    DataCost = {
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
                    "BUILDING_LIVESTOCKFARM_GOAT",
                    "BUILDING_LIVESTOCKFARM_CREAMERY",
                },
                AdditionalBuildingUnlockList = {
                    marketCart,
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_LIVESTOCKFARM_GOAT",
    },
})



-- -- Hay farm sub-building
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_LIVESTOCKFARM_HAYSTACK",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_HAYSTACK_NAME",
--     AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
--     AssetBuildingPartList = {
--         "BUILDING_PART_LIVESTOCKFARM_HAYSTACK",
-- 	},
-- 	IsEditable = true,
-- })
