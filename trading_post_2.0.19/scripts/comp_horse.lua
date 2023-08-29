local mod = ...


--[[

This code creates horse pack trains that leave from the Trading Post stable and go to a point at the edge of the map (or island).
There are three components:

Stable: contains the central code and saved coordinates of both the stable and the eventual destination.

Explorer: a single horseman that leaves the stable to find a map edge. Once they have found an edge, 
    the point is recorded and the Explorer is deleted.

Caravan: these follow the start and end points laid out by the Explorer and go back and forth with a pause at each end.
    They are not deleted until the Stable is deleted.

]]



-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/Horse1.fbx/Prefab/Explorer.Part.001", "PREFAB_TRADINGPOST_EXPLORER")
mod:registerAssetId("models/Horse1.fbx/Prefab/Rider.Part.001", "PREFAB_TRADINGPOST_RIDER")

mod:registerAssetId("models/Horse1.fbx/Prefab/PackHorse.Part.001", "PREFAB_TRADINGPOST_PACKHORSE1")
mod:registerAssetId("models/Horse1.fbx/Prefab/PackHorse.Part.002", "PREFAB_TRADINGPOST_PACKHORSE2")
mod:registerAssetId("models/Horse1.fbx/Prefab/PackHorse.Part.003", "PREFAB_TRADINGPOST_PACKHORSE3")
mod:registerAssetId("models/Horse1.fbx/Prefab/PackHorse.Part.004", "PREFAB_TRADINGPOST_PACKHORSE4")



-- Slow down speed of horses
mod:overrideAsset({
    Id = "VEHICLE_HORSE",
    DefaultSpeed = 4 -- villagers walk at speed 4
})



-- ***********************************************************************************************************************************************************
-- ********** E X P L O R E R ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Explorer: Define component -------------------------------------------------------------------------------------
local COMP_TRADINGPOST_EXPLORER = {
	TypeName = "COMP_TRADINGPOST_EXPLORER",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "SpawnFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "SpawnParent", Type = "string", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "EdgeFound", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}


-- Explorer: Init -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_EXPLORER:onEnabled()

    if (self.SpawnFlag) then -- the component has reloaded but it already started its journey; it must be reset or it may stop where it is now

        -- find the Stable and reset its Spawn flag so that it sends out another Explorer
        objectParent = self:getLevel():find(self.SpawnParent) -- get the parent object (Stable)
        compParent = objectParent:getComponent("COMP_TRADINGPOST_STABLE")

        if (compParent) then

            compParent.SpawnFlag = false
            compParent:destroySpawned() -- explorer self destruct

        end

    else

        self.lastPosition = self:getOwner():getGlobalPosition()
        self.SpawnFlag = true
        self.timer = 10

    end

end


-- Explorer: Update -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_EXPLORER:update()


    -- update timer
    local dt = self:getLevel():getDeltaTime() -- how much real time passed since the last frame
    self.timer = self.timer - dt -- decrement the timer

    if dt == 0 then -- game is paused

    elseif (self.timer <= 0) then -- check position every n seconds

        -- check to see if Explorer is still moving
        local pos = self:getOwner():getGlobalPosition()
        local dist = math.sqrt( (pos.x - self.lastPosition[1])^2 + (pos.z - self.lastPosition[3])^2 )
        if (dist > 2) then -- moving

            mod:log("Explorer is moving, so an edge must have been detected")
            self.lastPosition = pos
            self.EdgeFound = true

            -- Inform the stable that an edge has been found
            objectParent = self:getLevel():find(self.SpawnParent) -- get the parent object (stable)
            compParent = objectParent:getComponent("COMP_TRADINGPOST_STABLE")
            compParent.EdgeFound = true

        else -- stopped
            if (self.EdgeFound) then -- the Explorer has reached the destination

                -- record the stopping position
                objectParent = self:getLevel():find(self.SpawnParent) -- get the parent object (stable)
                compParent = objectParent:getComponent("COMP_TRADINGPOST_STABLE")
                compParent.CoordEdge = {pos.x, pos.y, pos.z} -- record the position as the trade destination
                mod:log("Explorer's final position: " .. tostring(pos))

                orient = self:getOwner():getGlobalOrientation()

                -- place a Trading Post to cover the spot (to hide the walking horse, and as a visual destination)
                -- first check if there is already one in this area
                local found = false
                self:getLevel():getComponentManager("COMP_TRADINGPOST_POST"):getAllComponent():forEach(function(compPost)

                    local posCompPost = compPost:getOwner():getGlobalPosition()
                    local distPost = math.sqrt( (pos.x - posCompPost[1])^2 + (pos.z - posCompPost[3])^2 )
                    if (distPost < 20) then -- other posts too close
                        found = true
                    end

                end)

                if not (found) then
                    objBorder = self:getLevel():createObject("PREFAB_TRADINGPOST_POST1", pos)
                    -- objBorder:lookAt({512, pos[2], 512}) -- orient the trading post to the centre of the map
                    objBorder:setGlobalOrientation(orient) -- orient the trading post to the Explorer so that the door lines up with the path
                    objBorder:rotateLocalY(math.pi) -- turn the trading post around 180 degrees so the door is facing where the Explorer came from
                    mod:log("Spawned destination trading post.")
                else
                    mod:log("There was already a destination trading post in this area. Destination set but no trading post spawned.")
                end

                -- delete the current object
                mod:log("Explorer about to self-destruct.....")
                compParent:destroySpawned()

            end

        end

        self.timer = 5 -- reset timer

    end

end


-- Explorer: Register class
mod:registerClass(COMP_TRADINGPOST_EXPLORER)


-- Explorer: Attach components
mod:registerPrefabComponent("PREFAB_TRADINGPOST_EXPLORER", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_EXPLORER" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_EXPLORER", { DataType = "COMP_TRADINGPOST_EXPLORER" } )



-- ***********************************************************************************************************************************************************
-- ********** C A R A V A N ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Caravan: Define component -------------------------------------------------------------------------------------
local COMP_TRADINGPOST_CARAVAN = {
	TypeName = "COMP_TRADINGPOST_CARAVAN",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "SpawnParent", Type = "string", Default = nil, Flags = { "SAVE_GAME" } },
    }
}


function COMP_TRADINGPOST_CARAVAN:onDestroy(isClearingLevel)

    -- Add imports to the parent stable
    if (string.sub(self:getOwner().Name, 1, 9) == "PackHorse") then
        objStable = self:getLevel():find(self.SpawnParent)
        if (objStable) then
            compStable = objStable:getComponent("COMP_TRADINGPOST_STABLE")
            if (compStable) then
                compStable:addImports(1) -- grant as many imports as there were pack horses in the caravan
                mod:log("Added 1 import to the stable on pack horse return.")
            end
        else
            mod:log("Could not find stable to deposit import.")
        end
    end

end


-- Caravan: Register class
mod:registerClass(COMP_TRADINGPOST_CARAVAN)


-- Caravan: Attach components
mod:registerPrefabComponent("PREFAB_TRADINGPOST_RIDER", { DataType = "COMP_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE1", { DataType = "COMP_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE2", { DataType = "COMP_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE3", { DataType = "COMP_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE4", { DataType = "COMP_TRADINGPOST_CARAVAN" } )

mod:registerPrefabComponent("PREFAB_TRADINGPOST_RIDER", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE1", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE2", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE3", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_CARAVAN" } )
mod:registerPrefabComponent("PREFAB_TRADINGPOST_PACKHORSE4", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_TRADINGPOST_CARAVAN" } )



-- ***********************************************************************************************************************************************************
-- ********** S T A B L E ************************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Stable: Define component -------------------------------------------------------------------------------------
local COMP_TRADINGPOST_STABLE = {
	TypeName = "COMP_TRADINGPOST_STABLE",
	ParentType = "COMPONENT",
	Properties = {
        { Name = "SpawnFlag", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "SpawnList", Type = "list<string>", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "CoordStable", Type = "vec3f", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "CoordEdge", Type = "vec3f", Default = nil, Flags = { "SAVE_GAME" } },
        { Name = "TryCoordEdge", Type = "vec3f", Default = {64, 0, 64}, Flags = { "SAVE_GAME" } },
        { Name = "EdgeFound", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
        { Name = "EdgeFunction", Type = "integer", Default = 1, Flags = { "SAVE_GAME" } },
        { Name = "DespawnOnArrival", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}


-- Stable: Create -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:create()

    self.timer = 1.2
    self.spawn = 0
    self.otherFound = false
    self.EdgeFunction = math.random(1, 4) -- pick a function, this determines which edge scanning will start with

    if (self.EdgeFunction == 1) then self.TryCoordEdge = {64, 0, 64}
    elseif (self.EdgeFunction == 2) then self.TryCoordEdge = {960, 0, 64}
    elseif (self.EdgeFunction == 3) then self.TryCoordEdge = {64, 0, 960}
    else self.TryCoordEdge = {960, 0, 960}
    end

end


-- Stable: Init -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:onEnabled()

    if not (self.SpawnFlag) then

        -- find and record Stable's position
        objStable = self:getOwner()
        self.CoordStable = objStable:getGlobalPosition()

        -- send the explorer to find the way
        objExplorer = self:createHorse("PREFAB_TRADINGPOST_EXPLORER")

        -- tell the explorer which stable it belongs to, so that it can send back the last coordinate
        compExplorer = objExplorer:getOrCreateComponent("COMP_TRADINGPOST_EXPLORER")
        if (compExplorer) then
            compExplorer.SpawnParent = self:getOwner():getId()
        end

        -- prevent re-spawning next time
        self.SpawnFlag = true

    end

    -- set up the daily pack train event
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        -- mod:log("Daily process starting.....")
        -- mod:log("CoordStable: " .. tostring(self.CoordStable))
        -- mod:log("CoordEdge: " .. tostring(self.CoordEdge))
        -- mod:log("SpawnList: " .. tostring(self.SpawnList))

        if (self.CoordEdge) then -- the explorer has found the edge already

            if (self.SpawnList[1] == nil) then -- no other pack train is currently functioning

                -- count the number of exports available within a radius of 100m
                objStable = self:getOwner()
                posStable = objStable:getGlobalPosition()
                local countExports = 0

                self:getLevel():getComponentManager("COMP_TRADINGPOST_EXPORT"):getAllComponent():forEach(function(compExport)

                    objExport = compExport:getOwner()
                    posExport = objExport:getGlobalPosition()
                    distExport = math.sqrt( (posStable.x - posExport.x)^2 + (posStable.z - posExport.z)^2 )

                    if (distExport <= 100) and (compExport.Quantity > 0) then
                        countExports = countExports + compExport.Quantity
                    end

                end)


                if (countExports >= 5) then

                    mod:log("Explorer has found the edge, no pack trains active, exports at least 5 within 100m, initiate pack train ....")

                    -- decrement exports
                    local takeExports = 0
                    local takeQuantity = 0
                    self:getLevel():getComponentManager("COMP_TRADINGPOST_EXPORT"):getAllComponent():forEach(function(compExport)

                        objExport = compExport:getOwner()
                        posExport = objExport:getGlobalPosition()
                        distExport = math.sqrt( (posStable.x - posExport.x)^2 + (posStable.z - posExport.z)^2 )
    
                        if (distExport <= 100) and (compExport.Quantity > 0) then
                            if (compExport.Quantity > (8 - takeExports)) then -- there are more exports than can fit in this caravan
                                takeQuantity = (8 - takeExports)
                                compExport.Quantity = compExport.Quantity - takeQuantity -- take as much as you can fit
                            else -- there is enough room in the caravan for everything here
                                takeQuantity = compExport.Quantity
                                compExport.Quantity = 0
                            end
                            compExport:drawCrates()
                            takeExports = takeExports + takeQuantity -- add to the amount tagged for this caravan
                        end
    
                    end)
    
                    -- send horses (this is picked up by the update() function)
                    self.spawn = takeExports + 1 -- send the number of horses as the export quantity plus a guard
                    self.timer = 1
                   
                else

                    -- mod:log("Exports found: " .. countExports .. ", quantity below five, waiting for a full load.....")

                end
            end
        end

    end) -- weekly loop
    
end


-- Stable: Create horse -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:createHorse(prefab)

    -- find the stable
    local objStable = self:getOwner()
    local posStable = objStable:getGlobalPosition()

    -- create prefab at the stable
    local objAgent = self:getLevel():createObject(prefab, posStable)

    -- add the agent component with a horse vehicle
    local agent = objAgent:getOrCreateComponent("COMP_AGENT")
    if (agent) then
        agent:setVehicle("VEHICLE_HORSE")
        mod:log("******************** Agent object spawned with horse vehicle *****************")
    end

    -- record id of spawned object
    table.insert(self.SpawnList, agent:getOwner():getId())
    mod:log("Created object: " .. tostring(agent:getOwner():getId()) .. " " .. agent:getOwner().Name)

    -- find generic character objects that spawn with the vehicle, and record these too so you can delete them later
    local i = 1
    self:getLevel():getComponentManager("COMP_AGENT"):getAllComponent():forEach(function(compAgent)

        local nameObj = compAgent:getOwner().Name
        if (nameObj == "GenericCharacter") then
            local compGuest = compAgent:getOwner():getComponent("COMP_GUEST")
            if not compGuest then -- do not capture guests who also have a GenericCharacter object name
                mod:log("Found and renamed GenericCharacter object: " .. compAgent:getOwner():getId() .. " " .. compAgent:getOwner().Name)
                compAgent:getOwner().Name = objAgent:getId() .. "__" .. i -- rename the object so that it doesn't get linked to any future stables
                table.insert(self.SpawnList, compAgent:getOwner():getId())
                -- compAgent:getOwner():forEachComponent(function(comp)
                --     mod:log("  Component " .. tostring(comp))
                -- end)
            end
        end

        i = i + 1

    end)

    return objAgent

end


-- Stable: Try Coordinates -------------------------------------------------------------------------------------
-- used for scanning the map for possible locations as trade destinations
-- the behaviour trees pick up this destination and try to go there, if they fail a new position is created in the next timed update
function COMP_TRADINGPOST_STABLE:tryCoord()

    mod:log("Stable trying coordinates using function nbr " .. tostring(self.EdgeFunction))
    lastTry = self.TryCoordEdge

    if (self.EdgeFunction == 1) then -- start with 64, 64

        if (lastTry[1] >= 960) then -- x has reached the end of row, move y and reset x
            self.TryCoordEdge[1] = 64 -- reset x
            if (self.TryCoordEdge[3] < 512) then -- last run was on the left side
                self.TryCoordEdge[3] = 1024 - self.TryCoordEdge[3] -- go to the right side
            else
                self.TryCoordEdge[3] = 1024 - (self.TryCoordEdge[3] - 64) -- go back to the left side
            end
        else -- move x down
            self.TryCoordEdge[1] = self.TryCoordEdge[1] + 64
        end

    elseif (self.EdgeFunction == 2) then -- start with 960, 64

        if (lastTry[1] <= 64) then -- x has reached the end of row, try a new row
            self.TryCoordEdge[1] = 960 -- reset x
            if (self.TryCoordEdge[3] < 512) then -- last run was on the left side
                self.TryCoordEdge[3] = 1024 - self.TryCoordEdge[3] -- go to the right side
            else
                self.TryCoordEdge[3] = 1024 - (self.TryCoordEdge[3] - 64) -- go back to the left side
            end
        else -- move x up
            self.TryCoordEdge[1] = self.TryCoordEdge[1] - 64
        end

    elseif (self.EdgeFunction == 3) then -- start with 64, 960 and move first along y rather than x

        if (lastTry[3] <= 64) then -- y has reached the end of row, try a new row
            self.TryCoordEdge[3] = 960 -- reset y
            if (self.TryCoordEdge[1] > 512) then -- last run was on the left side
                self.TryCoordEdge[1] = 1024 - self.TryCoordEdge[1] -- go to the right side
            else
                self.TryCoordEdge[1] = 1024 - (self.TryCoordEdge[1] - 64) -- go back to the left side
            end
        else -- move y down
            self.TryCoordEdge[3] = self.TryCoordEdge[3] - 64
        end

    else -- start with 960, 960 and move first along y rather than x

        if (lastTry[3] <= 64) then -- y has reached the end of row, try a new row
            self.TryCoordEdge[3] = 960 -- reset x
            if (self.TryCoordEdge[1] > 512) then -- last run was on the left side
                self.TryCoordEdge[1] = 1024 - self.TryCoordEdge[1] -- go to the right side
            else
                self.TryCoordEdge[1] = 1024 - (self.TryCoordEdge[1] + 64) -- go back to the left side
            end
        else -- move y up
            self.TryCoordEdge[3] = self.TryCoordEdge[3] - 64
        end

    end

    -- mod:log("Try coordinates: " .. tostring(self.TryCoordEdge))

end


-- Stable: update -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:update()

    -- if (self.CoordEdge) then mod:log("CoordEdge exists: " .. tostring(self.CoordEdge)) end
    -- if (self.TryCoordEdge) then mod:log("TryCoordEdge exists: " .. tostring(self.TryCoordEdge)) end

    -- cycles through possible destination coordinates until the Explorer finds one
    -- each edge gets 16 different tries, spaced out 64 metres apart
    -- if an edge does not yield a destination, the next row 64 metres inward is tried, and so on

    if not (self.EdgeFound) then -- only run if the edge hasn't been found yet

        local dt = self:getLevel():getDeltaTime()
        if (dt ~= 0) then -- game is not paused

            self.timer = self.timer - dt

            if (self.timer <= 0) then -- the timer has run out, time to check a new position

                -- try a new set of coordinates
                self:tryCoord()

                -- reset the timer
                self.timer = 1
                
            end

        end


    -- checks to see if pack horses should be spawned, if so spawns the qty requested with a delay between each horse
    elseif (self.spawn > 0) then -- only run if spawning has been requested

        local dt = self:getLevel():getUnscaledDeltaTime()
        local ts = self:getLevel():getTimeScale()
        if (dt ~= 0) then -- game is not paused

            self.timer = self.timer - (dt * ts)

            if (self.timer <= 0) then -- the timer has now run out, time to spawn

                -- spawn horse
                if not (self.SpawnList[1]) then -- first horse is a rider
                -- if (self.spawn == 5) then -- first horse is a rider
                    objCaravan = self:createHorse("PREFAB_TRADINGPOST_RIDER")
                else -- rest of the horses are pack animals
                    i = math.random(1, 4) -- pick one of the models
                    objCaravan = self:createHorse("PREFAB_TRADINGPOST_PACKHORSE" .. i)
                end
            
                -- tell the pack train which stable it belongs to, so that it knows the destination coordinates
                compCaravan = objCaravan:getOrCreateComponent("COMP_TRADINGPOST_CARAVAN")
                if (compCaravan) then
                    compCaravan.SpawnParent = self:getOwner():getId()
                end

                -- decrement the spawn count
                self.spawn = self.spawn - 1
                
                -- reset the timer
                self.timer = 1.2

            end
            
        end

    end
    
end



-- Stable: onDestroy -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:onDestroy(isClearingLevel)

    -- remove horses
    self:destroySpawned()

    -- remove crates
    objStable = self:getOwner()
    idStable = objStable:getId()

    for i = 1, 10, 1 do

        objFind = objStable:getLevel():find(tostring(idStable) .. "_ImportBoxPosition.00" .. i)
        if (objFind) then
            objFind:destroy()
        end

    end

    
end


-- Stable: destroySpawned -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:destroySpawned()

    -- remove any object that was logged in the spawn list 
    for i, idPair in ipairs(self.SpawnList) do
        obj = self:getLevel():find(self.SpawnList[i])
        if (obj) then
            local compGuest = obj:getComponent("COMP_GUEST")
            if not compGuest then -- do not destroy guests who also have a GenericCharacter object name, legacy bug from previous version of the mod
                mod:log("Destroying spawned object: " .. obj:getId() .. " " .. obj.Name)
                obj:destroyAllChild()
                obj:destroy()
            end
        end
    end

    -- Clear the spawn list for future use
    for k,v in pairs(self.SpawnList) do
        self.SpawnList[k] = nil
    end

end


-- Stable: addImports -------------------------------------------------------------------------------------
function COMP_TRADINGPOST_STABLE:addImports(qty)

    local objStable = self:getOwner()
    local idStable = objStable:getId()

    mod:log("Depositing " .. qty .. " imports at the stable door.....")

    -- find the import box positions and fill empty spaces with boxes
    local countAdd = qty
    objStable:forEachChildRecursive(function(objChild)
        if (string.sub(objChild.Name, 1, 17) == "ImportBoxPosition") and (countAdd > 0) then
            local objFind = objStable:getLevel():find(tostring(idStable) .. "_" .. objChild.Name)
            if not (objFind) then -- this position is not taken yet, put a crate here
                local objNew = self:getLevel():createObject("PREFAB_TRADINGPOST_IMPORTCONTAINER", objChild:getGlobalPosition(), objChild:getGlobalOrientation())
                if objNew then
                    objNew.Name = tostring(idStable) .. "_" .. objChild.Name -- name the crate object to find it later
                    countAdd = countAdd - 1
                end
            end
        end
    end)

    -- put any remaining boxes in slot 10
    if (countAdd > 0) then
        objStable:forEachChildRecursive(function(objChild)
            if (objChild.Name == "ImportBoxPosition.010") then
                for i = 1, countAdd, 1 do
                    local objNew = self:getLevel():createObject("PREFAB_TRADINGPOST_IMPORTCONTAINER", objChild:getGlobalPosition(), objChild:getGlobalOrientation())
                    if objNew then
                        objNew.Name = tostring(idStable) .. "_" .. objChild.Name -- name the crate object to find it later
                    end
                end
            end
        end)
    end

end


-- Stable: Register class
mod:registerClass(COMP_TRADINGPOST_STABLE)


-- Stable: Attach components
mod:registerPrefabComponent("PREFAB_TRADINGPOST_STABLE1", { DataType = "COMP_TRADINGPOST_STABLE" } )



-- ***********************************************************************************************************************************************************
-- ********** T R A D I N G   P O S T ********************************************************************************************************************************
-- ***********************************************************************************************************************************************************

-- Trading Post: Define component -------------------------------------------------------------------------------------
local COMP_TRADINGPOST_POST = {
	TypeName = "COMP_TRADINGPOST_POST",
	ParentType = "COMPONENT",
	Properties = {
    }
}


-- Trading Post: Register class
mod:registerClass(COMP_TRADINGPOST_POST)


-- Trading Post: Attach components
mod:registerPrefabComponent("PREFAB_TRADINGPOST_POST1", { DataType = "COMP_TRADINGPOST_POST" } )


