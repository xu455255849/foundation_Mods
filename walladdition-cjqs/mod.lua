local WallAddition = foundation.createMod();

if (foundation.getGameVersion == nil or version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    Pastry:logError("WallAddition: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9"
WallAddition:msgBox("WallAddition: game version" .. foundation.getGameVersion())

WallAdditionPrefix = "SGWALL"

WallAddition:dofile(_scriptFolder .. "/customTheme.lua")

WallAddition:dofile(_scriptFolder .. "/walls/wall.lua")
