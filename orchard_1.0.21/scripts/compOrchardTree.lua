local mod = ...



local function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end



-- Component -------------------------------------------------------------------------------------
local COMP_ORCHARD_TREE = {
	TypeName = "COMP_ORCHARD_TREE",
	ParentType = "COMPONENT",
	Properties = {
    }
}



-- Init -------------------------------------------------------------------------------------
function COMP_ORCHARD_TREE:update()

    local tree = self:getOwner()

    -- change size randomly
    tree:setScale(1) -- reset
    local scaleX = randomFloat(0.85, 1.15)
    local scaleY = randomFloat(0.85, 1.15)
    tree:scale( { scaleX, scaleY, scaleX } )

    tree:removeComponent(self)

end



-- Register custom Class
mod:registerClass(COMP_ORCHARD_TREE)


-- Attach to tree prefab
mod:registerPrefabComponent("PREFAB_ORCHARD_APPLE1", { DataType = "COMP_ORCHARD_TREE"} )

