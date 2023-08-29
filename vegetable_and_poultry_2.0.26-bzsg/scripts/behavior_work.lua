local mod = ...


--[[

    As of January 2022, the vanilla BEHAIOR_WORK had a bug where output inventories stopped growing when the sum was 50, for multi-output workplaces.
    The worker continued to destroy inputs but no output was created.
    I built this behaviour to get around that issue. It is similar to the vanilla work behaviour but it continues to produce any non-full output
    until all outputs are full.

]]


-- Transporter box -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_POULTRY_WORK",
    PurposeList = {
        "REQUEST",
        "WORK",
    },
    CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                FrontList = {
                    "PREFAB_RESOURCE_VISUAL_CRATE",
                },
            },
            { -- FEMALE
                FrontList = {
                    "PREFAB_RESOURCE_VISUAL_CRATE",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
    },
})



-- Behavior Tree -------------------------------------------------------------------------------------
mod:registerBehaviorTree({
	Id = "BEHAVIOR_POULTRY_WORK",
	VariableList = {
		{
			Name = "AgentData",
			DataType = "BEHAVIOR_TREE_DATA_AGENT",
			IsPublic = true,
			InitialValue = {},
		},
		{
			Name = "DoJobTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			IsPublic = false,
			InitialValue = {
				TimeToWait = 0,
				Animation = AGENT_ANIMATION.GUARD,
				SetIdleAfterWait = false,
			},
		},
		{
			Name = "WorkplacePosition",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION",
			IsPublic = false,
			InitialValue = {
				CanNavigateOnGround = true,
				CanNavigateOnWater = false,
				IsSetOrientationOnDestination = true,
			},
		},
		{
			Name = "TransportData",
			DataType = "BEHAVIOR_TREE_DATA_RESOURCE_TRANSPORT",
			IsPublic = false,
            InitialValue = {
                TransportSetup = "INTERACTIVE_LOCATION_SETUP_POULTRY_WORK",
            },
		},
		{
			Name = "ResourceProducedList",
			DataType = "BEHAVIOR_TREE_DATA_RESOURCE_PRODUCTION",
			IsPublic = false,
		},
        {
			Name = "ShouldReceiveXp",
			DataType = "BEHAVIOR_TREE_DATA_BOOL",
			IsPublic = false,
			InitialValue = {
				Value = false,
			},
		},
		{
			Name = "WorkLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 10,
				Duration = 0,
				IsInfinite = false,
				IsDuration = false,
			},
		},
	},
	Root = {
		Name = "WorkingGlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "NeedFilledSelector",
				Type = "SELECTOR",
				Children = {
					{
						Name = "NeedFilledInverter",
						Type = "INVERTER",
						Child = {
							Name = "IsMyNeedFilled",
							Type = "IS_WORKPLACE_NEED_RESOURCE",
							AgentData = "AgentData",
						}
					},
					{
						Name = "FetchResourceSequencer",
						Type = "SEQUENCER",
						Children = {
							{
								Name = "FindResourceForWorkplace",
								Type = "FIND_RESOURCE_FOR_WORKPLACE",
								AgentData = "AgentData",
								TransportData = "TransportData",
							},
							{
								Name = "Transport",
								Type = "BEHAVIOR_TRANSPORT",
								AgentData = "AgentData",
								TransportData = "TransportData",
							},
						},
					},
				},
			},
			{
				Name = "WorkLoopRepeater",
				Type = "REPEAT",
				RepeatData = "WorkLoop",
				Child = {
					Name = "WorkLoopSequencer",
					Type = "SEQUENCER",
					Children = {
						{
							Name = "SetupWork",
							Type = "SETUP_WORK",
							AgentData = "AgentData",
							TimeToWait = "DoJobTimer",
							WorkPosition = "WorkplacePosition",
						},
						{
							Name = "GoToWorkplace",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplacePosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
						{
							Name = "ProduceResource",
							Type = "PRODUCE_RESOURCE",
							AgentData = "AgentData",
							TimeToWait = "DoJobTimer",
							ResourceProducedList = "ResourceProducedList",
						},
						{
							Name = "GiveXp",
							Type = "GIVE_JOB_XP",
							AgentData = "AgentData",
							ShouldReceiveXp = "",
						}
					}
				}
			}
		}
	}
})

