local  SaltProduction = foundation.createMod();

-- Check the game version
if (foundation.getGameVersion == nil or version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    SaltProduction:logError("SaltProduction: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9"
SaltProduction:msgBox("SaltProduction: game version" .. foundation.getGameVersion())

-- Set the mod major versions
CommonResourceCarcass = "BV1_CARCASS"
CommonResourceSalt = "BV1_SALT"
CommonResourceBrine = "BV1_BRINE"
SaltPrefix = "SALT_V5"
SaltMarshesPrefix = "SALT_MARSHES_V5"
RockSaltMinePrefix = "ROCK_SALT_MINE_V5"
SaltWorksPrefix = "SALTWORKS_V5"
SmokeHousePrefix = "SMOKE_HOUSE_V5"

-- common functions
-- As the global functions are not transmit yet from dependencies, this file has to be duplicated in each mod
SaltProduction:dofile(_scriptFolder .. "/common.lua")

_NoSandbox = difficultyLevel(SaltProduction, "SaltProduction")


if not checkVersion(SaltProduction, "SaltProduction","Common Resources", "76daffe0-725f-4dac-b1b5-de331dfca67a", "1.2.9") then
    return
end

-- Apply building asset processor
SaltProduction:registerAssetProcessor("models/saltmarshes.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
SaltProduction:registerAssetProcessor("models/rocksaltmine.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
SaltProduction:registerAssetProcessor("models/saltworks.fbx", {
	DataType = "BUILDING_ASSET_PROCESSOR"
})
SaltProduction:registerAssetProcessor("models/smokehouse.fbx", {
    DataType = "BUILDING_ASSET_PROCESSOR"
})

-- Particle system
SaltProduction:dofile(_scriptFolder .. "/marsh.lua")
-- Jobs
SaltProduction:dofile(_scriptFolder .. "/jobs.lua")
-- Resources
SaltProduction:dofile(_scriptFolder .. "/resources.lua")
-- Trading
SaltProduction:dofile(_scriptFolder .. "/trade.lua")
-- Buildings
SaltProduction:dofile(_scriptFolder .. "/saltmarshes.lua")
SaltProduction:dofile(_scriptFolder .. "/rocksaltmine.lua")
SaltProduction:dofile(_scriptFolder .. "/saltworks.lua")
SaltProduction:dofile(_scriptFolder .. "/smokehouse.lua")
