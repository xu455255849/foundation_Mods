local mod = ...

mod:registerAssetId("models/Security6.fbx/Prefab/Wall.Modular", "PREFAB_SECURITY_WALLMODULAR1")
mod:registerAssetId("models/textures/Blank.png", "TEXTURE_FENCE")


mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_FENCE",
	HasAlphaTest = true,
	AlbedoTexture = "TEXTURE_FENCE"
})

local segment = 6.0
local width = 2.35
local height = 5.8

mod:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_SECURITY",
	WallConfigName = "WALL_SECURITY_NAME",
	IsManuallyUnlocked = false,
	Material = "MATERIAL_FENCE",
	MaterialTop = "MATERIAL_FENCE",
	Crenation = "PREFAB_SECURITY_WALLMODULAR1",
	CrenationDistance = segment,
	StepLength = segment,
	Width = width,
	Height = height,
	UvTillingWall = 0.2,
	UvTillingTop = 0.2,
	WallOffsetY = 0,
	CrenationOffsetY = 0,
	CrenationOffsetZ = 0
})
