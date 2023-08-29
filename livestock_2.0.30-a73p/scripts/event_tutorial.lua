local mod = ...



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_LIVESTOCK_START",
    }
})



-- -- Event: Start ---------------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "EVENT",
--     Id = "EVENT_LIVESTOCK_START",
--     IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
--     IsRecurrent = false,
--     DaysBetweenOccurences = nil,
--     DaysToFirst = 1,
--     Delay = 10,
-- 	ConditionList = {
-- 		{
--             DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
--             AssetVillagerStatus = "COMMONER",
--             NumberRequired = 1
-- 		}
-- 	},
-- 	ActionList = {
--         {
--             DataType = "ACTION_SHOW_NARRATIVE_PANEL",
--             NarrativePanelData = {
--                 DataType = "DATA_NARRATIVE_PANEL",
--                 Title = "EVENT_LIVESTOCK_START_TITLE",
--                 Description = "EVENT_LIVESTOCK_START_DESC",
--                 PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
--             },
--             ChoiceList = {
--                 {
--                     DataType = "EVENT_CHOICE",
--                     ShortName = "EVENT_LIVESTOCK_OK",
--                     EventActionList = {
--                         {
--                             DataType = "EVENT_ACTION_IGNORE"
--                         },
--                     },
--                 }
--             },
--         }
--     }
-- })




-- Event ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_LIVESTOCK_START",
    Title = "EVENT_LIVESTOCK_START_TITLE",
    Description = "EVENT_LIVESTOCK_START_DESC",
    PanelVisual = "ILLUSTRATION_ESTATE_LABOR",
    PanelVisualCell = "ICON_UNLOCKABLE_BUILDING_LIVESTOCKFARM",
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
    Id = "EVENT_LIVESTOCK_START",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_UNLOCKABLE_BOUGHT",
            AssetUnlockable = "UNLOCKABLE_BUILDING_LIVESTOCKFARM",
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            AssetNarrativePanel = "NARRATIVE_PANEL_LIVESTOCK_START",
        },
    },
})
