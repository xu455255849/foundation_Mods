local mod = ...



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_LIVESTOCK_COMPATIBILITY",
    }
})



-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_LIVESTOCK_COMPATIBILITY",
    Title = "EVENT_LIVESTOCK_COMPATIBILITY_TITLE",
    Description = "EVENT_LIVESTOCK_COMPATIBILITY_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM_CATTLE",
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
    Id = "EVENT_LIVESTOCK_COMPATIBILITY",
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 1,
	ConditionList = {
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_LIVESTOCK_COMPATIBILITY",
        },
    },
})
