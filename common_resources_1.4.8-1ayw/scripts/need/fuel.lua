local mod = ...



-- Fuel need -------------------------------------------------------------------------------------
mod:registerAssetId("icons/fuel.png", "ICON_FUEL_NEED", "ATLAS_CELL")

-- Happiness factor
mod:registerAsset({
    DataType = "HAPPINESS_FACTOR",
    Id = "HAPPINESS_FACTOR_FUEL",
    Name = "FUEL_NEED_NAME",
    Description = "FUEL_NEED_DESC",
    Value = -2,
    IsDecaying = true,
    TimeBeforeDecayingSeconds = 120.0,
    DecayingRatePerMinute = 3.5,
    IsCumulative = true,
    IsSolvable = true,
    RemovedOnDecayed = false,
    Icon = "ICON_FUEL_NEED",
})

-- Villager Need Type
mod:registerAsset({
    DataType = "AGENT_NEED_TYPE_RESOURCE",
    Id = "FUEL_NEED",
    NeedTypeName = "NEED_FUEL_NAME",
    NeedTypeDescription = "NEED_FUEL_DESC",
    NeedTypeList = {"FUEL_RESOURCE_TYPE"},
    -- FillDurationInSeconds=840,
    FillDurationInSeconds = (60*16),
    FillRate = 100,
    GracePeriod = 7,
    HappinessFactor = "HAPPINESS_FACTOR_FUEL",
    ResourceTypeIcon = "ICON_FUEL_NEED",
})

