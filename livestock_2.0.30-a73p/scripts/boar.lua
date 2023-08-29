local mod = ...



-- Hunter's hut to produce carcass ---------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCK_HUNTER",
    Name = "HUNTERS_HUT",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "HUNTER",
        Behavior = "BEHAVIOR_GATHER",
	},
    ResourceListNeeded = {
        { Resource = "BOAR", Quantity = 1 },
    },
    ResourceProduced = {
        { Resource = "BV1_CARCASS", Quantity = 1 },
    },
})

mod:overrideAsset({
    Id = "BUILDING_PART_HUNTERS_HUT",
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCK_HUNTER",
})

mod:overrideAsset({
    Id = "BUILDING_FUNCTION_HUNTERS_HUT",
	ResourceProduced = {
        { Resource = "BV1_CARCASS", Quantity = 1 },
    },
})



-- Butcher to process carcass ---------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BUILDING_FUNCTION_BUTCHER",
	InputInventoryCapacity = {
        { Resource = "BV1_CARCASS", Quantity = 50 },
	},
	ResourceListNeeded = {
        { Resource = "BV1_CARCASS", Quantity = 1 },
    },
})



-- Boar Resource hidden and not storable in granary -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BOAR",
    DisplayInToolbar = false,
	ResourceTypeList = {
    },
})



-- Change tavern meal recipe -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "BUILDING_FUNCTION_KITCHEN",
    InputInventoryCapacity = {
        { Resource = "MEAT", Quantity = 25 },
        { Resource = "CHEESE", Quantity = 25 },
    },
    ResourceListNeeded = {
        { Resource = "MEAT", Quantity = 1 },
        { Resource = "CHEESE", Quantity = 1 },
    },
    ResourceProduced = {
        { Resource = "MEAL", Quantity = 3 },
    },
})



-- Event to convert boar received in military missions to carcasses ---------------------------------------------------------------------------------------------

-- Quest
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_LIVESTOCK_BOAR",
    Name = "QUEST_LIVESTOCK_BOAR_NAME",
    IsSilent = true,
    ObjectiveList = {
		{
            DataType = "GAME_CONDITION_RESOURCE_QUANTITY_NUMBER",
            ComparisonOperator = "GREATER_OR_EQUAL",
            ResourceQtyPair = {
                Resource = "BOAR",
                Quantity = 5,
            },
		},
    },
    QuestSuccessActionList = {
        {
            DataType = "GAME_ACTION_DELIVER_RESOURCE",
            IsDeliveryAction = false,
            AmountToPay = {
                {
                    Resource = "BOAR",
                    Quantity = 5,
                },
            },
        },
        {
            DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
            BudgetCategory = "QUESTS",
            ResourceCollection = {
                {
                    Resource = "BV1_CARCASS",
                    Quantity = 5,
                },
            },
        },
        {
            DataType = "GAME_ACTION_GIVE_QUEST",
            Quest = "QUEST_LIVESTOCK_BOAR",
        },
    },
})

-- Event
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_LIVESTOCK_BOAR",
    },
})

mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_LIVESTOCK_BOAR",
    IsRecurrent = false,
    -- DaysBetweenOccurences = 1,
    IgnoreConditionOnRecurrence = false,
    DaysToFirst = 1,
    Delay = 0,
    ConditionList = {
        {
            DataType = "EVENT_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTER",
        },
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_GIVE_QUEST",
            Quest = "QUEST_LIVESTOCK_BOAR",
        },
        -- {
        --     DataType = "GAME_ACTION_TRIGGER_EVENT_CALLBACK",
        --     Callback = {
        --         DataType = "EVENT_CALLBACK_TRIGGER_EVENT",
        --         Event = "EVENT_LIVESTOCK_BOAR",
        --         Delay = 0,
        --     },
        -- },
    },
})

