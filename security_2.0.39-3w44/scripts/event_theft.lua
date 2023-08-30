local mod = ...


-- Narrative Panel ------------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_SECURITY_THEFT",
    Title = "EVENT_SECURITY_THEFT_NAME",
    Description = "EVENT_SECURITY_OUTLAW_STOLE_DESC",
    PanelVisual = "ILLUSTRATION_EVENT_WAR",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_SECURITY_OK",
            EventActionList = {
                {
                    DataType = "EVENT_ACTION_IGNORE",
                },
            },
        },
    },
})


-- Notification ------------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "NOTIFICATION",
    Id = "NOTIFICATION_SECURITY_THEFT",
    Title = "EVENT_SECURITY_THEFT_NAME",
    Description = "EVENT_SECURITY_OUTLAW_STOLE_DESC",
    Icon = "ICON_RESOURCE_SWORD",
    Severity = 1,
    DelayBeforeHide = 30,
})



-- Create: Job, Quest, Event -------------------------------------------------------------------------------------
function SecurityRegisterTheft(resource)

    -- Event: Theft ---------------------------------------------------------------------------------------------------------------
    mod:registerAsset({
        DataType = "EVENT",
        Id = "EVENT_SECURITY_EVENT_THEFT_" .. resource,
        Title = "EVENT_SECURITY_THEFT_NAME",
        Description = "EVENT_SECURITY_OUTLAW_STOLE_DESC",
        IsInMainPool = false,
        IsRecurrent = true,
        DaysToFirst = 1,
        ConditionList = {
            {
                DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                ComparisonOperator = "GREATER_OR_EQUAL",
                ResourceQtyPair = {
                    Resource = resource,
                    Quantity = 20,
                },
                IsInStockage = false,
                AllowStockpiled = true,
            },
        },
        ActionList = {
            {
                DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
                AssetNarrativePanel = "NARRATIVE_PANEL_SECURITY_THEFT",
                OptionalAssetNotification = "NOTIFICATION_SECURITY_THEFT",
                DescriptionKey = "EVENT_SECURITY_OUTLAW_STOLE_DESC",
            },
            {
                DataType = "GAME_ACTION_DELIVER_RESOURCE",
                AmountToPay = {
                    {
                        Resource = resource,
                        Quantity = 20, -- math.random(5, 20),
                    },
                },
                BudgetCategory = "MISCELLANEOUS",
            },
            -- {
            --     DataType = "GAME_ACTION_GIVE_QUEST",
            --     Quest = "QUEST_SECURITY_EVENT_THEFT_" .. resource,
            -- },
        },
    })

end



SecurityRegisterTheft("BARREL")
SecurityRegisterTheft("BEER")
SecurityRegisterTheft("BERRIES")
SecurityRegisterTheft("BERRY_BREW")
SecurityRegisterTheft("BOAR")
SecurityRegisterTheft("BREAD")
SecurityRegisterTheft("BV1_BUTTER")
SecurityRegisterTheft("BV1_CARCASS")
SecurityRegisterTheft("BV1_EGG")
-- SecurityRegisterTheft("BV1_MEAT")
SecurityRegisterTheft("MEAT")
SecurityRegisterTheft("BV1_PASTRY")
SecurityRegisterTheft("BV1_SALT")
SecurityRegisterTheft("BV1_SUGAR")
SecurityRegisterTheft("CHEESE")
SecurityRegisterTheft("CLOTHES")
SecurityRegisterTheft("COAL")
SecurityRegisterTheft("FISH")
SecurityRegisterTheft("FLOUR")
SecurityRegisterTheft("GEMS")
SecurityRegisterTheft("GLASS")
SecurityRegisterTheft("GOLD_BARS")
SecurityRegisterTheft("GOLD_COINS")
SecurityRegisterTheft("GOLD_ORE")
SecurityRegisterTheft("GRAPES")
SecurityRegisterTheft("HERBS")
SecurityRegisterTheft("HONEY")
SecurityRegisterTheft("HOP")
SecurityRegisterTheft("IRON")
SecurityRegisterTheft("IRON_ORE")
SecurityRegisterTheft("JEWELRY")
SecurityRegisterTheft("LEATHER")
SecurityRegisterTheft("MARBLE")
SecurityRegisterTheft("MEAL")
SecurityRegisterTheft("MILK")
SecurityRegisterTheft("PLANK")
SecurityRegisterTheft("POLISHED_STONE")
SecurityRegisterTheft("QUARTZ")
SecurityRegisterTheft("CANDLE")
SecurityRegisterTheft("RESOURCE_CIDER")
SecurityRegisterTheft("RESOURCE_CLAY")
SecurityRegisterTheft("RESOURCE_FLAX")
SecurityRegisterTheft("RESOURCE_FRUIT")
SecurityRegisterTheft("RESOURCE_FURNITURE")
SecurityRegisterTheft("RESOURCE_MUSHROOM")
SecurityRegisterTheft("RESOURCE_POTTERY")
SecurityRegisterTheft("RESOURCE_POULTRY")
SecurityRegisterTheft("RESOURCE_SHINGLE")
SecurityRegisterTheft("RESOURCE_THATCH")
SecurityRegisterTheft("RESOURCE_TILE")
SecurityRegisterTheft("RESOURCE_VEGETABLE")
SecurityRegisterTheft("SCULPTURE")
SecurityRegisterTheft("SPEAR")
SecurityRegisterTheft("STAINED_GLASS")
SecurityRegisterTheft("STONE")
SecurityRegisterTheft("SWORD")
SecurityRegisterTheft("TOOL")
SecurityRegisterTheft("WHEAT")
SecurityRegisterTheft("WINE")
SecurityRegisterTheft("WOOD")
SecurityRegisterTheft("WOOL")
SecurityRegisterTheft("WOOLEN_CLOTH")
