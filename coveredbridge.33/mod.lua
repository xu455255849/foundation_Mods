local coveredBridge = foundation.createMod();

-- Check the game version
if (foundation.getGameVersion == nil) or (version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    coveredBridge:logError("coveredBridge: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9"
coveredBridge:msgBox("coveredBridge: game version" .. foundation.getGameVersion())

-- Set the mod major versions
CoveredBridgePrefix = "COVERED_BRIDGE_V3"

-- common functions
-- As the global functions are not transmit yet from dependencies, this file has to be duplicated in each mod
coveredBridge:dofile(_scriptFolder .. "/common.lua")

_NoSandbox = difficultyLevel(coveredBridge, "coveredBridge")
_flagSecurity = checkVersion(coveredBridge, "coveredBridge", "Security", "99ee3b3b-f103-41f0-a725-bc466a2fc6de", "1.0.8")
_flagSecurity2 = checkVersion(coveredBridge, "coveredBridge", "Security 2.0", "ee00bed2-f02c-4dd2-896d-5efef8d8e2d2", "2.0.10")

-- Monuments
coveredBridge:dofile(_scriptFolder .. "/monument.lua")

if (checkVersion(coveredBridge, "coveredBridge", "Market Addition V2", "c6d941ce-a02d-41c5-a57f-9a2d9d1b2a02", "2.2.0")) then
    MarketAdditionPrefix = "MARKET_ADDITION_V2"
    coveredBridge:dofile(_scriptFolder .. "/addHatMaker.lua")
    coveredBridge:dofile(_scriptFolder .. "/addKnifeGrinder.lua")
end

