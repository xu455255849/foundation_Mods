local mod = foundation.createMod();



mod:dofile("scripts/compPoultry.lua")
mod:dofile("scripts/compVegetable.lua")
mod:dofile("scripts/compResourceGenerator.lua")
mod:dofile("scripts/behavior_gather.lua") -- bug requiring this was fixed in Jan 2022, keep loading it for compatibility
mod:dofile("scripts/behavior_work.lua") -- custom behaviour to produce poultry which is no longer needed, as the vanilla bug has been fixed (kept due to save game crashes)

mod:dofile("scripts/wall.lua")
mod:dofile("scripts/dung.lua")
mod:dofile("scripts/poultry.lua")
mod:dofile("scripts/vegetable.lua")

if not foundation.isModEnabled("4d419737-c3cd-456b-81c3-d473aad7a9f3") then -- Balanced Trading
    mod:dofile("scripts/trade.lua")
end

-- mod:dofile("scripts/event_tutorial.lua") -- superceded now since I can have minimum placement requirements for each sub-building

