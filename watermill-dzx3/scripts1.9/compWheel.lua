local WaterMill = ...

--------------------------------------------------------------------------
local WATER_MILL_COMP_WHEEL = {
	TypeName = WaterMillPrefix .. "_COMP_WHEEL",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "RotationSpeedX", Type = "float", Default = 0.5 }
	}
}

--------------------------------------------------------------------------
function WATER_MILL_COMP_WHEEL:update()
	local dt = self:getLevel():getDeltaTime()
        self:getOwner():rotateLocalX(-self.RotationSpeedX * dt)
end

--------------------------------------------------------------------------
WaterMill:registerClass(WATER_MILL_COMP_WHEEL)
