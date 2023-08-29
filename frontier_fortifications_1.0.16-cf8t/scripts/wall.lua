local mod = ...

-- Palisade
mod:registerAssetId("models/FrontierPalisade1.fbx/Prefab/PalisadePart", "PREFAB_FRONTIER_PALISADE1")
mod:registerAssetId("models/Textures/Blank.png", "TEXTURE_FENCE")



-- Register new material for the wall texture
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_FENCE",
	HasAlphaTest = true,
	AlbedoTexture = "TEXTURE_FENCE",
})



mod:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_FRONTIER_PALISADE",
	WallConfigName = "WALL_FRONTIER_PALISADE_NAME",
	IsManuallyUnlocked = true,
	Material = "MATERIAL_FENCE",
	MaterialTop = "MATERIAL_FENCE",
	Crenation = "PREFAB_FRONTIER_PALISADE1",
	CrenationDistance = 3.6,
	StepLength = 3.6,
	Width = 0.3,
	Height = 4.2,
	UvTillingWall = 0.2,
	UvTillingTop = 0.2,
	WallOffsetY = 0,
	CrenationOffsetY = 0,
	CrenationOffsetZ = 0,
})
