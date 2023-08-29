local NatureDeco = ...

----------------------------------
--| Draggable Streams Function |--
----------------------------------
local function StreamConfig(value)
	local colorLower = value[1]
	local colorUpper = string.upper(colorLower)
	NatureDeco:registerAsset({
		DataType = "WALL_CONFIG",
		Id = "STREAM_" .. colorUpper,
		WallConfigName = "STREAM_" .. colorUpper .. "_NAME",
		IsManuallyUnlocked = false,
		Material = "WATER_" .. colorUpper .. "_MATERIAL",
		MaterialTop = "WATER_" .. colorUpper .. "_MATERIAL",
		StepLength = 0.5,
		Width = 3.5,
		Height = 0.3,
		UvTilingWall = 0.1,
		UvTilingTop = 0.3
	})
end

-------------------------------
--| Draggable Streams Table |--
-------------------------------
local streamTable = {
	{ "blue" },
	{ "brown" },
	{ "green" },
	{ "grey" },
	{ "teal" }
}
for k, v in pairs(streamTable) do
	StreamConfig(v)
end

-------------------------------------
--| Draggable Bush Walls Function |--
-------------------------------------
local function BushConfig(value)
	local partLower = value[1]
	local partUpper = string.upper(partLower)
	NatureDeco:registerAsset({
		DataType = "WALL_CONFIG",
		Id = "WALL_" .. partUpper,
		WallConfigName = "WALL_" .. partUpper .. "_NAME",
		IsManuallyUnlocked = false,
		Material = "BLANK_CORE_MATERIAL",
		MaterialTop = "BLANK_CORE_MATERIAL",
		Crenation = "PREFAB_" .. partUpper .. "_PART",
		CrenationDistance = 3.5,
		CrenationOffsetZ = 0,
		StepLength = 4,
		Width = 0.2,
		Height = 2
	})
end

----------------------------------
--| Draggable Bush Walls Table |--
----------------------------------
local bushTable = {
	{ "Bush1_Long" },
	{ "Bush2_Long" },
	{ "Bush3_Long" },
	{ "Bush4_Long" },
	{ "Bush5_Long" }
}
for k, v in pairs(bushTable) do
	BushConfig(v)
end

-----------------------
--| Draggable Walls |--
-----------------------
NatureDeco:registerAssetId("models/nature.fbx/Prefab/Barrier_Wood_Part", "PREFAB_BARRIER_WOOD_PART")
NatureDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "BARRIER_WOOD",
	WallConfigName = "BARRIER_WOOD_NAME",
	IsManuallyUnlocked = false,
	Material = "BLANK_CORE_MATERIAL",
	MaterialTop = "BLANK_CORE_MATERIAL",
	Crenation = "PREFAB_BARRIER_WOOD_PART",
	CrenationDistance = 1.75,
	CrenationOffsetZ = 0,
	StepLength = 2.5,
	Width = 0.2,
	Height = 2
})
NatureDeco:registerAssetId("models/nature.fbx/Prefab/Barrier_Stone_Part", "PREFAB_BARRIER_STONE_PART")
NatureDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "BARRIER_STONE",
	WallConfigName = "BARRIER_STONE_NAME",
	IsManuallyUnlocked = false,
	Material = "BLANK_CORE_MATERIAL",
	MaterialTop = "BLANK_CORE_MATERIAL",
	Crenation = "PREFAB_BARRIER_STONE_PART",
	CrenationDistance = 1.9,
	CrenationOffsetZ = 0,
	StepLength = 2,
	Width = 0.2,
	Height = 2
})
NatureDeco:registerAssetId("models/nature.fbx/Prefab/Fence_Vines_Part", "PREFAB_FENCE_VINES_PART")
NatureDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "FENCE_VINES",
	WallConfigName = "FENCE_VINES_NAME",
	IsManuallyUnlocked = false,
	Material = "BLANK_CORE_MATERIAL",
	MaterialTop = "BLANK_CORE_MATERIAL",
	Crenation = "PREFAB_FENCE_VINES_PART",
	CrenationDistance = 3.7,
	CrenationOffsetZ = 0,
	StepLength = 5,
	Width = 0.2,
	Height = 2
})
NatureDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_HEDGE_SHORT",
	WallConfigName = "WALL_HEDGE_SHORT_NAME",
	IsManuallyUnlocked = false,
	Material = "HEDGE_MATERIAL",
	MaterialTop = "HEDGE_MATERIAL",
	StepLength = 2,
	Width = 1,
	Height = 1.5,
	UvTilingWall = 0.9,
	UvTilingTop = 0.9
})
NatureDeco:registerAsset({
	DataType = "WALL_CONFIG",
	Id = "WALL_HEDGE_TALL",
	WallConfigName = "WALL_HEDGE_TALL_NAME",
	IsManuallyUnlocked = false,
	Material = "HEDGE_MATERIAL",
	MaterialTop = "HEDGE_MATERIAL",
	StepLength = 2,
	Width = 1,
	Height = 3,
	UvTilingWall = 0.9,
	UvTilingTop = 0.9
})