local  Pastry = foundation.createMod();

_PastryPrefix = "PASTRY_V5"
_CommonEgg = "BV1_EGG"
_CommonButter = "BV1_BUTTER"
_CommonFruit = "RESOURCE_FRUIT"
_CommonPastry = "BV1_PASTRY"
DairyAdditionPrefix = "DAIRY_ADDITION"
BakerAdditionPrefix = "BAKER_ADDITION"

if (foundation.getGameVersion == nil or version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    Pastry:logError("Pastry: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9.3"
if version.cmp(foundation.getGameVersion(), "1.9.3") < 0 then
    _scriptFolder = "scripts1.9.2"
end
Pastry:msgBox("Pastry: game version" .. foundation.getGameVersion())

-- common functions
-- As the global functions are not transmit yet from dependencies, this file has to be duplicated in each mod
Pastry:dofile(_scriptFolder .. "/common.lua")

_NoSandbox = difficultyLevel(Pastry, "Pastry")

-- check all the dependencies
if not checkVersion(Pastry, "Pastry", "Common Resources", "76daffe0-725f-4dac-b1b5-de331dfca67a", "1.2.10") then
    return
end

Pastry:dofile(_scriptFolder .. "/monument.lua")
Pastry:dofile(_scriptFolder .. "/dairy.lua")
Pastry:dofile(_scriptFolder .. "/baker.lua")