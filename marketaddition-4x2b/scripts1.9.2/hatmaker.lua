local Hatmaker = ...

Hatmaker:overrideAsset({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_HATMAKER"
    }
})

Hatmaker:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_HATMAKER"
    }
})

Hatmaker:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_HATMAKER"
    }
})

Hatmaker:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_HATMAKER"
    }
})

-- Register Hatmaker job
Hatmaker:registerAsset({
	DataType = "JOB",
	Id = MarketAdditionPrefix .. "_HATMAKER",
	JobName = MarketAdditionPrefix .. "_HATMAKER_NAME",
	JobDescription = MarketAdditionPrefix .. "_HATMAKER_DESC",
	IsLockedByDefault = false,
	UseWorkplaceBehavior = true,
        AssetJobProgression = "DEFAULT_JOB_PROGRESSION"        
})

-- Register image assets
Hatmaker:registerAssetId("icons/hat.png", "ICON_" .. MarketAdditionPrefix .. "_HAT", "ATLAS_CELL")

-- Register hat (goods)
Hatmaker:registerAsset({
	DataType = "RESOURCE",
	Id = MarketAdditionPrefix .. "_HAT",
	ResourceName = MarketAdditionPrefix .. "_HAT",
	Icon = "ICON_" .. MarketAdditionPrefix .. "_HAT",
	ResourceTypeList = { "GOODS" },
	IsTradable = true,
        ResourceLayoutType = "CRATES",
        Prefab = MarketAdditionPrefix .. "_CRATE",
	TradeBuyingPrice = {{ Resource = "GOLD", Quantity = 10 }},
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 10 }},
})
