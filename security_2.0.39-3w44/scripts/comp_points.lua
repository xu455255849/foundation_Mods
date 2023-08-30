local mod = ...



-- *************************************************************************************************************
-- Custom Component: Security Points -------------------------------------------------------------------------------------
-- These are attached to anything that gives workplaces security points
-- *************************************************************************************************************

local COMP_SECURITY_POINTS = {
	TypeName = "COMP_SECURITY_POINTS",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "BasePoints", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } }, -- points for existence of the component
		{ Name = "WorkerPoints", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } }, -- points per worker in the associated workplace
		{ Name = "Points", Type = "integer", Default = 0, Flags = { "SAVE_GAME" } }, -- total points (calculated daily or when overlay is requested)
		{ Name = "Duration", Type = "integer", Default = -1, Flags = { "SAVE_GAME" } }, -- after this many days, delete the security point object (used for guard patrols)
    }
}


-- Init -------------------------------------------------------------------------------------
function COMP_SECURITY_POINTS:onEnabled()

    -- Clean up any obsolete patrol points
    if self:getOwner().Name == "PointsGuard" and self.Duration <= 0 then
        self:getOwner():destroy()
    end

    -- Daily script
    local compMainGameLoop = self:getLevel():find("COMP_MAIN_GAME_LOOP")
    event.register(self, compMainGameLoop.ON_NEW_DAY, function()

        -- Decrement the duration and delete the object if it has fallen to zero; ignore where duration is negative (no duration)
        if (self.Duration > 0) then
            self.Duration = self.Duration - 1
            if (self.Duration <= 0) then
                self:getOwner():destroy()
            end
        end

    end)

end


-- Register custom Class
mod:registerClass(COMP_SECURITY_POINTS)

-- Attach class to prefabs
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE0", { DataType = "COMP_SECURITY_POINTS", BasePoints = 4 } ) -- Constable's Keep

mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE1", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 2 } ) -- Constable in keep A (small stone)
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE2", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 2 } ) -- Guard in keep
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE3", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 2 } ) -- Guard in keep

mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE8", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 3 } ) -- Constable in keep B (medium stone)
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE9", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 3 } ) -- Guard in keep
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE10", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 3 } ) -- Guard in keep
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE11", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 3 } ) -- Guard in keep

mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE14", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 4 } ) -- Constable in keep C (large stone)
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE15", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 4 } ) -- Guard in keep
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE16", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 4 } ) -- Guard in keep
mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE17", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 4 } ) -- Guard in keep


mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE20", { DataType = "COMP_SECURITY_POINTS", BasePoints = 3 } ) -- Constable's Keep (wood)

mod:registerPrefabComponent("PREFAB_SECURITY_CONSTABLE21", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 3 } ) -- Constable in keep (wood)


mod:registerPrefabComponent("PREFAB_SECURITY_TOWER1_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER2_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER3_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER4_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER5_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER6_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Guard tower
mod:registerPrefabComponent("PREFAB_SECURITY_TOWER7_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 1, WorkerPoints = 2 } ) -- Guard tower (wood)

-- mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_DOOR1", { DataType = "COMP_SECURITY_POINTS" } ) -- Guard tower door
-- mod:registerPrefabComponent("PREFAB_SECURITY_TOWER_DOOR3", { DataType = "COMP_SECURITY_POINTS" } ) -- Guard tower door (wood)


mod:registerPrefabComponent("PREFAB_SECURITY_WALL_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Wall (employs 1 guard)
mod:registerPrefabComponent("PREFAB_SECURITY_WALL_END2", { DataType = "COMP_SECURITY_POINTS", BasePoints = 1, WorkerPoints = 2 } ) -- Wall (employs 1 guard)

mod:registerPrefabComponent("PREFAB_SECURITY_GATE_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } ) -- Gate (employs 1 guard)
mod:registerPrefabComponent("PREFAB_SECURITY_GATE2_END", { DataType = "COMP_SECURITY_POINTS", BasePoints = 1, WorkerPoints = 2 } ) -- Gate (employs 1 guard)


mod:registerPrefabComponent("PREFAB_SECURITY_POINTS_GUARD", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, Duration = 5 } ) -- Dropped at Patrol Points when occupied


mod:registerPrefabComponent("PREFAB_SECURITY_RALLY", { DataType = "COMP_SECURITY_POINTS", WorkerPoints = 2 } )

