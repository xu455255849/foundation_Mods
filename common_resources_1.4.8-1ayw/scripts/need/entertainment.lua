local mod = ...



-- Entertainment need -------------------------------------------------------------------------------------

-- -- Icon
-- mod:registerAssetId("icons/NeedEntertainment.png", "ICON_NEED_ENTERTAINMENT", "ATLAS_CELL")

-- -- Happiness factor
-- mod:registerAsset({
--     DataType = "HAPPINESS_FACTOR",
--     Id = "HAPPINESS_FACTOR_ENTERTAINMENT",
--     Name = "NEED_ENTERTAINMENT_NAME",
--     Description = "HAPPINESS_FACTOR_ENTERTAINMENT_DESC",
--     Value = -2,
--     IsDecaying = true,
--     TimeBeforeDecayingSeconds = 120.0,
--     DecayingRatePerMinute = 3.5, -- default is 2.0
--     IsCumulative = true,
--     IsSolvable = true,
--     RemovedOnDecayed = false,
--     Icon = "ICON_NEED_ENTERTAINMENT",
-- })

-- -- Villager Need Type
-- mod:registerAsset({
--     DataType = "AGENT_NEED_TYPE_RESOURCE",
--     Id = "NEED_ENTERTAINMENT",
--     NeedTypeName = "NEED_ENTERTAINMENT_NAME",
--     NeedTypeDescription = "HAPPINESS_FACTOR_ENTERTAINMENT_DESC",
--     NeedTypeList = {"ENTERTAINMENT"}, -- this need type already exists in the vanilla game
--     FillDurationInSeconds = (60*28),
--     FillRate = 100,
--     GracePeriod = 7,
--     HappinessFactor = "HAPPINESS_FACTOR_ENTERTAINMENT",
--     ResourceTypeIcon = "ICON_NEED_ENTERTAINMENT",
-- })

mod:overrideAsset({
    Id = "NEED_ENTERTAINMENT",
    NeedTypeList = {
        Action = "APPEND",
        "ENTERTAINMENT",
    },
})
