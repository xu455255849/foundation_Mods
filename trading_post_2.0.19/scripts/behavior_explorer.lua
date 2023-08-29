
local mod = ...


--[[ 

    Code adapted from Minotorious' "Foundation Extended Building Functions" mod

]]



mod:registerBehaviorTreeNode({
    Name = "SETUP_TRADINGPOST_EXPLORER_MOVE_POSITION",
    
    VariableList = {
        AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        MovePosition = "BEHAVIOR_TREE_DATA_LOCATION"
    },
    
    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compExplorer = nil
        compExplorer = compAgent:getOwner():getComponent("COMP_TRADINGPOST_EXPLORER")

        if (compExplorer) then

            local compStable = nil
            compStable = compAgent:getLevel():find(compExplorer.SpawnParent):getComponent("COMP_TRADINGPOST_STABLE")
            
            if (compStable) then

                local pos = nil

                local posEdge = nil
                posEdge = compStable.CoordEdge
                
                local posTry = nil
                posTry = compStable.TryCoordEdge

                local posAgent = nil
                posAgent = compAgent:getOwner():getGlobalPosition()

                local otherFound = nil
                otherFound = compStable.otherFound

                pos = posTry -- try the edge coordinates
                
                if (pos) and not (otherFound) then -- a new destination is set and no other trading post was in the area

                    -- mod:log("Picked a destination: " .. tostring(pos))

                    local moveSpot = nil
                    moveSpot = self.MovePosition
                    moveSpot:setDestination(pos)
                    
                    return BEHAVIOR_TREE_NODE_RESULT.TRUE

                else

                    mod:logError("Unable to get trading post destination")
                    return BEHAVIOR_TREE_NODE_RESULT.FALSE

                end

            else

                mod:logError("Agent is missing match to COMP_TRADINGPOST_STABLE")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end

        else

            mod:log("No COMP_TRADINGPOST_EXPLORER on this object")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end

})



mod:registerBehaviorTree({
    Id = "BEHAVIOR_TRADINGPOST_EXPLORER",
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
                TimeToWait = 60
            }
        },
    },
    Root = {
        Name = "AgentGlobalSequencer",
        Type = "SEQUENCER",
        Children = {
            {
                Name = "MovePositionSetter",
                Type = "SETUP_TRADINGPOST_EXPLORER_MOVE_POSITION",
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

