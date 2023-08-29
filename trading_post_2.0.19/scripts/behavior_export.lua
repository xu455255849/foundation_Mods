
local mod = ...



-- mod:registerBehaviorTreeNode({
--     Name = "BEHAVIOUR_NODE_TRADINGPOST_EXPORT_WORK",
--     VariableList = {
-- 		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
-- 		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
-- 		Var3 = "BEHAVIOR_TREE_DATA_LOCATION",
-- 		Var4 = "BEHAVIOR_TREE_DATA_RESOURCE_TRANSPORT",
-- 		Var5 = "BEHAVIOR_TREE_DATA_LOOP"
--     },

--     Init = function(self, instance)

--         return BEHAVIOR_TREE_NODE_RESULT.TRUE

--     end,
--     Update = function(self, instance)

--         return BEHAVIOR_TREE_NODE_RESULT.TRUE

--     end,
    
--     Finish = function(self, instance)

--         return BEHAVIOR_TREE_NODE_RESULT.TRUE

--     end,

-- })



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_TRADINGPOST_EXPORT_PRODUCE",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent
     
        local compExport = nil
        compExport = compAgent:getOwner():getComponent("COMP_VILLAGER"):getJobInstance().Workplace:getOwner():getComponent("COMP_TRADINGPOST_EXPORT")
        if (compExport) then

            compExport.Quantity = compExport.Quantity + 1
            -- mod:log("Increased exports at this station to " .. tostring(compExport.Quantity))
            compExport:drawCrates()
            return BEHAVIOR_TREE_NODE_RESULT.TRUE

        else

            mod:log("No COMP_TRADINGPOST_EXPORT found on this object.")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end

})



mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_TRADINGPOST_EXPORT",
    PurposeList = {
        "REQUEST", -- In 1.7 this was DEFAULT, not sure if this is correct in 1.8?
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



-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_TRADINGPOST_EXPORT",
    VariableList = {
        {
            Name = "AgentData",
            DataType = "BEHAVIOR_TREE_DATA_AGENT",
            IsPublic = false,
            InitialValue = {}
        },
		{
			Name = "DoJobTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			IsPublic = false,
			InitialValue = {
				TimeToWait = 0,
				Animation = AGENT_ANIMATION.IDLE,
				SetIdleAfterWait = true,
			}
		},
		{
			Name = "WorkplacePosition",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION",
			IsPublic = false,
			InitialValue = {
				CanNavigateOnGround = true,
				CanNavigateOnWater = false,
				IsSetOrientationOnDestination = true,
			}
		},
		{
			Name = "TransportData",
			DataType = "BEHAVIOR_TREE_DATA_RESOURCE_TRANSPORT",
			IsPublic = false,
            InitialValue = {
                TransportSetup = "INTERACTIVE_LOCATION_SETUP_TRADINGPOST_EXPORT",
            }
		},
		{
			Name = "ResourceProducedList",
			DataType = "BEHAVIOR_TREE_DATA_RESOURCE_PRODUCTION",
			IsPublic = false,
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
			}
		},
    },
	Root = {
		Name = "WorkingGlobalSequencer",
		Type = "SEQUENCER",
		Children = {
            {
                Name = "HasWorkplace",
                Type = "IS_WORKPLACE_AVAILABLE",
                AgentData = "AgentData"
            },
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
            -- {
			-- 	Name = "ExportWorkLoop",
			-- 	Type = "BEHAVIOUR_NODE_TRADINGPOST_EXPORT_WORK",
			-- 	Var1 = "AgentData",
			-- 	Var2 = "DoJobTimer",
			-- 	Var3 = "WorkplacePosition",
			-- 	Var4 = "TransportData",
			-- 	Var5 = "WorkLoop",
			-- },
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
							Name = "GoToWork",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplacePosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        -- { -- This clears out the input inventory
						-- 	Name = "SetupWork",
						-- 	Type = "SETUP_WORK",
						-- 	AgentData = "AgentData",
						-- 	TimeToWait = "DoJobTimer",
						-- 	WorkPosition = "WorkplacePosition",
						-- },
                        -- {
                        --     Name = "WaitAtWork",
                        --     Type = "WAIT",
                        --     AgentData = "AgentData",
                        --     TimeToWait = "DoJobTimer",
                        --     OptionalUseWorkstationAnim = "",
                        -- },
						{
							Name = "ProduceResource",
							Type = "PRODUCE_RESOURCE",
							AgentData = "AgentData",
							TimeToWait = "DoJobTimer",
							ResourceProducedList = "ResourceProducedList",
						},
						{
							Name = "UpdateExports",
							Type = "BEHAVIOUR_NODE_TRADINGPOST_EXPORT_PRODUCE",
							AgentData = "AgentData",
						},
						{
							Name = "GettingXp",
							Type = "GIVE_JOB_XP",
							AgentData = "AgentData",
							ShouldReceiveXp = "",
						},
					},
				},
			},
		},
	},
})

