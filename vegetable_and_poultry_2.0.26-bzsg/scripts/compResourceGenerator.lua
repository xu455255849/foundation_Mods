local mod = ...



-- Custom Component -------------------------------------------------------------------------------------
local COMP_POULTRYFARM_RESOURCEGENERATOR = {
	TypeName = "COMP_POULTRYFARM_RESOURCEGENERATOR",
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
function COMP_POULTRYFARM_RESOURCEGENERATOR:onEnabled()
    comp = self:getOwner():getOrCreateComponent("COMP_RESOURCE_GENERATOR")
    comp:setResourceGeneratorData(self.ResourceGenerator)
end



-- Register -------------------------------------------------------------------------------------
mod:registerClass(COMP_POULTRYFARM_RESOURCEGENERATOR)

