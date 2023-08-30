
local mod = ...



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_BANDIT",
    VariableList = {
		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
		Var3 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var4 = "BEHAVIOR_TREE_DATA_LOOP",
    },

    Update = function(self, instance)

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end,

})



-- Node: locate workplace target --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_BANDIT_LOCATETARGET",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        Destination = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compBandit = nil
        compBandit = compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_BANDIT")

        local enRouteToRaid = nil
        enRouteToRaid = compBandit.EnRouteToRaid
        enRouteToRaid = true -- to allow update function to check for guards and soldiers along the way

        local abandonRaid = nil
        abandonRaid = compBandit.AbandonRaid
        abandonRaid = false -- reset for journey

        local dataDestination = nil
        dataDestination = self.Destination

        local posDestination = nil
        posDestination = compBandit:getWorkplaceDestination()

        -- go to a camp position if no raiding position found
        if (posDestination) then
            mod:log("Bandit going to nearest workplace")
            compBandit.EnRouteToRaid = true
        else
            posDestination = GetNewCampPosition(compAgent, 100)
            compBandit.EnRouteToRaid = false
            mod:log("Bandit could not find a nearby workplace, going to a camp location")
        end

        if (posDestination) then
            dataDestination:setDestination(posDestination)
            return BEHAVIOR_TREE_NODE_RESULT.TRUE
        else
            mod:log("Unable to get a destination for bandit")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end

    end,

})



-- Node: Raid --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_BANDIT_RAID",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        EnRouteToRaid = "BEHAVIOR_TREE_DATA_BOOL",
        AbandonRaid = "BEHAVIOR_TREE_DATA_BOOL",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compBandit = nil
        compBandit = compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_BANDIT")

        local enRouteToRaid = nil
        enRouteToRaid = compBandit.EnRouteToRaid
        enRouteToRaid = false -- reset for next journey

        local abandonRaid = nil
        abandonRaid = compBandit.AbandonRaid

        if (abandonRaid) then
            mod:log("Bandit could not raid, guards or soldiers were encountered en route to the destination")
            abandonRaid = false -- reset for next try
            return BEHAVIOR_TREE_NODE_RESULT.TRUE -- so that it goes on to pick a new camp
        end

        local compSecVill = nil
        local posBandit = nil
        local posVill = nil
        local dist = nil
        local found = nil
        local chance = nil

        posBandit = compAgent:getOwner():getGlobalPosition()
        found = false

        local popCount = nil
        local outlawCount = nil
        local outlawPercent = nil
        popCount = GetPopulation(compAgent)
        outlawCount = GetOutlawCount(compAgent)
        outlawPercent = popCount / outlawCount

        if outlawPercent > 0.2 then found = true end -- abandon attack if outlaws are already too numerous

        -- Find any guards or soldiers within radius
        compAgent:getLevel():getComponentManager("COMP_VILLAGER"):getAllEnabledComponent():forEach(function(compVill)

            if not found then
                compSecVill = compVill:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER")
                if (compSecVill.DefenderFlag) then
                    posVill = compVill:getOwner():getGlobalPosition()
                    dist = math.sqrt( (posBandit.x - posVill.x)^2 + (posBandit.z - posVill.z)^2 )
                    if (dist <= 20) then
                        found = true
                    end
                end
            end

        end)

        -- guards or soldiers were found, abandon
        if found then
            mod:log("Bandit could not raid, guards or soldiers nearby, or outlaw count already too high")
            return BEHAVIOR_TREE_NODE_RESULT.TRUE -- so that it goes on to pick a new camp

        -- no guards were found, proceed
        else

            mod:log("Bandit sees no guards or soldiers, checking for nearby villagers to raid")

            -- convert nearby villagers to outlaws
            compAgent:getLevel():getComponentManager("COMP_VILLAGER"):getAllEnabledComponent():forEach(function(compVill)

                posVill = compVill:getOwner():getGlobalPosition()
                dist = math.sqrt( (posBandit.x - posVill.x)^2 + (posBandit.z - posVill.z)^2 )

                if (dist <= 15) then

                    chance = math.random()
                    if (chance < 0.50) then

                        -- trigger bandit notification
                        compVill:changeJob("JOB_SECURITY_EVENT_BANDIT")

                        -- trigger theft
                        compVill:changeJob("JOB_SECURITY_EVENT_THEFT_GOLD_COINS")

                        -- change the job to Outlaw
                        compVill:changeJob("JOB_SECURITY_OUTLAW")

                        -- register a flag change the job back to Outlaw if it is changed by the player
                        compVill:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag = true

                        mod:log("Villager " .. tostring(compVill:getOwner().Name) .. " became an Outlaw after meeting a Bandit.")

                    end

                end
            end)

            return BEHAVIOR_TREE_NODE_RESULT.TRUE

        end

    end -- update

})



-- Node: locate camp --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_BANDIT_LOCATECAMP",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        Destination = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local dataDestination = nil
        dataDestination = self.Destination

        local posDestination = nil
        posDestination = GetNewCampPosition(compAgent, 100)

        if (posDestination) then
            dataDestination:setDestination(posDestination)
            return BEHAVIOR_TREE_NODE_RESULT.TRUE
        else
            mod:log("Unable to get a destination for bandit, destroying the bandit")
            compAgent:getOwner():destroy()
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end

    end,

})



-- Node: Die --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_BANDIT_DIE",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        Destination = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        mod:log("Bandit will be destroyed")
        compAgent:getOwner():destroy()

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end,

})



-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_BANDIT",
    VariableList = {
        {
            Name = "AgentData",
            DataType = "BEHAVIOR_TREE_DATA_AGENT",
            IsPublic = false,
            InitialValue = {}
        },
        {
            Name = "TimeToWait",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 20,
            },
        },
		{
			Name = "Destination",
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
				LoopCount = 5,
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
				Name = "BanditWorkLoop",
				Type = "BEHAVIOUR_NODE_SECURITY_BANDIT",
				Var1 = "AgentData",
				Var2 = "TimeToWait",
				Var3 = "Destination",
				Var4 = "WorkLoop",
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
							Name = "LocateTarget",
							Type = "BEHAVIOUR_NODE_SECURITY_BANDIT_LOCATETARGET",
							AgentData = "AgentData",
							Destination = "Destination",
						},
                        {
							Name = "GoToTarget",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "Destination",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        {
							Name = "Raid",
							Type = "BEHAVIOUR_NODE_SECURITY_BANDIT_RAID",
							AgentData = "AgentData",
						},
                        {
							Name = "LocateCamp",
							Type = "BEHAVIOUR_NODE_SECURITY_BANDIT_LOCATECAMP",
							AgentData = "AgentData",
							Destination = "Destination",
						},
                        {
							Name = "GoToCamp",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "Destination",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
					}
				}
			},
            {
                Name = "Die",
                Type = "BEHAVIOUR_NODE_SECURITY_BANDIT_DIE",
                AgentData = "AgentData",
            },
        }
	}
})

