local mod = ...



-- Advanced Needs -------------------------------------------------------------------------------------

-- -- Social happiness factor
-- mod:registerAsset({
--     DataType = "HAPPINESS_FACTOR",
--     Id = "HAPPINESS_FACTOR_SOCIAL",
--     Name = "HAPPINESS_FACTOR_SOCIAL_NAME",
--     Description = "HAPPINESS_FACTOR_SOCIAL_DESC",
--     Value = -2,
--     IsDecaying = true,
--     TimeBeforeDecayingSeconds = 120.0,
--     DecayingRatePerMinute = 3.5,
--     IsCumulative = true,
--     IsSolvable = true,
--     RemovedOnDecayed = false,
--     Icon = "ICON_NEED_SOCIAL",
-- })


local function registerStatusNeed(name, start, finish, fill, grace, happiness, suffix)

    local upper = string.upper(name)
    mod:registerAssetId("icons/Need" .. name .. ".png", "ICON_NEED_" .. upper, "ATLAS_CELL")

    for level = start, finish do

        -- Resource Type
        mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_" .. upper .. "_LEVEL_" .. level .. suffix )

        -- Villager Need Type
        mod:registerAsset({
            DataType = "AGENT_NEED_TYPE_RESOURCE",
            Id = "NEED_" .. upper .. "_LEVEL_" .. level .. suffix,
            NeedTypeName = "NEED_" .. upper .. suffix .. "_NAME",
            NeedTypeDescription = "NEED_" .. upper .. suffix .. "_DESC",
            NeedTypeList = { "RESOURCE_TYPE_" .. upper .. "_LEVEL_" .. level .. suffix },
            IsUnique = true,
            FillDurationInSeconds = (60 * fill),
            FillRate = 100,
            GracePeriod = grace,
            HappinessFactor = happiness,
            ResourceTypeIcon = "ICON_NEED_" .. upper,
        })

    end

end

-- name, start level, finish level, fill days, grace days, happiness factor
-- registerStatusNeed("Drink", 1, 3, 7, 2, "HAPPINESS_FACTOR_LACK_PRIMARY_NEED", "")
-- registerStatusNeed("Food", 1, 3, 7, 4, "HAPPINESS_FACTOR_LACK_FOOD", "_GROUP_1")
-- registerStatusNeed("Food", 1, 3, 7, 4, "HAPPINESS_FACTOR_LACK_FOOD", "_GROUP_2")
-- registerStatusNeed("Food", 1, 3, 7, 4, "HAPPINESS_FACTOR_LACK_FOOD", "_GROUP_3")
-- registerStatusNeed("Faith", 1, 3, 7, 7, "HAPPINESS_FACTOR_LACK_SERVICES", "")
-- registerStatusNeed("Goods", 2, 3, 14, 7, "HAPPINESS_FACTOR_LACK_GOODS", "")
-- registerStatusNeed("Luxury", 3, 3, 14, 7, "HAPPINESS_FACTOR_BASE", "")
-- registerStatusNeed("Entertainment", 2, 3, 14, 7, "HAPPINESS_FACTOR_ENTERTAINMENT", "")
registerStatusNeed("Fuel", 1, 3, 14, 7, "HAPPINESS_FACTOR_FUEL", "")
-- registerStatusNeed("Social", 3, 3, 14, 7, "HAPPINESS_FACTOR_LACK_PRIMARY_NEED", "")



-- -- Faith: allow status to also attend a church at the next higher level
-- mod:overrideAsset({
--     Id = "NEED_FAITH_LEVEL_1",
--     NeedTypeList = {
--         Action = "APPEND",
--         "RESOURCE_TYPE_FAITH_LEVEL_2",
--     }
-- })

-- mod:overrideAsset({
--     Id = "NEED_FAITH_LEVEL_2",
--     NeedTypeList = {
--         Action = "APPEND",
--         "RESOURCE_TYPE_FAITH_LEVEL_3",
--     }
-- })



-- -- Housing
-- mod:registerAssetId("icons/NeedHouse.png", "ICON_NEED_HOUSE", "ATLAS_CELL")
-- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_HOUSE_LEVEL_3" )

-- mod:overrideAsset({
--     Id = "NEED_HOUSE_LEVEL_1",
--     NeedTypeName = "NEED_HOUSE_NAME",
--     NeedTypeDescription = "NEED_HOUSE_DESC",
--     ResourceTypeIcon = "ICON_NEED_HOUSE",
-- })

-- mod:overrideAsset({
--     Id = "NEED_HOUSE_LEVEL_2",
--     NeedTypeName = "NEED_HOUSE_NAME",
--     NeedTypeDescription = "NEED_HOUSE_DESC",
--     ResourceTypeIcon = "ICON_NEED_HOUSE",
-- })

-- -- Villager Need Type
-- mod:registerAsset({
--     DataType = "AGENT_NEED_TYPE_RESOURCE",
--     Id = "NEED_HOUSE_LEVEL_3",
--     NeedTypeName = "NEED_HOUSE_NAME",
--     NeedTypeDescription = "NEED_HOUSE_DESC",
--     NeedTypeList = { "RESOURCE_TYPE_HOUSE_LEVEL_3" },
--     IsUnique = true,
--     FillDurationInSeconds = (60*7),
--     FillRate = 100,
--     GracePeriod = 7,
--     HappinessFactor = "HAPPINESS_FACTOR_LACK_HOUSING",
--     ResourceTypeIcon = "ICON_NEED_HOUSE",
-- })

-- -- Hapiness Factor
-- mod:overrideAsset({
--     Id = "HAPPINESS_FACTOR_LACK_HOUSING",
--     Name = "HAPPINESS_FACTOR_LACK_HOUSING_NAME",
-- })

-- -- Soldier
-- mod:overrideAsset({
--     Id = "NEED_HOUSE_SOLDIER",
--     NeedTypeName = "NEED_HOUSE_SOLDIER_NAME",
--     NeedTypeDescription = "NEED_HOUSE_SOLDIER_DESC",
-- })

-- -- Monk
-- mod:overrideAsset({
--     Id = "NEED_HOUSE_MONASTERY",
--     NeedTypeName = "NEED_HOUSE_MONASTERY_NAME",
--     NeedTypeDescription = "NEED_HOUSE_MONASTERY_DESC",
-- })



-- -- Resource -------------------------------------------------------------------------------------
-- local function registerResource(start, finish, name, type, trade, display, gold)

--     local upper = string.upper(name)

--     for i = start, finish do

--         mod:registerAssetId("icons/" .. name .. i .. ".png", "ICON_" .. upper .. "_LEVEL_" .. i, "ATLAS_CELL")
--         mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_" .. upper .. "_LEVEL_" .. i )

--         local price = nil
--         if gold then
--             price = { Resource = "GOLD_COINS", Quantity = 5 + (i * 10) }
--         end

--         mod:registerAsset({
--             DataType = "RESOURCE",
--             Id = "RESOURCE_" .. upper .. "_LEVEL_" .. i,
--             ResourceName = "RESOURCE_" .. upper .. "_LEVEL_" .. i .. "_NAME",
--             Icon = "ICON_" .. upper .. "_LEVEL_" .. i,
--             ResourceTypeList = { "RESOURCE_TYPE_" .. type .. "_LEVEL_" .. i, "RESOURCE_TYPE_" .. upper .. "_LEVEL_" .. i, },
--             IsTradable = trade,
--             DisplayInInventory = display,
--             DisplayInToolbar = display,
--             -- VillagerBuyingPrice = price,
--         })

--     end

-- end

-- -- start, finish, type, trade, display
-- -- registerResource(2, 3, "Meal", "FOOD", false, true, true)
-- registerResource(1, 3, "Faith", "FAITH", false, false, false)
-- -- registerResource(1, 3, "Fuel", "FUEL", false, false, false)



-- -- Make new resources work for vanilla needs (to satisfy visitors)
-- mod:overrideAsset({
--     Id = "RESOURCE_FAITH_LEVEL_1",
--     ResourceTypeList = {
--         Action = "APPEND",
--         "SERVICE",
--     },
-- })

-- mod:overrideAsset({
--     Id = "RESOURCE_FAITH_LEVEL_2",
--     ResourceTypeList = {
--         Action = "APPEND",
--         "SERVICE",
--     },
-- })



-- -- -- Resource: Housing Level 3 (match to existing vanilla resources)
-- -- mod:registerAssetId("icons/Housing3.png", "ICON_HOUSING_LEVEL_3", "ATLAS_CELL")
-- -- mod:registerEnumValue( "RESOURCE_TYPE", "RESOURCE_TYPE_HOUSING_LEVEL_3" )

-- -- mod:registerAsset({
-- --     DataType = "RESOURCE",
-- --     Id = "HOUSING_LEVEL_3",
-- --     ResourceName = "RESOURCE_HOUSING_LEVEL_3_NAME",
-- --     Icon = "ICON_HOUSING_LEVEL_3",
-- --     ResourceTypeList = { "RESOURCE_TYPE_HOUSING_LEVEL_3", },
-- --     IsTradable = false,
-- --     DisplayInInventory = false,
-- --     DisplayInToolbar = false,
-- -- })



-- -- -- Fuel price
-- -- for i = 1, 3 do
-- --     mod:overrideAsset({
-- --         Id = "RESOURCE_FUEL_LEVEL_" .. i,
-- --         -- VillagerBuyingPrice = { Resource = "GOLD_COINS", Quantity = 2 },
-- --     })
-- -- end



