local mod = foundation.createMod();


mod:dofile("scripts/compFarm.lua")
mod:dofile("scripts/compResourceGenerator.lua")

mod:dofile("scripts/monument.lua")

mod:dofile("scripts/behavior.lua") -- deprecate this in the next break version of the game (no longer needed)

mod:dofile("scripts/hay.lua")

mod:dofile("scripts/goat.lua")
mod:dofile("scripts/sheep.lua")
mod:dofile("scripts/cattle.lua")
mod:dofile("scripts/pig.lua")

mod:dofile("scripts/creamery.lua")
mod:dofile("scripts/butcher.lua")
mod:dofile("scripts/boar.lua")

mod:dofile("scripts/tanner.lua")
mod:dofile("scripts/cobbler.lua")

mod:dofile("scripts/wall.lua")

-- mod:dofile("scripts/event_trade.lua")
-- if not foundation.isModEnabled("4d419737-c3cd-456b-81c3-d473aad7a9f3") then -- If Balanced Trading is also loading, don't append the animals to the trade screen
--     mod:dofile("scripts/trade.lua")
-- end

-- -- Compatibility warning
-- if foundation.isModEnabled("b0c2607d-6073-4540-b5d5-5334fac177c7") or foundation.isModEnabled("3da8e097-c1c2-451b-a1aa-a28f25420c74") or foundation.isModEnabled("d333254a-6cc5-45bb-a9a8-7f98bc9c6fdb") or foundation.isModEnabled("8b9cd526-6c84-448f-bfb7-e5bff21f0fc7") then -- More Boar, Boar+, Production Booster, Production Overhaul
--     mod:dofile("scripts/event_compatibility.lua")
-- end

