local mod = ...


-- Initial Component -------------------------------------------------------------------------------------
-- This puts the overlay component on the building object and removes the old setup where that component existed for each part
local COMP_SECURITY_OVERLAY_INIT = {
	TypeName = "COMP_SECURITY_OVERLAY_INIT",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Init", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    }
}

-- Update -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY_INIT:update()
-- Runs only once, then self destructs

    -- -- Put the overlay component on the building object if it doesn't already exist
    -- local compBuilding = nil

    -- -- First check if the calling object is a building
    -- compBuilding = self:getOwner():getComponent("COMP_BUILDING")

    -- -- If this isn't a building, try to find a building up the hierarchy
    -- if not compBuilding then
    --     compBuilding = self:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")
    -- end

    local compBuilding = self:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")

    if compBuilding then
        local compBuildingAgain = compBuilding:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")
        if compBuildingAgain then
            local compOverlay = compBuildingAgain:getOwner():getOrCreateComponent("COMP_SECURITY_OVERLAY")
            -- mod:log("Adding or reading the overlay component on Building object (a second level was found): " .. tostring(compOverlay:getOwner().name))
        else
            local compOverlay = compBuilding:getOwner():getOrCreateComponent("COMP_SECURITY_OVERLAY")
            -- mod:log("Adding or reading the overlay component on Building object (only 1 found)" .. tostring(compOverlay:getOwner().name))
        end

    else
        mod:log("COMP_SECURITY_OVERLAY could not find a building to attach to.")

    end

    -- Self destruct
    self:getOwner():removeComponent(self)

end

-- Register
mod:registerClass(COMP_SECURITY_OVERLAY_INIT)

-- Attach class to prefab
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE0", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE20", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_ROUND_ROOT", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_SQUARE_ROOT", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
mod:registerPrefabComponent("PREFAB_SECURITY_WALL_ROOT", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )



-- *************************************************************************************************************
-- Custom Component -------------------------------------------------------------------------------------
-- If the keep workplace is paused, shows the Security overlay
-- *************************************************************************************************************
local COMP_SECURITY_OVERLAY = {
	TypeName = "COMP_SECURITY_OVERLAY",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Show", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
		{ Name = "SpawnList", Type = "list<string>", Default = nil, Flags = { "SAVE_GAME" } },
    }
}

-- Update -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:update()

    -- local compBuilding = self:getOwner():findFirstObjectWithComponentUp("COMP_BUILDING")
    local compBuilding = self:getOwner():getComponent("COMP_BUILDING")
    if compBuilding then

        -- mod:log("comp building found for overlay: edit mode " .. tostring(compBuilding.EditMode) .. ", Show flag " .. tostring(self.Show))

        if compBuilding.EditMode and not self.Show then
            self:showOverlay()
        elseif not compBuilding.EditMode and self.Show then
            self.Show = false
            self:hideOverlay()
        end

    end

end



-- Show Overlay -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:showOverlay()

    -- Check if an overlay is already active
    local found = false
    self:getLevel():getComponentManager("COMP_SECURITY_OVERLAY"):getAllComponent():forEach(function(compCheck)
        if compCheck.Show then
            found = true
        end
    end)

    if not found then

        self.Show = true

        mod:log("Show security overlay")

        -- -- Recalculate security on the fly
        local compSec = self:getLevel():getComponentManager("COMP_SECURITY"):getFirst()
        compSec:calcPoints()
        compSec:trackWorkplaces()

        -- Show building security status
        local listDelete = {}
        self:getLevel():getComponentManager("COMP_SECURITY_BUILDING_PART"):getAllComponent():forEach(function(compSecPart)

            -- queue for deletion any that no longer have a workplace (this case will result in an incorrect red shield showing on the overlay)
            local compWork = compSecPart:getOwner():getComponent("COMP_WORKPLACE")
            if not compWork then
                table.insert(listDelete, compSecPart)
            end

            -- add billboards based on score band
            local objSecPart = compSecPart:getOwner()
            local posSecPart = objSecPart:getGlobalPosition()

            if (compSecPart.Score < 1) then -- these are subject to having workers become outlaws
                -- mod:log("Spawned low score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDLOW", posSecPart, 12)
            elseif (compSecPart.Score < 5) then -- these are subject to having outlaws steal resources
                -- mod:log("Spawned medium score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDMED", posSecPart, 12)
            elseif (compSecPart.Score >= 5) then -- these are protected against outlaws and cannot be stolen from
                -- mod:log("Spawned high score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDHIGH", posSecPart, 12)
            end

        end)

        -- Delete any security building part components that no longer have a workplace
        local countDelete = #listDelete
        if (countDelete > 0) then
            for i=1, countDelete do
                local objDelete = listDelete[i]:getOwner()
                if (objDelete) then
                    objDelete:removeComponent(listDelete[i])
                    mod:log("Removed COMP_SECURITY_BUILDING_PART on a part that no longer had a COMP_WORKPLACE: " .. tostring(objDelete.Name))
                end
            end
        end

        -- Show security points (items that add security to other buildings)
        self:getLevel():getComponentManager("COMP_SECURITY_POINTS"):getAllComponent():forEach(function(compSecPoint)

            local objSecPoint = compSecPoint:getOwner()
            local posSecPoint = objSecPoint:getGlobalPosition()
            local points = compSecPoint.Points

            if (points <= 0) then
            elseif (points < 2) then
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARD2", posSecPoint, 16)
            elseif (points < 5) then
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARD5", posSecPoint, 18)
            elseif (points >= 5) then
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARD10", posSecPoint, 20)
            end

        end)

        -- Show house security status
        self:getLevel():getComponentManager("COMP_SECURITY_HOUSE"):getAllComponent():forEach(function(compSecHouse)

            -- add billboards based on score band
            local objSecPart = compSecHouse:getOwner()
            local posSecPart = objSecPart:getGlobalPosition()

            if (compSecHouse.Score < 1) then -- these are subject to having workers become outlaws
                -- mod:log("Spawned low score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDLOW", posSecPart, 12)
            elseif (compSecHouse.Score < 5) then -- these are subject to having outlaws steal resources
                -- mod:log("Spawned medium score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDMED", posSecPart, 12)
            elseif (compSecHouse.Score >= 5) then -- these are protected against outlaws and cannot be stolen from
                -- mod:log("Spawned high score object")
                self:spawnObject("PREFAB_SECURITY_POINTS_BILLBOARDHIGH", posSecPart, 12)
            end

        end)

    end

end



-- Spawn Overlay Object -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:spawnObject(prefab, pos, height)

    local objNew = self:getLevel():createObject(prefab, pos)
    objNew:translate({0, height, 0})
    table.insert(self.SpawnList, objNew:getId())

end



-- Hide Overlay -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:hideOverlay()

    mod:log("Hide security overlay")
    self:destroySpawned()
    
end



-- destroySpawned -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:destroySpawned()

    -- remove any object in the spawn list 
    for i, idPair in ipairs(self.SpawnList) do
        local obj = self:getLevel():find(self.SpawnList[i])
        if (obj) then
            obj:destroyAllChild()
            obj:destroy()
        end
    end
    
    -- Clear the spawn list for future use
    for k,v in pairs(self.SpawnList) do
        self.SpawnList[k] = nil
    end

end



-- onDestroy -------------------------------------------------------------------------------------
function COMP_SECURITY_OVERLAY:onDestroy(isClearingLevel)

    self.Show = false
    self:destroySpawned()

end



-- Register custom Class
mod:registerClass(COMP_SECURITY_OVERLAY)

-- -- Attach class to prefab; these objects when in edit mode will spawn the overlay
-- mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE0", { DataType = "COMP_SECURITY_OVERLAY" } )
-- mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_ROUND_ROOT", { DataType = "COMP_SECURITY_OVERLAY" } )
-- mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_SQUARE_ROOT", { DataType = "COMP_SECURITY_OVERLAY" } )
-- mod:registerPrefabComponent("PREFAB_SECURITY_WALL_ROOT", { DataType = "COMP_SECURITY_OVERLAY" } )



-- Particle System: Overlay -------------------------------------------------------------------------------------
local function particleOverlay(id, mat, prefab, size)
    mod:registerAsset({
        DataType = "PARTICLE_SYSTEM",
        Id = id,
        Material = mat,
        Visual = {
            DataType = "PARTICLE_DEFAULT_VISUAL",
        },
        BillboardBehavior = "FACE_CAMERA",
        MinimumQuality = "LOW",
        LinearVelocity = {
            DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
            Value = { 0, 0, 0 }
        },
        Delay = { 0, 0 },
        StartSpeed = { 0, 0 },
        StartRotation = { 0, 0 },
        StartSize = { size, size },
        StartColor = { 1, 1, 1, 1 },
        GravityModifier = 0,
        Looping = false, -- whether to keep spawning new particles for the duration
        Duration = 1, -- how long to spawn new ones
        RateOverTime = 1, -- how many to spawn per second
        -- LifeTime = (60 * 10), -- how long each spawned particle lasts before disappearing
        LifeTime = 10, -- how long each spawned particle lasts before disappearing
        Shape = {
            DataType = "PARTICLE_EMITTER_SHAPE_BOX",
            Size = { 0, 0.001, 0 },
            Rotation = { 0, 0, 0 },
            Position = { 0, 0, 0 },
        },
    })

    mod:registerPrefabComponent(prefab, {
        DataType = "COMP_PARTICLE_EMITTER",
        ParticleSystem = id,
        IsPlaying = true,
        IsEmitting = true
    })
end

-- particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD10", "MATERIAL_SECURITY_POINTS_PLUS10", "PREFAB_SECURITY_POINTS_BILLBOARD10", 10)
-- particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD5", "MATERIAL_SECURITY_POINTS_PLUS5", "PREFAB_SECURITY_POINTS_BILLBOARD5", 5)
-- particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD2", "MATERIAL_SECURITY_POINTS_PLUS2", "PREFAB_SECURITY_POINTS_BILLBOARD2", 3)

particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD2", "MATERIAL_SECURITY_POINTS_PLUS", "PREFAB_SECURITY_POINTS_BILLBOARD2", 2)
particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD5", "MATERIAL_SECURITY_POINTS_PLUS", "PREFAB_SECURITY_POINTS_BILLBOARD5", 5)
particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARD10", "MATERIAL_SECURITY_POINTS_PLUS", "PREFAB_SECURITY_POINTS_BILLBOARD10", 8)

particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARDLOW", "MATERIAL_SECURITY_POINTS_LOW", "PREFAB_SECURITY_POINTS_BILLBOARDLOW", 4)
particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARDMED", "MATERIAL_SECURITY_POINTS_MED", "PREFAB_SECURITY_POINTS_BILLBOARDMED", 4)
particleOverlay("PARTICLE_SYSTEM_SECURITY_BILLBOARDHIGH", "MATERIAL_SECURITY_POINTS_HIGH", "PREFAB_SECURITY_POINTS_BILLBOARDHIGH", 4)

