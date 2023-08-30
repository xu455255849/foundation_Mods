
local mod = ...


--[[ 

    Code adapted from Minotorious' "Foundation Extended Building Functions" mod

]]



mod:registerBehaviorTreeNode({
    Name = "SETUP_SECURITY_PATHFINDER_MOVE_POSITION",
    
    VariableList = {
        AgentData = "BEHAVIOR_TREE_DATA_AGENT",
        MovePosition = "BEHAVIOR_TREE_DATA_LOCATION"
    },
    
    Update = function(self, instance)

        local compAgent = nil
        compAgent = self.AgentData.Agent

        local compPathfinder = nil
        compPathfinder = compAgent:getOwner():getComponent("COMP_SECURITY_PATHFINDER")

        if (compPathfinder) then

            local posDestination = nil
            posDestination = compPathfinder.Destination
            
            if (posDestination) then -- a destination is set

                -- mod:log("Picked a destination: " .. tostring(pos))

                local moveSpot = nil
                moveSpot = self.MovePosition
                moveSpot:setDestination(posDestination)
                
                return BEHAVIOR_TREE_NODE_RESULT.TRUE

            else

                mod:logError("COMP_SECURITY_PATHFINDER does not contain a destination")
                return BEHAVIOR_TREE_NODE_RESULT.FALSE

            end

        else

            mod:log("No COMP_SECURITY_PATHFINDER on this object")
            return BEHAVIOR_TREE_NODE_RESULT.FALSE

        end

    end

})



mod:registerBehaviorTree({
    Id = "BEHAVIOR_SECURITY_PATHFINDER",
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
                Type = "SETUP_SECURITY_PATHFINDER_MOVE_POSITION",
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

