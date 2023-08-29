local mod = ...



function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end



-- Vegetable Plot -------------------------------------------------------------------------------------
local COMP_VEGETABLEPLOT = {
	TypeName = "COMP_VEGETABLEPLOT",
	ParentType = "COMPONENT",
	Properties = {
        -- {
        --     Name = "InitFlag",
        --     Type = "boolean",
        --     Default = false,
        --     Flags = { "SAVE_GAME" }
        -- },
    }
}



-- Init -------------------------------------------------------------------------------------
function COMP_VEGETABLEPLOT:onEnabled()

    -- if not (self.InitFlag) then

    self:getOwner():forEachChild(function(child)

        local childName = child.Name
        if (childName) then
            if (string.sub(childName, 1, 12) == "Attach_Minor") then

                -- mod:log("Attach Minor found within vegetable plotm rotating and sizing")

                -- rotate randomly
                local factorRotate = math.random(0, 359)
                child:setRotationY(factorRotate)

                -- change size randomly
                child:setScale(1) -- reset
                local scaleX = randomFloat(0.8, 1.2)
                local scaleY = randomFloat(0.8, 1.2)
                child:scale( { scaleX, scaleY, scaleX } )

                -- offset randomly
                local moveX = randomFloat(0, 0.15)
                local moveY = 0
                local moveZ = randomFloat(0, 0.15)
                local pos = child:getGlobalPosition()
                child:setGlobalPosition( { pos[1] + moveX, pos[2] + moveY, pos[3] + moveZ } )

            end -- attach minor

        end

    end)

    --     self.InitFlag = true

    -- end

end



-- Register custom Class
mod:registerClass(COMP_VEGETABLEPLOT)

