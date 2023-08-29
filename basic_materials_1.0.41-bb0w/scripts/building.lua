local mod = ...



-- Update building costs -----------------------------------------------------------------------------------------

-- House Serf Level 1
mod:overrideAsset({
    Id = "BUILDING_PART_HOUSING_SERF_DENSITY_1",
    Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 12 },
                { Resource = "RESOURCE_THATCH", Quantity = 6 },
                { Resource = "RESOURCE_CLAY", Quantity = 6 },
            },
        },
    },
})

-- House Serf Level 2
mod:overrideAsset({
    Id = "BUILDING_PART_HOUSING_SERF_DENSITY_2",
    Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "RESOURCE_THATCH", Quantity = 12 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
            },
        },
    },
})

-- House Commoner Level 1
mod:overrideAsset({
    Id = "BUILDING_PART_HOUSING_CITIZEN_DENSITY_1",
    Cost = {
        -- UpkeepCost = {
        --     { Resource = "GOLD_COINS", Quantity = 8 },
        -- },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                { Resource = "STONE", Quantity = 10 },
            },
        },
    },
})

-- House Commoner Level 2
mod:overrideAsset({
    Id = "BUILDING_PART_HOUSING_CITIZEN_DENSITY_2",
    Cost = {
        -- UpkeepCost = {
        --     { Resource = "GOLD_COINS", Quantity = 14 },
        -- },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 30 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 20 },
                { Resource = "STONE", Quantity = 20 },
            },
        },
    },
})

-- Well
mod:overrideAsset({
    Id = "BUILDING_PART_WELL",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "STONE", Quantity = 8 },
                { Resource = "TOOL", Quantity = 5 },
                { Resource = "RESOURCE_TILE", Quantity = 2 },
            },
        },
    },
})

-- Sawmill
mod:overrideAsset({
    Id = "BUILDING_PART_SAWMILL",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 6 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 6 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
            },
        },
    },
})

-- Stonemason hut
mod:overrideAsset({
    Id = "BUILDING_PART_STONEMASON",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 3 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "STONE", Quantity = 2 },
                { Resource = "WOOLEN_CLOTH", Quantity = 5 },
                { Resource = "TOOL", Quantity = 2 },
            },
        },
    },
})

-- Granary
mod:overrideAsset({
    Id = "BUILDING_PART_GRANARY",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "TOOL", Quantity = 4 },
            },
        },
    },
})

-- Warehouse
mod:overrideAsset({
    Id = "BUILDING_PART_WAREHOUSE",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "TOOL", Quantity = 4 },
            },
        },
    },
})

-- Foresters camp
mod:overrideAsset({
    Id = "BUILDING_PART_FORESTER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 1 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 1 },
            },
        },
    },
})

-- Dairy farm
mod:overrideAsset({
    Id = "BUILDING_PART_DAIRY_FARM",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 150 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 5 },
                { Resource = "RESOURCE_THATCH", Quantity = 10 },
            },
        },
    },
})

-- Blacksmith
mod:overrideAsset({
    Id = "BUILDING_PART_BLACKSMITH",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "STONE", Quantity = 20 },
                { Resource = "POLISHED_STONE", Quantity = 5 },
                { Resource = "RESOURCE_CLAY", Quantity = 5 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
            },
        },
    },
})

-- Iron Smelter
mod:overrideAsset({
    Id = "BUILDING_PART_IRON_SMELTER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "STONE", Quantity = 20 },
                { Resource = "RESOURCE_CLAY", Quantity = 4 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
            },
        },
    },
})

-- Coal hut
mod:overrideAsset({
    Id = "BUILDING_PART_COAL_HUT",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 5 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 5 },
            },
        },
    },
})

-- Sheep farm
mod:overrideAsset({
    Id = "BUILDING_PART_SHEEP_FARM",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 100 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 15 },
                { Resource = "STONE", Quantity = 2 },
                { Resource = "RESOURCE_THATCH", Quantity = 6 },
                { Resource = "TOOL", Quantity = 5 },
            },
        },
    },
})

-- Wheat farm
mod:overrideAsset({
    Id = "BUILDING_PART_WHEAT_FARM",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 15 },
                { Resource = "PLANK", Quantity = 5 },
                { Resource = "STONE", Quantity = 2 },
                { Resource = "TOOL", Quantity = 8 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
                { Resource = "RESOURCE_THATCH", Quantity = 12 },
            },
        },
    },
})

-- Bakery
mod:overrideAsset({
    Id = "BUILDING_PART_BAKERY",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 10 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 5 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
            },
        },
    },
})

-- Windmill
mod:overrideAsset({
    Id = "BUILDING_PART_WINDMILL",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "STONE", Quantity = 15 },
                { Resource = "TOOL", Quantity = 15 },
                { Resource = "RESOURCE_CLAY", Quantity = 8 },
                { Resource = "RESOURCE_TILE", Quantity = 6 },
            },
        },
    },
})

-- Weaver
mod:overrideAsset({
    Id = "BUILDING_PART_WEAVER_HUT",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 15 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
            },
        },
    },
})

-- Tailor
mod:overrideAsset({
    Id = "BUILDING_PART_TAILOR_WORKSHOP",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 15 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "STONE", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
            },
        },
    },
})

-- Fisher
mod:overrideAsset({
    Id = "BUILDING_PART_FISHING_HUT",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
            },
        },
    },
})

-- Hunter's Hut
mod:overrideAsset({
    Id = "BUILDING_PART_HUNTERS_HUT",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 1 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
            },
        },
    },
})

-- Cheese maker
mod:overrideAsset({
    Id = "BUILDING_PART_CHEESE_MAKER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 15 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
                { Resource = "RESOURCE_SHINGLE", Quantity = 14 },
            },
        },
    },
})

-- Brewery
mod:overrideAsset({
    Id = "BUILDING_PART_BREWERY",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 15 },
                { Resource = "PLANK", Quantity = 20 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 8 },
                { Resource = "RESOURCE_TILE", Quantity = 10 },
            },
        },
    },
})

-- Hop farm
mod:overrideAsset({
    Id = "BUILDING_PART_HOP_FARM",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 15 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 8 },
                { Resource = "RESOURCE_TILE", Quantity = 10 },
            },
        },
    },
})

-- Cooperage
mod:overrideAsset({
    Id = "BUILDING_PART_COOPERAGE",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 8 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 12 },
                { Resource = "RESOURCE_TILE", Quantity = 8 },
            },
        },
    },
})

-- Vineyard
mod:overrideAsset({
    Id = "BUILDING_PART_VINEYARD",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 15 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 4 },
                { Resource = "PLANK", Quantity = 2 },
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "TOOL", Quantity = 6 },
            },
        },
    },
})

-- Weaponsmith
mod:overrideAsset({
    Id = "BUILDING_PART_WEAPONSMITH",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 8 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "TOOL", Quantity = 15 },
                { Resource = "RESOURCE_CLAY", Quantity = 10 },
                { Resource = "RESOURCE_TILE", Quantity = 10 },
            },
        },
    },
})

-- Gold Smelter
mod:overrideAsset({
    Id = "BUILDING_PART_GOLD_SMELTER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 30 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 8 },
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 2 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 4 },
                { Resource = "RESOURCE_TILE", Quantity = 6 },
            },
        },
    },
})

-- Glass Smelter
mod:overrideAsset({
    Id = "BUILDING_PART_GLASS_SMELTER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 25 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
                { Resource = "PLANK", Quantity = 4 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
                { Resource = "WOOLEN_CLOTH", Quantity = 2 },
            },
        },
    },
})


-- Candlemaker
mod:overrideAsset({
    Id = "BUILDING_PART_CANDLE_WORKSHOP_CORE",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 25 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 12 },
                { Resource = "WOOD", Quantity = 8 },
                { Resource = "PLANK", Quantity = 12 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 12 },
                { Resource = "RESOURCE_TILE", Quantity = 12 },
            },
        },
    },
})

mod:overrideAsset({
    Id = "BUILDING_PART_CANDLE_WORKSHOP_EXTENSION",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 4 },
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 6 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 4 },
                { Resource = "RESOURCE_TILE", Quantity = 4 },
            },
        },
    },
})


-- Common Wares
mod:overrideAsset({
    Id = "BUILDING_PART_COMMON_WARES_WORKSHOP_CORE",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 25 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 12 },
                { Resource = "WOOD", Quantity = 8 },
                { Resource = "PLANK", Quantity = 12 },
                { Resource = "TOOL", Quantity = 12 },
                { Resource = "RESOURCE_CLAY", Quantity = 10 },
                { Resource = "RESOURCE_TILE", Quantity = 8 },
            },
        },
    },
})

mod:overrideAsset({
    Id = "BUILDING_PART_COMMON_WARES_WORKSHOP_TOWER",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 20 }
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 10 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 4 },
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 6 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 4 },
                { Resource = "RESOURCE_TILE", Quantity = 2 },
            },
        },
    },
})


-- Jeweler
mod:overrideAsset({
    Id = "BUILDING_PART_JEWELER_CORE",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 35 },
        },
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 25 },
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 6 },
                { Resource = "WOOD", Quantity = 2 },
                { Resource = "PLANK", Quantity = 4 },
                { Resource = "TOOL", Quantity = 2 },
                { Resource = "RESOURCE_CLAY", Quantity = 10 },
            },
        },
    },
})


-- Butchery
mod:overrideAsset({
    Id = "BUILDING_PART_BUTCHERY_CORE",
    Cost = {
        BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 6 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
                { Resource = "RESOURCE_CLAY", Quantity = 10 },
                { Resource = "RESOURCE_TILE", Quantity = 10 },
            },
        },
    },
})



-- Building Part: Vegetable Farm (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("c8b63172-5b6d-45eb-9fab-a40c8ecd9947")) then

    for i = 1, 4 do
        mod:overrideAsset({
            Id = "BUILDING_PART_VEGETABLEFARM_FARM" .. i,
            Cost = {
                BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 5 } },
                UpkeepCost = { 
                    { Resource = "GOLD_COINS", Quantity = 5 },
                },
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 10 },
                        { Resource = "STONE", Quantity = 6 },
                        { Resource = "PLANK", Quantity = 6 },
                        { Resource = "TOOL", Quantity = 8 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                    },
                },
            },
        })
    end

    mod:overrideAsset({
        Id = "BUILDING_PART_POULTRYFARM_DOVECOTE1",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 5 }
            },
                ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "TOOL", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 2 },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_POULTRYFARM_DOVECOTE3",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 },
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
                    { Resource = "RESOURCE_SHINGLE", Quantity = 2 },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_POULTRYFARM_GOOSEHOUSE",
        Cost = {
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 1 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "TOOL", Quantity = 2 },
                    { Resource = "RESOURCE_THATCH", Quantity = 8 },
                },
            },
        },
    })

end



-- Building Part: Water mill (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("162964c3-f084-4062-b7d4-7a50487f28ef")) then
	mod:overrideAsset({
		Id = "WATER_MILL_CORE_FLOUR_PART",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})
	mod:overrideAsset({
		Id = "WATER_MILL_CORE_TEXTILE_PART",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})
	mod:overrideAsset({
		Id = "WATER_MILL_CORE_PLANKS_PART",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})
	mod:overrideAsset({
		Id = "WATER_MILL_EXTENSION_RIGHT_BANK_PART",
		Cost = {
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 4 },
                },
            },
		},
	})
	mod:overrideAsset({
		Id = "WATER_MILL_EXTENSION_LEFT_BANK_PART",
		Cost = {
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 4 },
                },
            },
		},
	})
end



-- Building Part: Furniture (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("4a8d3ff2-60af-4c75-8950-33e990975862")) then
	mod:overrideAsset({
		Id = "BUILDING_PART_FURNITURE_JOINER1",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 20 },
                    { Resource = "WOOD", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 25 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "RESOURCE_CLAY", Quantity = 14 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_FURNITURE_JOINER2",
		Cost = {
			BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 25 },
            },
			UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 15 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "RESOURCE_CLAY", Quantity = 14 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})
end



-- Building Part: Livestock Farm (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("f6361b64-05d3-4ab5-a2db-b3b60dc4d307")) then

	-- mod:overrideAsset({
	-- 	Id = "BUILDING_PART_LIVESTOCKFARM_BUTCHER",
	-- 	Cost = {
	-- 		BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
	-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
	-- 		ResourceNeededList = {
    --             {
    --                 { Resource = "STONE", Quantity = 8 },
    --                 { Resource = "WOOD", Quantity = 10 },
    --                 { Resource = "PLANK", Quantity = 10 },
    --                 { Resource = "TOOL", Quantity = 10 },
    --                 { Resource = "RESOURCE_CLAY", Quantity = 10 },
    --                 { Resource = "RESOURCE_TILE", Quantity = 12 },
    --             },
    --         },
	-- 	},
	-- })

	mod:overrideAsset({
		Id = "BUILDING_PART_LIVESTOCKFARM_CREAMERY",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
			ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "STONE", Quantity = 12 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_CLAY", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})

	-- mod:overrideAsset({
	-- 	Id = "BUILDING_PART_LIVESTOCKFARM_CHANDLER",
	-- 	Cost = {
	-- 		BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
	-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
	-- 		ResourceNeededList = {
    --             {
    --                 { Resource = "WOOD", Quantity = 4 },
    --                 { Resource = "STONE", Quantity = 12 },
    --                 { Resource = "PLANK", Quantity = 8 },
    --                 { Resource = "TOOL", Quantity = 6 },
    --                 { Resource = "RESOURCE_SHINGLE", Quantity = 8 },
    --             },
    --         },
	-- 	},
	-- })

	mod:overrideAsset({
		Id = "BUILDING_PART_LIVESTOCKFARM_SILO1",
		Cost = {
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 1 },
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_CLAY", Quantity = 4 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_LIVESTOCKFARM_SILO2",
		Cost = {
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 1 },
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_CLAY", Quantity = 4 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_LIVESTOCKFARM_TANNER",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 25 },
            },
            UpkeepCost = {
                { Resource = "GOLD", Quantity = 10 },
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 4 },
                    { Resource = "RESOURCE_THATCH", Quantity = 8 },
                },
            },
		},
	})

    mod:overrideAsset({
		Id = "BUILDING_PART_LIVESTOCKFARM_COBBLER",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 25 },
            },
            UpkeepCost = {
                { Resource = "GOLD", Quantity = 10 },
            },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 14 },
                },
                {
                    { Resource = "PLANK", Quantity = 18 },
                    { Resource = "TOOL", Quantity = 10 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 10 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})

end



-- Building Part: Harbour (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("595ec1ef-de7e-44d1-94f6-e8ffae346ff1")) then

	mod:overrideAsset({
		Id = "HARBOUR_V2_LIGHT_TOWER_ROOT_PART",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 100 },
            },
            UpkeepCost = {
                { Resource = "GOLD", Quantity = 30 },
            },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 30 },
                    { Resource = "WOOD", Quantity = 14 },
                    { Resource = "PLANK", Quantity = 10 },
                    { Resource = "RESOURCE_CLAY", Quantity = 20 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "HARBOUR_V2_LIGHT_ROOF_A_PART",
		Cost = {
			ResourceNeededList = {
                {
                    { Resource = "RESOURCE_TILE", Quantity = 8 },
                },
            },
		},
	})

end



-- Building Part: Flax Farm (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("25402f80-c479-4c9b-a1c0-2bc7eedf17a1")) then
	mod:overrideAsset({
		Id = "BUILDING_PART_FLAX_FARM",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 10 },
            },
            UpkeepCost = {
                { Resource = "GOLD", Quantity = 5 },
            },
			ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 8 },
                    { Resource = "RESOURCE_THATCH", Quantity = 8 },
                },
            },
		},
	})
end



-- Building Part: Orchard (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("f252f14d-ca1d-4d02-97ca-46581d4b567d")) then
	mod:overrideAsset({
		Id = "BUILDING_PART_ORCHARD_FARM1",
		Cost = {
			BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 25 },
            },
			UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 5 },
            },
			ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "RESOURCE_THATCH", Quantity = 8 },
                },
            },
		},
	})
end



-- Building Part: Pastry (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("4de588cf-4d24-422a-bbd6-7c97c22ff496")) then

	mod:overrideAsset({
		Id = "PV4_PASTRY_WORKPLACE_PART",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 15 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 6 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "TOOL", Quantity = 6 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "PV4_CREAMERY_PART",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 15 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 6 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "TOOL", Quantity = 6 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
		},
	})

end



-- Building Part: Authority (Lord Manor) (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("93098b10-e659-49db-ae11-f08341972d46")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_HALL1",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 5 },
                    { Resource = "PLANK", Quantity = 25 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_HALL2",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 5 },
                    { Resource = "PLANK", Quantity = 25 },
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_HALL3",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 5 },
                    { Resource = "RESOURCE_CLAY", Quantity = 12 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_HALL4",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 25 },
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	-- mod:overrideAsset({
	-- 	Id = "BUILDING_PART_AUTHORITY_KITCHEN",
	-- 	Cost = {
	-- 		-- BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
	-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
	-- 		ResourceNeededList = {
    --             {
    --                 { Resource = "STONE", Quantity = 6 },
    --                 { Resource = "WOOD", Quantity = 4 },
    --                 { Resource = "PLANK", Quantity = 10 },
    --                 { Resource = "RESOURCE_SHINGLE", Quantity = 6 },
    --             },
    --         },
	-- 	},
	-- })

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE1_STEWARD",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE1_BUTLER",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE1_CHAMBERLAIN",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE1_GARDEN",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE1_QUARTERMASTER",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE2_STEWARD",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE2_BUTLER",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE2_CHAMBERLAIN",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE2_GARDEN",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_AUTHORITY_STORAGE2_QUARTERMASTER",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 4 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	-- mod:overrideAsset({
	-- 	Id = "BUILDING_PART_AUTHORITY_GARDENSHED",
	-- 	Cost = {
	-- 		-- BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 25 } },
	-- 		UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
	-- 		ResourceNeededList = {
    --             {
    --                 { Resource = "STONE", Quantity = 4 },
    --                 { Resource = "WOOD", Quantity = 1 },
    --                 { Resource = "PLANK", Quantity = 4 },
    --                 { Resource = "TOOL", Quantity = 1 },
    --                 { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
    --             },
    --         },
	-- 	},
	-- })

end



-- Building Part: Harbour Trading (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("467b9d01-c8f4-42b5-a3a9-5b026376a6a3")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_HARBORTRADE_HOUSE",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 100 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 50 } },
			ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 20 },
                    { Resource = "WOOD", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 40 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_HARBORTRADE_WAREHOUSE2",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 10 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
			ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_HARBORTRADE_WAREHOUSE5",
		Cost = {
			BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 10 } },
			UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
			ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
		},
	})

end



-- Building Part: Trading Post (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("9fc78b27-77d7-4f5f-96b2-464e458e3e06")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_POST1",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 20 },
                    { Resource = "WOOD", Quantity = 12 },
                    { Resource = "PLANK", Quantity = 12 },
                    { Resource = "TOOL", Quantity = 6 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_STABLE1",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 40 },
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "RESOURCE_THATCH", Quantity = 20 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD",
		Cost = {
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_THATCH", Quantity = 4 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS",
		Cost = {
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_THATCH", Quantity = 4 },
                },
            },
        },
	})

end



-- -- Building Part: Hospital (Override) -------------------------------------------------------------------------------------
-- if (foundation.isModLoaded("618c6eec-46f0-434d-b645-418462e889d8")) then

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_PLAGUE_HOSPITAL",
-- 		Cost = {
--             BuildRightTaxes = {
--                 { Resource = "GOLD_COINS", Quantity = 60 }
--             },
--             UpkeepCost = {
--                 { Resource = "GOLD_COINS", Quantity = 40 }
--             },
--             ResourceNeededList = {
--                 {
--                     { Resource = "STONE", Quantity = 20 },
--                     { Resource = "WOOD", Quantity = 12 },
--                     { Resource = "PLANK", Quantity = 16 },
--                     { Resource = "RESOURCE_CLAY", Quantity = 16 },
--                     { Resource = "RESOURCE_TILE", Quantity = 20 },
--                     { Resource = "POLISHED_STONE", Quantity = 10 },
--                     { Resource = "TOOL", Quantity = 4 },
--                 },
--             },
--         },
-- 	})

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_PLAGUE_HOSPITAL_BEDS",
--         Cost = {
--             UpkeepCost = {
--                 { Resource = "GOLD_COINS", Quantity = 10 }
--             },
--             ResourceNeededList = {
--                 {
--                     { Resource = "STONE", Quantity = 12 },
--                     { Resource = "WOOD", Quantity = 12 },
--                     { Resource = "RESOURCE_CLAY", Quantity = 12 },
--                     { Resource = "RESOURCE_TILE", Quantity = 16 },
--                 },
--             },
--         },
--     })

-- end



-- -- Building Part: Placeable Houses (Override) -------------------------------------------------------------------------------------
-- if (foundation.isModLoaded("23b4f5f5-b7fd-4d79-80fd-d9943211c460")) then

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_EMPTY_HOUSE_L1D1",
-- 		Cost = {
--             ResourceNeededList = {
--                 {
--                     { Resource = "WOOD", Quantity = 6 },
--                     { Resource = "RESOURCE_THATCH", Quantity = 6 },
--                     { Resource = "RESOURCE_CLAY", Quantity = 6 },
--                 },
--             },
--         },
-- 	})

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_EMPTY_HOUSE_L1D2",
-- 		Cost = {
--             ResourceNeededList = {
--                 {
--                     { Resource = "WOOD", Quantity = 12 },
--                     { Resource = "RESOURCE_THATCH", Quantity = 12 },
--                     { Resource = "RESOURCE_CLAY", Quantity = 12 },
--                 },
--             },
--         },
-- 	})

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_EMPTY_HOUSE_L2D1",
-- 		Cost = {
--             ResourceNeededList = {
--                 {
--                     { Resource = "WOOD", Quantity = 10 },
--                     { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
--                     { Resource = "STONE", Quantity = 10 },
--                 },
--             },
--         },
-- 	})

-- 	mod:overrideAsset({
-- 		Id = "BUILDING_PART_EMPTY_HOUSE_L2D2",
-- 		Cost = {
--             ResourceNeededList = {
--                 {
--                     { Resource = "WOOD", Quantity = 20 },
--                     { Resource = "RESOURCE_SHINGLE", Quantity = 20 },
--                     { Resource = "STONE", Quantity = 20 },
--                 },
--             },
--         },
-- 	})

-- end



-- Building Part: Vanioville (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("7786b0a3-cb8f-4c78-9ba6-ca3745b7c677")) then

    -- type 1
    local function registerVanioville1(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                            { Resource = "WOOD", Quantity = 6 },
                            { Resource = "PLANK", Quantity = 12 },
                            { Resource = "RESOURCE_CLAY", Quantity = 6 },
                            { Resource = "RESOURCE_THATCH", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville1("HOUSE_A")
    registerVanioville1("HOUSE_A_0")
    registerVanioville1("HOUSE_A_N")
    registerVanioville1("ASSEMBLED_HOUSE_A")


    -- type 2
    local function registerVanioville2(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 6 },
                        { Resource = "PLANK", Quantity = 6 },
                        { Resource = "RESOURCE_CLAY", Quantity = 12 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                    },
                },
            },
        })
    end

    registerVanioville2("HOUSE_B")
    registerVanioville2("HOUSE_B_0")
    registerVanioville2("HOUSE_B_N")
    registerVanioville2("ASSEMBLED_HOUSE_B")
    

    -- type 3
    local function registerVanioville3(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 6 },
                        { Resource = "PLANK", Quantity = 6 },
                        { Resource = "RESOURCE_CLAY", Quantity = 6 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                    },
                },
            },
        })
    end

    registerVanioville3("HOUSE_C")
    registerVanioville3("HOUSE_C_0")
    registerVanioville3("HOUSE_C_N")
    registerVanioville3("ASSEMBLED_HOUSE_C")


    -- type 4
    local function registerVanioville4(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 6 },
                        { Resource = "PLANK", Quantity = 6 },
                        { Resource = "STONE", Quantity = 10 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                    },
                },
            },
        })
    end

    registerVanioville4("HOUSE_D")
    registerVanioville4("HOUSE_D_0")
    registerVanioville4("HOUSE_D_N")
    -- registerVanioville4("ASSEMBLED_HOUSE_D")

    registerVanioville4("HOUSE_AH")
    registerVanioville4("HOUSE_AH_0")
    registerVanioville4("HOUSE_AH_N")
    registerVanioville4("ASSEMBLED_HOUSE_AH")

    -- registerVanioville4("RANDOM_CITIZEN_HOUSE_PART")

    
    -- type 5
    local function registerVanioville5(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 4 },
                        { Resource = "RESOURCE_CLAY", Quantity = 4 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                    },
                },
            },
        })
    end

    registerVanioville5("HOUSE_E")
    registerVanioville5("HOUSE_E_0")
    registerVanioville5("HOUSE_E_N")
    registerVanioville5("ASSEMBLED_HOUSE_E")

    
    -- type 6
    local function registerVanioville6(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 10 },
                        { Resource = "PLANK", Quantity = 10 },
                        { Resource = "STONE", Quantity = 10 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville6("HOUSE_F")
    registerVanioville6("HOUSE_F_0")
    registerVanioville6("HOUSE_F_N")
    -- registerVanioville6("ASSEMBLED_HOUSE_F")

    
    -- type 7
    local function registerVanioville7(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 12 },
                        { Resource = "PLANK", Quantity = 10 },
                        { Resource = "STONE", Quantity = 10 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville7("HOUSE_G")
    registerVanioville7("HOUSE_G_0")
    registerVanioville7("HOUSE_G_N")
    -- registerVanioville7("ASSEMBLED_HOUSE_G")

    
    -- type 8
    local function registerVanioville8(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 6 },
                        { Resource = "RESOURCE_CLAY", Quantity = 6 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                    },
                },
            },
        })
    end

    registerVanioville8("HOUSE_H")
    registerVanioville8("HOUSE_H_0")
    registerVanioville8("HOUSE_H_N")
    registerVanioville8("ASSEMBLED_HOUSE_H")

    registerVanioville8("HOUSE_O")
    registerVanioville8("HOUSE_O_0")
    registerVanioville8("HOUSE_O_N")
    registerVanioville8("ASSEMBLED_HOUSE_O")

    
    -- type 9
    local function registerVanioville9(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 12 },
                        { Resource = "PLANK", Quantity = 20 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville9("HOUSE_I")
    registerVanioville9("HOUSE_I_0")
    registerVanioville9("HOUSE_I_N")
    -- registerVanioville9("ASSEMBLED_HOUSE_I")

    registerVanioville9("HOUSE_AA")
    registerVanioville9("HOUSE_AA_0")
    registerVanioville9("HOUSE_AA_N")
    -- registerVanioville9("ASSEMBLED_HOUSE_AA")

    
    -- type 10
    local function registerVanioville10(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 12 },
                        { Resource = "PLANK", Quantity = 10 },
                        { Resource = "STONE", Quantity = 16 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville10("HOUSE_J")
    registerVanioville10("HOUSE_J_0")
    registerVanioville10("HOUSE_J_N")
    -- registerVanioville10("ASSEMBLED_HOUSE_J")

    registerVanioville10("HOUSE_R")
    registerVanioville10("HOUSE_R_0")
    registerVanioville10("HOUSE_R_N")

    registerVanioville10("HOUSE_S")
    registerVanioville10("HOUSE_S_0")
    registerVanioville10("HOUSE_S_N")

    
    -- type 11
    local function registerVanioville11(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 18 },
                        { Resource = "PLANK", Quantity = 12 },
                        { Resource = "STONE", Quantity = 12 },
                        { Resource = "RESOURCE_CLAY", Quantity = 20 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville11("HOUSE_K")
    registerVanioville11("HOUSE_K_0")
    registerVanioville11("HOUSE_K_N")
    -- registerVanioville11("ASSEMBLED_HOUSE_K")

    registerVanioville11("HOUSE_M")
    registerVanioville11("HOUSE_M_0")
    registerVanioville11("HOUSE_M_N")
    -- registerVanioville11("ASSEMBLED_HOUSE_M")

    
    -- type 12
    local function registerVanioville12(partId)
        mod:overrideAsset({
            Id = "JK_" .. partId .. "_PART",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 18 },
                        { Resource = "PLANK", Quantity = 12 },
                        { Resource = "STONE", Quantity = 12 },
                        { Resource = "RESOURCE_CLAY", Quantity = 20 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                    },
                },
            },
        })
    end

    registerVanioville12("HOUSE_L")
    registerVanioville12("HOUSE_L_0")
    registerVanioville12("HOUSE_L_N")
    -- registerVanioville12("ASSEMBLED_HOUSE_L")

    registerVanioville12("HOUSE_N")
    registerVanioville12("HOUSE_N_0")
    registerVanioville12("HOUSE_N_N")
    -- registerVanioville12("ASSEMBLED_HOUSE_N")

    registerVanioville12("HOUSE_P")
    registerVanioville12("HOUSE_P_0")
    registerVanioville12("HOUSE_P_N")
    -- registerVanioville12("ASSEMBLED_HOUSE_P")

    registerVanioville12("HOUSE_Q")
    registerVanioville12("HOUSE_Q_0")
    registerVanioville12("HOUSE_Q_N")

    registerVanioville12("HOUSE_T")
    registerVanioville12("HOUSE_T_0")
    registerVanioville12("HOUSE_T_N")

end



-- Building Part: Rustic Church Rework (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("1374ff7a-476d-4b3f-8ec4-e46d96551375")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_CE_RUSTIC_CORE1_END",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 20 },
            },
            UpkeepCost = {
                { Resource = "GOLD", Quantity = 10 },
            },
                ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 8 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "STONE", Quantity = 16 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 16 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_CE_RUSTIC_DOOR1",
		Cost = {
            ResourceNeededList = {
                {
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "TOOL", Quantity = 1 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 2 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_CE_RUSTIC_EXTENSION1_END",
		Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD", Quantity = 10 },
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 8 },
                },
            },
        },
	})

end



-- Building Part: Fishing Shacks (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("a673e06c-5bfd-4325-bd33-398fbd9e5531")) then

	mod:overrideAsset({
		Id = "JK_FISHING_SHACK_A",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 8 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "RESOURCE_THATCH", Quantity = 8 },
                },
            },
        },
	})

    mod:overrideAsset({
		Id = "JK_FISHING_SHACK_B",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 12 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                },
            },
        },
	})

    mod:overrideAsset({
		Id = "JK_FISHING_SHACK_C",
		Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 6 },
                },
            },
        },
	})

end



-- Building Part: Trading Post (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("9fc78b27-77d7-4f5f-96b2-464e458e3e06")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_POST1",
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 50 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 20 },
                    -- { Resource = "POLISHED_STONE", Quantity = 6 },
                    { Resource = "WOOD", Quantity = 12 },
                    { Resource = "PLANK", Quantity = 12 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 16 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_STABLE1",
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD_COINS", Quantity = 100 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 20 } },
            ResourceNeededList = {
                {
                    -- { Resource = "TOOL", Quantity = 6 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 10 },
                    { Resource = "RESOURCE_THATCH", Quantity = 10 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_IMPORTFOOD",
        Cost = {
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_THATCH", Quantity = 2 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_TRADINGPOST_IMPORTGOODS",
        Cost = {
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 2 },
                    { Resource = "RESOURCE_THATCH", Quantity = 2 },
                },
            },
        },
    })

end



-- Building Part: Security (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("ee00bed2-f02c-4dd2-896d-5efef8d8e2d2")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_CONSTABLEA",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 5 },
                    { Resource = "POLISHED_STONE", Quantity = 15 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 15 },
                    { Resource = "WOOD", Quantity = 10 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 10 },
                },
                {
                    { Resource = "TOOL", Quantity = 4 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 6 },
                    { Resource = "RESOURCE_TILE", Quantity = 14 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_CONSTABLED",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 35 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 15 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "RESOURCE_CLAY", Quantity = 20 },
                },
                {
                    { Resource = "WOOD", Quantity = 40 },
                },
                {
                    { Resource = "PLANK", Quantity = 40 },
                    { Resource = "TOOL", Quantity = 2 },
                },
                {
                    { Resource = "RESOURCE_SHINGLE", Quantity = 20 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER1_END",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 5 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                    { Resource = "WOOD", Quantity = 4 },
                },
                {
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER2_END",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 5 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                    { Resource = "WOOD", Quantity = 4 },
                },
                {
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER3_END",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 5 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                    { Resource = "WOOD", Quantity = 4 },
                },
                {
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER4",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 },
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 10 },
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                },
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER5",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 },
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 10 },
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                },
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER6",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 },
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 10 },
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "POLISHED_STONE", Quantity = 12 },
                },
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_TILE", Quantity = 4 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SECURITY_TOWER7",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 5 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 2 },
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "RESOURCE_CLAY", Quantity = 8 },
                },
                {
                    { Resource = "PLANK", Quantity = 12 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 6 },
                },
            },
        },
    })

end



-- Building Part: Storage (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("379a7c1c-777d-4f35-8042-7caa9c87d428")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_STORAGE_GRANARY2", -- root cellar
		Cost = {
            BuildRightTaxes = { { Resource = "GOLD_COINS", Quantity = 5 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "STONE", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 4 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_STORAGE_GRANARY4", -- barn
		Cost = {
            BuildRightTaxes = { { Resource = "GOLD_COINS", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 12 },
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 20 },
                    { Resource = "RESOURCE_THATCH", Quantity = 10 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_STORAGE_WAREHOUSE2", -- shed with thatch
		Cost = {
            BuildRightTaxes = { { Resource = "GOLD_COINS", Quantity = 5 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 6 },
                    { Resource = "STONE", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "RESOURCE_THATCH", Quantity = 4 },
                },
            },
        },
	})

	mod:overrideAsset({
		Id = "BUILDING_PART_STORAGE_WAREHOUSE4", -- shed with shingle
		Cost = {
            BuildRightTaxes = { { Resource = "GOLD_COINS", Quantity = 5 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 5 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 4 },
                    { Resource = "PLANK", Quantity = 8 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 4 },
                },
            },
        },
	})

    mod:overrideAsset({
		Id = "BUILDING_PART_STORAGE_WAREHOUSE3", -- big storehouse
		Cost = {
            BuildRightTaxes = { { Resource = "GOLD_COINS", Quantity = 10 } },
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 10 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                    { Resource = "RESOURCE_SHINGLE", Quantity = 12 },
                },
            },
        },
	})


end



-- Building Part: Fire (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("35f7b4b6-105d-4377-a727-5ea2997e556d")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_FIRE_TOWER",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
            UpkeepCost = { 
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                },
                {
                    { Resource = "PLANK", Quantity = 10 },
                    { Resource = "RESOURCE_CLAY", Quantity = 10 },
                },
                {
                    { Resource = "WOOD", Quantity = 5 },
                    { Resource = "PLANK", Quantity = 5 },
                },
                {
                    { Resource = "RESOURCE_SHINGLE", Quantity = 6 },
                },
            },
        },
    })

end



-- Building Part: Cathedral of St Anne (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("fed4da16-0a9a-49ed-b5cd-b24db6702cc0")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_CORE1", -- NAVE
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 50 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 40 },
                    { Resource = "STONE", Quantity = 40 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_CORE4", -- TRANSEPT
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 40 },
                    { Resource = "STONE", Quantity = 40 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 10 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_CORE2", -- ISLE
        Cost = {
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "STONE", Quantity = 10 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 20 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_CORE3", -- CHAPEL
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 20 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "STONE", Quantity = 10 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 10 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "RESOURCE_TILE", Quantity = 15 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_TOWER1", -- TOWER
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 100 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 40 },
                    { Resource = "STONE", Quantity = 40 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 10 },
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 10 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_SAINTANNECATHEDRAL_TOWER2", -- TOWER
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 }
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 100 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 40 },
                    { Resource = "STONE", Quantity = 40 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "TOOL", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 20 },
                    { Resource = "PLANK", Quantity = 20 },
                },
                {
                    { Resource = "POLISHED_STONE", Quantity = 10 },
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 10 },
                },
            },
        },
    })

end



-- Building Part: Guilds (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("850a58d6-2910-44ed-aaa0-8ea962b10954")) then

	mod:overrideAsset({
		Id = "BUILDING_PART_GUILD_HALL1",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 100 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 40 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 20 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 15 },
                    { Resource = "POLISHED_STONE", Quantity = 15 },
                    { Resource = "TOOL", Quantity = 10 },
                },
                {
                    { Resource = "PLANK", Quantity = 15 },
                    { Resource = "RESOURCE_TILE", Quantity = 20 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_GUILD_HALL_EXTENSION1",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 50 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 25 }
            },
            ResourceNeededList = {
                {
                    { Resource = "STONE", Quantity = 10 },
                    { Resource = "WOOD", Quantity = 10 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 10 },
                    { Resource = "POLISHED_STONE", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 2 },
                },
                {
                    { Resource = "PLANK", Quantity = 10 },
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_GUILD_HALL_BALCONY1",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 40 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 10 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 5 },
                    { Resource = "TOOL", Quantity = 5 },
                    { Resource = "PLANK", Quantity = 15 },
                },
                {
                    { Resource = "RESOURCE_CLAY", Quantity = 5 },
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                },
            },
        },
    })

	mod:overrideAsset({
		Id = "BUILDING_PART_GUILD_HALL_MARKET1",
        Cost = {
            BuildRightTaxes = {
                { Resource = "GOLD_COINS", Quantity = 30 },
            },
            UpkeepCost = {
                { Resource = "GOLD_COINS", Quantity = 15 }
            },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "TOOL", Quantity = 2 },
                    { Resource = "PLANK", Quantity = 15 },
                },
                {
                    { Resource = "RESOURCE_TILE", Quantity = 10 },
                },
            },
        },
    })

end



-- Building Part: House Expansion Set (Override) -------------------------------------------------------------------------------------
if (foundation.isModLoaded("3d454b80-08d7-4491-994d-49cbd78fa3d4")) then

    -- Serf low density
    for i = 1, 8 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 12 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                        { Resource = "RESOURCE_CLAY", Quantity = 6 },
                    },
                },
            },
        })
    end

    for i = 31, 34 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "STONE", Quantity = 6 },
                        { Resource = "WOOD", Quantity = 6 },
                        { Resource = "RESOURCE_THATCH", Quantity = 6 },
                        { Resource = "RESOURCE_CLAY", Quantity = 6 },
                    },
                },
            },
        })
    end

    -- Serf high density
    for i = 9, 24 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 20 },
                        { Resource = "RESOURCE_THATCH", Quantity = 12 },
                        { Resource = "RESOURCE_CLAY", Quantity = 12 },
                    },
                },
            },
        })
    end

    for i = 40, 45 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 20 },
                        { Resource = "RESOURCE_CLAY", Quantity = 12 },
                        { Resource = "RESOURCE_TILE", Quantity = 8 },
                    },
                },
            },
        })
    end

    for i = 131, 134 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 20 },
                        { Resource = "RESOURCE_THATCH", Quantity = 12 },
                        { Resource = "RESOURCE_CLAY", Quantity = 12 },
                    },
                },
            },
        })
    end

    -- Commoner low density
    for i = 101, 106 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 10 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "PLANK", Quantity = 20 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 10 },
                        { Resource = "STONE", Quantity = 10 },
                    },
                },
            },
        })
    end

    -- Commoner high density
    for i = 111, 122 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 20 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "PLANK", Quantity = 20 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 20 },
                        { Resource = "STONE", Quantity = 20 },
                    },
                },
            },
        })
    end

    for i = 140, 143 do
        mod:overrideAsset({
            Id = "BUILDING_PART_BATYUSHKIHOUSE_HOUSE" .. i .. "_BASE",
            Cost = {
                ResourceNeededList = {
                    {
                        { Resource = "WOOD", Quantity = 20 },
                        { Resource = "RESOURCE_CLAY", Quantity = 10 },
                        { Resource = "PLANK", Quantity = 20 },
                        { Resource = "RESOURCE_SHINGLE", Quantity = 20 },
                        { Resource = "STONE", Quantity = 20 },
                    },
                },
            },
        })
    end

end
