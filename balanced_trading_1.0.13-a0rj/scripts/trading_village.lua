local mod = ...


-- Make trade route upgrades less steep (does not work as of Dec 2022)
mod:overrideAsset({
    Id = "TRADE_SETTINGS",
    ScalingFactor = 1.5, -- with each upgrade, how much the quantity changes
    SoldToTraderPerMonthFactorMultiplier = 30, -- how many you need to sell in a month to qualify for upgrade
    BoughtFromTraderPerMonthFactorMultiplier = 30, -- how many you need to buy in a month to qualify for upgrade
    QuantityFactorMultiplier = 10, -- base quantity of trade (at level one, this is how much will be bought and sold each time)
})



-- Add modded resources if their production mods are enabled in this game
local eggs = nil
local poultry = nil
local vegetable = nil
if foundation.isModEnabled("c8b63172-5b6d-45eb-9fab-a40c8ecd9947") then -- Vegetable and Poultry Farms
    eggs = { ResourceMaxAmount = { Resource = "BV1_EGG", Quantity = 10 }, ReplenishingAmount = 30 }
    poultry = { ResourceMaxAmount = { Resource = "RESOURCE_POULTRY", Quantity = 10 }, ReplenishingAmount = 30 }
    vegetable = { ResourceMaxAmount = { Resource = "RESOURCE_VEGETABLE", Quantity = 10 }, ReplenishingAmount = 30 }
end

local butter = nil
-- local goat = nil
-- local sheep = nil
-- local cattle = nil
-- local pig = nil
local leather = nil
local shoes = nil
local hay = nil
local boar = { ResourceMaxAmount = { Resource = "BOAR", Quantity = 5 }, ReplenishingAmount = 15 }
if foundation.isModEnabled("f6361b64-05d3-4ab5-a2db-b3b60dc4d307") then -- Livestock Farms
    boar = { ResourceMaxAmount = { Resource = "BV1_CARCASS", Quantity = 5 }, ReplenishingAmount = 15 } -- since this mod doesn't produce Boar, it produces Carcasses from the hunter's hut
    hay = { ResourceMaxAmount = { Resource = "RESOURCE_HAY", Quantity = 5 }, ReplenishingAmount = 15 }
    butter = { ResourceMaxAmount = { Resource = "BV1_BUTTER", Quantity = 10 }, ReplenishingAmount = 30 }
    -- goat = { ResourceMaxAmount = { Resource = "RESOURCE_GOAT", Quantity = 10 }, ReplenishingAmount = 30 }
    -- sheep = { ResourceMaxAmount = { Resource = "RESOURCE_SHEEP", Quantity = 10 }, ReplenishingAmount = 30 }
    -- cattle = { ResourceMaxAmount = { Resource = "RESOURCE_CATTLE", Quantity = 10 }, ReplenishingAmount = 30 }
    -- pig = { ResourceMaxAmount = { Resource = "RESOURCE_PIG", Quantity = 10 }, ReplenishingAmount = 30 }
    leather = { ResourceMaxAmount = { Resource = "LEATHER", Quantity = 10 }, ReplenishingAmount = 30 }
    shoes = { ResourceMaxAmount = { Resource = "RESOURCE_SHOES", Quantity = 10 }, ReplenishingAmount = 30 }
end

local pottery = nil
local shingles = nil
local tiles = nil
if foundation.isModEnabled("d757c3ab-0148-4290-aa51-5559329f5640") then -- Basic Materials
    pottery = { ResourceMaxAmount = { Resource = "RESOURCE_POTTERY", Quantity = 5 }, ReplenishingAmount = 15 }
    shingles = { ResourceMaxAmount = { Resource = "RESOURCE_SHINGLE", Quantity = 5 }, ReplenishingAmount = 15 }
    tiles = { ResourceMaxAmount = { Resource = "RESOURCE_TILE", Quantity = 5 }, ReplenishingAmount = 15 }
end

local rabbit = nil
local mushrooms = nil
if foundation.isModEnabled("07f894be-f512-4870-9067-e978f165efa4") or foundation.isModEnabled("31ff1a31-a65d-41e9-b1f1-8405fc3f4632") then -- Monastic Life or Forest Folk
    rabbit = { ResourceMaxAmount = { Resource = "RESOURCE_RABBIT", Quantity = 10 }, ReplenishingAmount = 30 }
    mushrooms = { ResourceMaxAmount = { Resource = "RESOURCE_MUSHROOM", Quantity = 10 }, ReplenishingAmount = 30 }
end

local apples = nil
local cider = nil
if foundation.isModEnabled("f252f14d-ca1d-4d02-97ca-46581d4b567d") or foundation.isModEnabled("5686b0a3-ad5e-4d74-9ba6-da3745b7c090") then -- Orchard or Cider Brewery
    apples = { ResourceMaxAmount = { Resource = "RESOURCE_FRUIT", Quantity = 5 }, ReplenishingAmount = 15 }
    cider = { ResourceMaxAmount = { Resource = "RESOURCE_CIDER", Quantity = 10 }, ReplenishingAmount = 30 }
end

local pastry = nil
if foundation.isModEnabled("4de588cf-4d24-422a-bbd6-7c97c22ff496") or foundation.isModEnabled("d5862f04-2e5b-4339-b9af-c9f1635d9b43") then -- Pastry Production V4 or V5
    pastry = { ResourceMaxAmount = { Resource = "BV1_PASTRY", Quantity = 10 }, ReplenishingAmount = 30 }
end

local salt = nil
local hidesalt = nil
if foundation.isModEnabled("7c23713a-f2fc-4c65-8de1-55747961c130") or foundation.isModEnabled("6f41d53b-d028-4b47-819b-96741416e408") then -- Salt Production V5 or Salt & Brine
    salt = { ResourceMaxAmount = { Resource = "BV1_SALT", Quantity = 10 }, ReplenishingAmount = 30 }
    if foundation.isModLoaded("7c23713a-f2fc-4c65-8de1-55747961c130") then
        hidesalt = "EVENT_BALANCEDTRADING_HIDESALT"
        mod:registerAsset({
            DataType = "EVENT",
            Id = "EVENT_BALANCEDTRADING_HIDESALT",
            IsInMainPool = false,
            IsRecurrent = false,
            DaysBetweenOccurences = nil,
            DaysToFirst = 1,
            Delay = 0,
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_BUILDING_BUILT",
                    AssetBuilding = "BUILDING_VILLAGE_CENTER",
                },
            },
            ActionList = {
                {
                    DataType = "GAME_ACTION_REMOVE_TRADE_ROUTE",
                    VillageListToAdd = {
                        "SALT_V5_VILLAGE_CHARTRES",
                        "SALT_V5_VILLAGE_NANTES",
                    },
                },
            },
        })
    end
end



-- Northbury ------------------------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "VILLAGE_NORTHBURY",
    UnlockCost = {
        {
            Resource = "GOLD_COINS",
            Quantity = 200,
        },
        {
            Resource = "PLANK",
            Quantity = 20,
        },
    },
    BuyingResourceList = {
        { ResourceMaxAmount = { Resource = "BERRIES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "HERBS", Quantity = 10 }, ReplenishingAmount = 30 },
        poultry,
        vegetable,
        pottery,
        boar,
        { ResourceMaxAmount = { Resource = "PLANK", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "IRON", Quantity = 5 }, ReplenishingAmount = 15 },
    },
    SellingResourceList = {
        eggs,
        { ResourceMaxAmount = { Resource = "RESOURCE_THATCH", Quantity = 5 }, ReplenishingAmount = 15 },
        butter,
        { ResourceMaxAmount = { Resource = "FISH", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "CHEESE", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "BERRY_BREW", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "WOOLEN_CLOTH", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "TOOL", Quantity = 5 }, ReplenishingAmount = 15 },
    },
})



-- Myddle ------------------------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "VILLAGE_MYDDLE",
    UnlockCost = {
        {
            Resource = "GOLD_COINS",
            Quantity = 300,
        },
        {
            Resource = "FISH",
            Quantity = 30,
        },
    },
    BuyingResourceList = {
        eggs,
        { ResourceMaxAmount = { Resource = "MILK", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "FISH", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "WOOLEN_CLOTH", Quantity = 10 }, ReplenishingAmount = 30 },
        shingles,
        tiles,
        salt,
        { ResourceMaxAmount = { Resource = "GEMS", Quantity = 10 }, ReplenishingAmount = 30 },
    },
    SellingResourceList = {
        { ResourceMaxAmount = { Resource = "HERBS", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "WHEAT", Quantity = 10 }, ReplenishingAmount = 30 },
        leather,
        { ResourceMaxAmount = { Resource = "CANDLE", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "IRON", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "CLOTHES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "COMMON_WARES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "GLASS", Quantity = 5 }, ReplenishingAmount = 10 },
    },
})



-- Davenport ------------------------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "VILLAGE_DAVENPORT",
    UnlockCost = {
        {
            Resource = "GOLD_COINS",
            Quantity = 400,
        },
        {
            Resource = "BREAD",
            Quantity = 40,
        },
    },
    BuyingResourceList = {
        { ResourceMaxAmount = { Resource = "CHEESE", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "BREAD", Quantity = 10 }, ReplenishingAmount = 30 },
        shoes,
        { ResourceMaxAmount = { Resource = "CLOTHES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "COMMON_WARES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "GLASS", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "SWORD", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "JEWELRY", Quantity = 10 }, ReplenishingAmount = 30 },
    },
    SellingResourceList = {
        hay,
        { ResourceMaxAmount = { Resource = "HONEY", Quantity = 10 }, ReplenishingAmount = 30 },
        apples,
        poultry,
        { ResourceMaxAmount = { Resource = "COAL", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "BV1_SUGAR", Quantity = 10 }, ReplenishingAmount = 30 },
        shoes,
        { ResourceMaxAmount = { Resource = "GOLD_BARS", Quantity = 1 }, ReplenishingAmount = 3 },
    },
})



-- Kinstone Abbey ------------------------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "VILLAGE_KINSTONE",
    UnlockCost = {
        {
            Resource = "GOLD_COINS",
            Quantity = 500,
        },
        {
            Resource = "TOOL",
            Quantity = 50,
        },
    },
    BuyingResourceList = {
        { ResourceMaxAmount = { Resource = "WHEAT", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "GRAPES", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "HONEY", Quantity = 10 }, ReplenishingAmount = 30 },
        butter,
        { ResourceMaxAmount = { Resource = "CANDLE", Quantity = 10 }, ReplenishingAmount = 30 },
        cider,
        { ResourceMaxAmount = { Resource = "BEER", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "TOOL", Quantity = 5 }, ReplenishingAmount = 15 },
    },
    SellingResourceList = {
        { ResourceMaxAmount = { Resource = "PLANK", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "RESOURCE_SHINGLE", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "RESOURCE_TILE", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "MEAT", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "BREAD", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "BARREL", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "WINE", Quantity = 5 }, ReplenishingAmount = 15 },
        { ResourceMaxAmount = { Resource = "MANUSCRIPT", Quantity = 2 }, ReplenishingAmount = 6 },
    },
})



-- Trotbury ------------------------------------------------------------------------------------------------------------
-- also unhide this village from the beginning of the game, since its unhide conditions are unknown but apparently prevented by some mod
mod:overrideAsset({
    Id = "VILLAGE_TROTBURY",
    UnlockCost = {
        {
            Resource = "GOLD_COINS",
            Quantity = 600,
        },
        {
            Resource = "MEAT",
            Quantity = 60,
        },
    },
    BuyingResourceList = {
        mushrooms,
        { ResourceMaxAmount = { Resource = "WAX", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "WOOL", Quantity = 10 }, ReplenishingAmount = 30 },
        leather,
        apples,
        { ResourceMaxAmount = { Resource = "MEAT", Quantity = 5 }, ReplenishingAmount = 15 },
        pastry,
        { ResourceMaxAmount = { Resource = "WINE", Quantity = 5 }, ReplenishingAmount = 15 },
    },
    SellingResourceList = {
        pottery,
        vegetable,
        boar,
        cider,
        { ResourceMaxAmount = { Resource = "BEER", Quantity = 10 }, ReplenishingAmount = 30 },
        salt,
        { ResourceMaxAmount = { Resource = "GEMS", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "JEWELRY", Quantity = 10 }, ReplenishingAmount = 30 },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_BALANCEDTRADING_TROTBURY",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 0,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTER",
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_ADD_TRADE_ROUTE",
            VillageListToAdd = {
                "VILLAGE_TROTBURY",
            },
        },
    },
})



-- Event list --------------------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_BALANCEDTRADING_TROTBURY",
        hidesalt,
    },
})
