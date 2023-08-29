local WaterMill = foundation.createMod();

WaterMillPrefix = "WATER_MILL"

WaterMill:log("Hello World: Water Mill Set")
--WaterMill:logWarning("This is a warning!")
--WaterMill:logError("This is an error!")
--WaterMill:msgBox("Water Mill Set: Hello there")

if (foundation.getGameVersion == nil) or (version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    WaterMill:logError("WaterMill: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9"
WaterMill:msgBox("WaterMill: game version" .. foundation.getGameVersion())

-- common functions
-- As the global functions are not transmit yet from dependencies, this file has to be duplicated in each mod
WaterMill:dofile(_scriptFolder .. "/common.lua")

_NoSandbox = difficultyLevel(WaterMill, "WaterMill")

-- check all the dependencies
if not checkVersion(WaterMill, "WaterMill", "Common Resources", "76daffe0-725f-4dac-b1b5-de331dfca67a", "1.2.24") then
    return
end

WaterMill:dofile(_scriptFolder .. "/monument.lua")

