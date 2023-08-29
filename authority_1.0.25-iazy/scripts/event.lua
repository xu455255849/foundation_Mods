local mod = ...




-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_AUTHORITY_LABOUR_COMMONER",
        "EVENT_AUTHORITY_LABOUR_GOLD",
        "EVENT_AUTHORITY_LABOUR_LORDLADY",
        "EVENT_AUTHORITY_KINGDOM_SOLDIER",
        "EVENT_AUTHORITY_KINGDOM_RECRUIT",
        "EVENT_AUTHORITY_KINGDOM_MISSION",
        "EVENT_AUTHORITY_CLERGY_MONKNUN",
        "EVENT_AUTHORITY_CLERGY_RECRUIT",
        "EVENT_AUTHORITY_CLERGY_MANUSCRIPT",
    },
})



-- Labour: 10 Commoners ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_LABOUR_COMMONER",
    Title = "EVENT_AUTHORITY_LABOUR_COMMONER_TITLE",
    Description = "EVENT_AUTHORITY_LABOUR_COMMONER_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_RESOURCE_TOOLS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_LABOUR_COMMONER",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_LABOUR_COMMONER",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "COMMONER",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 1,
        },
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_LABOUR_COMMONER",
        },
    },
})

-- Outcome Panel
mod:registerAsset({
    DataType = "OUTCOME_PANEL_DATA",
    Id = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
    TitleKey = "OUTCOME_PANEL_AUTHORITY_SUCCESS_TITLE",
    DescriptionKey = "OUTCOME_PANEL_AUTHORITY_SUCCESS_DESC",
    Result = "SUCCESS",
    DisplayTime = 10,
})

mod:registerAsset({
    DataType = "OUTCOME_PANEL_DATA",
    Id = "OUTCOME_PANEL_AUTHORITY_FAILURE",
    TitleKey = "OUTCOME_PANEL_AUTHORITY_FAILURE_TITLE",
    DescriptionKey = "OUTCOME_PANEL_AUTHORITY_FAILURE_DESC",
    Result = "FAILURE",
    DisplayTime = 10,
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_LABOUR_COMMONER",
    Name = "QUEST_AUTHORITY_LABOUR_COMMONER_NAME",
    Description = "QUEST_AUTHORITY_LABOUR_COMMONER_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "COMMONER",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 10,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 90,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 20,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Labour: 2000 Gold Coins ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_LABOUR_GOLD",
    Title = "EVENT_AUTHORITY_LABOUR_GOLD_TITLE",
    Description = "EVENT_AUTHORITY_LABOUR_GOLD_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_RESOURCE_TOOLS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_LABOUR_GOLD",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_LABOUR_GOLD",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
            ComparisonOperator = "GREATER_OR_EQUAL",
            ResourceQtyPair = {
                Resource = "GOLD_COINS",
                Quantity = 1000,
            },
            IsInStockage = false,
            AllowStockpiled = true,
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_LABOUR_GOLD",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_LABOUR_GOLD",
    Name = "QUEST_AUTHORITY_LABOUR_GOLD_NAME",
    Description = "QUEST_AUTHORITY_LABOUR_GOLD_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
            ComparisonOperator = "GREATER_OR_EQUAL",
            ResourceQtyPair = {
                Resource = "GOLD_COINS",
                Quantity = 2000,
            },
            IsInStockage = false,
            AllowStockpiled = true,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 6,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Labour: Lord and Lady ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_LABOUR_LORDLADY",
    Title = "EVENT_AUTHORITY_LABOUR_LORDLADY_TITLE",
    Description = "EVENT_AUTHORITY_LABOUR_LORDLADY_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_RESOURCE_TOOLS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_LABOUR_LORDLADY",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_LABOUR_LORDLADY",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_TIER_UNLOCKED",
            Estate = "LABOUR",
            ProgressTierLevel = 3,
            ComparisonOperator = "GREATER_OR_EQUAL",
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_LABOUR_LORDLADY",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_LABOUR_LORDLADY",
    Name = "QUEST_AUTHORITY_LABOUR_LORDLADY_NAME",
    Description = "QUEST_AUTHORITY_LABOUR_LORDLADY_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_AUTHORITY_LORD",
        },
        {
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_AUTHORITY_LADY",
        },
        {
            DataType = "GAME_CONDITION_WORKER_ASSIGNED",
            AssetJob = "JOB_AUTHORITY_LORD",
        },
        {
            DataType = "GAME_CONDITION_WORKER_ASSIGNED",
            AssetJob = "JOB_AUTHORITY_LADY",
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 9,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Kingdom: 10 Soldiers ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_SOLDIER",
    Title = "EVENT_AUTHORITY_KINGDOM_SOLDIER_TITLE",
    Description = "EVENT_AUTHORITY_KINGDOM_SOLDIER_DESC",
    PanelVisual = "ILLUSTRATION_EVENT_WAR",
    PanelVisualCell = "ICON_RESOURCE_SWORD",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_KINGDOM_SOLDIER",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_KINGDOM_SOLDIER",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SOLDIER_SOLDIER",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 1,
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_SOLDIER",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_KINGDOM_SOLDIER",
    Name = "QUEST_AUTHORITY_KINGDOM_SOLDIER_NAME",
    Description = "QUEST_AUTHORITY_KINGDOM_SOLDIER_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SOLDIER_SOLDIER",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 10,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 6,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 20,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Kingdom: 30 Recruits ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_RECRUIT",
    Title = "EVENT_AUTHORITY_KINGDOM_RECRUIT_TITLE",
    Description = "EVENT_AUTHORITY_KINGDOM_RECRUIT_DESC",
    PanelVisual = "ILLUSTRATION_EVENT_WAR",
    PanelVisualCell = "ICON_RESOURCE_SWORD",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_KINGDOM_RECRUIT",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_KINGDOM_RECRUIT",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SOLDIER_ROOKIE",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 10,
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_RECRUIT",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_KINGDOM_RECRUIT",
    Name = "QUEST_AUTHORITY_KINGDOM_RECRUIT_NAME",
    Description = "QUEST_AUTHORITY_KINGDOM_RECRUIT_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SOLDIER_ROOKIE",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 30,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 6,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Kingdom: 3 missions completed ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_MISSION",
    Title = "EVENT_AUTHORITY_KINGDOM_MISSION_TITLE",
    Description = "EVENT_AUTHORITY_KINGDOM_MISSION_DESC",
    PanelVisual = "ILLUSTRATION_EVENT_WAR",
    PanelVisualCell = "ICON_RESOURCE_SWORD",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_KINGDOM_MISSION",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_KINGDOM_MISSION",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SOLDIER_ROOKIE",
                    GenderUsage = "ALL",
                },
            },
            Quantity = 1,
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_KINGDOM_MISSION",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_KINGDOM_MISSION",
    Name = "QUEST_AUTHORITY_KINGDOM_MISSION_NAME",
    Description = "QUEST_AUTHORITY_KINGDOM_MISSION_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_MILITARY_CAMPAIGN_COMPLETED",
            AssetEventMilitaryCampaign = "NARRATIVE_KINGDOMBOARD_MTC_FOOD_CITY_Q1",
        },
        {
            DataType = "GAME_CONDITION_MILITARY_CAMPAIGN_COMPLETED",
            AssetEventMilitaryCampaign = "NARRATIVE_KINGDOMBOARD_MTC_WEALTH_MONASTERY_Q1",
        },
        {
            DataType = "GAME_CONDITION_MILITARY_CAMPAIGN_COMPLETED",
            AssetEventMilitaryCampaign = "NARRATIVE_KINGDOMBOARD_MTC_WEALTH_MONASTERY_Q2",
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 12,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Clergy: 10 Monks / Nuns ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_CLERGY_MONKNUN",
    Title = "EVENT_AUTHORITY_CLERGY_MONKNUN_TITLE",
    Description = "EVENT_AUTHORITY_CLERGY_MONKNUN_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_CHURCH",
    PanelVisualCell = "ICON_RESOURCE_STAINED_GLASS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_CLERGY_MONKNUN",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_CLERGY_MONKNUN",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = 1,
        },
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_CLERGY_MONKNUN",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_CLERGY_MONKNUN",
    Name = "QUEST_AUTHORITY_CLERGY_MONKNUN_NAME",
    Description = "QUEST_AUTHORITY_CLERGY_MONKNUN_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = 10,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 6,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 20,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Clergy: 30 Monks / Nuns ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_CLERGY_RECRUIT",
    Title = "EVENT_AUTHORITY_CLERGY_RECRUIT_TITLE",
    Description = "EVENT_AUTHORITY_CLERGY_RECRUIT_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_CHURCH",
    PanelVisualCell = "ICON_RESOURCE_STAINED_GLASS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_CLERGY_RECRUIT",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_CLERGY_RECRUIT",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = 10,
        },
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_CLERGY_RECRUIT",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_CLERGY_RECRUIT",
    Name = "QUEST_AUTHORITY_CLERGY_RECRUIT_NAME",
    Description = "QUEST_AUTHORITY_CLERGY_RECRUIT_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = 30,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 12,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})



-- Clergy: 50 Manuscripts ---------------------------------------------------------------------------------------------

-- Narrative panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_AUTHORITY_CLERGY_MANUSCRIPT",
    Title = "EVENT_AUTHORITY_CLERGY_MANUSCRIPT_TITLE",
    Description = "EVENT_AUTHORITY_CLERGY_MANUSCRIPT_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_CHURCH",
    PanelVisualCell = "ICON_RESOURCE_STAINED_GLASS",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_ACCEPT",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_GIVE_QUEST",
                    Quest = "QUEST_AUTHORITY_CLERGY_MANUSCRIPT",
                },
            },
        },
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_AUTHORITY_DECLINE",
            EventActionList = {
                {
                    DataType = "GAME_ACTION_IGNORE",
                },
            },
        },
    },
})

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_AUTHORITY_CLERGY_MANUSCRIPT",
    IsInMainPool = false,
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 30,
	ConditionList = {
        {
            DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
            ComparisonOperator = "GREATER_OR_EQUAL",
            ResourceQtyPair = {
                Resource = "MANUSCRIPT",
                Quantity = 1,
            },
            IsInStockage = false,
            AllowStockpiled = true,
        },
    },
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_AUTHORITY_CLERGY_MANUSCRIPT",
        },
    },
})

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_AUTHORITY_CLERGY_MANUSCRIPT",
    Name = "QUEST_AUTHORITY_CLERGY_MANUSCRIPT_NAME",
    Description = "QUEST_AUTHORITY_CLERGY_MANUSCRIPT_DESC",
    ObjectiveList = {
        {
            DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
            ComparisonOperator = "GREATER_OR_EQUAL",
            ResourceQtyPair = {
                Resource = "MANUSCRIPT",
                Quantity = 50,
            },
            IsInStockage = false,
            AllowStockpiled = true,
        },
    },
    FailureConditionList = {
        {
            DataType = "GAME_CONDITION_DAY_COUNT",
            DaysToComplete = 30 * 12,
        },
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            ResourceCollection = {
                {
                    Resource = "RESOURCE_AUTHORITY",
                    Quantity = 30,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_SUCCESS",
        },
    },
    QuestFailActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "GOLD_COINS",
                    Quantity = 200,
                },
            },
        },
        {
            DataType = "GAME_ACTION_SHOW_OUTCOME_PANEL",
            AssetOutcomePanel = "OUTCOME_PANEL_AUTHORITY_FAILURE",
        },
    },
})