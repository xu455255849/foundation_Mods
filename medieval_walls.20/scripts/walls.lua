local MedievalWall = ...

--------------------------------
--| Draggable Walls Function |--
--------------------------------
local function WallConfig(value)
	local partLower = value[1]
	local partUpper = string.upper(partLower)
	MedievalWall:registerAssetId("models/stonewall.fbx/Prefab/" .. partLower .. "_Part", "PREFAB_" .. partUpper .. "_PART")
	MedievalWall:registerAsset({
		DataType = "WALL_CONFIG",
		Id = partUpper,
		WallConfigName = partUpper .. "_NAME",
		IsManuallyUnlocked = false,
		Material = "BLANK_CORE_MATERIAL",
		MaterialTop = "BLANK_CORE_MATERIAL",
		Crenation = "PREFAB_" .. partUpper .. "_PART",
		CrenationDistance = 4.9,
		CrenationOffsetZ = 0.25,
		StepLength = 10,
		Width = 0.5,
		Height = 2
	})
end

-----------------------------
--| Draggable Walls Table |--
-----------------------------
local crenationTable = {
	{ "Wall_Iron_Dark" },
	{ "Wall_Iron_Light" },
	{ "Wall_Iron_Fleur_Dark" },
	{ "Wall_Iron_Fleur_Light" },
	{ "Wall_Stone_Dark" },
	{ "Wall_Stone_Light" },
}
for k, v in pairs(crenationTable) do
	WallConfig(v)
end