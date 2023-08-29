local _CommonFunctions = ...

-- register specific housing function
function registerFunctionHouse(_assetPrefix, _assetId, _lvl)
        function houseStatusList()
            function houseStatus(_desirabilityLevel)
                return {
	            DataType = "HOUSE_STATUS",
	            RequiredDesirability = _desirabilityLevel,
	            ResourceGenerated = "HOUSING_LEVEL_" .. _lvl,
	            HouseDensityPartList = { _assetPrefix .. "_" .. _assetId .. "_PART" }
                }
            end
            if _lvl == "1" then
                return {
	            houseStatus(DESIRABILITY_LEVEL.LOW),
	            houseStatus(DESIRABILITY_LEVEL.HIGH)
	        }
            end
            if _lvl == "2" then
	        return {
	            houseStatus(DESIRABILITY_LEVEL.AVERAGE),
	            houseStatus(DESIRABILITY_LEVEL.VERY_HIGH)
	        }
            end
            return nil
        end

        _CommonFunctions:registerAsset({
	    DataType= "HOUSE_SETUP",
	    Id = _assetPrefix .. "_" .. _assetId .. "_HOUSING_LVL" .. _lvl .. "_SETUP",
	    HouseStatusList = houseStatusList()
        })
        _CommonFunctions:registerAsset({
	    DataType = "BUILDING_FUNCTION_HOUSE",
	    Id = _assetPrefix .. "_" .. _assetId .. "_HOUSING_LVL" .. _lvl .. "_FUNCTION",
            Name = _assetPrefix .. "_BUILDING_FUNCTION_HOUSING_LVL" .. _lvl .. "_NAME",
	    RelatedZone = "RESIDENTIAL",
	    RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
	    AssetHouseSetup =  _assetPrefix .. "_" .. _assetId .. "_HOUSING_LVL" .. _lvl .. "_SETUP",
        })
        return _assetPrefix .. "_" .. _assetId .. "_HOUSING_LVL" .. _lvl .. "_FUNCTION"
end

function checkVersion(_mod, _modName, _name, _id, _minimalVersion)
    if (foundation.getModVersion == nil) then
        _mod:logError(_modName .. " Unknown mod version")
        return false
    end
    if not foundation.isModEnabled(_id) then
        _mod:logError(_modName .. " " .. _name .. " disabled")
        return false
    end
    if not foundation.isModLoaded(_id) then
        _mod:logWarning(_modName .. " Up the position of " .. _name .. " in the mod list of your game")
        return false
    end
    local _myVersion = foundation.getModVersion(_id)
    _mod:msgBox(_modName .. " " .. _name .. " Current version : " .. _myVersion)
    if version.cmp(_myVersion, _minimalVersion) < 0 then
        _mod:logWarning(_modName .. " Please, load at least the version " .. _minimalVersion .. " of " .. _name)
        return false
    end
    return true
end

-- Set the sandbox option
function difficultyLevel(_mod, _modName)
    if foundation.isModEnabled("8f186d4a-7b5d-4b8a-b959-43bd254ca95b") then
        _mod:log("Hello World: " .. _modName .. " sandbox mode.")
        return 0
    end
    _mod:log("Hello World: " .. _modName .. " difficulty level low by default")
    return 1
end

--------------------------------------------------------------------------
function computeElevation(_self, _initialPosition, _flagList)
    local _flags = 0
    for i, flag in ipairs(_flagList) do
        _flags = bit.bor(_flags, bit.lshift(1, flag:toNumber()))
    end
    if _flags == 0 then
         _CommonFunctions:logWarning("computeElevation: _flagList empty")
         return _initialPosition[2]
    end 
    local raycastResult = {}

    -- Raycast from the building position + Y = 100
    -- to building position - y = 100
    -- only on objects with a WATER flag
    local FromPosition = { _initialPosition[1], _initialPosition[2]+100, _initialPosition[3] }
    local ToPosition = { _initialPosition[1], _initialPosition[2]-100, _initialPosition[3] }
    
    if not _self:getLevel():rayCast(FromPosition, ToPosition, raycastResult, _flags) then
         _CommonFunctions:logWarning("computeElevation: not any flag found " .. tostring(_flagList))
         return nil
    end
    return raycastResult["Position"][2] 
end


