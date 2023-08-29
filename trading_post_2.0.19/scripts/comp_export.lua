local mod = ...




-- Define component -------------------------------------------------------------------------------------
local COMP_TRADINGPOST_EXPORT = {
	TypeName = "COMP_TRADINGPOST_EXPORT",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "Quantity", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } },
    }
}


-- Redraw the crates in the stall
function COMP_TRADINGPOST_EXPORT:drawCrates()

    -- Update the visual crates showing how many exports are present (up to 7)

    local objExport = self:getOwner()
    local idExport = objExport:getId()
    local count = self.Quantity

    -- mod:log("redrawing crates for " .. tostring(idExport) .. " which has " .. count .. " exports...")

    -- there are seven crate slots in each stall
    for i=1, 7, 1 do

        objExport:forEachChild(function(child)

            -- find the crate slots one by one
            if (string.sub(child.Name, 1, 21) == "ExportBoxPosition.00" .. i) then

                -- mod:log("Found a crate position")

                -- check to see if there is an existing crate
                local objFind = objExport:getLevel():find(tostring(idExport) .. "_ExportBoxPosition.00" .. i)
                if (objFind) and (i > count) then -- exports have reduced, remove this crate
                    -- mod:log("Found an existing crate, deleting")
                    objFind:destroy()
                elseif not objFind and (i <= count) then  -- no crate found but exports have increased, add a crate
                    -- mod:log("Creating new crate")
                    local objNew = self:getLevel():createObject("PREFAB_RESOURCE_VISUAL_CRATE", child:getGlobalPosition(), child:getGlobalOrientation())
                    objNew.Name = tostring(idExport) .. "_ExportBoxPosition.00" .. i -- name the crate object to find it later
                -- else a crate was found and it is still within the Quantity of exports, so take no action
                end

            end

        end)

    end

    -- -- Remove any Export inventory (to avoid the workplace filling up)
    -- local compDepot = objExport:getComponent("COMP_RESOURCE_DEPOT")
    -- if compDepot then
    --     local qtyInv = compDepot.OutputInventory.Inventory.Collection[1].Quantity
    --     if qtyInv then
    --         compDepot.OutputInventory.Inventory.Collection[1].Quantity = 0
    --         mod:log("Export inventory set to zero.")
    --     end
    -- end


end



-- remove crates when the stall is destroyed
function COMP_TRADINGPOST_EXPORT:onDestroy(isClearingLevel)

    objExport = self:getOwner()
    idExport = objExport:getId()

    for i = 1, 7, 1 do

        objFind = objExport:getLevel():find(tostring(idExport) .. "_ExportBoxPosition.00" .. i)
        if (objFind) then
            objFind:destroy()
        end

    end

end



-- Register class
mod:registerClass(COMP_TRADINGPOST_EXPORT)


-- Attach components
mod:registerPrefabComponent("PREFAB_TRADINGPOST_EXPORTYARD1", { DataType = "COMP_TRADINGPOST_EXPORT" } )

