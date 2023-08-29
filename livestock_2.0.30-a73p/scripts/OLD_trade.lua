local mod = ...



-- Trader sells animals
mod:overrideAsset({
    Id = "VILLAGE_NORTHBURY",
    SellingResourceList = {
        Action = "APPEND",
        { ResourceMaxAmount = { Resource = "RESOURCE_GOAT", Quantity = 10 }, ReplenishingAmount = 30 },
    },
})



-- Trader sells animals
mod:overrideAsset({
    Id = "VILLAGE_MYDDLE",
    -- BuyingResourceList = {
    --     Action = "APPEND",
        -- { ResourceMaxAmount = { Resource = "CHEESE", Quantity = 10 }, ReplenishingAmount = 30 },
        -- { ResourceMaxAmount = { Resource = "RESOURCE_SHOES", Quantity = 10 }, ReplenishingAmount = 30 },
    -- },
    SellingResourceList = {
        Action = "APPEND",
        { ResourceMaxAmount = { Resource = "RESOURCE_SHEEP", Quantity = 10 }, ReplenishingAmount = 30 },
    },
})



-- Trader sells animals
mod:overrideAsset({
    Id = "VILLAGE_DAVENPORT",
    SellingResourceList = {
        Action = "APPEND",
        { ResourceMaxAmount = { Resource = "RESOURCE_CATTLE", Quantity = 10 }, ReplenishingAmount = 30 },
        { ResourceMaxAmount = { Resource = "RESOURCE_PIG", Quantity = 10 }, ReplenishingAmount = 30 },
    },
})


