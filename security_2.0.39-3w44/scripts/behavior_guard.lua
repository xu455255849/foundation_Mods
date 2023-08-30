
local mod = ...



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_GUARD_WORK",
    VariableList = {
		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
		Var3 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var4 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var5 = "BEHAVIOR_TREE_DATA_LOOP",
		Var6 = "BEHAVIOR_TREE_DATA_LOOP",
		Var7 = "BEHAVIOR_TREE_DATA_LOOP",
		Var8 = "BEHAVIOR_TREE_DATA_WAIT",
    },

    Init = function(self, instance)

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end,
    Update = function(self, instance)

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end,
    
    Finish = function(self, instance)

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end,

})



-- Node: Set Next Patrol Point --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_GUARD_MOVE",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        MovePosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local moveSpot = nil
        moveSpot = self.MovePosition

        local objDest = nil
        local objPoints = nil

        local compWorkplace = nil
        compWorkplace = compAgent:getOwner():getComponent("COMP_VILLAGER"):getJobInstance().Workplace

        -- mod:log("Starting guard behavior node")

        if (compWorkplace) then

            -- mod:log("Found workplace.")

            -- find the nearest unused patrol point in this monument
            local compBuilding = nil
            local objBuilding = nil
            compBuilding = compWorkplace:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")

            if compBuilding then
                objBuilding = compBuilding:getOwner()
            end

            if objBuilding then

                -- mod:log("Found building for guard workplace: " .. tostring(objBuilding.Name))

                local dist = nil
                local minDist = nil
                minDist = 1024

                local posAgent = nil
                posAgent = compAgent:getOwner():getGlobalPosition()

                local posArrow = nil

                objBuilding:forEachChild(function(child)

                    -- mod:log("Found child of building: " .. tostring(child.Name))

                    -- If it is a patrol point, find out if it is unused and shorter than the minDistance recorded so far
                    if (child.Name == "PatrolPoint") then

                        local compArrow = child:getEnabledComponent("COMP_SECURITY_GUARD_ARROW")
                        if (compArrow) then

                            if not (compArrow.Used) then

                                posArrow = child:getGlobalPosition()

                                local distX = math.abs(posAgent.x - posArrow.x)
                                local distY = math.abs(posAgent.z - posArrow.z)
                
                                -- dist = math.sqrt( (posAgent.x - posArrow.x)^2 + (posAgent.z - posArrow.z)^2 )
                                dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots

                                if (dist < minDist) then
                                    minDist = dist
                                    objDest = child
                                end

                            end -- patrol point was not used
                        end

                    end -- child was a patrol point

                end)

                -- Go to destination, if it was found
                if (objDest) then

                    -- Make sure another guard will not use this arrow for some time
                    local compArrow = objDest:getEnabledComponent("COMP_SECURITY_GUARD_ARROW")
                    compArrow.Used = true
                    compArrow.DayUsed = CurrentDay(compAgent)

                    -- mod:log("Moving guard to object " .. tostring(objDest) .. " at position " .. tostring(objDest:getGlobalPosition()))
                    -- moveSpot:setDestination(objDest:getGlobalPosition())
                    moveSpot:setDestination(objDest)

                    -- deposit security points
                    objPoints = objDest:getLevel():createObject("PREFAB_SECURITY_POINTS_GUARD", objDest:getGlobalPosition())

                    return BEHAVIOR_TREE_NODE_RESULT.TRUE

                else

                    -- mod:log("No unused patrol arrow found")
                    return BEHAVIOR_TREE_NODE_RESULT.FALSE

                end

            else

                -- mod:log("Security: Guard found no parent building at the expected path.")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end -- worker belongs to a building

        end -- worker is employed

    end -- update

})



-- Node: Find Outlaw --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_GUARD_FINDOUTLAW",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        MovePosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local moveSpot = nil
        moveSpot = self.MovePosition

        local objDest = nil

        -- find the nearest outlaw if any
        local dist = nil
        local minDist = nil
        minDist = 1024

        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local posOutlaw = nil
        local compSecVill = nil
        local compSecVillOutlaw = nil

        -- mod:log("Looking for nearby outlaws")
        compAgent:getLevel():getComponentManager("COMP_SECURITY_VILLAGER"):getAllEnabledComponent():forEach(function(compSecVill)

            if (compSecVill.OutlawFlag == true) then

                posOutlaw = compSecVill:getOwner():getGlobalPosition()

                local distX = math.abs(posAgent.x - posOutlaw.x)
                local distY = math.abs(posAgent.z - posOutlaw.z)

                -- dist = math.sqrt( (posAgent.x - posOutlaw.x)^2 + (posAgent.z - posOutlaw.z)^2 )
                dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots

                if (dist < minDist) and (dist <= 20) then
                    -- mod:log("Found an outlaw within 20m")
                    minDist = dist
                    objDest = compSecVill:getOwner()
                end

            end

        end)

        -- Go to destination, if it was found
        compSecVill = nil
        if (objDest) then

            -- mod:log("Inspecting potential outlaw")

            compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")
            compSecVillOutlaw = objDest:getComponent("COMP_SECURITY_VILLAGER")
            if (compSecVill) and (compSecVillOutlaw) then
                -- mod:log("Potential outlaw: " .. tostring(compSecVillOutlaw:getOwner()) .. ", questioning? = " .. tostring(compSecVillOutlaw.Questioning))
                if not (compSecVillOutlaw.Questioning) then
                    -- mod:log("Villager is not yet tagged for questioning")
                    compSecVillOutlaw.Questioning = true
                    compSecVill.QuestioningVillager = compSecVillOutlaw
                    moveSpot:setDestination(objDest:getGlobalPosition())
                    -- mod:log("Going to outlaw")
                    return BEHAVIOR_TREE_NODE_RESULT.TRUE

                else
                    -- mod:log("Villager is already being questioned")
                    return BEHAVIOR_TREE_NODE_RESULT.FALSE

                end

            else
                -- mod:log("No villager security component found")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end

        else

            -- mod:log("No outlaw found")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end -- update

})



-- Node: Catch Outlaw --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_GUARD_CATCHOUTLAW",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        -- find the nearest outlaw if any
        local compOutlaw = nil
        local posOutlaw = nil

        local dist = nil
        local minDist = nil
        minDist = 1024

        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local compSecVill = nil
        local compAgentOutlaw = nil
        local compVillOutlaw = nil

        -- mod:log("Looking to see if target outlaw still within 5m")
        local found = nil
        found = false
        compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")
        if (compSecVill) then
            compOutlaw = compSecVill.QuestioningVillager
            if (compOutlaw) then
                posOutlaw = compOutlaw:getOwner():getGlobalPosition()
                local distX = math.abs(posAgent.x - posOutlaw.x)
                local distY = math.abs(posAgent.z - posOutlaw.z)
                -- dist = math.sqrt( (posAgent.x - posOutlaw.x)^2 + (posAgent.z - posOutlaw.z)^2 )
                dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots
                if (dist <= 20) then
                    found = true
                    -- mod:log("Target for questioning is still within 20m")
                end
            end
        end

        -- Chance to catch Outlaw if nearby
        local chance = nil
        chance = math.random()

        if (found) and (chance <= 0.75) then

            -- mod:log("Chance was with us, outlaw caught")
            compAgentOutlaw = compOutlaw:getOwner():getComponent("COMP_AGENT")
            compVillOutlaw = compOutlaw:getOwner():getComponent("COMP_VILLAGER")

            -- Turn off outlaw flag
            compOutlaw.OutlawFlag = false

            -- Make prisoner
            compVillOutlaw:changeJob(nil)
            compOutlaw.PrisonerFlag = true
            compVillOutlaw:changeJob("JOB_SECURITY_PRISONER")

            -- Change road painting
            compAgentOutlaw:setIsRoadTracingEnabled(true)

        end

        -- Unset the questioning flag regardless of the outcome
        -- mod:log("Resetting questioning fields")
        local compQuestioning = nil

        compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")
        if (compSecVill) then
            compQuestioning = compSecVill.QuestioningVillager
            if (compQuestioning) then
                compSecVill.QuestioningVillager = nil
                compQuestioning.Questioning = false
            end
        end

        -- Return true in any case
        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end -- update

})




-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_GUARD",
    VariableList = {
        {
            Name = "AgentData",
            DataType = "BEHAVIOR_TREE_DATA_AGENT",
            IsPublic = false,
            InitialValue = {},
        },
		{
			Name = "DoJobTimer",
			DataType = "BEHAVIOR_TREE_DATA_WAIT",
			IsPublic = false,
			InitialValue = {
				TimeToWait = 0,
				Animation = AGENT_ANIMATION.IDLE,
				SetIdleAfterWait = true,
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
            Name = "MovePosition",
            DataType = "BEHAVIOR_TREE_DATA_LOCATION",
            IsPublic = false,
            InitialValue = {
                CanNavigateOnGround = true,
                CanNavigateOnWater = false,
                GotoObjectPosition = true,
                IsSetOrientationOnDestination = true,
            },
        },
		{
			Name = "WorkLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 1,
				Duration = 0,
				IsInfinite = false,
				IsDuration = false,
			},
		},
		{
			Name = "PatrolLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 0,
				Duration = 120, -- will do one work cycle over two days, after that will check if needs must be met and quit if so
				IsInfinite = false,
				IsDuration = true,
			},
		},
		{
			Name = "CatchLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 0,
				Duration = 40,
				IsInfinite = false,
				IsDuration = true,
			},
		},
        {
            Name = "ShortTimer",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 6,
                Animation = "GUARD",
                SetIdleAfterWait = false,
            },
        },
    },
	Root = {
		Name = "WorkingGlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "PatrolWorkLoop",
				Type = "BEHAVIOUR_NODE_SECURITY_GUARD_WORK",
				Var1 = "AgentData",
				Var2 = "DoJobTimer",
				Var3 = "WorkplacePosition",
				Var4 = "MovePosition",
				Var5 = "WorkLoop",
				Var6 = "PatrolLoop",
				Var7 = "CatchLoop",
				Var8 = "ShortTimer",
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
							Name = "GoToWork1",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplacePosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        -- {
                        --     Name = "ProduceResource1",
                        --     Type = "PRODUCE_RESOURCE",
                        --     AgentData = "AgentData",
                        --     TimeToWait = "DoJobTimer",
                        -- },
                        {
                            Name = "WaitBeforeWork",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "DoJobTimer",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
                            Name = "PatrolLoopRepeater",
                            Type = "REPEAT",
                            RepeatData = "PatrolLoop",
                            Child = {
                                Name = "PatrolLoopSequencer",
                                Type = "SEQUENCER",
                                Children = {
                                    {
                                        Name = "SetNextPatrolpoint",
                                        Type = "BEHAVIOUR_NODE_SECURITY_GUARD_MOVE",
                                        AgentData = "AgentData",
                                        MovePosition = "MovePosition",
                                    },
                                    {
                                        Name = "GoToPatrol",
                                        Type = "GO_TO",
                                        AgentData = "AgentData",
                                        Destination = "MovePosition",
                                        BuildingPathType = "",
                                        AnimationData = "",
                                        AnimationSpeedMultiplier = "",
                                    },
                                    {
                                        Name = "CatchLoopRepeater",
                                        Type = "REPEAT",
                                        RepeatData = "CatchLoop",
                                        Child = {
                                            Name = "CatchLoopSequencer",
                                            Type = "SEQUENCER",
                                            Children = {
                                                {
                                                    Name = "WaitWhileSearching",
                                                    Type = "WAIT",
                                                    AgentData = "AgentData",
                                                    TimeToWait = "ShortTimer",
                                                    OptionalUseWorkstationAnim = "",
                                                },
                                                {
                                                    Name = "FindOutlaw",
                                                    Type = "BEHAVIOUR_NODE_SECURITY_GUARD_FINDOUTLAW",
                                                    AgentData = "AgentData",
                                                    MovePosition = "MovePosition",
                                                },
                                                {
                                                    Name = "GoToOutlaw",
                                                    Type = "GO_TO",
                                                    AgentData = "AgentData",
                                                    Destination = "MovePosition",
                                                    BuildingPathType = "",
                                                    AnimationData = "",
                                                    AnimationSpeedMultiplier = "",
                                                },
                                                {
                                                    Name = "WaitWhileQuestioning",
                                                    Type = "WAIT",
                                                    AgentData = "AgentData",
                                                    TimeToWait = "ShortTimer",
                                                    OptionalUseWorkstationAnim = "",
                                                },
                                                {
                                                    Name = "CatchOutlaw",
                                                    Type = "BEHAVIOUR_NODE_SECURITY_GUARD_CATCHOUTLAW",
                                                    AgentData = "AgentData",
                                                },
                                            },
                                        },
                                    },
                                },
                            },
                        },
                        {
							Name = "GoBackToWork",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "WorkplacePosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        -- {
                        --     Name = "ProduceResource2",
                        --     Type = "PRODUCE_RESOURCE",
                        --     AgentData = "AgentData",
                        --     TimeToWait = "DoJobTimer",
                        -- },
                        {
                            Name = "WaitAfterWork",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "DoJobTimer",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
							Name = "GettingXp",
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

