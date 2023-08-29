local mod = ...



-- Trader sells eggs which are required for establishing poultry flocks
mod:overrideAsset({
    Id = "VILLAGE_NORTHBURY",
    SellingResourceList = {
        Action = "APPEND",
        { ResourceMaxAmount = { Resource = "BV1_EGG", Quantity = 10 }, ReplenishingAmount = 30 },
    },
})

