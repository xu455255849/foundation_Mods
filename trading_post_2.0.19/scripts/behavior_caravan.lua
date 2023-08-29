
local mod = ...


--[[ 

    Code adapted from Minotorious' "Foundation Extended Building Functions" mod

]]



mod:registerBehaviorTreeNode({
    Name = "SETUP_TRADINGPOST_MOVE_POSITION",
    
    VariableList = {
        AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        MovePosition = "BEHAVIOR_TREE_DATA_LOCATION"
    },
    
    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compCaravan = nil
        compCaravan = compAgent:getOwner():getComponent("COMP_TRADINGPOST_CARAVAN")
        if (compCaravan) then

            local compStable = nil
            compStable = compAgent:getLevel():find(compCaravan.SpawnParent):getComponent("COMP_TRADINGPOST_STABLE")
            
            if (compStable) then

                local posStable = nil
                posStable = compStable.CoordStable
                
                local posEdge = nil
                posEdge = compStable.CoordEdge

                local posAgent = nil
                posAgent = compAgent:getOwner():getGlobalPosition()

                local moveSpot = nil
                moveSpot = self.MovePosition -- BEHAVIOR_TREE_DATA_LOCATION

                local posDest = nil
                posDest = moveSpot.DestinationPosition

                local despawn = nil
                despawn = compStable.DespawnOnArrival
                

                -- mod:log("Destination before logic: " .. tostring(posDest))

                if (posStable) and (posEdge) then

                    if (posDest == {0, 0, 0}) then

                        -- mod:log("First destination: edge")
                        pos = posEdge

                    else

                        local distStable = math.sqrt( (posAgent[1] - posStable[1])^2 + (posAgent[3] - posStable[3])^2 )
                        local distDest = math.sqrt( (posAgent[1] - posDest[1])^2 + (posAgent[3] - posDest[3])^2 )

                        if (distStable <= 1 ) then -- the agent is in the stable

                            if (despawn) then
                                mod:log("Caravan marked for despawning, proceeding now.....")
                                compStable:destroySpawned()
                                compStable.DespawnOnArrival = false
                            else
                                pos = posEdge -- go to the edge
                            end

                        elseif (distDest <= 1) then -- agent is already at the destination, they need a new one
                            mod:log("New Destination: stable")
                            pos = posStable -- go to the stable
                            compStable.DespawnOnArrival = true -- when this caravan arrives at the stable, despawn it

                        else -- keep the same destination as before
                            mod:log("New Destination: border")
                            pos = posDest

                        end

                    end
                        
                    moveSpot:setDestination(pos)

                    return BEHAVIOR_TREE_NODE_RESULT.TRUE

                else

                    mod:logError("COMP_TRADINGPOST_STABLE does not contain any coordinates")
                    return BEHAVIOR_TREE_NODE_RESULT.FALSE

                end

            else

                mod:logError("Agent is missing match to COMP_TRADINGPOST_STABLE")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end

        else

            mod:log("No COMP_TRADING_POST_CARAVAN on this object")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end

})



mod:registerBehaviorTree({
    Id = "BEHAVIOR_TRADINGPOST_CARAVAN",
    VariableList = {
        {
            Name = "AgentData",
            DataType = "BEHAVIOR_TREE_DATA_AGENT",
            IsPublic = false,
            InitialValue = {}
        },
        {
            Name = "MovePosition",
            DataType = "BEHAVIOR_TREE_DATA_LOCATION",
            IsPublic = false,
            InitialValue = {
                CanNavigateOnGround = true,
                CanNavigateOnWater = false,
                IsSetOrientationOnDestination = false
            }
        },
        {
            Name = "TimeToWait",
            DataType = "BEHAVIOR_TREE_DATA_WAIT",
            IsPublic = false,
            InitialValue = {
                TimeToWait = 90 -- wait at the destination to simulate trading and loading up goods, also need a delay at the stable to make time for the despawner to run
            }
        },
    },
    Root = {
        Name = "AgentGlobalSequencer",
        Type = "SEQUENCER",
        Children = {
            {
                Name = "MovePositionSetter",
                Type = "SETUP_TRADINGPOST_MOVE_POSITION",
                AgentData = "AgentData",
                MovePosition = "MovePosition"
            },
            {
                Name = "GoToPosition",
                Type = "GO_TO",
                AgentData = "AgentData",
                Destination = "MovePosition",
                BuildingPathType = "",
                AnimationData = "",
                AnimationSpeedMultiplier = ""
            },
            {
                Name = "WaitBeforeNextMove",
                Type = "WAIT",
                AgentData = "AgentData",
                TimeToWait = "TimeToWait",
                OptionalUseWorkstationAnim = ""
            }
        }
    }
})

