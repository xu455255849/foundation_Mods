local mod = ...


--[[

The flock has 10 empty Attach_Minors. Each one has a component that generates a new child SpawnPoint on initialisation,
and deletes and regenerates the SpawnPoint every month. The SpawnPoint has its own component which generates the
poultry prefab that moves. SpawnPoints also have the poultry resources, and when they are collected they disappear and
remove the poultry prefab. Every month the SpawnPoint is recreated which adds a new poultry prefab to the world.

]]


-- Poultry Farm Flock -------------------------------------------------------------------------------------
local COMP_POULTRYFARM_FLOCK = {
	TypeName = "COMP_POULTRYFARM_FLOCK",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "FlockSpawnFlag",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "FlockSpawnedList",
            Type = "list<string>",
            Default = nil,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "FlockPoultryType",
            Type = "string",
            Default = "CHICKEN",
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "RespawnWeekToggle",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
    }
}



-- Flock: Create SpawnPoints -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_FLOCK:createSpawnPoints()

    objFlock = self:getOwner()

    -- Remove any existing SpawnPoints
    for i, idPair in ipairs(self.FlockSpawnedList) do
        objSpawn = self:getLevel():find(self.FlockSpawnedList[i])
        if (objSpawn) then
            objSpawn:destroyAllChild()
            objSpawn:destroy()
        end
    end

    -- Clear the table
    -- for i, idPair in ipairs(self.FlockSpawnedList) do 
    --     table.remove(self.FlockSpawnedList, i)
    -- end
    for k,v in pairs(self.FlockSpawnedList) do
        self.FlockSpawnedList[k] = nil
    end

    -- Create new SpawnPoints
    objFlock:forEachChild(function(child)

        childName = child.Name
        if (childName) then
            if (string.sub(childName, 1, 12) == "Attach_Minor") then
                pos = child:getGlobalPosition()
                objSpawnNew = self:getLevel():createObject("PREFAB_POULTRYFARM_SPAWNPOINT_" .. self.FlockPoultryType, pos)
                compSpawnNew = objSpawnNew:getOrCreateComponent("COMP_POULTRYFARM_SPAWNPOINT")
                compSpawnNew.PoultryType = self.FlockPoultryType
                table.insert(self.FlockSpawnedList, objSpawnNew:getId())
            end
        end
        
    end)

end



-- Flock: Init -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_FLOCK:onEnabled()

    if not (self.FlockSpawnFlag) then
    
        self:createSpawnPoints()
        self.FlockSpawnFlag = true
        -- mod:log("Poultry farm populated for the first time.............")

    end

    -- Event to delete and regenerate every other week
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_WEEK, function()
        if self.RespawnWeekToggle then
            self:createSpawnPoints()
            self.RespawnWeekToggle = false
        else
            self.RespawnWeekToggle = true
        end
        -- mod:log("Poultry farm replenished..............")
    end)

end



-- Flock: onDestroy -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_FLOCK:onDestroy(isClearingLevel)

    -- Remove any associated SpawnPoints
    -- mod:log("COMP_POULTRYFARM_FLOCK.destroy ______________________________________________________________________________________")

    for i, idPair in ipairs(self.FlockSpawnedList) do
        obj = self:getLevel():find(self.FlockSpawnedList[i])
        if (obj) then
            obj:destroyAllChild()
            obj:destroy()
        end
    end
    
    -- Clear the table
    -- for i, idPair in ipairs(self.FlockSpawnedList) do 
    --     table.remove(self.FlockSpawnedList, i)
    -- end
    for k,v in pairs(self.FlockSpawnedList) do
        self.FlockSpawnedList[k] = nil
    end


end



-- Register custom Class
mod:registerClass(COMP_POULTRYFARM_FLOCK)



-- Custom Component: Poultry Farm Spawn Point -------------------------------------------------------------------------------------
local COMP_POULTRYFARM_SPAWNPOINT = {
	TypeName = "COMP_POULTRYFARM_SPAWNPOINT",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "SpawnFlag",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "SpawnedList",
            Type = "list<string>",
            Default = nil,
            Flags = { "SAVE_GAME" } 
        },
        {
            Name = "PoultryType",
            Type = "string",
            Default = "CHICKEN",
            Flags = { "SAVE_GAME" } 
        },
    }
}



-- Custom Component: Initialise -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_SPAWNPOINT:onEnabled()

    if not (self.SpawnFlag) then

        -- mod:log("COMP_POULTRYFARM_SPAWNPOINT.init ______________________________________________________________________________________")

        -- Spawn a poultry prefab at the location of each SpawnPoint, record the Id of the poultry game object to delete it when the SpawnPoint is removed
        local pos = self:getOwner():getGlobalPosition()
        local i = math.random(1, 10)
        local poultryType = self.PoultryType
        if not (poultryType) then poultryType = "CHICKEN" end
        local obj = self:getLevel():createObject("PREFAB_POULTRYFARM_" .. poultryType .. i, pos)
        table.insert(self.SpawnedList, obj:getId())

        -- Enforce a radius within which the poultry can move
        local compEnforcerRadius = obj:getOrCreateComponent("COMP_ENFORCE_RADIUS")
        if (compEnforcerRadius) then
            compEnforcerRadius:setEnforcer(self:getOwner())
        end

        -- Avoid respawning animals again the next time the component loads
        self.SpawnFlag = true

    end -- SpawnFlag was not set

end -- component init end



-- Custom Component: onDestroy -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_SPAWNPOINT:onDestroy(isClearingLevel)

    if not (isClearingLevel) then

        -- mod:log("COMP_POULTRYFARM_SPAWNPOINT.destroy ______________________________________________________________________________________")
        -- Remove any poultry spawned from this SpawnPoint
        for i, idPair in ipairs(self.SpawnedList) do
            obj = self:getLevel():find(self.SpawnedList[i])
            if (obj) then 
                obj:destroyAllChild()
                obj:destroy()
            end
        end

    end

end



-- Register custom Class
mod:registerClass(COMP_POULTRYFARM_SPAWNPOINT)



-- Custom Component: DuckPond -------------------------------------------------------------------------------------
local COMP_POULTRYFARM_DUCKPOND = {
	TypeName = "COMP_POULTRYFARM_DUCKPOND",
	ParentType = "COMPONENT",
	Properties = {
        {
            Name = "SpawnFlag",
            Type = "boolean",
            Default = false,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "AnimalCount",
            Type = "integer",
            Default = 1,
            Flags = { "SAVE_GAME" }
        },
        {
            Name = "SpawnedList",
            Type = "list<string>",
            Default = nil,
            Flags = { "SAVE_GAME" } 
        },
    }
}



-- Duck: Initialise -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_DUCKPOND:onEnabled()

    if not (self.SpawnFlag) then

        pos = self:getOwner():getGlobalPosition()

        for i = 1, self.AnimalCount, 1 do

            -- Spawn ducks
            type = math.random(1, 2)
            obj = self:getLevel():createObject("PREFAB_POULTRYFARM_DUCK" .. type, pos)
            table.insert(self.SpawnedList, obj:getId())

            -- Enforce a radius within which the poultry can move
            compEnforcerRadius = obj:getOrCreateComponent("COMP_ENFORCE_RADIUS")
            if (compEnforcerRadius) then
                compEnforcerRadius:setEnforcer(self:getOwner())
            end

        end

        -- Avoid respawning animals again the next time the component loads
        self.SpawnFlag = true

    end -- SpawnFlag was not set

end -- component init end



-- Duck: onDestroy -------------------------------------------------------------------------------------
function COMP_POULTRYFARM_DUCKPOND:onDestroy(isClearingLevel)

    if not (isClearingLevel) then

        -- mod:log("COMP_POULTRYFARM_SPAWNPOINT.destroy ______________________________________________________________________________________")
        -- Remove any poultry spawned from this SpawnPoint
        for i, idPair in ipairs(self.SpawnedList) do
            obj = self:getLevel():find(self.SpawnedList[i])
            if (obj) then 
                obj:destroyAllChild()
                obj:destroy()
            end
        end

    end

end



-- Register custom Class
mod:registerClass(COMP_POULTRYFARM_DUCKPOND)


