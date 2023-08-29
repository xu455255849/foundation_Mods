local coveredBridge = ...

coveredBridge:registerAsset({
		DataType = "BUILDING_FUNCTION_MARKET",
                Id = CoveredBridgePrefix .. "_KNIFE_FUNCTION",
                Name = CoveredBridgePrefix .. "_KNIFE_FUNCTION_NAME",
                TypeList = { "GOODS" },
                IsOverrideCapacity = true,
                CapacityPerSlot = 50,
		    WorkerCapacity = 1,
                RelatedJob = { Job = MarketAdditionPrefix .. "_KNIFEGRINDER", Behavior = "BEHAVIOR_WORK" },
                HasResourceDepot = false,
                InputInventoryCapacity = {
			{ Resource = "TOOL", Quantity = 50 }
                },
                ResourceListNeeded = {
                	{ Resource = "TOOL", Quantity = 1 }
                },
                ResourceProduced = {
			{ Resource = MarketAdditionPrefix .. "_KNIFE", Quantity = 1 }
                }
})

appendSubBuildingList("", CoveredBridgePrefix .. "_KNIFE_FUNCTION")
appendSubBuildingList("_LARGE", CoveredBridgePrefix .. "_KNIFE_FUNCTION")

--[[
coveredBridge:overrideAsset({
    Id = CoveredBridgePrefix .. "_FUNCTION_LIST",
    AssetFunctionList = {
                Action = "APPEND",
		CoveredBridgePrefix .. "_KNIFE_FUNCTION"
    }
})
function registerKnifeGrinderFunction(_assetId)
    coveredBridge:overrideAsset({
        Id = CoveredBridgePrefix .. "_" .. _assetId .. "_FUNCTION_LIST",
        AssetFunctionList = {
                Action = "APPEND",
		CoveredBridgePrefix .. "_KNIFE_FUNCTION"
        }
    })
end
registerKnifeGrinderFunction("HOUSE")
registerKnifeGrinderFunction("RED")
registerKnifeGrinderFunction("GREEN_A")
registerKnifeGrinderFunction("BLUE")
registerKnifeGrinderFunction("GREEN_B")
registerKnifeGrinderFunction("RED_WINE")
registerKnifeGrinderFunction("CARBON")
registerKnifeGrinderFunction("HOUSE_TOWER1")
registerKnifeGrinderFunction("HOUSE_MIDDLE1")
registerKnifeGrinderFunction("HOUSE_MIDDLE2")
registerKnifeGrinderFunction("HOUSE_TOWER2")
registerKnifeGrinderFunction("HOUSE_MIDDLE3")
coveredBridge:log("addKnifeGrinder end")
--]]
