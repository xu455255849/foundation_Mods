local mod = ...



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_TRADINGPOST_START",
    }
})



-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_TRADINGPOST_START",
    Title = "EVENT_TRADINGPOST_START_TITLE",
    Description = "EVENT_TRADINGPOST_START_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_UNLOCKABLE_BUILDING_TRADINGPOST",
    ChoiceList = {
        {
            DataType = "EVENT_CHOICE",
            ShortName = "EVENT_TRADINGPOST_OK",
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
    Id = "EVENT_TRADINGPOST_START",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_UNLOCKABLE_BOUGHT",
            AssetUnlockable = "UNLOCKABLE_BUILDING_TRADINGPOST",
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_TRADINGPOST_START",
        },
    },
})
