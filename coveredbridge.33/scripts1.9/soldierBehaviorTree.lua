local AssignSoldier = ...

-- Specific behavior tree in order to set the animation GUARD

-- Create behavior tree node to setup the guard at location job
AssignSoldier:registerBehaviorTreeNode({
	Name = CoveredBridgePrefix .. "_NODE",
	
	VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
		WorkplaceLocation = "BEHAVIOR_TREE_DATA_LOCATION",
	},
	
	Update = function(self, level, instance)
		local workplace = self.AgentData.Agent:getOwner():getEnabledComponent("COMP_VILLAGER"):getJobInstance().Workplace
		
		-- No workplace found that matches this job
		if (workplace == nil or not workplace:isEnabled()) then
			self.AgentData.Agent:setBehaviorMessage(foundation.localize("I_CANT_FIND_A_PLACE_TO_WORK"))
			return BEHAVIOR_TREE_NODE_RESULT.FALSE
		end
		self.WorkplaceLocation:setDestination(workplace:getOwner())
		return BEHAVIOR_TREE_NODE_RESULT.TRUE
	end
})

-- Create the new locator guard behavior tree
AssignSoldier:registerBehaviorTree({
	Id = CoveredBridgePrefix .. "_BEHAVIOR_TREE",
	VariableList = {
		{
			Name = foundation.BEHAVIOR_TREE_AGENT_DATA,
			DataType = "BEHAVIOR_TREE_DATA_AGENT",
		},
		{
			Name = "WorkplaceLocation",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION"
		},
		{
			Name = "GuardRepeatData",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			InitialValue = { LoopCount = 5 }
		},
		{
			Name = "GuardTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			InitialValue = {
				TimeToWait = 10.0,
				Animation = AGENT_ANIMATION.GUARD,
			}
		},
		{
			Name = "DoJobTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			IsPublic = false,
			InitialValue = {
				TimeToWait = 30.0,
				Animation = AGENT_ANIMATION.GUARD,
				SetIdleAfterWait = false,
			}
		},
        },
	Root = {
		Name = "GlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "SetupGuardLocatorPost",
				Type = CoveredBridgePrefix .. "_NODE",
				AgentData = "AgentData",
				WorkplaceLocation = "WorkplaceLocation",
			},
			{
				Name = "Repeater",
				Type = "REPEAT",
				RepeatData = "GuardRepeatData",
				Child = {
					Name = "GuardSequencer",
					Type = "SEQUENCER",
					Children = {
-- mandatory to begin working
						{
							Name = "GoToLocation1",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplaceLocation",
						},
						{
							Name = "WaitLocation1",
							Type = "WAIT",
							AgentData = "AgentData",
							TimeToWait = "GuardTimer",
						},
						{
							Name = "ProduceResource",
							Type = "PRODUCE_RESOURCE",
							AgentData = "AgentData",
							TimeToWait = "DoJobTimer",
						},

					}
				}
			}
		}
	}
})
