local MedievalWall = ...

-------------------------
--| Material Function |--
-------------------------
local function Material(value)
	local materialName = value[1]
	local fileName = 	 value[2]
	local hasAlpha = 	 value[3]
	local hasBackface =  value[4]
	local materialId =	 string.upper(materialName) .. "_MATERIAL"
	MedievalWall:registerAssetId("models/" .. fileName .. ".fbx/Materials/" .. materialName, materialId)
	MedievalWall:overrideAsset({
		Id = materialId,
		HasAlphaTest = hasAlpha,
		BackFaceVisible = hasBackface
	})
end

----------------------
--| Material Table |--
--------------------------------------------------------------------
--|	materialName[1] - fileName[2] - hasAlpha[3] - hasBackface[4] |--
--------------------------------------------------------------------
local materialTable = {
	{ "blank_core", 		   "core",  	true,  false },
	{ "blank_pathway", 		   "stonewall", true,  false },
	{ "metal_iron_light", 	   "stonewall", false, false },
	{ "metal_iron_dark", 	   "stonewall", false, false },
	{ "roof_black", 		   "stonewall", false, false },
	{ "roof_brown", 		   "stonewall", false, false },
	{ "brick_light", 		   "stonewall", false, false },
	{ "brick_dark", 		   "stonewall", false, false },
	{ "brick_tan_light", 	   "stonewall", false, false },
	{ "brick_tan_dark", 	   "stonewall", false, false },
	{ "stone_light", 		   "stonewall", false, false },
	{ "stone_dark", 		   "stonewall", false, false },
	{ "stone_tan_light", 	   "stonewall", false, false },
	{ "stone_tan_dark", 	   "stonewall", false, false },
	{ "cobblestone_light", 	   "stonewall", false, false },
	{ "cobblestone_dark", 	   "stonewall", false, false },
	{ "cobblestone_tan_light", "stonewall", false, false },
	{ "cobblestone_tan_dark",  "stonewall", false, false }
}
for k, v in pairs(materialTable) do
	Material(v)
end