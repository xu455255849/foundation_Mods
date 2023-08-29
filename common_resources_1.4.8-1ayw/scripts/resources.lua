local mod = ...



-- Resource Farm (new in 1.8, RESOURCE_FOOD types show in the Granary)
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FARM" )



-- -- Resource Monastery Food
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_FOOD" )



-- Override foods
mod:overrideAsset({
    Id = "WATER",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    OrderId = 99,
})

mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_BERRIES" )
mod:overrideAsset({
    Id = "BERRIES",
	ResourceTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_BERRIES",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 1, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    OrderId = 100,
})

mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_BREAD" )
mod:overrideAsset({
    Id = "BREAD",
	-- ResourceTypeList = { "FOOD", "RESOURCE_TYPE_BREAD", "RESOURCE_TYPE_MONASTERY_FOOD",  "RESOURCE_TYPE_FOOD_LEVEL_0", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_BREAD",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 154,
})

mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FISH" )
mod:overrideAsset({
    Id = "FISH",
	-- ResourceTypeList = { "FOOD", "RESOURCE_FOOD", "RESOURCE_TYPE_FISH", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_FISH",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 106,
})

mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_CHEESE" )
mod:overrideAsset({
    Id = "CHEESE",
	ResourceTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_CHEESE",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 103,
})

mod:overrideAsset({
    Id = "BOAR",
	ResourceTypeList = {
        Action = "APPEND",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 10, } }, 
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 20, } },
    OrderId = 108,
})

mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_HONEY" )
mod:overrideAsset({
    Id = "HONEY",
	ResourceTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_HONEY",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 619,
})

mod:registerEnumValue( "RESOURCE_TYPE", "LIVESTOCKFARM_RESOURCE_TYPE" )
mod:overrideAsset({
    Id = "MILK",
	-- ResourceTypeList = { "FOOD", "RESOURCE_FOOD", "LIVESTOCKFARM_RESOURCE_TYPE", },
	ResourceTypeList = {
        Action = "APPEND",
        "LIVESTOCKFARM_RESOURCE_TYPE",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 102,
})

mod:registerAssetId("icons/Leather.png", "ICON_RESOURCE_LEATHER", "ATLAS_CELL")
mod:overrideAsset({
    Id = "LEATHER",
	Icon = "ICON_RESOURCE_LEATHER",
	ResourceTypeList = {
        "RESOURCE",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
	ResourceLayoutType = "TRUNKS",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 140,
})

mod:overrideAsset({
    Id = "WHEAT",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 150,
})

mod:overrideAsset({
    Id = "FLOUR",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    OrderId = 152,
})

mod:overrideAsset({
    Id = "WOOD",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 500,
})

mod:overrideAsset({
    Id = "PLANK",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    OrderId = 501,
})

mod:overrideAsset({
    Id = "STONE",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 505,
})

mod:overrideAsset({
    Id = "POLISHED_STONE",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 506,
})

mod:overrideAsset({
    Id = "WAX",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 509,
})

mod:overrideAsset({
    Id = "CANDLE",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 510,
})

mod:overrideAsset({
    Id = "WOOL",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 528,
})

mod:overrideAsset({
    Id = "WOOLEN_CLOTH",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 529,
})

mod:overrideAsset({
    Id = "CLOTHES",
	ResourceTypeList = {
        Action = "APPEND",
    },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 530,
})

mod:overrideAsset({
    Id = "COMMON_WARES",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 32, } },
    OrderId = 540,
})

mod:overrideAsset({
    Id = "HOP",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 607,
})

mod:overrideAsset({
    Id = "BEER",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 608,
})

mod:overrideAsset({
    Id = "GRAPES",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 609,
})

mod:overrideAsset({
    Id = "WINE",
    OrderId = 610,
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
})

mod:overrideAsset({
    Id = "MEAL",
    OrderId = 620,
})

mod:overrideAsset({
    Id = "MONASTIC_MEAL",
    -- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    OrderId = 621,
})

mod:overrideAsset({
    Id = "HERBS",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 620,
})

mod:overrideAsset({
    Id = "BARREL",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 10, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 20, } },
    OrderId = 700,
})

mod:overrideAsset({
    Id = "COAL",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 810,
})

mod:overrideAsset({
    Id = "IRON_ORE",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 880,
})

mod:overrideAsset({
    Id = "IRON",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 10, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 20, } },
    OrderId = 881,
})

mod:overrideAsset({
    Id = "MARBLE",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    OrderId = 882,
})

mod:overrideAsset({
    Id = "SCULPTURE",
    OrderId = 883,
})

mod:overrideAsset({
    Id = "GOLD_ORE",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    OrderId = 884,
})

mod:overrideAsset({
    Id = "GOLD_BARS",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 885,
})

mod:overrideAsset({
    Id = "QUARTZ",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    OrderId = 886,
})

mod:overrideAsset({
    Id = "GLASS",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 32, } },
    OrderId = 887,
})

mod:overrideAsset({
    Id = "STAINED_GLASS",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 48, } },
    OrderId = 888,
})

mod:overrideAsset({
    Id = "TOOL",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 999,
})

mod:overrideAsset({
    Id = "GEMS",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 40, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 80, } },
    OrderId = 900,
})

mod:overrideAsset({
    Id = "JEWELRY",
	-- ResourceTypeList = {
    --     Action = "APPEND",
    -- },
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 60, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 120, } },
    OrderId = 910,
})

mod:overrideAsset({
    Id = "SPEAR",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 36, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 72, } },
    OrderId = 981,
})

mod:overrideAsset({
    Id = "SWORD",
    -- TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    -- TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 48, } },
    OrderId = 980,
})



-- Learning: Plants -------------------------------------------------------------------------------------
mod:registerAssetId("icons/LearningPlants.png", "ICON_LEARNING_PLANTS", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_LEARNING_PLANTS",
	ResourceName = "RESOURCE_LEARNING_PLANTS_NAME",
	Icon = "ICON_LEARNING_PLANTS",
	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_STUDY" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 50,
})



-- Learning: Animals -------------------------------------------------------------------------------------
mod:registerAssetId("icons/LearningAnimals.png", "ICON_LEARNING_ANIMALS", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_LEARNING_ANIMALS",
	ResourceName = "RESOURCE_LEARNING_ANIMALS_NAME",
	Icon = "ICON_LEARNING_ANIMALS",
	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_STUDY" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 51,
})



-- Learning: Alchemy -------------------------------------------------------------------------------------
mod:registerAssetId("icons/LearningAlchemy.png", "ICON_LEARNING_ALCHEMY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_LEARNING_ALCHEMY",
	ResourceName = "RESOURCE_LEARNING_ALCHEMY_NAME",
	Icon = "ICON_LEARNING_ALCHEMY",
	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_STUDY" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 52,
})



-- Learning: Mathematics -------------------------------------------------------------------------------------
mod:registerAssetId("icons/LearningMathematics.png", "ICON_LEARNING_MATHEMATICS", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_LEARNING_MATHEMATICS",
	ResourceName = "RESOURCE_LEARNING_MATHEMATICS_NAME",
	Icon = "ICON_LEARNING_MATHEMATICS",
	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_STUDY" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 53,
})



-- -- Manuscript -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_STUDY" )
-- mod:registerAssetId("icons/Manuscript.png", "ICON_MANUSCRIPT", "ATLAS_CELL")

mod:overrideAsset({
    Id = "MANUSCRIPT",
    OrderId = 10,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 40, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 80, } },
})

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_MANUSCRIPT",
-- 	ResourceName = "RESOURCE_MANUSCRIPT_NAME",
-- 	Icon = "ICON_MANUSCRIPT",
-- 	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_STUDY" },
-- 	IsTradable = false,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "RESOURCE_MONASTERY_LEARNING", Quantity = 1 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     OrderId = 88,
-- })



-- -- Monastery Meal -------------------------------------------------------------------------------------
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_MEAL" )

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_MONASTERY_MEAL",
-- 	ResourceName = "RESOURCE_MONASTERY_MEAL_NAME",
-- 	Icon = "ICON_RESOURCE_MEAL",
-- 	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_MEAL", "RESOURCE_TYPE_MONASTERY_FOOD" },
-- 	IsTradable = false,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 0 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     OrderId = 80,
-- })



-- -- Monastery Clothes -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/MonasteryClothes.png", "ICON_MONASTERY_CLOTHES", "ATLAS_CELL")
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_CLOTHES" )

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_MONASTERY_CLOTHES",
-- 	ResourceName = "RESOURCE_MONASTERY_CLOTHES_NAME",
-- 	Icon = "ICON_MONASTERY_CLOTHES",
-- 	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_CLOTHES" },
-- 	IsTradable = false,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 0 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     OrderId = 82,
-- })



-- Butter -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Butter.png", "ICON_BV1_BUTTER", "ATLAS_CELL")
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_BUTTER" )

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_BUTTER",
	ResourceName = "BV1_BUTTER_NAME",
	Icon = "ICON_BV1_BUTTER",
	-- ResourceTypeList = { "FOOD", "FOOD_SELLABLE" },
	ResourceTypeList = {
        "FOOD",
        "RESOURCE_TYPE_BUTTER",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 6 },
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 104,
})



-- Grass -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Grass.png", "ICON_GRASS", "ATLAS_CELL")
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_GRASS" )

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_GRASS",
	ResourceName = "RESOURCE_GRASS_NAME",
	Icon = "ICON_GRASS",
	ResourceTypeList = { "RESOURCE_TYPE_GRASS" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 0 },
    DisplayInInventory = false,
    DisplayInToolbar = false,
    OrderId = 621,
})



-- Orange -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Orange.png", "BV1_ORANGE_ICON", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_ORANGE",
	ResourceName = "BV1_ORANGE",
	Icon = "BV1_ORANGE_ICON",
	ResourceTypeList = {
        "LUXURY_FOOD",
      },
	IsTradable = true,
      DisplayInInventory = true,
      DisplayInToolbar = true,
      ResourceLayoutType = "CRATES",
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 10 },},
})


-- Christmas gift -------------------------------------------------------------------------------------
mod:registerAssetId("icons/cadeaux.png", "BV1_CHRISTMAS_GIFT_ICON", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_CHRISTMAS_GIFT",
	ResourceName = "BV1_CHRISTMAS_GIFT",
	Icon = "BV1_CHRISTMAS_GIFT_ICON",
	ResourceTypeList = {
        "RESOURCE",
      },
	IsTradable = true,
      DisplayInInventory = true,
      DisplayInToolbar = true,
      ResourceLayoutType = "CRATES",
	TradeBuyingPrice = {{ Resource = "CLOTHES", Quantity = 1 },},
})

-- Pastry -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Pastry.png", "ICON_BV1_PASTRY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_PASTRY",
	ResourceName = "BV1_PASTRY_NAME",
	Icon = "ICON_BV1_PASTRY",
	ResourceTypeList = {
        "LUXURY_FOOD",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 15 },
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 626,
})

-- Sugar -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Sugar.png", "ICON_BV1_SUGAR", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_SUGAR",
	ResourceName = "BV1_SUGAR_NAME",
	Icon = "ICON_BV1_SUGAR",
	ResourceTypeList = {
        "LUXURY_FOOD",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    ResourceLayoutType = "CRATES",
	TradeBuyingPrice = {{ Resource = "GOLD", Quantity = 8 },},
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 16 },},
    OrderId = 624,
})


-- Electuary -------------------------------------------------------------------------------------
mod:registerAssetId("icons/electuary.png", "ICON_BV1_ELECTUARY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_ELECTUARY",
	ResourceName = "BV1_ELECTUARY_NAME",
	Icon = "ICON_BV1_ELECTUARY",
	ResourceTypeList = {
        "LUXURY_FOOD",
    },
	IsTradable = true,
	TradeBuyingPrice = {{ Resource = "GOLD", Quantity = 10 },},
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 20 },},
    DisplayInInventory = true,
    DisplayInToolbar = true,
})

-- Salt -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Salt.png", "ICON_BV1_SALT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_SALT",
	ResourceName = "BV1_SALT_NAME",
	Icon = "ICON_BV1_SALT",
	ResourceTypeList = {
        "LUXURY_FOOD",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    ResourceLayoutType = "CRATES",
	TradeBuyingPrice = {{ Resource = "GOLD", Quantity = 6 },},
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 12 },},
    OrderId = 622,
})

-- Dirty Brine -------------------------------------------------------------------------------------
mod:registerAssetId("icons/brinedirty.png", "ICON_BV1_BRINE_DIRTY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_BRINE_DIRTY",
	ResourceName = "BV1_BRINE_DIRTY_NAME",
	Icon = "ICON_BV1_BRINE_DIRTY",
	-- ResourceTypeList = { "RESOURCE" },
	-- IsTradable = true,
	ResourceLayoutType = "CRATES",
	DisplayInInventory = false,
    DisplayInToolbar = false,
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 1 }
})



-- Brine -------------------------------------------------------------------------------------
mod:registerAssetId("icons/brineclean.png", "ICON_BV1_BRINE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_BRINE",
	ResourceName = "BV1_BRINE_NAME",
	Icon = "ICON_BV1_BRINE",
	ResourceTypeList = { "GRANARY" },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = true,
    DisplayInToolbar = true,
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 1 }
})



-- Fruit -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FRUIT" )
mod:registerAssetId("icons/Fruit.png", "ICON_FRUIT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FRUIT",
	ResourceName = "RESOURCE_FRUIT_NAME",
	Icon = "ICON_FRUIT",
	-- ResourceTypeList = { "FOOD", "RESOURCE_TYPE_FRUIT", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
        "RESOURCE_TYPE_FRUIT",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    IsDisplayContainerTracker = false,
    OrderId = 616,
})



-- Shoes -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Shoes.png", "ICON_RESOURCE_SHOES", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SHOES",
	ResourceName = "RESOURCE_SHOES_NAME",
	Icon = "ICON_RESOURCE_SHOES",
	ResourceTypeList = {
        "GOODS",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 12 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 526,
})



-- Flax -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Flax.png", "ICON_FLAX", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FLAX",
	ResourceName = "RESOURCE_FLAX_NAME",
	Icon = "ICON_FLAX",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    IsDisplayContainerTracker = false,
    OrderId = 527,
})



-- -- Vellum -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/Vellum.png", "ICON_VELLUM", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_VELLUM",
-- 	ResourceName = "RESOURCE_VELLUM_NAME",
-- 	Icon = "ICON_VELLUM",
-- 	ResourceTypeList = { "RESOURCE" },
-- 	IsTradable = true,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     OrderId = 535,
-- })



-- Clay -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Clay.png", "ICON_CLAY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CLAY",
	ResourceName = "RESOURCE_CLAY_NAME",
	Icon = "ICON_CLAY",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 1, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    OrderId = 520,
})



-- Pottery -------------------------------------------------------------------------------------
mod:registerEnumValue ("RESOURCE_TYPE", "RESOURCE_TYPE_POTTERY")
mod:registerAssetId("icons/Pottery.png", "ICON_POTTERY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_POTTERY",
	ResourceName = "RESOURCE_POTTERY_NAME",
	Icon = "ICON_POTTERY",
	ResourceTypeList = {
        "GOODS",
        "RESOURCE_TYPE_POTTERY",
    },
	-- VillagerBuyingPrice = {
	-- 	Resource = "GOLD_COINS",
	-- 	Quantity = 8
	-- },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
	OrderId = 521,
})



-- Clay Tile -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Tile.png", "ICON_TILE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_TILE",
	ResourceName = "RESOURCE_TILE_NAME",
	Icon = "ICON_TILE",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
	OrderId = 522,
})



-- Wood Shingles -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Shingle.png", "ICON_SHINGLE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SHINGLE",
	ResourceName = "RESOURCE_SHINGLE_NAME",
	Icon = "ICON_SHINGLE",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
	OrderId = 502,
})



-- Thatch -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Thatch.png", "ICON_THATCH", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_THATCH",
	ResourceName = "RESOURCE_THATCH_NAME",
	Icon = "ICON_THATCH",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    IsDisplayContainerTracker = false,
	OrderId = 519,
})



-- Authority -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_AUTHORITY" )
mod:registerAssetId("icons/Authority.png", "ICON_AUTHORITY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_AUTHORITY",
	ResourceName = "RESOURCE_AUTHORITY_NAME",
	Icon = "ICON_AUTHORITY",
	ResourceTypeList = { "RESOURCE_TYPE_AUTHORITY" },
	IsTradable = false,
    DisplayInInventory = true,
	DisplayInToolbar = true,
	OrderId = 4
})



-- -- Wages -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/Wage.png", "ICON_WAGE", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_WAGE",
-- 	ResourceName = "RESOURCE_WAGE_NAME",
-- 	Icon = "ICON_WAGE",
-- 	ResourceTypeList = { "RESOURCE_TYPE_AUTHORITY" },
-- 	IsTradable = false,
--     DisplayInInventory = false,
-- 	DisplayInToolbar = false,
-- })



-- Furniture -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_FURNITURE" )
mod:registerAssetId("icons/Furniture.png", "ICON_FURNITURE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FURNITURE",
	ResourceName = "RESOURCE_FURNITURE_NAME",
	Icon = "ICON_FURNITURE",
	ResourceTypeList = {
        "GOODS",
        "RESOURCE_TYPE_FURNITURE",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 32, } },
    OrderId = 550,
})



-- Animal Hides -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Hide.png", "ICON_RESOURCE_HIDE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_HIDE",
	ResourceName = "RESOURCE_HIDE_NAME",
	Icon = "ICON_RESOURCE_HIDE",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
	ResourceLayoutType = "TRUNKS",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 6 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 138,
})



-- Carcass -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Carcass.png", "ICON_BV1_CARCASS", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_CARCASS",
	ResourceName = "BV1_CARCASS_NAME",
	Icon = "ICON_BV1_CARCASS",
	ResourceTypeList = { "RESOURCE_FOOD" },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 4 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 134,
})



-- Fur -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Fur.png", "ICON_RESOURCE_FUR", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FUR",
	ResourceName = "RESOURCE_FUR_NAME",
	Icon = "ICON_RESOURCE_FUR",
	ResourceTypeList = {
        "LUXURY",
    },
	IsTradable = true,
	ResourceLayoutType = "TRUNKS",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 6 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 142,
})



-- Meat (OLD) -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "BUTCHER_RESOURCE_TYPE" )
mod:registerAssetId("icons/Meat.png", "ICON_BV1_MEAT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_MEAT",
	ResourceName = "BV1_MEAT_NAME",
	Icon = "ICON_BV1_MEAT",
	-- ResourceTypeList = { "FOOD", "BUTCHER_RESOURCE_TYPE", "FOOD_SELLABLE" },
	ResourceTypeList = {
        "FOOD",
        "BUTCHER_RESOURCE_TYPE",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 14 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
    OrderId = 136,
})



-- Meat -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "BUTCHER_RESOURCE_TYPE" )

mod:overrideAsset({
	Id = "MEAT",
	ResourceTypeList = {
        Action = "APPEND",
        "BUTCHER_RESOURCE_TYPE",
    },
    OrderId = 136,
})



-- -- Tallow -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/Tallow.png", "ICON_TALLOW", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_TALLOW",
-- 	ResourceName = "RESOURCE_TALLOW_NAME",
-- 	Icon = "ICON_TALLOW",
-- 	-- ResourceTypeList = { "RESOURCE_TYPE_FARM" },
-- 	ResourceTypeList = { "RESOURCE" },
-- 	IsTradable = true,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 6 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     OrderId = 508,
-- })



-- -- Candle -------------------------------------------------------------------------------------
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_CHANDLER" )
-- mod:registerAssetId("icons/Candle.png", "ICON_CANDLE", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_CANDLE",
-- 	ResourceName = "RESOURCE_CANDLE_NAME",
-- 	Icon = "ICON_CANDLE",
-- 	ResourceTypeList = { "GOODS", "RESOURCE_TYPE_CHANDLER", "RESOURCE_TYPE_GOODS_LEVEL_2", },
-- 	IsTradable = true,
-- 	ResourceLayoutType = "CRATES",
-- 	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 8 },
--     DisplayInInventory = true,
--     DisplayInToolbar = true,
--     TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
--     TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 16, } },
--     OrderId = 510,
-- })



-- Cattle -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Cattle.png", "ICON_RESOURCE_CATTLE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CATTLE",
	ResourceName = "RESOURCE_CATTLE_NAME",
	Icon = "ICON_RESOURCE_CATTLE",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	-- ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 20 },
    DisplayInInventory = true,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 32, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 64, } },
    OrderId = 126,
})



-- Pig -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Pig.png", "ICON_RESOURCE_PIG", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_PIG",
	ResourceName = "RESOURCE_PIG_NAME",
	Icon = "ICON_RESOURCE_PIG",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	-- ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 20 },
    DisplayInInventory = true,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 30, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 60, } },
    OrderId = 128,
})



-- Sheep -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Sheep.png", "ICON_RESOURCE_SHEEP", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SHEEP",
	ResourceName = "RESOURCE_SHEEP_NAME",
	Icon = "ICON_RESOURCE_SHEEP",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	-- ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 20 },
    DisplayInInventory = true,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 48, } },
    OrderId = 124,
})



-- Goat -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Goat.png", "ICON_RESOURCE_GOAT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_GOAT",
	ResourceName = "RESOURCE_GOAT_NAME",
	Icon = "ICON_RESOURCE_GOAT",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	-- ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 20 },
    DisplayInInventory = true,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 18, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 36, } },
    OrderId = 122,
})



-- Hay -------------------------------------------------------------------------------------
mod:registerAssetId("models/ResourceVisual1.fbx/Prefab/ResourceHayPart", "PREFAB_RESOURCEVISUAL_HAY")
mod:registerAssetId("icons/Hay.png", "ICON_HAY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_HAY",
	ResourceName = "RESOURCE_HAY_NAME",
	Icon = "ICON_HAY",
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true,
    ResourceVisualPrefab = "PREFAB_RESOURCEVISUAL_HAY",
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    IsDisplayContainerTracker = false,
    OrderId = 120,
})



-- Animal Feed -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Feed.png", "ICON_FEED", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FEED",
	ResourceName = "RESOURCE_FEED_NAME",
	Icon = "ICON_FEED",
	ResourceTypeList = { "RESOURCE_FOOD" },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 20 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 10, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 20, } },
    OrderId = 121,
})



-- Cider -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Cider.png", "ICON_CIDER", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CIDER",
    ResourceName = "RESOURCE_CIDER_NAME",
	Icon = "ICON_CIDER",
	ResourceTypeList = {
        "TAVERN",
        "RESOURCE_FOOD",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 16 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 617,
})



-- Mead -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Mead.png", "ICON_MEAD", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_MEAD",
    ResourceName = "RESOURCE_MEAD_NAME",
	Icon = "ICON_MEAD",
	ResourceTypeList = {
        "TAVERN",
        "RESOURCE_FOOD",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 16 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 6, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    OrderId = 618,
})



-- Berry Brew -------------------------------------------------------------------------------------
mod:overrideAsset({
	Id = "BERRY_BREW",
    OrderId = 617,
})



-- Entertainment (OLD) -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Entertainment.png", "ICON_ENTERTAINMENT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_ENTERTAINMENT",
	ResourceName = "RESOURCE_ENTERTAINMENT_NAME",
	Icon = "ICON_ENTERTAINMENT",
	ResourceTypeList = {
        "ENTERTAINMENT",
    },
	-- VillagerBuyingPrice = {
	-- 	Resource = "GOLD_COINS",
	-- 	Quantity = 5,
	-- },
	IsTradable = false,
    DisplayInInventory = true,
	DisplayInToolbar = true,
	OrderId = 5,
})



-- -- Entertainment -------------------------------------------------------------------------------------
-- mod:overrideAsset({
-- 	Id = "ENTERTAINMENT",
-- 	ResourceTypeList = {
--         Action = "APPEND",
--         "ENTERTAINMENT",
--     },
--     OrderId = 5,
-- })



-- Dung -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Dung.png", "ICON_DUNG", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_DUNG",
	ResourceName = "RESOURCE_DUNG_NAME",
	Icon = "ICON_DUNG",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false, -- available to store in the warehouse
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 2 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 1, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    OrderId = 130,
})



-- Compost -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Compost.png", "ICON_COMPOST", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_COMPOST",
	ResourceName = "RESOURCE_COMPOST_NAME",
	Icon = "ICON_COMPOST",
	-- ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	ResourceTypeList = { "RESOURCE" },
	IsTradable = true, -- available to store in the warehouse
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 2 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 132,
})



-- Sewage -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_SEWAGE" )
mod:registerAssetId("icons/Sewage.png", "ICON_SEWAGE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SEWAGE",
	ResourceName = "RESOURCE_SEWAGE_NAME",
	Icon = "ICON_SEWAGE",
	ResourceTypeList = { "RESOURCE_TYPE_SEWAGE" },
	IsTradable = false, -- available to store in the warehouse
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 92,
})



-- Corpse -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_CORPSE" )
mod:registerAssetId("icons/Corpse.png", "ICON_CORPSE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CORPSE",
	ResourceName = "RESOURCE_CORPSE_NAME",
	Icon = "ICON_CORPSE",
	ResourceTypeList = { "RESOURCE_TYPE_CORPSE" },
	IsTradable = false, -- available to store in the warehouse
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 93,
})



-- -- Grave -------------------------------------------------------------------------------------
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_GRAVE" )
-- mod:registerAssetId("icons/Grave.png", "ICON_GRAVE", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_GRAVE",
-- 	ResourceName = "RESOURCE_GRAVE_NAME",
-- 	Icon = "ICON_GRAVE",
-- 	ResourceTypeList = { "RESOURCE_TYPE_GRAVE" },
-- 	IsTradable = false, -- available to store in the warehouse
--     DisplayInInventory = false,
--     DisplayInToolbar = false,
--     OrderId = 94,
-- })



-- Unwell Villager -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_UNWELL" )
mod:registerAssetId("icons/Unwell.png", "ICON_UNWELL", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_UNWELL",
	ResourceName = "RESOURCE_UNWELL_NAME",
	Icon = "ICON_UNWELL",
	ResourceTypeList = { "RESOURCE_TYPE_UNWELL" },
	IsTradable = false, -- available to store in the warehouse
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 95,
})


-- Poultry -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "POULTRYFARM_RESOURCE_TYPE" )
mod:registerEnumValue( "RESOURCE_TYPE", "POULTRYFARM_POULTRY_RESOURCE_TYPE" )
mod:registerEnumValue( "RESOURCE_TYPE", "POULTRYFARM_EGG_RESOURCE_TYPE" )
mod:registerAssetId("icons/Poultry.png", "ICON_POULTRY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_POULTRY",
	ResourceName = "RESOURCE_POULTRY_NAME",
	Icon = "ICON_POULTRY",
	-- ResourceTypeList = { "FOOD", "POULTRYFARM_POULTRY_RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
        "POULTRYFARM_POULTRY_RESOURCE_TYPE",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    OrderId = 112,
})


-- Egg -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Egg.png", "ICON_BV1_EGG", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "BV1_EGG",
	ResourceName = "BV1_EGG_NAME",
	Icon = "ICON_BV1_EGG",
	-- ResourceTypeList = { "FOOD", "POULTRYFARM_EGG_RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
        "POULTRYFARM_EGG_RESOURCE_TYPE",
    },
	IsTradable = true,
    DisplayInInventory = true,
    DisplayInToolbar = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 8 },
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    OrderId = 110,
})


-- Rabbit -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_RABBIT" )
mod:registerAssetId("icons/Rabbit.png", "ICON_RABBIT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_RABBIT",
	ResourceName = "RESOURCE_RABBIT_NAME",
	Icon = "ICON_RABBIT",
	-- ResourceTypeList = { "FOOD", "RESOURCE_TYPE_RABBIT", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
        "RESOURCE_TYPE_RABBIT",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 10 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    IsDisplayContainerTracker = false,
    OrderId = 114,
})


-- Chicken -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Chicken.png", "ICON_CHICKEN", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CHICKEN",
	ResourceName = "RESOURCE_CHICKEN_NAME",
	Icon = "ICON_CHICKEN",
	-- ResourceTypeList = { "RESOURCE_FOOD" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = false,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 10, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 20, } },
    OrderId = 105,
})


-- Goose -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Goose.png", "ICON_GOOSE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_GOOSE",
	ResourceName = "RESOURCE_GOOSE_NAME",
	Icon = "ICON_GOOSE",
	-- ResourceTypeList = { "RESOURCE_FOOD" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = false,
    DisplayInToolbar = false,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    OrderId = 106,
})


-- Vegetable -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "VEGETABLEFARM_RESOURCE_TYPE" )
mod:registerAssetId("icons/Vegetable.png", "ICON_VEGETABLE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_VEGETABLE",
	ResourceName = "RESOURCE_VEGETABLE_NAME",
	Icon = "ICON_VEGETABLE",
	-- ResourceTypeList = { "FOOD", "VEGETABLEFARM_RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
        "VEGETABLEFARM_RESOURCE_TYPE",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 12 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    IsDisplayContainerTracker = false,
	OrderId = 148,
})



-- Raw Vegetable -------------------------------------------------------------------------------------
mod:registerAssetId("icons/RawVegetable.png", "ICON_RAW_VEGETABLE", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_VEGETABLE_RAW",
	ResourceName = "RESOURCE_VEGETABLE_RAW_NAME",
	Icon = "ICON_RAW_VEGETABLE",
	-- ResourceTypeList = { "RESOURCE" },
	ResourceTypeList = { "RESOURCE_TYPE_FARM" },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    DisplayInInventory = false,
    DisplayInToolbar = false,
    IsDisplayContainerTracker = false,
})



-- Security -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_SECURITY" )
mod:registerAssetId("icons/Security.png", "ICON_SECURITY", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SECURITY",
	ResourceName = "RESOURCE_SECURITY_NAME",
	Icon = "ICON_SECURITY",
	ResourceTypeList = { "RESOURCE_TYPE_SECURITY" },
	IsTradable = false,
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 1 },
    DisplayInInventory = false,
    DisplayInToolbar = false,
    OrderId = 3,
    -- ConsumptionBehaviorOverride = "BEHAVIOR_TREE_SECURITY_CONSUME"
})



-- Waterfowl -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Waterfowl.png", "ICON_WATERFOWL", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_WATERFOWL",
	ResourceName = "RESOURCE_WATERFOWL_NAME",
	OrderId = 1,
	Icon = "ICON_WATERFOWL",
	-- ResourceTypeList = { "FOOD", "RESOURCE_TYPE_MONASTERY_FOOD", "RESOURCE_TYPE_FOOD_LEVEL_1", },
	ResourceTypeList = {
        "FOOD",
    },
	IsTradable = true,
	ResourceLayoutType = "CRATES",
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 8 },
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 12, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 24, } },
    DisplayInInventory = true,
    DisplayInToolbar = true,
})



-- Resource: Fuel -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "FUEL_RESOURCE_TYPE" )

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_FUEL",
	ResourceName = "RESOURCE_FUEL_NAME",
	Icon = "ICON_FUEL_NEED",
    ResourceTypeList = {
        "FUEL_RESOURCE_TYPE",
    },
	IsTradable = false,
	ResourceLayoutType = "CRATES",
    -- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 2 },
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 499,
})



-- Paganism -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Paganism.png", "ICON_PAGANISM", "ATLAS_CELL")
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_PAGANISM" )

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_PAGANISM",
	ResourceName = "RESOURCE_PAGANISM_NAME",
	Icon = "ICON_PAGANISM",
	ResourceTypeList = {
        "RESOURCE_TYPE_PAGANISM",
        "SERVICE",
    },
	IsTradable = false,
	-- VillagerBuyingPrice = { Resource = "GOLD", Quantity = 1 },
    DisplayInInventory = false,
    DisplayInToolbar = false,
})



-- -- Resource: Monastic Worship -------------------------------------------------------------------------------------
-- mod:registerAssetId("icons/Faith.png", "ICON_RESOURCE_FAITH", "ATLAS_CELL")
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MONASTERY_FAITH" )

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_MONASTERY_FAITH",
-- 	ResourceName = "RESOURCE_MONASTERY_FAITH_NAME",
-- 	Icon = "ICON_RESOURCE_FAITH",
-- 	ResourceTypeList = { "RESOURCE_TYPE_MONASTERY_FAITH" },
-- 	IsTradable = false,
-- 	-- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 0 },
--     DisplayInInventory = false,
--     DisplayInToolbar = false,
-- })


-- Resource: Mushrooms -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Mushroom.png", "ICON_MUSHROOM", "ATLAS_CELL")
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_MUSHROOM" )

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_MUSHROOM",
	ResourceName = "RESOURCE_MUSHROOM_NAME",
	Icon = "ICON_MUSHROOM",
    ResourceTypeList = {
        "FOOD",
        "RESOURCE_TYPE_MUSHROOM",
    },
	IsTradable = true,
    -- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 6 },
	DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 1, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 2, } },
    IsDisplayContainerTracker = false,
    OrderId = 102,
})


-- Resource: Corn -------------------------------------------------------------------------------------
MOD_NS = 'JK_'
mod:registerAssetId("icons/corn.png", MOD_NS .. "ICON_CORN", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_CORN",
	ResourceName = "RESOURCE_CORN_NAME",
	Icon = MOD_NS .. "ICON_CORN",
	ResourceTypeList = {
        "GRANARY",
        "RESOURCE_FOOD",
    },
    -- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 8 },
	IsTradable = true,
	ResourceLayoutType = "BAGS",
    DisplayInInventory = true,
    DisplayInToolbar = true,
    TradeBuyingPrice = { { Resource = "GOLD_COINS", Quantity = 4, } },
    TradeSellingPrice = { { Resource = "GOLD_COINS", Quantity = 8, } },
    IsDisplayContainerTracker = false,
    OrderId = 111,
})



-- Resource: Servant -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_SERVANT" )
mod:registerAssetId("icons/Servant.png", "ICON_SERVANT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_SERVANT",
	ResourceName = "RESOURCE_SERVANT_NAME",
	Icon = "ICON_SERVANT",
    ResourceTypeList = { "RESOURCE_TYPE_SERVANT", },
    -- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 2 },
	IsTradable = false,
	DisplayInInventory = false,
    DisplayInToolbar = false,
    OrderId = 6,
})



-- Resource: Rubbish -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_RUBBISH" )
mod:registerAssetId("icons/Rubbish.png", "ICON_RUBBISH", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_RUBBISH",
	ResourceName = "RESOURCE_RUBBISH_NAME",
	Icon = "ICON_RUBBISH",
    ResourceTypeList = { "RESOURCE_TYPE_RUBBISH", },
	IsTradable = false,
	DisplayInInventory = false,
    DisplayInToolbar = false,
    IsDisplayContainerTracker = false,
})



-- -- Resource: Conversation -------------------------------------------------------------------------------------
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_SOCIAL" )
-- mod:registerAssetId("icons/Conversation.png", "ICON_CONVERSATION", "ATLAS_CELL")

-- mod:registerAsset({
-- 	DataType = "RESOURCE",
-- 	Id = "RESOURCE_CONVERSATION",
-- 	ResourceName = "RESOURCE_CONVERSATION_NAME",
-- 	Icon = "ICON_CONVERSATION",
--     ResourceTypeList = { "RESOURCE_TYPE_SOCIAL", "RESOURCE_TYPE_SOCIAL_LEVEL_3", },
-- 	IsTradable = false,
-- 	DisplayInInventory = false,
--     DisplayInToolbar = false,
-- })



-- Alert -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_ALERT" )
mod:registerAssetId("icons/Alert.png", "ICON_ALERT", "ATLAS_CELL")

mod:registerAsset({
	DataType = "RESOURCE",
	Id = "RESOURCE_ALERT",
	ResourceName = "RESOURCE_ALERT_NAME",
	Icon = "ICON_ALERT",
	ResourceTypeList = { "RESOURCE_TYPE_ALERT" },
	IsTradable = false, -- available to store in the warehouse
    DisplayInInventory = true,
    DisplayInToolbar = true,
    OrderId = 0,
})



-- Resource: Universal Housing -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Dorm.png", "ICON_RESOURCE_HOUSE", "ATLAS_CELL")
mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_UNIVERSAL_HOUSING" ) -- ADDED
mod:registerAsset({
    DataType = "RESOURCE",
    Id = "RESOURCE_UNIVERSAL_HOUSING",
    ResourceName = "NEED_HOUSE_NAME",
    Icon = "ICON_RESOURCE_HOUSE",
    ResourceTypeList = {
        "RESOURCE_TYPE_UNIVERSAL_HOUSING",
    },
    IsTradable = false,
    DisplayInInventory = false,
    DisplayInToolbar = false,
    OrderId = 0,
})
