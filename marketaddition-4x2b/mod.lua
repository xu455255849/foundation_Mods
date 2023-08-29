local  MarketAddition = foundation.createMod();

MarketAdditionPrefix = "MARKET_ADDITION_V2"

if (foundation.getGameVersion == nil) or (version.cmp(foundation.getGameVersion(), "1.9") < 0) then
    MarketAddition:msgBox("MarketAdditionV2: game version anterior to 1.9")
    return
end
_scriptFolder = "scripts1.9.3"
if version.cmp(foundation.getGameVersion(), "1.9.3") < 0 then
    _scriptFolder = "scripts1.9.2"
end
_marketCategory = "MARKET_STALL"

MarketAddition:msgBox("MarketAdditionV2: game version" .. foundation.getGameVersion())

-- common functions
-- As the global functions are not transmit yet from dependencies, this file has to be duplicated in each mod
MarketAddition:dofile(_scriptFolder .. "/common.lua")

_NoSandbox = difficultyLevel(MarketAddition, "MarketAddition")

-- workplace
MarketAddition:dofile(_scriptFolder .. "/buildings.lua")

