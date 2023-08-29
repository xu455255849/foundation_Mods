local WaterMill = ...

--------------------------------------------------------------------------
local WATER_MILL_COMP_CHECK_WHEEL = {
	TypeName = WaterMillPrefix .. "_COMP_CHECK_WHEEL",
	ParentType = "COMPONENT",
	Properties = {
	}
}

--------------------------------------------------------------------------
function WATER_MILL_COMP_CHECK_WHEEL:create()
	self._timer = 0
end

--------------------------------------------------------------------------
function WATER_MILL_COMP_CHECK_WHEEL:init()
        local FromPosition = self:getOwner():getGlobalPosition()
        local _elevation = computeElevation(self, FromPosition, {OBJECT_FLAG.TERRAIN, OBJECT_FLAG.WATER})
        if _elevation == nil then
            return
        end
        self:getOwner():setGlobalPosition({ FromPosition[1], _elevation, FromPosition[3] })
        WaterMill:log("FinalPosition = " .. tostring(self:getOwner():getGlobalPosition()))
end

--------------------------------------------------------------------------
function WATER_MILL_COMP_CHECK_WHEEL:update()
    if self._timer ~= 0 then
        return
    end
    WaterMill:log("WATER_MILL_COMP_CHECK_WHEEL:update")
    self:init()
    self._timer = 1
    WaterMill:log("FinalPosition on first update = " .. tostring(self:getOwner():getGlobalPosition()))
end

--------------------------------------------------------------------------
WaterMill:registerClass(WATER_MILL_COMP_CHECK_WHEEL)
