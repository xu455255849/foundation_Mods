local mod = ...



mod:overrideAsset({
    Id = "ONBOARDING_QST_TRADE",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
            Resource = "BERRIES",
        },
        {
            DataType = "GAME_CONDITION_ASSIGN_TRADE_RESOURCE",
            AssetResource = "BERRIES",
            TradeState = "SELL",
        },
    },
})

