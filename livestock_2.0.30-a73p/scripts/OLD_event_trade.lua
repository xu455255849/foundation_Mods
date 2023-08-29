local mod = ...


-- Prices of the trader selling animals (should match the Trading Village list)
local costGoat = 36
local costSheep = 48
local costCattle = 64
local costPig = 60



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_LIVESTOCK_TRADE",
    },
})



-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_LIVESTOCK_TRADE",
    IsInMainPool = false,
    IsRecurrent = true,
    DaysBetweenOccurences = 7 * 4 * 2, -- every 2 months
    DaysToFirst = 1,
    Delay = 2,
    ConditionList = {
        { -- only show Livestock Fair if minimum Prosperity achieved to unlock the first livestock
            DataType = "GAME_CONDITION_SCORE",
            ScoreNeeded = 50,
        },
        { -- only show Livestock Fair if at least one of the Livestock types is unlocked in the Trade routes
            DataType = "GAME_CONDITION_MULTIPLE_CONDITION",
            IsAny = true,
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_GOAT",
                },
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_SHEEP",
                },
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_CATTLE",
                },
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_PIG",
                },
            },
        },
        { -- only show Livestock Fair if you don't already have a minimum number of all of the animal types
            DataType = "GAME_CONDITION_MULTIPLE_CONDITION",
            IsAny = true,
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_GOAT",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_SHEEP",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_CATTLE",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_PIG",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
            },
        },
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_LIVESTOCK_TRADE",
            DescriptionKey = "EVENT_LIVESTOCK_TRADE_DESC",
            OptionalAssetNotification = "NOTIFICATION_LIVESTOCK_TRADE",
        },
    },
})


mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_LIVESTOCK_TRADE",
    Title = "EVENT_LIVESTOCK_TRADE_NAME",
    Description = "EVENT_LIVESTOCK_TRADE_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_LIVESTOCK_TRADE_RESOURCE_GOAT_NAME",
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_GOAT",
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS_OR_EQUAL",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_GOAT",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
            },
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_LIVESTOCK_TRADE_RESOURCE_GOAT",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_LIVESTOCK_TRADE_RESOURCE_SHEEP_NAME",
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_SHEEP",
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS_OR_EQUAL",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_SHEEP",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
            },
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_LIVESTOCK_TRADE_RESOURCE_SHEEP",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_LIVESTOCK_TRADE_RESOURCE_CATTLE_NAME",
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_CATTLE",
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS_OR_EQUAL",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_CATTLE",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
            },
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_LIVESTOCK_TRADE_RESOURCE_CATTLE",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_LIVESTOCK_TRADE_RESOURCE_PIG_NAME",
            ConditionList = {
                {
                    DataType = "GAME_CONDITION_UNLOCK_TRADE_ROUTE",
                    Resource = "RESOURCE_PIG",
                },
                {
                    DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
                    ComparisonOperator = "LESS_OR_EQUAL",
                    ResourceQtyPair = {
                        Resource = "RESOURCE_PIG",
                        Quantity = 20,
                    },
                    IsInStockage = false,
                    AllowStockpiled = true,
                },
            },
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_LIVESTOCK_TRADE_RESOURCE_PIG",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_LIVESTOCK_TRADE_IGNORE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

mod:registerAsset({
    DataType = "NOTIFICATION",
    Id = "NOTIFICATION_LIVESTOCK_TRADE",
    Title = "EVENT_LIVESTOCK_TRADE_NAME",
    Description = "EVENT_LIVESTOCK_TRADE_DESC",
    Icon = "ICON_RESOURCE_PIG",
    Severity = 1,
    DelayBeforeHide = 60 * 14, -- 14 days
})


-- Quest
local function registerQuest(resource, cost)
    mod:registerAsset({
        DataType = "QUEST",
        Id = "QUEST_LIVESTOCK_TRADE_" .. resource,
        Name = "QUEST_LIVESTOCK_TRADE_NAME",
        Description = "QUEST_LIVESTOCK_TRADE_DESC",
        ObjectiveList = {
            {
                DataType = "GAME_CONDITION_EXECUTE_ACTION_LIST",
                ActionList = {
                    {
                        DataType = "GAME_ACTION_DELIVER_RESOURCE",
                        IsDeliveryAction = false,
                        AmountToPay = {
                            {
                                Resource = "GOLD_COINS",
                                Quantity = cost,
                            },
                        },
                    },
                },
            },
        },
        FailureConditionList = {
            {
                DataType = "GAME_CONDITION_DAY_COUNT",
                DaysToComplete = 7,
            },
        },
        QuestSuccessActionList = {
            {
                DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
                ResourceCollection = {
                    {
                        Resource = resource,
                        Quantity = 5,
                    },
                },
            },
        },
        QuestFailActionList = {
            {
                DataType = "GAME_ACTION_DELIVER_RESOURCE",
                IsDeliveryAction = false,
                AmountToPay = {
                    {
                        Resource = "GOLD_COINS",
                        Quantity = 50,
                    },
                },
            },
        },
    })
end

registerQuest("RESOURCE_GOAT", costGoat * 5)
registerQuest("RESOURCE_SHEEP", costSheep * 5)
registerQuest("RESOURCE_CATTLE", costCattle * 5)
registerQuest("RESOURCE_PIG", costPig * 5)
