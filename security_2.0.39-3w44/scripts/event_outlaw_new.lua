local mod = ...



-- Event: Outlaw from Immigrant ---------------------------------------------------------------------------------------------------------------

-- Narrative Panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_SECURITY_OUTLAW_NEW",
    Title = "EVENT_SECURITY_OUTLAW_NEW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_NEW_DESC",
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
    Id = "NOTIFICATION_SECURITY_OUTLAW_NEW",
    Title = "EVENT_SECURITY_OUTLAW_NEW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_NEW_DESC",
    Icon = "ICON_RESOURCE_SWORD",
    Severity = 100,
    DelayBeforeHide = 30,
})

-- Event
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_SECURITY_OUTLAW_NEW",
    Title = "EVENT_SECURITY_OUTLAW_NEW_NAME",
    Description = "EVENT_SECURITY_OUTLAW_NEW_DESC",
    IsInMainPool = false,
    IsRecurrent = true,
    DaysToFirst = 1,
    ConditionList = {
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            DescriptionKey = "EVENT_SECURITY_OUTLAW_NEW_DESC",
            AssetNarrativePanel = "NARRATIVE_PANEL_SECURITY_OUTLAW_NEW",
            OptionalAssetNotification = "NOTIFICATION_SECURITY_OUTLAW_NEW",
        },
    },
})


