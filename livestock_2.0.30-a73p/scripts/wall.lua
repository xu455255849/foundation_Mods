local mod = ...

-- Rail fence
mod:registerAssetId("models/Livestock2.fbx/Prefab/Fence.Part.001", "PREFAB_LIVESTOCKFARM_RAILFENCE")
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
	Id = "WALL_LIVESTOCKFARM_RAILFENCE",	
	WallConfigName = "WALL_LIVESTOCKFARM_RAILFENCE_NAME",
	IsManuallyUnlocked = false,
	Material = "MATERIAL_FENCE",
	MaterialTop = "MATERIAL_FENCE",
	Crenation = "PREFAB_LIVESTOCKFARM_RAILFENCE",
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
