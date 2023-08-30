local mod = foundation.createMod();

-- If Security v1.x is loaded, do not load this mod
if not (foundation.isModLoaded("99ee3b3b-f103-41f0-a725-bc466a2fc6de")) then

    mod:dofile("scripts/comp_action.lua") -- data required to execute game actions (trigger events) from components
    mod:dofile("scripts/comp_function.lua") -- global functions used by components
    mod:dofile("scripts/comp_alert.lua") -- resource generator that shows security alerts visually
    mod:dofile("scripts/comp_security.lua") -- main security component that governs the mod, attached to prefab_manager
    mod:dofile("scripts/comp_pathfinder.lua") -- used by agent that finds out whether a location is pathable
    mod:dofile("scripts/comp_points.lua") -- points attached to building parts that generate security for other buildings
    mod:dofile("scripts/comp_outlawcamp.lua") -- outlaw camp
    -- mod:dofile("scripts/comp_rally.lua") -- rally camp
    -- mod:dofile("scripts/comp_bandit.lua") -- bandits (mounted raiders)
    mod:dofile("scripts/comp_overlay.lua") -- visual representation of security when Security building is in Edit mode
    mod:dofile("scripts/comp_misc.lua") -- various small components: guard arrows, outlaw camps, etc etc

    mod:dofile("scripts/behavior_guard.lua") -- Guards
    mod:dofile("scripts/behavior_pathfinder.lua") -- Invisible pathfinder to find suitable outlaw camp locations
    mod:dofile("scripts/behavior_outlaw.lua") -- Outlaws
    mod:dofile("scripts/behavior_prisoner.lua") -- Prisoners
    -- mod:dofile("scripts/behavior_rally.lua") -- Rally point (clearing outlaw camps)
    -- mod:dofile("scripts/behavior_bandit.lua") -- Bandits (mounted raiders)

    mod:dofile("scripts/security.lua") -- the main building, part, job and function code
    mod:dofile("scripts/override.lua") -- override vanilla and modded assets with functions and generators

    mod:dofile("scripts/particles.lua") -- campfire particles

    mod:dofile("scripts/event_tutorial.lua") -- gives help when needed
    mod:dofile("scripts/event_outlaw.lua") -- gives notifications when villagers become outlaws
    mod:dofile("scripts/event_outlaw_new.lua") -- gives notifications when outlaws arrive from outside the borders
    mod:dofile("scripts/event_theft.lua") -- pays resources and gold when outlaws steal things
    -- mod:dofile("scripts/event_bandit.lua") -- gives notifications when bandits successfully attack

    mod:dofile("scripts/wall.lua")

end


