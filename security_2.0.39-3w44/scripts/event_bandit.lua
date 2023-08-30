local mod = ...



-- Job: Event Trigger -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "JOB",
    Id = "JOB_SECURITY_EVENT_BANDIT",
    JobName = "EVENT_SECURITY_BANDIT_NAME",
    JobDescription = "EVENT_SECURITY_BANDIT_DESC",
    IsLockedByDefault = true,
    Hidden = true,
    DefaultBehavior = "BEHAVIOR_WORK",
    ProductionDelay = 0.0, -- default 30
    AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
    CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
            },
            { -- FEMALE
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
    },
})

-- mod:overrideAsset({ Id = "NEWCOMER", CompatibleJobList = { Action = "APPEND", "JOB_SECURITY_EVENT_BANDIT" } })
mod:overrideAsset({ Id = "SERF", CompatibleJobList = { Action = "APPEND", "JOB_SECURITY_EVENT_BANDIT" } })
mod:overrideAsset({ Id = "COMMONER", CompatibleJobList = { Action = "APPEND", "JOB_SECURITY_EVENT_BANDIT" } })
mod:overrideAsset({ Id = "CITIZEN", CompatibleJobList = { Action = "APPEND", "JOB_SECURITY_EVENT_BANDIT" } })



-- Quest ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "QUEST",
    Id = "QUEST_SECURITY_EVENT_BANDIT",
    Name = "EVENT_SECURITY_BANDIT_NAME",
    Description = "EVENT_SECURITY_BANDIT_DESC",
    IsSilent = true,
    QuestFunction = {
        DataType = "QUEST_FUNCTION_ASSIGN_WORKER",
        Job = "JOB_SECURITY_EVENT_BANDIT",
    },
    QuestRewardActionList = nil,
    QuestFailActionList = nil,
    QuestListToUnlockAfter = nil,
    OnFailCallback = nil,
    OnSuccessCallback = {
        DataType = "EVENT_CALLBACK_TRIGGER_EVENT",
        Event = "EVENT_SECURITY_BANDIT"
    },
})


-- Default Balancing (event list) ---------------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_SECURITY_SETUP_BANDIT",
    },
})


-- Event: Setup Outlaw ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_SECURITY_SETUP_BANDIT",
    Title = "EVENT_SECURITY_BANDIT_NAME",
    Description = "EVENT_SECURITY_BANDIT_DESC",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysToFirst = 1, -- number of days from the start of the game (setting = 5 will fire the event at the start of Day 5). 
    ConditionList = {
        {
            DataType = "EVENT_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTER"
        }
    },
    ActionList = {
        {
            DataType = "EVENT_ACTION_GIVE_QUEST",
            Quest = "QUEST_SECURITY_EVENT_BANDIT"
        },
    }
})


-- Event: Bandit ---------------------------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_SECURITY_BANDIT",
    Title = "EVENT_SECURITY_BANDIT_NAME",
    Description = "EVENT_SECURITY_BANDIT_DESC",
    IsInMainPool = false,
    IsRecurrent = true,
    DaysToFirst = 1,
    ConditionList = {
    },
    ActionList = {
        {
            DataType = "ACTION_SHOW_NARRATIVE_PANEL",
            AssetNotification = "NOTIFICATION_SECURITY_BANDIT",
            NarrativePanelData = {
                DataType = "DATA_NARRATIVE_PANEL",
                Title = "EVENT_SECURITY_BANDIT_NAME",
                Description = "EVENT_SECURITY_BANDIT_DESC",
                PanelVisual = "ILLUSTRATION_EVENT_WAR",
            },
            ChoiceList = {
                {
                    DataType = "EVENT_CHOICE",
                    ShortName = "EVENT_SECURITY_OK",
                    EventActionList = {
                        {
                            DataType = "EVENT_ACTION_IGNORE"
                        },
                    },
                },
            },
        },
        {
            DataType = "EVENT_ACTION_GIVE_QUEST",
            Quest = "QUEST_SECURITY_EVENT_BANDIT"
        },
    }
})



-- Notification ---------------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "NOTIFICATION",
    Id = "NOTIFICATION_SECURITY_BANDIT",
    Title = "EVENT_SECURITY_BANDIT_NAME",
    Description = "EVENT_SECURITY_BANDIT_DESC",
    Severity = 1,
    DelayBeforeHide = 60,
})
