
local mod = ...



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_RALLY",
    VariableList = {
		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
		Var3 = "BEHAVIOR_TREE_DATA_WAIT",
		Var4 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var5 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var6 = "BEHAVIOR_TREE_DATA_LOOP",
		Var8 = "BEHAVIOR_TREE_DATA_LOOP",
		Var9 = "BEHAVIOR_TREE_DATA_ANIMATION_DATA",
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



-- Node: Get Rally Position --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_RALLY_GETRALLY",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        RallyPosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local compWork = nil

        local moveSpot = nil
        moveSpot = self.RallyPosition

        local objDest = nil

        local compRallyPos = nil
        local objRallyPos = nil

        local compSecVill = nil

        -- if the soldier already has a rally point, and it still exists, go to it
        compRallyPos = compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").RallyPosition

        if (compRallyPos) then

            -- mod:log("Guard already has a rally point.")

            -- Find out if the rally position still exists, if so go there and terminate the node
            objRallyPos = compRallyPos:getOwner()
            if (objRallyPos) then

                -- mod:log("Guard's rally point exists, going there.")

                objDest = objRallyPos
                moveSpot:setDestination(objDest)
                return BEHAVIOR_TREE_NODE_RESULT.TRUE

            else

                -- mod:log("Guard's rally point doesn't exist, clearing the entry.")
                compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")
                if (compSecVill) then
                    compSecVill.RallyPosition = nil
                end
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end

        end

        -- find the nearest non Reserved Guard rally in the worker's workplace
        -- mod:log("Guard looking for a new rally position")
        compWork = compAgent:getOwner():getComponent("COMP_VILLAGER"):getJobInstance().Workplace
        if (compWork) then
            compWork:getOwner():forEachChild(function(child)
                if (string.find(child.Name, "RallyPosition")) then
                    compRallyPos = child:getComponent("COMP_SECURITY_RALLYPOSITION")
                    if (compRallyPos) then
                        if not (compRallyPos.Reserved) then

                            local posRallyPos = nil
                            posRallyPos = compRallyPos:getOwner():getGlobalPosition()
            
                            local dist = nil
                            local minDist = nil
                            minDist = 1024
            
                            dist = math.sqrt( (posAgent.x - posRallyPos.x)^2 + (posAgent.z - posRallyPos.z)^2 )
                            -- mod:log("Found rally position, distance = " .. tostring(dist))
            
                            if (dist < minDist) then
                                minDist = dist
                                objDest = compRallyPos:getOwner()
                            end

                        end
                    end
                end
            end)
        else
            -- mod:log("Guard has no workplace")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

        -- Go to destination, if it was found
        compRallyPos = nil
        if (objDest) then

            -- Make sure another soldier will not use this position
            compRallyPos = objDest:getEnabledComponent("COMP_SECURITY_RALLYPOSITION")
            compRallyPos.Reserved = true
            compRallyPos.DayReserved = CurrentDay(compAgent)

            -- Set and record destination
            moveSpot:setDestination(objDest)
            compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").RallyPosition = compRallyPos
            -- mod:log("Guard is going to a new rally position: " .. tostring(objDest))
            -- mod:log("Destination object id: " .. tostring(objDest:getId()))

            return BEHAVIOR_TREE_NODE_RESULT.TRUE

        else

            -- mod:log("No unreserved rally position found.")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end -- update

})



-- Node: Get Soldier Position in Outlaw Camp if one is nearby ---------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_RALLY_GETCAMP",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        GuardPosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local moveSpot = nil
        moveSpot = self.GuardPosition

        local destSolPos = nil

        local compOutlawCamp = nil

        local dist = nil
        local minDist = nil
        minDist = 1024

        local objSolPos = nil
        local compSolPos = nil

        local compRally = nil

        local compSolPosClosest = nil
        local compRallyPos = nil

        -- determine if the Rally Point is ready to send at least 3 soldiers on a mission
        compRallyPos = compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").RallyPosition
        if (compRallyPos) then
            -- mod:log("Soldier rally component exists")
            if not (compRallyPos.SendSoldier) then
                -- mod:log("Soldiers are not asked to go on 9**+a mission yet")
                -- The soldiers are not on a mission and the rally camp is not ready; abort the tree
                return BEHAVIOR_TREE_NODE_RESULT.FALSE
            end
        else
            -- Rally component missing
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end

        -- find the nearest non Reserved Guard position in the Target Camp
        compRally = compRallyPos:getOwner():getParent():getComponent("COMP_SECURITY_RALLY")
        -- mod:log("Rally component found: " .. tostring(compRally))
        compOutlawCamp = compRally.TargetCamp
        -- mod:log("Guard has camp: " .. tostring(compRally.TargetCamp) .. ", looking for unreserved camp position.")

        if (compOutlawCamp) then
            compOutlawCamp:getOwner():forEachChild(function(child)
                if (string.find(child.Name, "SoldierPosition")) then
                    objSolPos = child
                    compSolPos = objSolPos:getComponent("COMP_SECURITY_SOLDIERPOSITION")
                    if (compSolPos) then
                        -- mod:log("Looking at soldier position .. " .. tostring(objSolPos) .. ", reserved = " .. tostring(compSolPos.Reserved))
                        if not (compSolPos.Reserved) then

                            local posSolPos = nil
                            posSolPos = objSolPos:getGlobalPosition()

                            dist = math.sqrt( (posAgent.x - posSolPos.x)^2 + (posAgent.z - posSolPos.z)^2 )
                            if (dist < minDist) then
                                minDist = dist
                                compSolPosClosest = compSolPos
                            end
                            -- mod:log("Found camp position, distance = " .. tostring(dist))

                        end
                    end
                end
            end)

        else
            -- mod:log("No target camp")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end

        if (compSolPosClosest) then

            -- Make sure another soldiers doesn't go here
            compSolPosClosest.Reserved = true
            compSolPosClosest.DayReserved = CurrentDay(compAgent)
            -- mod:log("Closest destination is now set.")

            -- Set and record destination
            local objSolPosClosest = nil
            objSolPosClosest = compSolPosClosest:getOwner()
            if (objSolPosClosest) then
                moveSpot:setDestination(objSolPosClosest)
                compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").SoldierPosition = compSolPosClosest
                compRally.SoldiersSent = true
                -- mod:log("Destination object id: " .. tostring(objSolPosClosest:getId()))
                return BEHAVIOR_TREE_NODE_RESULT.TRUE
            else
                mod:log("Could not find object of destination component")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE
            end

        else
            -- No unreserved soldier position was found
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end

    end -- update

})



-- Node: Clear Camp --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_RALLY_CLEARCAMP",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local dist = nil

        local compSecVill = nil
        local posSecVill = nil

        local compAgentOutlaw = nil
        local compVillagerOutlaw = nil

        local outlawsRemoved = nil
        outlawsRemoved = 0

        -- Loop through all outlaws
        compAgent:getLevel():getComponentManager("COMP_SECURITY_VILLAGER"):getAllEnabledComponent():forEach(function(compSecVill)

            if (compSecVill.OutlawFlag) then

                posSecVill = compSecVill:getOwner():getGlobalPosition()
                dist = math.sqrt( (posAgent.x - posSecVill.x)^2 + (posAgent.z - posSecVill.z)^2 )

                if (dist < 30) then -- outlaw is within range

                    compAgentOutlaw = compSecVill:getOwner():getComponent("COMP_AGENT")
                    compVillagerOutlaw = compSecVill:getOwner():getComponent("COMP_VILLAGER")

                    -- Turn off outlaw flag
                    compSecVill.OutlawFlag = false

                    -- Make prisoner
                    compVillagerOutlaw:changeJob("JOB_SECURITY_PRISONER")
                    compSecVill.PrisonerFlag = true

                    -- Change road painting
                    compAgentOutlaw:setIsRoadTracingEnabled(true)

                    outlawsRemoved = outlawsRemoved + 1
                    
                end

            end

        end)

        -- Burn the outlaw camp
        local objCamp = nil
        compSecVill = nil
        compSecVill = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER")

        local compSolPos = nil
        local objOldCamp = nil
        local objSolPos = nil
        local compCamp = nil

        if (compSecVill) then

            -- remove camp and reset rally
            local compRally = nil
            local compRallyPos = nil
            compRallyPos = compSecVill.RallyPosition
            if (compRallyPos) then
                compRally = compRallyPos:getOwner():getParent():getComponent("COMP_SECURITY_RALLY")
                if (compRally) then
                    compCamp = compRally.TargetCamp
                    if (compCamp) then
                        compCamp:removeCamp()
                    end
                    compRally:resetRally()
                end
            end

            -- reset villager variables
            compSecVill.SoldierPosition = nil
            compSecVill.RallyPosition = nil
            mod:log("Rally and villager variables reset.")

        end

        return BEHAVIOR_TREE_NODE_RESULT.TRUE


    end -- update

})



-- Node: Finish --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_RALLY_FINISH",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        -- local compWork = nil
        -- local compRally = nil

        -- local objSolPosId = nil
        -- local objSolPos = nil

        -- -- Destroy the outlaw camp
        -- objSolPosId = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").SoldierPosition
        -- if (string.len(objSolPosId) > 1) then
        --     objSolPos = compAgent:getLevel():find(objSolPosId)
        -- end

        -- if not (objSolPos) then
        --     return BEHAVIOR_TREE_NODE_RESULT.FALSE
        -- end

        -- objSolPos:getParent():destroy()

        -- -- Reset the rally
        -- compWork = compAgent:getOwner():getComponent("COMP_VILLAGER"):getJobInstance().Workplace
        -- if (compWork) then
        --     compRally = compWork:getOwner():getComponent("COMP_SECURITY_RALLY")
        --     if (compRally) then
        --         compRally:resetRally()
        --     end
        -- end

        return BEHAVIOR_TREE_NODE_RESULT.TRUE

    end -- update

})




-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_RALLY",
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
                TimeToWait = 15,
                Animation = "GUARD",
                SetIdleAfterWait = false,
            },
        },
        {
            Name = "TimeToWait2",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 30,
                Animation = "GUARD",
                SetIdleAfterWait = false,
            },
        },
		{
			Name = "GuardPosition",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION",
			IsPublic = false,
			InitialValue = {
				CanNavigateOnGround = true,
				CanNavigateOnWater = false,
				IsSetOrientationOnDestination = true,
			}
		},
		{
			Name = "RallyPosition",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION",
			IsPublic = false,
			InitialValue = {
				CanNavigateOnGround = true,
				CanNavigateOnWater = false,
				IsSetOrientationOnDestination = true,
			}
		},
		{
			Name = "RallyLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 10,
				Duration = 0, -- wait at the rally point for all 5 soldiers to show up
				IsInfinite = false,
				IsDuration = false,
			}
		},
		{
			Name = "ClearLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 200,
				Duration = 0,
				IsInfinite = false,
				IsDuration = false,
			}
		},
		{
			Name = "MoveAnimation",
			DataType = "BEHAVIOR_TREE_DATA_ANIMATION_DATA",
			IsPublic = true,
			InitialValue = {
                Animation = "WALK_SPEAR"
			}
		},
    },
	Root = {
		Name = "WorkingGlobalSequencer",
		Type = "SEQUENCER",
		Children = {
			{
				Name = "OutlawWorkLoop",
				Type = "BEHAVIOUR_NODE_SECURITY_RALLY",
				Var1 = "AgentData",
				Var2 = "TimeToWait1",
				Var3 = "TimeToWait2",
				Var4 = "GuardPosition",
				Var5 = "RallyPosition",
				Var6 = "RallyLoop",
				Var8 = "ClearLoop",
				Var9 = "MoveAnimation",
			},
			{
				Name = "RallyLoopRepeater",
				Type = "REPEAT",
				RepeatData = "RallyLoop",
				Child = {
					Name = "RallyLoopSequencer",
					Type = "SEQUENCER",
					Children = {
                        {
							Name = "GetRally",
							Type = "BEHAVIOUR_NODE_SECURITY_RALLY_GETRALLY",
							AgentData = "AgentData",
							RallyPosition = "RallyPosition",
						},
                        {
							Name = "GoToRally",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "RallyPosition",
							BuildingPathType = "",
							AnimationData = "MoveAnimation",
							AnimationSpeedMultiplier = "",
						},
					}
				}
			},
			{
				Name = "ClearLoopRepeater",
				Type = "REPEAT",
				RepeatData = "ClearLoop",
				Child = {
					Name = "ClearLoopSequencer",
					Type = "SEQUENCER",
					Children = {
                        {
							Name = "GetCamp",
							Type = "BEHAVIOUR_NODE_SECURITY_RALLY_GETCAMP",
							AgentData = "AgentData",
							GuardPosition = "GuardPosition",
						},
                        {
							Name = "GoToCamp",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "GuardPosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        {
                            Name = "WaitAtCamp",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "TimeToWait2",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
							Name = "ClearCamp",
							Type = "BEHAVIOUR_NODE_SECURITY_RALLY_CLEARCAMP",
							AgentData = "AgentData",
						},
                        {
                            Name = "WaitAtCampAgain",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "TimeToWait1",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
							Name = "FinishWork",
							Type = "BEHAVIOUR_NODE_SECURITY_RALLY_FINISH",
							AgentData = "AgentData",
						},
					}
				}
			},
        }
	}
})

