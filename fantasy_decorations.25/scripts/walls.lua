local FantasyDeco = ...

-----------------------
--| Draggable Walls |--
-----------------------
FantasyDeco:registerAssetId("models/fences.fbx/Prefab/Fence_Wall_Part", "PREFAB_FENCE_WALL_PART")
FantasyDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "FENCE_WALL",
	WallConfigName = "FENCE_WALL_NAME",
	IsManuallyUnlocked = false,
	Material = "BLANK_CORE_MATERIAL",
	MaterialTop = "BLANK_CORE_MATERIAL",
	Crenation = "PREFAB_FENCE_WALL_PART",
	CrenationDistance = 2.32,
	CrenationOffsetZ = 0,
	StepLength = 3,
	Width = 0.2,
	Height = 2
})

FantasyDeco:registerAssetId("models/doors.fbx/Prefab/Wall_Palisade_Part", "PREFAB_WALL_PALISADE_PART")
FantasyDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_PALISADE",
	WallConfigName = "WALL_PALISADE_NAME",
	IsManuallyUnlocked = false,
	Material = "BLANK_CORE_MATERIAL",
	MaterialTop = "BLANK_CORE_MATERIAL",
	Crenation = "PREFAB_WALL_PALISADE_PART",
	CrenationDistance = 2.2,
	CrenationOffsetZ = 0,
	StepLength = 3,
	Width = 0.2,
	Height = 2
})