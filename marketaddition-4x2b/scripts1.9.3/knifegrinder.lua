local KnifeGrinder = ...

KnifeGrinder:overrideAsset({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_KNIFEGRINDER"
    }
})

KnifeGrinder:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_KNIFEGRINDER"
    }
})

KnifeGrinder:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_KNIFEGRINDER"
    }
})

KnifeGrinder:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        MarketAdditionPrefix .. "_KNIFEGRINDER"
    }
})

KnifeGrinder:registerAssetId("models/knife.fbx/Prefab/knife", MarketAdditionPrefix .. "_KNIFEGRINDER_KNIFE_PREFAB")

-- Register Knife grinder job
KnifeGrinder:registerAsset({
    DataType = "JOB",
    Id = MarketAdditionPrefix .. "_KNIFEGRINDER",
    JobName = MarketAdditionPrefix .. "_KNIFEGRINDER_NAME",
    JobDescription = MarketAdditionPrefix .. "_KNIFEGRINDER_DESC",
    CharacterSetup = {
        CharacterSetupDataGendered = {
            -- MALE
            {
                DataType = "CHARACTER_SETUP_DATA",
            },
            -- FEMALE
            {
                DataType = "CHARACTER_SETUP_DATA",
            },
            -- ALL
            {
                DataType = "CHARACTER_SETUP_DATA",
                RightHandObject = { Model =  MarketAdditionPrefix .. "_KNIFEGRINDER_KNIFE_PREFAB" },
                IdleAnimation = "GRINDSTONE"
            }
        }
    },
    IsLockedByDefault = false,
    UseWorkplaceBehavior = true,
    AssetJobProgression = "DEFAULT_JOB_PROGRESSION"        
})

-- Register image assets
KnifeGrinder:registerAssetId("icons/knife.png", "ICON_" .. MarketAdditionPrefix .. "_KNIFE", "ATLAS_CELL")

-- Register knife (goods)
KnifeGrinder:registerAsset({
	DataType = "RESOURCE",
	Id = MarketAdditionPrefix .. "_KNIFE",
	ResourceName = MarketAdditionPrefix .. "_KNIFE",
	Icon = "ICON_" .. MarketAdditionPrefix .. "_KNIFE",
	ResourceTypeList = { "GOODS" },
	IsTradable = true,
        ResourceLayoutType = "CRATES",
        Prefab = MarketAdditionPrefix .. "_CRATE",
	TradeBuyingPrice = {{ Resource = "GOLD", Quantity = 15 }},
	TradeSellingPrice = {{ Resource = "GOLD", Quantity = 15 }},
})
