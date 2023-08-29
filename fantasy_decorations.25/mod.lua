local FantasyDeco = foundation.createMod()

------------------------------------------------------------------- |
--	 ______          _                  _____					 -- |
--	|  ____|        | |                |  __ \				 	 -- | -----------------------------------------------------------------
--	| |__ __ _ _ __ | |_ __ _ ___ _   _| |  | | ___  ___ ___  	 -- | --   _____       _     _       __  __        __  __ _          --
--	|  __/ _/ | \_ \| __/ _/ / __| | | | |  | |/ _ \/ __/ _ \ 	 -- | --  |  __ \     (_)   (_)     |  \/  |      / _|/ _(_)         --
--	| | | (_| | | | | || (_| \__ \ |_| | |__| |  __/ (_| (_) | 	 -- | --  | |__) |__ _ _ ___ _ _ __ | \  / |_   _| |_| |_ _ _ __     --
--	|_|  \__,_|_| |_|\__\__,_|___/\___ |_____/ \___|\___\___/  	 -- | --  |  _  // _/ | / __| | \_ \| |\/| | | | |  _|  _| | \_ \    --
--								   __/ |						 -- | --  | | \ \ (_| | \__ \ | | | | |  | | |_| | | | | | | | | |   --
--								  |___/							 -- | --  |_|  \_\__,_|_|___/_|_| |_|_|  |_|\__,_|_| |_| |_|_| |_|   --
------------------------------------------------------------------- | -----------------------------------------------------------------

-----------------------
--| DoFile Function |--
-----------------------
local function DoFile(fileName)
	FantasyDeco:dofile("scripts/" .. fileName .. ".lua")
end
DoFile("buildings")
DoFile("components")
DoFile("materials")
DoFile("particles")
DoFile("paths")
DoFile("walls")

---------------------------
--| Enum Value Function |--
---------------------------
local function EnumValue(value)
	local type = value[1]
	local name = value[2]
	FantasyDeco:registerEnumValue (type .. "_TYPE", name)
end

------------------------
--| Enum Value Table |--
------------------------
local enumTable = {
	{ "BUILDING_PART", "ANIMALS" },
	{ "BUILDING_PART", "BARRELS" },
	{ "BUILDING_PART", "BRAZIERS" },
	{ "BUILDING_PART", "BUSHES" },
	{ "BUILDING_PART", "CLOTH" },
	{ "BUILDING_PART", "CONTAINERS" },
	{ "BUILDING_PART", "CRATES" },
	{ "BUILDING_PART", "DECO" },
	{ "BUILDING_PART", "DOORS" },
	{ "BUILDING_PART", "FENCES" },
	{ "BUILDING_PART", "FLOWERS" },
	{ "BUILDING_PART", "FURNITURE" },
	{ "BUILDING_PART", "GATES" },
	{ "BUILDING_PART", "GRAINS" },
	{ "BUILDING_PART", "GRASSCLEAR" },
	{ "BUILDING_PART", "GRAVESTONES" },
	{ "BUILDING_PART", "HAYBALES" },
	{ "BUILDING_PART", "HEDGES" },
	{ "BUILDING_PART", "LANTERNS" },
	{ "BUILDING_PART", "LAMPPOST" },
	{ "BUILDING_PART", "LAUNDRY" },
	{ "BUILDING_PART", "LOGGING" },
	{ "BUILDING_PART", "PLANKS" },
	{ "BUILDING_PART", "PLANTERS" },
	{ "BUILDING_PART", "PLANTS" },
	{ "BUILDING_PART", "POTTERY" },
	{ "BUILDING_PART", "PUMPKINS" },
	{ "BUILDING_PART", "PUNISHMENT" },
	{ "BUILDING_PART", "SAPLINGS" },
	{ "BUILDING_PART", "SHIPMENTS" },
	{ "BUILDING_PART", "SIEGE" },
	{ "BUILDING_PART", "STONES" },
	{ "BUILDING_PART", "TOOLS" },
	{ "BUILDING_PART", "TREES" },
	{ "BUILDING_PART", "VEHICLES" },
	{ "BUILDING_PART", "WATER" },
	{ "BUILDING_PART", "WATERSOURCE" },
	{ "BUILDING_PART", "WEAPONS" },
	{ "BUILDING_PART", "WINDOWS" },
	{ "ATTACH_NODE", "GCL" },
	{ "ATTACH_NODE", "SIEGE" },
	{ "ATTACH_NODE", "TREE" }
}
for k, v in pairs(enumTable) do
	EnumValue(v)
end

--------------------------------
--| Asset Processor Function |--
--------------------------------
local function AssetProcessor(value)
	local fileName = value[1]
	FantasyDeco:registerAssetProcessor("models/" .. fileName .. ".fbx", {
		DataType = "BUILDING_ASSET_PROCESSOR"
	})
end

-----------------------------
--| Asset Processor Table |--
-----------------------------
local processorTable = {
	{ "core" },
	{ "animals" },
	{ "barrels" },
	{ "braziers" },
	{ "bushes" },
	{ "campfire" },
	{ "cart" },
	{ "cauldron" },
	{ "chest" },
	{ "cloth" },
	{ "containers" },
	{ "coffin" },
	{ "crates" },
	{ "doors" },
	{ "fences" },
	{ "fishing" },
	{ "flowers" },
	{ "furniture" },
	{ "grass_clearing" },
	{ "gravestones" },
	{ "haybales" },
	{ "lanterns" },
	{ "laundry" },
	{ "logs" },
	{ "planks" },
	{ "pumpkins" },
	{ "punishment" },
	{ "sacks" },
	{ "scaling" },
	{ "siege" },
	{ "skulls" },
	{ "statues" },
	{ "tools" },
	{ "water_source" },
	{ "weapons" },
	{ "windows" }
}
for k, v in pairs(processorTable) do
	AssetProcessor(v)
end