local mod = ...

-- Woven farm fence
mod:registerAssetId("models/VegetableFarm2.fbx/Prefab/Fence.Part.001", "PREFAB_POULTRYFARM_WOVENFENCE")
mod:registerAssetId("models/Blank.png", "TEXTURE_FENCE")

-- Register new material for the wall texture
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_FENCE",
	HasAlphaTest = true,
	AlbedoTexture = "TEXTURE_FENCE"
})

mod:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_POULTRYFARM_WOVENFENCE",
	WallConfigName = "WALL_POULTRYFARM_WOVENFENCE_NAME",
	IsManuallyUnlocked = true,
	Material = "MATERIAL_FENCE",
	MaterialTop = "MATERIAL_FENCE",
	Crenation = "PREFAB_POULTRYFARM_WOVENFENCE",
	CrenationDistance = 3.0,
	StepLength = 3.0,
	Width = 0.2,
	Height = 0.7,
	UvTillingWall = 0.2,
	UvTillingTop = 0.2,
	WallOffsetY = 0,
	CrenationOffsetY = 0,
	CrenationOffsetZ = 0
})
