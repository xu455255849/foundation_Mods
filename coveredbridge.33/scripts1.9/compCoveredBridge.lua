local coveredBridge = ...

--------------------------------------------------------------------------
local COVERED_BRIDGE_PATH_COMP = {
	TypeName = CoveredBridgePrefix .. "_PATH_COMP",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "FlagTerrain", Type = "integer", Default = 2 ^ OBJECT_FLAG.TERRAIN:toNumber() },
		{ Name = "FlagWater", Type = "integer", Default = 2 ^ OBJECT_FLAG.WATER:toNumber() },
		{ Name = "CoveredBridgeEndLength", Type = "float", Default = 10.0 },
		{ Name = "Direction", Type = "integer", Default = 0 },
		{ Name = "initDone", Type = "boolean", Default = false },
	}
}

--------------------------------------------------------------------------
function COVERED_BRIDGE_PATH_COMP:onEnabled()
        if self.initDone then
            return
        end
        local FromPosition = self:getOwner():getGlobalPosition()
--        coveredBridge:log("FromPosition = " .. tostring(FromPosition))
        local _elevation = computeElevation(self, FromPosition, {OBJECT_FLAG.WATER})
        if _elevation == nil then
            return
        end
        local Delta = self:checkNearestBank({ FromPosition[1], _elevation, FromPosition[3] }, self.Direction)

--        coveredBridge:log("Delta A0 = " .. tostring(Delta))
--        coveredBridge:log("FinalPosition = " .. tostring(self:getOwner():getGlobalPosition()))
        self:getOwner():setGlobalPosition(Delta)
--        coveredBridge:log("FinalPosition = " .. tostring(self:getOwner():getGlobalPosition()))
        self.initDone = true
end

--------------------------------------------------------------------------
function COVERED_BRIDGE_PATH_COMP:checkNearestBank(_workerDestination, _direction)
--    coveredBridge:log("A0: _workerDestination = " .. tostring(_workerDestination) .. " _direction = " .. tostring(_direction))
    local raycastResult2 = {}
--    coveredBridge:log("A0:self:getOwner():getGlobalOrientation() = " .. tostring(self:getOwner():getGlobalOrientation()) ) 
    local q = self:getOwner():getGlobalOrientation()
--    coveredBridge:log("A0:q = " .. tostring(q) ) 
    local sinp = 2 * (q[4] * q[2] - q[3] * q[1])
    local cosp = q[4] * q[4] - q[2] * q[2]
--    coveredBridge:log("A0:sinp = " .. tostring(sinp) .. " cosp = " .. tostring(cosp) ) 

    -- Raycast from the building position + Y = 100
    -- to building position - y = 100
    -- only on objects with a TERRAIN flag
    local FromPosition2 = { _workerDestination[1], _workerDestination[2], _workerDestination[3] }
    local ToPosition2 = { _workerDestination[1] - _direction * sinp * 100, _workerDestination[2], _workerDestination[3] - _direction * cosp * 100 }
--    coveredBridge:log("checkNearestBank: FromPosition2 = " .. tostring(FromPosition2) .. "ToPosition2 = " .. tostring(ToPosition2))
    if not (self:getLevel():rayCast(FromPosition2, ToPosition2, raycastResult2, self.FlagTerrain)) then
--    coveredBridge:log("A0: final raycastResult2 = RigidBody = " .. tostring(raycastResult2["RigidBody"]) .. " Position = " .. tostring(raycastResult2["Position"]) .. " Normal = " .. tostring(raycastResult2["Normal"]))
         coveredBridge:logWarning("coveredBridge: Bridge extremity NOT on terrain")
         local FinalPosition = { _workerDestination[1] - _direction * sinp * self.CoveredBridgeEndLength,
                                 _workerDestination[2],
                                 _workerDestination[3] - _direction * cosp * self.CoveredBridgeEndLength }   
         return FinalPosition
    else
         local FinalPosition = { raycastResult2["Position"][1] - _direction * sinp * self.CoveredBridgeEndLength,
                                 raycastResult2["Position"][2],
                                 raycastResult2["Position"][3] - _direction * cosp * self.CoveredBridgeEndLength }   
--         coveredBridge:log("A0: FinalPosition = " .. tostring(FinalPosition))
         return FinalPosition
    end
end

--------------------------------------------------------------------------
coveredBridge:registerClass(COVERED_BRIDGE_PATH_COMP)
