
local mod = ...



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_PRISONER",
    VariableList = {
		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
		Var3 = "BEHAVIOR_TREE_DATA_WAIT",
		Var4 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var5 = "BEHAVIOR_TREE_DATA_LOOP",
    },

    Update = function(self, instance)
        return BEHAVIOR_TREE_NODE_RESULT.TRUE
    end,

})



-- Node: Leave Prison --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_PRISONER_LEAVEPRISON",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compSecVill = nil
        compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")

        local compVillager = nil
        compVillager = compAgent:getOwner():getComponent("COMP_VILLAGER")

        local compPos = nil

        -- Turn off prisoner flag
        compSecVill.PrisonerFlag = false

        -- -- Unreserve prison position
        -- compPos = compSecVill.PrisonerPosition
        -- compPos.Reserved = false
        -- compPos.DayReserved = -1

        -- Make unemployed
        compVillager:changeJob(nil)

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end -- update

})



-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_PRISONER",
    VariableList = {
        {
            Name = "AgentData",
            DataType = "BEHAVIOR_TREE_DATA_AGENT",
            IsPublic = false,
            InitialValue = {}
        },
        {
            Name = "TimeToWait1",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 1,
                Animation = "IDLE",
                SetIdleAfterWait = false,
            },
        },
        {
            Name = "TimeToWait2",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 60 * 4, -- four days prison sentence
                Animation = "IDLE",
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
			}
		},
		{
			Name = "WorkLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 1,
				Duration = 0,
				IsInfinite = false, -- very long work duration so that they eventually leave from unhappiness
				IsDuration = false,
			}
		},
    },
	Root = {
		Name = "WorkingGlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "PrisonerWorkLoop",
				Type = "BEHAVIOUR_NODE_SECURITY_PRISONER",
				Var1 = "AgentData",
				Var2 = "TimeToWait1",
				Var3 = "TimeToWait2",
				Var4 = "WorkplacePosition",
				Var5 = "WorkLoop",
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
							TimeToWait = "TimeToWait1",
							WorkPosition = "WorkplacePosition",
						},
                        {
							Name = "GoToPrison",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplacePosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        {
                            Name = "WaitAtPrison",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "TimeToWait2",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
							Name = "LeavePrison",
							Type = "BEHAVIOUR_NODE_SECURITY_PRISONER_LEAVEPRISON",
							AgentData = "AgentData",
						},
					}
				}
			}
		}
	}
})

