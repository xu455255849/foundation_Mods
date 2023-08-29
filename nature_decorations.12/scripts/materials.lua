local NatureDeco = ...

-------------------------
--| Material Function |--
-------------------------
local function Material(value)
	local materialName = value[1]
	local fileName = 	 value[2]
	local renderMode =	 value[3]
	local hasAlpha = 	 value[4]
	local hasBackface =  value[5]
	local hasShadow =	 value[6]
	local materialId =	 string.upper(materialName) .. "_MATERIAL"
	NatureDeco:registerAssetId("models/" .. fileName .. ".fbx/Materials/" .. materialName, materialId)
	NatureDeco:overrideAsset({
		Id = materialId,
		RenderMode = renderMode,
		HasAlphaTest = hasAlpha,
		BackFaceVisible = hasBackface,
		HasShadow = hasShadow
	})
end

----------------------
--| Material Table |--
----------------------------------------------------------------------------------------------------
--|	materialName[1] - fileName[2] - renderMode[3] - hasAlpha[4] - hasBackface[5] - hasShadow[6] |--
----------------------------------------------------------------------------------------------------
local materialTable = {
	{ "blank_core",  "core",   "DEFAULT", true,  false, false },
	{ "bush",  		 "nature", "DEFAULT", true,  true,  true },
	{ "bush2",  	 "nature", "DEFAULT", true,  true,  true },
	{ "bush3",  	 "nature", "DEFAULT", true,  true,  true },
	{ "butterfly",   "nature", "DEFAULT", true,  true,  true },
	{ "foliage",  	 "nature", "DEFAULT", true,  true,  true },
	{ "grass",  	 "nature", "DEFAULT", true,  false, true },
	{ "hedge",  	 "nature", "DEFAULT", true,  true,  true },
	{ "oak",  		 "nature", "DEFAULT", true,  true,  true },
	{ "vine",  		 "nature", "DEFAULT", true,  true,  true },
	{ "water_blue",  "nature", "UNLIT",   true,  false, true },
	{ "water_brown", "nature", "UNLIT",   true,  false, true },
	{ "water_green", "nature", "UNLIT",   true,  false, true },
	{ "water_grey",  "nature", "UNLIT",   true,  false, true },
	{ "water_teal",  "nature", "UNLIT",   true,  false, true }
}
for k, v in pairs(materialTable) do
	Material(v)
end