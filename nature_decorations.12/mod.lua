local NatureDeco = foundation.createMod();

-------------------------------------------------------------- | -----------------------------------------------------------------
--	 _   _       _                  _____                 	-- | --   _____       _     _       __  __        __  __ _          --
--	| \ | |     | |                |  __ \                  -- | --  |  __ \     (_)   (_)     |  \/  |      / _|/ _(_)         --
--	|  \| | __ _| |_ _   _ _ __ ___| |  | | ___  ___ ___    -- | --  | |__) |__ _ _ ___ _ _ __ | \  / |_   _| |_| |_ _ _ __     --
--	| \ \ |/ _/ | __| | | |  __/ _ \ |  | |/ _ \/ __/ _ \   -- | --  |  _  // _/ | / __| | \_ \| |\/| | | | |  _|  _| | \_ \    --
--	| |\  | (_| | |_| |_| | | |  __/ |__| |  __/ (_| (_) |  -- | --  | | \ \ (_| | \__ \ | | | | |  | | |_| | | | | | | | | |   --
--	|_| \_|\__,_|\__|\__,_|_|  \___|_____/ \___|\___\___/   -- | --  |_|  \_\__,_|_|___/_|_| |_|_|  |_|\__,_|_| |_| |_|_| |_|   --
-------------------------------------------------------------- | -----------------------------------------------------------------

-----------------------
--| DoFile Function |--
-----------------------
local function DoFile(fileName)
	NatureDeco:dofile("scripts/" .. fileName .. ".lua")
end
DoFile("buildings")
DoFile("components")
DoFile("materials")
DoFile("walls")

------------------------
--| Asset Processors |--
------------------------
NatureDeco:registerAssetProcessor("models/core.fbx",   { DataType = "BUILDING_ASSET_PROCESSOR" })
NatureDeco:registerAssetProcessor("models/nature.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })