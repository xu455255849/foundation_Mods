local  CommonResource = foundation.createMod();



-- Modded needs (required in this mod to type the resources correctly)
CommonResource:dofile("scripts/need/entertainment.lua") -- used by the Entertainment and Street Performers mods
CommonResource:dofile("scripts/need/fuel.lua") -- used by the Fuel mod
CommonResource:dofile("scripts/need/advancedneeds.lua") -- kept for save game compatibility, remove at next game version
CommonResource:dofile("scripts/need/house.lua") -- universal housing

-- Resource definitions and types
CommonResource:dofile("scripts/resources.lua")


