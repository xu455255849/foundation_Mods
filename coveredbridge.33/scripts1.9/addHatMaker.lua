local coveredBridge = ...
--coveredBridge:log("addHatMaker begin")
coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_MARKET",
                Id = CoveredBridgePrefix .. "_HAT_FUNCTION",
                Name = CoveredBridgePrefix .. "_HAT_FUNCTION_NAME",
                TypeList = { "GOODS" },
                IsOverrideCapacity = true,
                CapacityPerSlot = 50,
		    WorkerCapacity = 1,
                RelatedJob = { Job = MarketAdditionPrefix .. "_HATMAKER", Behavior = "BEHAVIOR_WORK" },
                HasResourceDepot = false,
                InputInventoryCapacity = {
			{ Resource = "WOOLEN_CLOTH", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "WOOLEN_CLOTH", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = MarketAdditionPrefix .. "_HAT", Quantity = 1 }
                }
})

appendSubBuildingList("", CoveredBridgePrefix .. "_HAT_FUNCTION")
appendSubBuildingList("_LARGE", CoveredBridgePrefix .. "_HAT_FUNCTION")

--[[
coveredBridge:overrideAsset({
        Id = CoveredBridgePrefix .. "_FUNCTION_LIST",
        AssetFunctionList = {
                Action = "APPEND",
		CoveredBridgePrefix .. "_HAT_FUNCTION"
        }
})
function registerHatFunction(_assetId)
    coveredBridge:overrideAsset({
        Id = CoveredBridgePrefix .. "_" .. _assetId .. "_FUNCTION_LIST",
        AssetFunctionList = {
                Action = "APPEND",
		CoveredBridgePrefix .. "_HAT_FUNCTION"
        }
    })
end
registerHatFunction("HOUSE")
registerHatFunction("RED")
registerHatFunction("GREEN_A")
registerHatFunction("BLUE")
registerHatFunction("GREEN_B")
registerHatFunction("RED_WINE")
registerHatFunction("CARBON")
registerHatFunction("HOUSE_TOWER1")
registerHatFunction("HOUSE_MIDDLE1")
registerHatFunction("HOUSE_MIDDLE2")
registerHatFunction("HOUSE_TOWER2")
registerHatFunction("HOUSE_MIDDLE3")
--coveredBridge:log("addHatMaker end")
--]]
