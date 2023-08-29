local mod = ...




-- Change starting inventory -------------------------------------------------------------------------------------
mod:overrideAsset({
	Id = "DEFAULT_VILLAGE_CENTER_INVENTORY",
	Collection = {
		Action = "APPEND",
        {Resource = "TOOL", Quantity = 30},
        {Resource = "WOOD", Quantity = 20},
    },
})



-- Asset  -------------------------------------------------------------------------------------
mod:registerAssetId("models/Authority2.fbx/Prefab/Blank", "PREFAB_AUTHORITY_BLANK") -- used to remove belts from authority jobs
mod:registerAssetId("models/Authority2.fbx/Prefab/GroomMaleHat", "PREFAB_AUTHORITY_GROOM_MALE_HAT")
mod:registerAssetId("models/Authority2.fbx/Prefab/GroomFemaleHat", "PREFAB_AUTHORITY_GROOM_FEMALE_HAT")




-- Territory Purchase and Maintenance (OVERRIDE) -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "DEFAULT_BALANCING",
    TerritoryPrice = {
		{
			Resource = "RESOURCE_AUTHORITY",
			Quantity = 20,
		},
	},
    TerritoryRoyalTaxesList = {
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 0,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 0,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 0,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 2,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 4,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 6,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 8,
            },
        },
        {
            {
                Resource = "RESOURCE_AUTHORITY",
                Quantity = 10,
            },
        },
    },
})



-- Job: Servant -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_AUTHORITY_SERVANT",
	JobName = "JOB_AUTHORITY_SERVANT_NAME",
	JobDescription = "JOB_AUTHORITY_SERVANT_DESC",
    IsLockedByDefault = false,
    Hidden = false,
	DefaultBehavior = "BEHAVIOR_WORK",
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_AUTHORITY_GROOM_MALE_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_AUTHORITY_GROOM_FEMALE_HAT",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_AUTHORITY_SERVANT",
    },
})



-- Gift of Authority as you advance -------------------------------------------------------------------------
for i = 2, 3 do

    mod:overrideAsset({
        Id = "PROGRESS_TIER_LABOUR_T" .. i,
        OnReachedFirstTimeActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
                ResourceCollection = {
                    {
                        Resource = "RESOURCE_AUTHORITY",
                        Quantity = 20,
                    },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "PROGRESS_TIER_KINGDOM_T" .. i,
        OnReachedFirstTimeActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
                ResourceCollection = {
                    {
                        Resource = "RESOURCE_AUTHORITY",
                        Quantity = 20,
                    },
                },
            },
        },
    })

    mod:overrideAsset({
        Id = "PROGRESS_TIER_CLERGY_T" .. i,
        OnReachedFirstTimeActionList = {
            Action = "APPEND",
            {
                DataType = "GAME_ACTION_GIVE_RESOURCE_LIST",
                ResourceCollection = {
                    {
                        Resource = "RESOURCE_AUTHORITY",
                        Quantity = 20,
                    },
                },
            },
        },
    })

end



-- Promotion (OVERRIDE) -------------------------------------------------------------------------------------
-- mod:overrideAsset({
--     Id = "GAME_RULE_STATUS_PROMOTION_DEFAULT",
--     StatusCostList = {
-- 		-- {
-- 		-- 	Status = "SERF",
-- 		-- 	Cost = {
-- 		-- 		{
-- 		-- 			Resource = "RESOURCE_AUTHORITY",
-- 		-- 			Quantity = 2
-- 		-- 		},
-- 		-- 		{
-- 		-- 			Resource = "GOLD_COINS",
-- 		-- 			Quantity = 10
-- 		-- 		},
-- 		-- 	},
-- 		-- },
-- 		{
-- 			Status = "COMMONER",
-- 			Cost = {
-- 				{
-- 					Resource = "RESOURCE_AUTHORITY",
-- 					Quantity = 5
-- 				},
-- 			},
-- 		},
-- 		{
-- 			Status = "CITIZEN",
-- 			Cost = {
-- 				{
-- 					Resource = "RESOURCE_AUTHORITY",
-- 					Quantity = 20
-- 				},
-- 			},
-- 		},
-- 		-- {
-- 		-- 	Status = "MONK_PRIOR",
-- 		-- 	Cost = {
-- 		-- 		{
-- 		-- 			Resource = "RESOURCE_AUTHORITY",
-- 		-- 			Quantity = 20
-- 		-- 		},
-- 		-- 	}
-- 		-- },
-- 		{
-- 			Status = "SOLDIER_SOLDIER",
-- 			Cost = {
--                 Action = "APPEND",
-- 				{
-- 					Resource = "RESOURCE_AUTHORITY",
-- 					Quantity = 5
-- 				},
-- 			},
-- 		},
-- 		{
-- 			Status = "SOLDIER_KNIGHT",
-- 			Cost = {
--                 Action = "APPEND",
-- 				{
-- 					Resource = "RESOURCE_AUTHORITY",
-- 					Quantity = 20
-- 				},
-- 			},
-- 		},
-- 	}
-- })



-- -- Estate: Nobility ------------------------------------------------------------------------------------------------------
-- mod:registerAsset({
--     DataType = "ESTATE",
--     Id = "ESTATE_NOBILITY",
--     EstateName = "ESTATE_NOBILITY_NAME",
--     InfluenceIcon = "ICON_RESOURCE_BARREL",
--     SplendorIcon = "ICON_RESOURCE_BARREL",
--     DualIcon = "ICON_RESOURCE_BARREL",
--     RatingIcon = "ICON_RESOURCE_BARREL",
--     HeaderImage = "ICON_RESOURCE_BARREL",
--     PanelVisual = "ILLUSTRATION_EVENT_WAR",
--     AssetProgressPath = "PROGRESS_PATH_CLERGY",
--     DefaultPrivilegeList = {},
--     InfluenceEffectList = {},
--     EstateInfluenceRange = "DEFAULT_INFLUENCE_RANGE",
--     AssetBuildingList = {},
-- })

-- mod:overrideAsset({
--     Id = "DEFAULT_ESTATE_SETTING",
--     AssetEstateList = {
--         Action = "APPEND",
--         "ESTATE_NOBILITY",
--     },
-- })



-- -- Prosperity ------------------------------------------------------------------------------------------------------
-- mod:overrideAsset({
--     Id = "UNLOCKABLE_COMMON_STONEMASON",
--     IsRecurrent = true,
--     DaysBeforeBuyingAgain = 7,
--     DataCost = {
--         Action = "APPEND",
--         ResourceCollection = {
--             Action = "APPEND",
--             {
--                 Resource = "GOLD_COINS",
--                 Quantity = 200,
--             },
--         },
--     },
-- })



-- -- Testing
-- mod:overrideAsset({
--     Id = "GOLD_COINS",
--     DisplayInToolbar = true,
-- })