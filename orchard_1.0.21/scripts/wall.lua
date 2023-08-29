local mod = ...

-- Picket fence
mod:registerAssetId("models/PicketFence.fbx/Prefab/WallPart", "PREFAB_FENCE_PICKET")
mod:registerAssetId("models/Textures/Blank.png", "TEXTURE_FENCE")

-- Register new material for the wall texture
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_FENCE",
	HasAlphaTest = true,
	AlbedoTexture = "TEXTURE_FENCE"
})

mod:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "FENCE_PICKET",
	WallConfigName = "FENCE_PICKET_NAME",
	IsManuallyUnlocked = true,
	Material = "MATERIAL_FENCE",
	MaterialTop = "MATERIAL_FENCE",
	Crenation = "PREFAB_FENCE_PICKET",
	CrenationDistance = 3.0,
	StepLength = 3.0,
	Width = 0.2,
	Height = 0.6,
	UvTillingWall = 0.2,
	UvTillingTop = 0.2,
	WallOffsetY = 0,
	CrenationOffsetY = 0,
	CrenationOffsetZ = 0
})
