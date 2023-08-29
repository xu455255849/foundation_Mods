local HenHouse = ...

--------------------------------------------------------------------------
local PV3_HENHOUSE_COMP = {
	TypeName = _PastryPrefix .. "_HENHOUSE_COMP",
	ParentType = "COMPONENT",
	Properties = {
                { Name = "MinHenHouseSpeed", Type = "float", Default = 0.3 },
                { Name = "MaxHenHouseSpeed", Type = "float", Default = 1.5 },
                { Name = "MinHenDeltaX", Type = "float", Default = -2.0 },
                { Name = "MaxHenDeltaX", Type = "float", Default = 2.0 },
                { Name = "MinHenDeltaZ", Type = "float", Default = -2.0 },
                { Name = "MaxHenDeltaZ", Type = "float", Default = 2.0 },
                { Name = "_isHenInitialPositionSet", Type = "boolean", Default = false }
	}
}

--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:create()
        self._henHouseSpeedCurrent = self.MinHenHouseSpeed
        self._timer = 0
        self._isHenInitialPositionSet = false
        self.DeltaXThreshold1 = ( self.MaxHenDeltaX - self.MinHenDeltaX ) * ( self.MaxHenDeltaX - self.MinHenDeltaX )
        self.DeltaXThreshold2 = self.DeltaXThreshold1 * 5 / 4
        self.DeltaZThreshold1 = ( self.MaxHenDeltaZ - self.MinHenDeltaZ ) * ( self.MaxHenDeltaZ - self.MinHenDeltaZ )
        self.DeltaZThreshold2 = self.DeltaZThreshold1 * 5 / 4
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:init2()
        if (self:getOwner():getGlobalPosition()[1]*self:getOwner():getGlobalPosition()[1] + self:getOwner():getGlobalPosition()[3]*self:getOwner():getGlobalPosition()[3]) < 2 then
            HenHouse:logWarning("for Maxime: init: self:getOwner():getGlobalPosition()" .. tostring(self:getOwner():getGlobalPosition()))
            return
        end

        self._henInitialGlobalPosition = self:getOwner():getGlobalPosition() 
        self._isHenInitialPositionSet = true
--        HenHouse:log("init: self:getOwner():getGlobalPosition()" .. tostring(self:getOwner():getGlobalPosition()))
        self._henHouseSpeedCurrent = self:chooseRandomSpeed()
        self._timer = self:chooseRandomSequence(self._henHouseSpeedCurrent)
--        HenHouse:log("init: FlagTerrain = " .. self.FlagTerrain .. " bit TERRAIN = " .. OBJECT_FLAG.TERRAIN:toNumber())
end


--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:chooseRandomSpeed()
        return self.MinHenHouseSpeed + math.random() * (self.MaxHenHouseSpeed - self.MinHenHouseSpeed )
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:chooseRandomSequence(_speed)
-- compute the translation from the _henInitialGlobalPosition 
        local _translation = {0,0,0}        
        _translation[1] = self.MinHenDeltaX + math.random() * ( self.MaxHenDeltaX - self.MinHenDeltaX )
        _translation[2] = 0 
        _translation[3] = self.MinHenDeltaZ + math.random() * ( self.MaxHenDeltaZ - self.MinHenDeltaZ )
-- compute the translation from the current getGlobalPosition()
        _translation[1] = _translation[1] + self._henInitialGlobalPosition[1] - self:getOwner():getGlobalPosition()[1]
        _translation[3] = _translation[3] + self._henInitialGlobalPosition[3] - self:getOwner():getGlobalPosition()[3]
--        HenHouse:log("chooseRandomSequence: _henInitialPosition = " .. tostring(self._henInitialPosition) .. " _currentPosition = " .. tostring(self:getOwner():getGlobalPosition()).. " _translation = " .. tostring(_translation))
        local Distance = (_translation[1]*_translation[1] + _translation[3]*_translation[3]) ^ 0.5
        local _timer = 0
        if (_speed > 0) and (Distance > 0) then
            _timer = Distance / _speed
            self:computeHenRotation(_translation)
        end
--        HenHouse:log("chooseRandomSequence: _henInitialGlobalPosition = " .. tostring(self._henInitialGlobalPosition) .. " _translation = " .. tostring(_translation) .. " Distance = " .. Distance)
        return _timer
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:computeHenRotation(_translation)
    self:getOwner():globalLookAt({ _translation[1]+self:getOwner():getGlobalPosition()[1],
                                   _translation[2]+self:getOwner():getGlobalPosition()[2],
                                   _translation[3]+self:getOwner():getGlobalPosition()[3] })
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_COMP:update()
    if not self._isHenInitialPositionSet then
        self:init2()
        return
    end

    local dt = self:getLevel():getDeltaTime()
    if dt <= 0 then -- case of game pause
        return
    end

    if dt > 1 then
        dt = 1
        HenHouse:logWarning("HenHouse: Too much glitch dt = " .. dt)
        self:getOwner():setGlobalPosition(self._henInitialGlobalPosition)
    end

    self._timer = self._timer - dt
    if self._timer < 0 then
        self._henHouseSpeedCurrent = self:chooseRandomSpeed()
        self._timer = self:chooseRandomSequence(self._henHouseSpeedCurrent)
    end

    -- for security in case of glitch
    local DeltaGlobalX = self:getOwner():getGlobalPosition()[1] - self._henInitialGlobalPosition[1]
    local DeltaGlobalZ = self:getOwner():getGlobalPosition()[3] - self._henInitialGlobalPosition[3]
    if DeltaGlobalX*DeltaGlobalX > self.DeltaXThreshold2 then
        HenHouse:logWarning("HenHouse: Too much glitch DeltaGlobalX = " .. DeltaGlobalX .. " DeltaGlobalZ = " .. DeltaGlobalZ)
        self:getOwner():setGlobalPosition(self._henInitialGlobalPosition)
        return
    end
    if DeltaGlobalZ*DeltaGlobalZ > self.DeltaZThreshold2 then
        HenHouse:logWarning("HenHouse: Too much glitch DeltaGlobalX = " .. DeltaGlobalX .. " DeltaGlobalZ = " .. DeltaGlobalZ)
        self:getOwner():setGlobalPosition(self._henInitialGlobalPosition)
        return
    end

    local _elevation = computeElevation(self, self:getOwner():getGlobalPosition(), {OBJECT_FLAG.TERRAIN})
    if _elevation == nil then
        return
    end
    self:getOwner():move({0, _elevation - self:getOwner():getGlobalPosition()[2], dt*self._henHouseSpeedCurrent})        
end

--------------------------------------------------------------------------
HenHouse:registerClass(PV3_HENHOUSE_COMP)

--------------------------------------------------------------------------
local PV3_HENHOUSE_DOOR_COMP = {
	TypeName = _PastryPrefix .. "_HENHOUSE_DOOR_COMP",
	ParentType = "COMPONENT",
	Properties = {
                { Name = "HenHouseDoorRotation", Type = "float", Default = 4 * math.pi / 10 },
                { Name = "HenHouseDoorRotationalSpeed", Type = "float", Default = 0.5 },
                { Name = "_isDoorInitialPositionSet", Type = "boolean", Default = false }
	}
}

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:create()
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:init2()
    self._sequence = 0
    self._initialOrientation = self:getOwner():getGlobalOrientation()
    self._isDoorInitialPositionSet = true
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:onFinalize()
--    self:henHouseDoorRotation(-1)
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:onEnabled()
--    HenHouse:log("onEnabled: _deltaRotationY = " .. tostring(self._deltaRotationY))
    if not self._isDoorInitialPositionSet then
        self:init2()
    end
    if self._sequence == 0 then
            self:henHouseDoorRotation(1.0)
            self._sequence = 1 -- request on going
    end
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:onDisabled()
 --   HenHouse:log("onDisabled: _deltaRotationY = " .. tostring(self._deltaRotationY))
    if not self._isDoorInitialPositionSet then
        self:init2()
    end
    if self._sequence == 0 then
        if not (self._deltaRotationY < 0) then
            self:henHouseDoorRotation(-1.0)
            self._sequence = 1  -- request on going
        end
    end
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:henHouseDoorRotation(_senseOfRotation)
        self._timer = self.HenHouseDoorRotation / self.HenHouseDoorRotationalSpeed
        self._deltaRotationY = _senseOfRotation

--        HenHouse:log("henHouseDoorRotation: _deltaRotationY = " .. tostring(self._deltaRotationY))
end

--------------------------------------------------------------------------
function PV3_HENHOUSE_DOOR_COMP:update()
    if not self._isDoorInitialPositionSet then
        self:init2()
        return
    end
    local dt = self:getLevel():getDeltaTime()
    if self._timer < 0 then
        if self._deltaRotationY < 0 then
            self:getOwner():setGlobalOrientation(self._initialOrientation)
        end
        self._sequence = 0  -- no request on going
        return
    end
    self._timer = self._timer - dt
--    HenHouse:log("update: _deltaRotationY = " .. tostring(self._deltaRotationY))

    self:getOwner():rotateY(self._deltaRotationY * dt * self.HenHouseDoorRotationalSpeed)
end

--------------------------------------------------------------------------
HenHouse:registerClass(PV3_HENHOUSE_DOOR_COMP)
