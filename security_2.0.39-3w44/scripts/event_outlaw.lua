local mod = ...



-- Event: Outlaw ---------------------------------------------------------------------------------------------------------------

-- Narrative Panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_SECURITY_OUTLAW",
    Title = "EVENT_SECURITY_OUTLAW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_DESC",
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

-- Notification
mod:registerAsset({
    DataType = "NOTIFICATION",
    Id = "NOTIFICATION_SECURITY_OUTLAW",
    Title = "EVENT_SECURITY_OUTLAW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_NAME",
    Icon = "ICON_RESOURCE_SWORD",
    Severity = 1,
    DelayBeforeHide = 30,
})

-- Event
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_SECURITY_OUTLAW",
    Title = "EVENT_SECURITY_OUTLAW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_DESC",
    IsInMainPool = false,
    IsRecurrent = true,
    DaysToFirst = 1,
    ConditionList = {
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            DescriptionKey = "EVENT_SECURITY_OUTLAW_DESC",
            AssetNarrativePanel = "NARRATIVE_PANEL_SECURITY_OUTLAW",
            OptionalAssetNotification = "NOTIFICATION_SECURITY_OUTLAW",
        },
        -- {
        --     DataType = "GAME_ACTION_GIVE_QUEST",
        --     Quest = "QUEST_SECURITY_EVENT_OUTLAW",
        -- },
    },
})

