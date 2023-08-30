
local mod = ...



mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_OUTLAW_WORK",
    VariableList = {
		Var1 = "BEHAVIOR_TREE_DATA_AGENT",
		Var2 = "BEHAVIOR_TREE_DATA_WAIT",
		Var3 = "BEHAVIOR_TREE_DATA_WAIT",
		Var4 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var5 = "BEHAVIOR_TREE_DATA_LOCATION",
		Var6 = "BEHAVIOR_TREE_DATA_LOOP",
    },

    Update = function(self, instance)

        -- local compAgent = nil
        -- compAgent = self.AgentData.Agent

        -- if (compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").OutlawFlag) then
            return BEHAVIOR_TREE_NODE_RESULT.TRUE
        -- else
        --     return BEHAVIOR_TREE_NODE_RESULT.FALSE
        -- end

    end,

})



-- Node: Get Outlaw Position in Outlaw Camp --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_OUTLAW_GETCAMP",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        CampPosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        -- Exit loop if the villager is no longer an outlaw
        if not (compAgent:getOwner():getOrCreateComponent("COMP_SECURITY_VILLAGER").OutlawFlag) then
            return BEHAVIOR_TREE_NODE_RESULT.FALSE
        end
        
        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local moveSpot = nil
        moveSpot = self.CampPosition

        local objDest = nil

        -- find the nearest non Reserved outlaw position
        -- mod:log("Outlaw looking for camp position")
        local compOutPos = nil
        compAgent:getLevel():getComponentManager("COMP_SECURITY_OUTLAWPOSITION"):getAllEnabledComponent():forEach(function(compOutPos)

            if not (compOutPos.Reserved) then
                local posOutPos = nil
                posOutPos = compOutPos:getOwner():getGlobalPosition()

                local dist = nil
                local minDist = nil
                minDist = 1024

                local distX = math.abs(posAgent.x - posOutPos.x)
                local distY = math.abs(posAgent.z - posOutPos.z)

                -- dist = math.sqrt( (posAgent.x - posOutPos.x)^2 + (posAgent.z - posOutPos.z)^2 )
                dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots
                -- mod:log("Found camp position, distance = " .. tostring(dist))

                if (dist < minDist) then
                    minDist = dist
                    objDest = compOutPos:getOwner()
                end
            end

        end)

        -- Go to destination, if it was found
        if (objDest) then

            -- Turn off road tracing to keep the camp's location more private
            compAgent:setIsRoadTracingEnabled(false)

            -- Make sure another guard will not use this position
            compOutPos = objDest:getEnabledComponent("COMP_SECURITY_OUTLAWPOSITION")
            compOutPos.Reserved = true
            compOutPos.DayReserved = CurrentDay(compAgent)

            -- Set and record destination
            moveSpot:setDestination(objDest)
            compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").OutlawPosition = compOutPos
            -- mod:log("Outlaw found a destination object: " .. tostring(objDest))
            -- mod:log("Destination object id: " .. tostring(objDest:getId()))

            return BEHAVIOR_TREE_NODE_RESULT.TRUE

        else

            -- mod:log("No unreserved outlaw position found.")
            -- return BEHAVIOR_TREE_NODE_RESULT.TRUE
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end -- update

})



-- Node: Get Outlaw Theft Point near an unprotected building --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_OUTLAW_GETTHEFT",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        TheftPosition = "BEHAVIOR_TREE_DATA_LOCATION",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent
        local posAgent = nil
        posAgent = compAgent:getOwner():getGlobalPosition()

        local moveSpot = nil
        moveSpot = self.TheftPosition

        local compPosition = nil
        compPosition = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").OutlawPosition
        -- mod:log("Position object id passed to GetTheft: " .. tostring(objPositionId))

        local objDest = nil

        -- Leaving the camp, so un-reserve the position
        local compOutPos = nil
        if (compOutPos) then
            compOutPos.Reserved = false
            -- mod:log("Outlaw leaving camp position, set position to un-reserved")
        end

        -- find the nearest non Reserved theft point
        -- mod:log("Looking at COMP_SECURITY_OUTLAWTHEFTPOINT")
        local compTheft = nil
        compAgent:getLevel():getComponentManager("COMP_SECURITY_OUTLAWTHEFTPOINT"):getAllEnabledComponent():forEach(function(compTheft)

            if not (compTheft.Reserved) then
                local posTheft = nil
                posTheft = compTheft:getOwner():getGlobalPosition()

                local dist = nil
                local minDist = nil
                minDist = 1024

                local distX = math.abs(posAgent.x - posTheft.x)
                local distY = math.abs(posAgent.z - posTheft.z)

                -- dist = math.sqrt( (posAgent.x - posTheft.x)^2 + (posAgent.z - posTheft.z)^2 )
                dist = 0.5 * (distX + distY + math.max(distX, distY)) -- this is an approximate distance but is faster than using square roots

                if (dist < minDist) then
                    minDist = dist
                    objDest = compTheft:getOwner()
                    -- mod:log("Outlaw theft point found, distance: " .. tostring(dist))
                end
            end

        end)

        -- Go to destination, if it was found
        if (objDest) then

            -- Make sure another guard will not use this theft point
            compTheft = objDest:getEnabledComponent("COMP_SECURITY_OUTLAWTHEFTPOINT")
            compTheft.Reserved = true

            moveSpot:setDestination(objDest)
            compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").TheftPoint = compTheft
            -- mod:log("Moving to theft point, object: " .. tostring(objDest))

            return BEHAVIOR_TREE_NODE_RESULT.TRUE

        else

            -- mod:log("No unreserved theft point found.")
            -- return BEHAVIOR_TREE_NODE_RESULT.TRUE
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end -- update

})



-- Node: Execute Theft --------------------------------------------------------------------------------------------------------
mod:registerBehaviorTreeNode({
    Name = "BEHAVIOUR_NODE_SECURITY_OUTLAW_EXECUTETHEFT",
    VariableList = {
		AgentData = "BEHAVIOR_TREE_DATA_AGENT",
    },

    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        -- mod:log("Theft point id passed to GetTheft: " .. tostring(objTheftId))

        -- Pay resources for theft
        local objTheft = nil
        local compTheft = nil
        local posTheft = nil
        -- local jobTrigger = nil
        -- local compVill = nil

        compVill = compAgent:getOwner():getComponent("COMP_VILLAGER")
        compTheft = compAgent:getOwner():getComponent("COMP_SECURITY_VILLAGER").TheftPoint

        if (compTheft) then

            -- trigger theft quest to fulfill by momentarily changing the outlaw's job to the appropriate one for stealing this resource
            -- jobTrigger = "JOB_SECURITY_EVENT_THEFT_" .. compTheft.Resource
            -- compVill:changeJob(jobTrigger)
            -- compVill:changeJob("JOB_SECURITY_EVENT_OUTLAW_STOLE")
            -- compVill:changeJob("JOB_SECURITY_OUTLAW")
            self.gameActionTheft = nil
            self.gameActionTheft = foundation.createData(
                {
                    DataType = "GAME_ACTION_TRIGGER_EVENT_CALLBACK",
                    Callback = {
                        DataType = "EVENT_CALLBACK_TRIGGER_EVENT",
                        Event = "EVENT_SECURITY_EVENT_THEFT_" .. compTheft.Resource,
                        Delay = 0
                    }
                }
            )
            self.gameActionTheft:execute(compAgent:getLevel())

            -- Set the resource generator (for visual tracking)
            objTheft = compTheft:getOwner()
            posTheft = objTheft:getGlobalPosition()
            local objAlert = compAgent:getLevel():createObject("PREFAB_SECURITY_ALERT", posTheft)

            local compGen = objAlert:getOrCreateComponent("COMP_RESOURCE_GENERATOR")
            compGen.MaxQuantity = 0
            compGen:setResourceGeneratorData("BUILDING_FUNCTION_SECURITY_ALERT")
            compGen:setMaxQuantity(1, true)
            compGen.GrowRate = 0

            -- Destroy the theft point
            objTheft:destroy()
            -- mod:log("Theft point destroyed.")

        end

        return BEHAVIOR_TREE_NODE_RESULT.TRUE


    end -- update

})



-- **********************************************************************************************************************************************
-- ***************** T R E E ********************************************************************************************************************
-- **********************************************************************************************************************************************
mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_OUTLAW",
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
                TimeToWait = 30,
                Animation = "GUARD",
                SetIdleAfterWait = false,
            },
        },
        {
            Name = "TimeToWait2",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 3,
                Animation = "MARKET_TENDER",
                SetIdleAfterWait = false,
            },
        },
		{
			Name = "CampPosition",
			DataType = "BEHAVIOR_TREE_DATA_LOCATION",
			IsPublic = false,
			InitialValue = {
				CanNavigateOnGround = true,
				CanNavigateOnWater = false,
				IsSetOrientationOnDestination = true,
			}
		},
        {
            Name = "TheftPosition",
            DataType = "BEHAVIOR_TREE_DATA_LOCATION",
            IsPublic = false,
            InitialValue = {
                CanNavigateOnGround = true,
                CanNavigateOnWater = false,
                GotoObjectPosition = true,
                IsSetOrientationOnDestination = true
            }
        },
		{
			Name = "WorkLoop",
			DataType = "BEHAVIOR_TREE_DATA_LOOP",
			IsPublic = true,
			InitialValue = {
				LoopCount = 200,
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
				Name = "OutlawWorkLoop",
				Type = "BEHAVIOUR_NODE_SECURITY_OUTLAW_WORK",
				Var1 = "AgentData",
				Var2 = "TimeToWait1",
				Var3 = "TimeToWait2",
				Var4 = "CampPosition",
				Var5 = "TheftPosition",
				Var6 = "WorkLoop",
			},
			{
				Name = "WorkLoopRepeater",
				Type = "REPEAT",
				-- Type = "REPEAT_UNTIL_FAIL",
				RepeatData = "WorkLoop",
				Child = {
					Name = "WorkLoopSequencer",
					Type = "SEQUENCER",
					Children = {
                        {
							Name = "GetCamp",
							Type = "BEHAVIOUR_NODE_SECURITY_OUTLAW_GETCAMP",
							AgentData = "AgentData",
							CampPosition = "CampPosition",
						},
                        {
							Name = "GoToCamp",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "CampPosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        {
                            Name = "WaitAtCamp",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "TimeToWait1",
                            OptionalUseWorkstationAnim = "",
                        },
                        {
							Name = "GetTheft",
							Type = "BEHAVIOUR_NODE_SECURITY_OUTLAW_GETTHEFT",
							AgentData = "AgentData",
							TheftPosition = "TheftPosition",
						},
                        {
							Name = "GoToTheft",
							Type = "GO_TO",
							AgentData = "AgentData",
							Destination = "TheftPosition",
							BuildingPathType = "",
							AnimationData = "",
							AnimationSpeedMultiplier = "",
						},
                        {
							Name = "ExecuteTheft",
							Type = "BEHAVIOUR_NODE_SECURITY_OUTLAW_EXECUTETHEFT",
							AgentData = "AgentData",
						},
                        {
                            Name = "WaitAtTheft",
                            Type = "WAIT",
                            AgentData = "AgentData",
                            TimeToWait = "TimeToWait2",
                            OptionalUseWorkstationAnim = "",
                        },
					}
				}
			}
		}
	}
})

