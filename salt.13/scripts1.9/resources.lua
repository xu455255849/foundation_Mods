local SaltProduction = ...

-- Register model for stocking asset
SaltProduction:registerAssetId("models/sacs.fbx/Prefab/sacs", SaltPrefix .. "_SACS")
SaltProduction:registerAssetId("models/barrel.fbx/Prefab/barrel", SaltPrefix .. "_BARREL")

SaltProduction:registerPrefabComponent("models/sacs.fbx/Prefab/sacs", {
	DataType = "COMP_GROUNDED"
})
SaltProduction:registerPrefabComponent("models/barrel.fbx/Prefab/barrel", {
	DataType = "COMP_GROUNDED"
})


-- Register image assets
SaltProduction:overrideAsset({
	DataType = "RESOURCE",
	Id = "BV1_SALT",
      ResourceLayoutType = "OPEN_BAGS",
      Prefab = SaltPrefix .. "_SACS",
})
SaltProduction:overrideAsset({
	DataType = "RESOURCE",
	Id = "BV1_BRINE",
      ResourceLayoutType = "OPEN_BAGS",
      Prefab = SaltPrefix .. "_BARREL",
})

-- Register image assets
SaltProduction:registerAssetId("icons/salting.png", SmokeHousePrefix .. "_ICON_SALTING", "ATLAS_CELL")

-- Register saltings (food)
SaltProduction:registerAsset({
	DataType = "RESOURCE",
	Id = SmokeHousePrefix .. "_SALTING",
	ResourceName = SmokeHousePrefix .. "_SALTING_NAME",
	Icon = SmokeHousePrefix .. "_ICON_SALTING",
	ResourceTypeList = { "FOOD" },
	IsTradable = true,
      ResourceLayoutType = "CRATES",
      DisplayInToolbar=true, 
	VillagerBuyingPrice = { Resource = "GOLD", Quantity = 15 }
})
