local mod = ...



-- Custom Component -------------------------------------------------------------------------------------
local COMP_LIVESTOCKFARM_RESOURCEGENERATOR = {
	TypeName = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "ResourceGenerator",
            Type = "string",
            Default = "BUILDING_FUNCTION_WELL",
            Flags = { "SAVE_GAME" }
        },
    }
}



-- Init -------------------------------------------------------------------------------------
function COMP_LIVESTOCKFARM_RESOURCEGENERATOR:onEnabled()
    local comp = self:getOwner():getOrCreateComponent("COMP_RESOURCE_GENERATOR")
    comp:setResourceGeneratorData(self.ResourceGenerator)
end



-- Register -------------------------------------------------------------------------------------
mod:registerClass(COMP_LIVESTOCKFARM_RESOURCEGENERATOR)

