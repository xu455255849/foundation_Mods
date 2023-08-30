local saltTrader = ...

-- Register an addition neighbour to trade with. 
saltTrader:registerAsset({
	DataType = "TRADING_VILLAGE",
	Id = SaltPrefix .. "_VILLAGE_NANTES",
        Heraldry = "ICON_" .. CommonResourceSalt,
        Description = SaltPrefix .. "_VILLAGE_NANTES_DESC",
	VillageName = "Nantes",
	--RESOURCE QUANTITY PAIR
	UnlockCost = { 
		{ Resource = "GOLD", Quantity = 300 }
	},
	ResourceTradingReplenishDelay = 300.0,
	
	--BUYING RESOURCE TRADING INFO
	BuyingResourceList = { 
		{
			ResourceMaxAmount = { Resource = "HONEY", Quantity = 30 },
                        ReplenishingAmount = 10,
		},
		{
			ResourceMaxAmount = { Resource = "HERBS", Quantity = 30 },
                        ReplenishingAmount = 10,
		}
	},
	
	--SELLING RESOURCE TRADING INFO
	SellingResourceList = {
		{
			ResourceMaxAmount = { Resource = CommonResourceSalt, Quantity = 50 },
                        ReplenishingAmount = 20,
		}
	},	
	Allegeance = "CLERGY",
      ResourceNeededToUpgrade = "BERRIES",
      TradeRouteUpgradeNarrativePanelTemplate = "NARRATIVE_PANEL_TEMPLATE_TRADE_ROUTE_UPGRADE",
      WorldGuiIcon = "ICON_" .. CommonResourceSalt,
      UpgradeEventEnvoyProfile = "PROFILE_ENVOY_ROYAL",
})

saltTrader:registerAsset({
	DataType = "TRADING_VILLAGE",
	Id = SaltPrefix .. "_VILLAGE_CHARTRES",
        Heraldry = "ICON_" .. CommonResourceSalt,
        Description = SaltPrefix .. "_VILLAGE_CHARTRES_DESC",
	VillageName = "Chartres",
	--RESOURCE QUANTITY PAIR
	UnlockCost = { 
		{ Resource = CommonResourceSalt, Quantity = 20 }
	},
	ResourceTradingReplenishDelay = 300.0,
	
	--SELLING RESOURCE TRADING INFO
	SellingResourceList = { 
		{
			ResourceMaxAmount = { Resource = "HONEY", Quantity = 30 },
                        ReplenishingAmount = 10,
		},
		{
			ResourceMaxAmount = { Resource = "HERBS", Quantity = 30 },
                        ReplenishingAmount = 10,
		}
	},
	
	--BUYING RESOURCE TRADING INFO
	BuyingResourceList = {
		{
			ResourceMaxAmount = { Resource = CommonResourceSalt, Quantity = 50 },
                        ReplenishingAmount = 20,
		}
	},
	Allegeance = "CLERGY",
      ResourceNeededToUpgrade = "BERRIES",
      TradeRouteUpgradeNarrativePanelTemplate = "NARRATIVE_PANEL_TEMPLATE_TRADE_ROUTE_UPGRADE",
      WorldGuiIcon = "ICON_" .. CommonResourceSalt,
      UpgradeEventEnvoyProfile = "PROFILE_ENVOY_ROYAL",
})

-- Override default village list
saltTrader:overrideAsset({
	Id = "VILLAGE_LIST_DEFAULT",
	TradingVillageList = {
		Action = "APPEND",
		SaltPrefix .. "_VILLAGE_NANTES",
		SaltPrefix .. "_VILLAGE_CHARTRES"
	}
})