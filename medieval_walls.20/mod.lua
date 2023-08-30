local MedievalWall = foundation.createMod()

----------------------------------------------------------------------- | -----------------------------------------------------------------
--	 __  __          _ _                 ___          __   _ _       -- | --   _____       _     _       __  __        __  __ _          --
--	|  \/  |        | (_)               | \ \        / /  | | |      -- | --  |  __ \     (_)   (_)     |  \/  |      / _|/ _(_)         --
--	| \  / | ___  __| |_  _____   ____ _| |\ \  /\  / /_ _| | |___   -- | --  | |__) |__ _ _ ___ _ _ __ | \  / |_   _| |_| |_ _ _ __     --
--	| |\/| |/ _ \/ _| | |/ _ \ \ / / _/ | | \ \/  \/ / _/ | | / __|  -- | --  |  _  // _/ | / __| | \_ \| |\/| | | | |  _|  _| | \_ \    --
--	| |  | |  __/ (_| | |  __/\ V / (_| | |  \  /\  / (_| | | \__ \	 -- | --  | | \ \ (_| | \__ \ | | | | |  | | |_| | | | | | | | | |   --
--	|_|  |_|\___|\__,_|_|\___| \_/ \__,_|_|   \/  \/ \__,_|_|_|___/  -- | --  |_|  \_\__,_|_|___/_|_| |_|_|  |_|\__,_|_| |_| |_|_| |_|   --
----------------------------------------------------------------------- | -----------------------------------------------------------------

-----------------------
--| DoFile Function |--
-----------------------
local function DoFile(fileName)
	MedievalWall:dofile("scripts/" .. fileName .. ".lua")
end
DoFile("buildings")
DoFile("components")
DoFile("materials")
DoFile("particles")
DoFile("walls")

---------------------------
--| Enum Value Function |--
---------------------------
local function EnumValue(value)
	local type = value[1]
	local name = value[2]
	MedievalWall:registerEnumValue (type .. "_TYPE", name)
end

------------------------
--| Enum Value Table |--
------------------------
local enumTable = {
	{ "BUILDING_PART", "WALLS" },
	{ "BUILDING_PART", "PILLARS" },
	{ "BUILDING_PART", "PATHWAYS" },
	{ "BUILDING_PART", "BUILDINGS" },
	{ "BUILDING_PART", "IRONGATE" },
	{ "BUILDING_PART", "PILLARDECO" },
	{ "BUILDING_PART", "WALLDECO" },
	{ "BUILDING_PART", "ORNAMENTS" },
	{ "ATTACH_NODE", "PATHWAY" },
	{ "ATTACH_NODE", "ORNAMENT" }
}
for k, v in pairs(enumTable) do
	EnumValue(v)
end

--------------------------------
--| Asset Processor Function |--
--------------------------------
MedievalWall:registerAssetProcessor("models/core.fbx", 		{ DataType = "BUILDING_ASSET_PROCESSOR" })
MedievalWall:registerAssetProcessor("models/stonewall.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })