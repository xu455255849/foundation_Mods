local mod = ...



-- Default Balancing (event list) ---------------------------------------------------------------------------------------------

mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_SECURITY_START",
        "EVENT_SECURITY_CRIME",
    }
})


-- Event: Start ---------------------------------------------------------------------------------------------

-- Narrative Panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_SECURITY_START",
    Title = "EVENT_SECURITY_START_TITLE",
    Description = "EVENT_SECURITY_START_DESC",
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

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_SECURITY_START",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SERF",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "COMMONER",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "CITIZEN",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_ROOKIE",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_SOLDIER",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_KNIGHT",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "FEMALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "FEMALE",
                },
                {
                    AssetVillagerStatus = "MONK_PRIOR",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_PRIOR",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = MinPopUnlock(),
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            DescriptionKey = "EVENT_SECURITY_START_DESC",
            AssetNarrativePanel = "NARRATIVE_PANEL_SECURITY_START",
        },
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                -- AssetBuildingList = {
                --     "BUILDING_SECURITY_STONE_KEEP",
                -- },
                AdditionalBuildingUnlockList = {
                    {
                        OwnerBuilding = "MONUMENT_RUSTIC_LORD_MANOR",
                        SubBuildingList = {
                            "BUILDING_SECURITY_RUSTIC_LORD_MANOR",
                            "BUILDING_SECURITY_RUSTIC_LORD_MANOR_PRISON",
                        },
                    },
                    {
                        OwnerBuilding = "MONUMENT_WOODEN_KEEP",
                        SubBuildingList = {
                            "BUILDING_SECURITY_WOODEN_KEEP",
                            "BUILDING_SECURITY_WOODEN_KEEP_PRISON",
                        },
                    },
                    {
                        OwnerBuilding = "MONUMENT_MONASTERY",
                        SubBuildingList = {
                            "BUILDING_SECURITY_MONASTERY",
                            "BUILDING_SECURITY_MONASTERY_PRISON",
                        },
                    },
                },
            },
        },
    },
})



-- Event: Crime ---------------------------------------------------------------------------------------------

-- Narrative Panel
mod:registerAsset({
    DataType = "ASSET_NARRATIVE_PANEL",
    Id = "NARRATIVE_PANEL_SECURITY_CRIME",
    Title = "EVENT_SECURITY_CRIME_TITLE",
    Description = "EVENT_SECURITY_CRIME_DESC",
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

-- Event
mod:registerAsset({
	DataType = "EVENT",
    Id = "EVENT_SECURITY_CRIME",
    IsInMainPool = false, -- the main pool seems to suppress itself until the first Weather event fires, so custom events should be outside the main pool
    IsRecurrent = false,
    DaysBetweenOccurences = nil,
    DaysToFirst = 1,
    Delay = 10,
	ConditionList = {
		{
            DataType = "GAME_CONDITION_VILLAGER_STATUS_REACHED",
            VillagerStatusGenderToValidateList = {
                {
                    AssetVillagerStatus = "SERF",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "COMMONER",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "CITIZEN",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_ROOKIE",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_SOLDIER",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "SOLDIER_KNIGHT",
                    GenderUsage = "ALL",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_NOVICE",
                    GenderUsage = "FEMALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK",
                    GenderUsage = "FEMALE",
                },
                {
                    AssetVillagerStatus = "MONK_PRIOR",
                    GenderUsage = "MALE",
                },
                {
                    AssetVillagerStatus = "MONK_PRIOR",
                    GenderUsage = "FEMALE",
                },
            },
            Quantity = MinPopCrime(),
		},
	},
	ActionList = {
        {
            DataType = "GAME_ACTION_SHOW_NARRATIVE_PANEL",
            DescriptionKey = "EVENT_SECURITY_CRIME_DESC",
            AssetNarrativePanel = "NARRATIVE_PANEL_SECURITY_CRIME",
        },
    },
})





