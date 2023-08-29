local mod = foundation.createMod();


mod:dofile("scripts/resource.lua") -- resources used internally to the mod for the boss/worker relationship
mod:dofile("scripts/authority.lua") -- basic setup: servant job, territory cost, some additional resources at beginning of game
mod:dofile("scripts/building.lua") -- new parts for the Lord manor
mod:dofile("scripts/event.lua") -- quests to gain authority

-- Lord manor functions
mod:dofile("scripts/steward.lua")
mod:dofile("scripts/butler.lua")
mod:dofile("scripts/chamberlain.lua")
mod:dofile("scripts/garden.lua")
mod:dofile("scripts/councillor.lua")
mod:dofile("scripts/lord.lua")
mod:dofile("scripts/gentry.lua")

-- Soldier's Keep functions
mod:dofile("scripts/quartermaster.lua")
mod:dofile("scripts/armorer.lua")
mod:dofile("scripts/sergeant.lua")
mod:dofile("scripts/captain.lua")
mod:dofile("scripts/vassal.lua")

-- Monastery functions
mod:dofile("scripts/steward_monastery.lua")
mod:dofile("scripts/cellarer_monastery.lua")
mod:dofile("scripts/chamberlain_monastery.lua")
mod:dofile("scripts/garden_monastery.lua")
mod:dofile("scripts/archivist_monastery.lua")
mod:dofile("scripts/abbot_monastery.lua")

