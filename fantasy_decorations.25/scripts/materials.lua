local FantasyDeco = ...

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
	FantasyDeco:registerAssetId("models/" .. fileName .. ".fbx/Materials/" .. materialName, materialId)
	FantasyDeco:overrideAsset({
		Id = materialId,
		RenderMode = renderMode,
		HasAlphaTest = hasAlpha,
		BackFaceVisible = hasBackface,
		HasShadow = hasShadow
	})
end

----------------------
--| Material Table |--
---------------------------------------------------------------------------------------------------
--|	materialName[1] - fileName[2] - renderMode[3] - hasAlpha[4] - hasBackface[5] - hasShadow[6] |--
---------------------------------------------------------------------------------------------------
local materialTable = {
	{ "blank_box",				"lanterns", 		"DEFAULT",  true,  false, false },
	{ "blank_box_animal",		"animals", 			"DEFAULT",  true,  false, false },
	{ "blank_core", 			"core", 			"DEFAULT",  true,  false, false },
	{ "blank_door_trigger", 	"doors", 			"DEFAULT",  true,  false, false },
	{ "blank_fence_trigger", 	"fences", 			"DEFAULT",  true,  false, false },
	{ "blank_grass",			"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "cloth_black_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_blue_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_brown_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_green_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_grey_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_purple_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_red_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_white_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_yellow_cart", 		"cart", 			"DEFAULT",  false, false, true },
	{ "cloth_black_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_blue_spools", 		"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_brown_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_green_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_grey_spools", 		"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_purple_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_red_spools", 		"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_white_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_yellow_spools", 	"cloth", 			"DEFAULT",  false, false, true },
	{ "cloth_black_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_blue_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_brown_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_green_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_grey_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_purple_logs",		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_red_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_white_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_yellow_logs", 		"logs", 			"DEFAULT",  false, false, true },
	{ "cloth_black_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_blue_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_brown_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_green_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_grey_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_purple_siege",		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_red_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_white_siege", 		"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_yellow_siege", 	"siege", 			"DEFAULT",  false, false, true },
	{ "cloth_black_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_blue_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_brown_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_green_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_grey_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_purple_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_red_weapons", 		"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_white_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_yellow_weapons", 	"weapons", 			"DEFAULT",  false, false, true },
	{ "cloth_black_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_blue_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_brown_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_green_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_grey_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_purple_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_red_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_white_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "cloth_yellow_well", 		"water_source", 	"DEFAULT",  false, false, true },
	{ "icon_gc_circle_small", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_circle_medium", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_circle_large", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_circle_xlarge", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_square_small", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_square_medium", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_square_large", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "icon_gc_square_xlarge", 	"grass_clearing", 	"DEFAULT",  true,  false, false },
	{ "bush", 					"bushes", 			"DEFAULT",  true,  true,  true },
	{ "bush2", 					"bushes", 			"DEFAULT",  true,  true,  true },
	{ "butterfly", 				"flowers", 			"DEFAULT",  true,  true,  true },
	{ "foliage", 				"flowers", 			"DEFAULT",  true,  true,  true },
	{ "palette", 				"flowers", 			"DEFAULT",  false, true,  true },
	{ "scroll", 				"weapons", 			"DEFAULT",  true,  true,  true },
	{ "thatch", 				"haybales",	 		"DEFAULT",  true,  true,  true },
	{ "thatch_roof", 			"cart", 			"DEFAULT",  true,  true,  true },
	{ "water_barrel", 			"barrels", 			"UNLIT", 	true,  false, false },
	{ "water_source", 			"water_source", 	"UNLIT", 	true,  false, false },
	{ "water_cookpot", 			"campfire",			"UNLIT",	true,  false, false },
	{ "water_containers", 		"containers", 		"UNLIT",	true,  false, false },
	{ "vines_well", 			"water_source", 	"DEFAULT",  true,  true,  true }
}
for k, v in pairs(materialTable) do
	Material(v)
end