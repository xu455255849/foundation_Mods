local mod = ...



-- *************************************************************************************************************
-- Custom Component: Outlaw Position -------------------------------------------------------------------------------------
-- Outlaws go to these positions at the camp during their work cycle
-- *************************************************************************************************************
local COMP_SECURITY_OUTLAWPOSITION = {
	TypeName = "COMP_SECURITY_OUTLAWPOSITION",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Reserved", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "DayReserved", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_OUTLAWPOSITION:onEnabled()

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)
        if (self.DayReserved < (currentDay - 5)) then -- it's been too long since reservation, free up this position (outlaw got lost?)
            self.Reserved = false
            self.DayReserved = -1
        end
    
    end)
        
end


-- Register custom Class
mod:registerClass(COMP_SECURITY_OUTLAWPOSITION)



-- *************************************************************************************************************
-- Custom Component: Soldier Position -------------------------------------------------------------------------------------
-- Outlaws go to these positions at the camp during their work cycle
-- *************************************************************************************************************
local COMP_SECURITY_SOLDIERPOSITION = {
	TypeName = "COMP_SECURITY_SOLDIERPOSITION",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Reserved", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "DayReserved", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_SOLDIERPOSITION:onEnabled()


    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        local currentDay = CurrentDay(self)
        if (self.DayReserved < (currentDay - 5)) then -- it's been too long since reservation, free up this position (soldier got lost)
            self.Reserved = false
            self.DayReserved = -1
        end
    
    end)
        
end


-- Register custom Class
mod:registerClass(COMP_SECURITY_SOLDIERPOSITION)



-- *************************************************************************************************************
-- Custom Component: Outlaw Camp -------------------------------------------------------------------------------------
-- *************************************************************************************************************
local COMP_SECURITY_OUTLAWCAMP = {
	TypeName = "COMP_SECURITY_OUTLAWCAMP",
	ParentType = "COMPONENT",
	Properties = {
        -- The existence of these component list variables was causing crashes, there may be something wrong in Foundation with storing lists of components
		-- { Name = "OutlawPositionList", Type = "list<COMP_SECURITY_OUTLAWPOSITION>", Default = nil, Flags = { "SAVE_GAME" } },
		-- { Name = "SoldierPositionList", Type = "list<COMP_SECURITY_SOLDIERPOSITION>", Default = nil, Flags = { "SAVE_GAME" } },
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_OUTLAWCAMP:onEnabled()

    -- even when only storing IDs these fields caused issues, going to get them on the fly
    
    -- -- Record child components
    -- if (self.OutlawPositionList) then
    --     if (string.len(self.OutlawPositionList[1]) > 1) then
    --         self:getOwner():forEachChild(function(child)
    --             if (string.find(child.Name, "OutlawPosition")) then
    --                 table.insert(self.OutlawPositionList, child:getId())
    --             end
    --         end)
    --     end
    -- end
    -- mod:log("OutlawPositionList = " .. tostring(self.OutlawPositionList))

    -- if (self.SoldierPositionList) then
    --     if (string.len(self.SoldierPositionList[1]) > 1) then
    --         self:getOwner():forEachChild(function(child)
    --             if (string.find(child.Name, "SoldierPosition")) then
    --                 table.insert(self.SoldierPositionList, child:getId())
    --             end
    --         end)
    --     end
    -- end
    -- mod:log("SoldierPositionList = " .. tostring(self.SoldierPositionList))

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        -- check to see if workplace have been added nearby, if so remove the camp
        -- was using building parts but this was getting triggered constantly
        self:getLevel():getComponentManager("COMP_WORKPLACE"):getAllComponent():forEach(function(compWork)

            local posOutlawCamp = self:getOwner():getGlobalPosition()
            local objPart = compWork:getOwner()
            local posPart = objPart:getGlobalPosition()
            local dist = math.sqrt( (posOutlawCamp.x - posPart.x)^2 + (posOutlawCamp.z - posPart.z)^2 )

            if (dist < 100) and not (objPart.Name == "SoldierRally.Part") then
                -- local objOldCamp = self:getLevel():createObject("PREFAB_SECURITY_OUTLAWCAMP2", self:getOwner():getGlobalPosition())
                self:removeCamp()
            end

        end)

    end)

end


-- remove -------------------------------------------------------------------------------------
function COMP_SECURITY_OUTLAWCAMP:removeCamp()

    -- -- Remove all TargetCamp references for this camp
    -- self:getLevel():getComponentManager("COMP_SECURITY_RALLY"):getAllComponent():forEach(function(compRally)

    --     if (compRally.TargetCamp == self) then
    --         compRally.TargetCamp = nil
    --     end

    -- end)

    self:getOwner():destroy()

end


-- Register custom Class
mod:registerClass(COMP_SECURITY_OUTLAWCAMP)

