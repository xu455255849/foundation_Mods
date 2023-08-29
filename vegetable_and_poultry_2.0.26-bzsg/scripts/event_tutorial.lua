local mod = ...



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_POULTRY_START",
        "EVENT_VEGETABLE_START",
    }
})



-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_POULTRY_START",
    Title = "EVENT_POULTRY_START_TITLE",
    Description = "EVENT_POULTRY_START_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_UNLOCKABLE_BUILDING_POULTRYFARM",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_POULTRY_OK",
            EventActionList = {
                {
                    DataType = "EVENT_ACTION_IGNORE"
                },
            },
        }
    },
})

mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_POULTRY_START",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_UNLOCKABLE_BOUGHT",
            AssetUnlockable = "UNLOCKABLE_BUILDING_POULTRYFARM",
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_POULTRY_START",
        },
    },
})



-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_VEGETABLE_START",
    Title = "EVENT_VEGETABLE_START_TITLE",
    Description = "EVENT_VEGETABLE_START_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_UNLOCKABLE_BUILDING_VEGETABLEFARM",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_POULTRY_OK",
            EventActionList = {
                {
                    DataType = "EVENT_ACTION_IGNORE",
                },
            },
        }
    },
})

mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_VEGETABLE_START",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_UNLOCKABLE_BOUGHT",
            AssetUnlockable = "UNLOCKABLE_BUILDING_VEGETABLEFARM",
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_VEGETABLE_START",
        },
    },
})
