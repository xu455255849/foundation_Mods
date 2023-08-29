local NatureDeco = ...
local AssetList = {}

------------------------------
--| Building Part Function |--
------------------------------
local function BuildingPart(value)
	local partLower =	value[1]
	local partUpper =	string.upper(partLower)
    local tableName =  	value[2]
	local hasScaling =	value[3]
	local hasAttach =	value[4]
	local hasZone =		value[5]
	local hasDesire =	value[6]
	local hasFunction =	value[7]
	if tableName then
		table.insert(AssetList, partUpper .. "_PART")
	end
	NatureDeco:registerAssetId("models/nature.fbx/Prefab/" .. partLower .. "_Part", "PREFAB_" .. partUpper .. "_PART")
	NatureDeco:registerAsset({
		DataType = "BUILDING_PART",
		Id = partUpper .. "_PART",
		Name = partUpper .. "_NAME",
		Description = partUpper .. "_DESC",
		Category = tableName,
		BeautificationValue = 1,
		IsMovableWhenBuilt = true,
		ConstructorData = {
			DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
			CoreObjectPrefab = "PREFAB_" .. partUpper .. "_PART"
		}
	})
	if hasScaling then
		NatureDeco:registerAssetId("models/nature.fbx/Prefab/" .. partLower .. "_Root_Part", "PREFAB_" .. partUpper .. "_ROOT_PART")
		NatureDeco:registerAssetId("models/nature.fbx/Prefab/" .. partLower .. "_Tiling_Part", "PREFAB_" .. partUpper .. "_TILING_PART")
		NatureDeco:registerAsset({
			DataType = "BUILDING_PART",
			Id = partUpper .. "_TILING_PART",
			ConstructorData = {
				DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
				CoreObjectPrefab = "PREFAB_" .. partUpper .. "_TILING_PART"
			}
		})
		NatureDeco:registerAsset({
			DataType = "BUILDING_PART",
			Id = partUpper,
			ConstructorData = {
				DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
				CoreObjectPrefab = "PREFAB_" .. partUpper .. "_PART"
			}
		})
		NatureDeco:overrideAsset({
			Id = partUpper .. "_PART",
			ConstructorData = {
				DataType = "BUILDING_CONSTRUCTOR_SCALER",
				CoreObjectPrefab = "PREFAB_" .. partUpper .. "_ROOT_PART",
				EndPart = partUpper,
				FillerList = {
					partUpper .. "_TILING_PART",
				},
				MinimumScale = 1,
				IsVertical = true
			}
		})
	end
	if hasAttach then
		NatureDeco:registerPrefabComponent("models/nature.fbx/Prefab/" .. partLower ..  "_Part", {
			DataType = "COMP_BUILDING_PART",
			BuildingPartType = hasAttach
		})
	end
	if hasZone then
		NatureDeco:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingZone = {
				ZoneEntryList = hasZone
			}
		})
	end
	if hasDesire then
		NatureDeco:overrideAsset({
			Id = partUpper .. "_PART",
			DesirabilityModifiers = { hasDesire }
		})
	end
	if hasFunction then
		NatureDeco:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingFunction = hasFunction
		})
	end
end

-------------------------------------
--| Building Part Table Functions |--
-------------------------------------
local function ZoneSquare(shape, offset)
	return {Type = {DEFAULT = true, NAVIGABLE = false}, Polygon = polygon.createRectangle(shape, offset)}
end
local function ZoneCircle(size, offset, sides)
	return {Type = {DEFAULT = true, NAVIGABLE = false}, Polygon = polygon.createCircle(size, offset, sides)}
end
local function ZonePoints(polygon)
	return {Type = {DEFAULT = true, NAVIGABLE = false}, Polygon = polygon}
end
local function Desire(type, radius, value)
	return {Desirability = "DESIRABILITY_RESIDENTIAL", Type = type, Radius = radius, Value = value}
end

---------------------------
--| Building Part Table |--
---------------------------------------------------------------------------------------------------------------------------------------
--| partLower[1] ----- tableName[2] ----- hasScaling[3] ----- hasAttach[4] ----- hasZone[5] ----- hasDesire[6] ----- hasFunction[7] |--
---------------------------------------------------------------------------------------------------------------------------------------
local buildingTable = {
--| Foliage |--
	{ "Fern1", 					 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.3), false },
	{ "Fern2", 					 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.3), false },
	{ "Fern3", 					 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.3), false },
	{ "Fern4", 					 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.3), false },
	{ "Grass1", 				 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.2), false },
	{ "Grass2", 				 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.2), false },
	{ "Reed1", 					 "PLANTS",	 false, false,   false, 								  false,				  false },
	{ "Reed2", 					 "PLANTS",	 false, false,   false, 								  false,				  false },
	{ "Grass_Patch_Small", 		 "PLANTS",	 false, false,   false, 								  Desire("ADD", 5,  0.2), false },
	{ "Grass_Patch_Medium",		 "PLANTS",	 false, false,   false, 								  Desire("ADD", 10, 0.2), false },
	{ "Grass_Patch_Large", 		 "PLANTS",	 false, false,   false, 								  Desire("ADD", 15, 0.2), false },
	{ "Grass_Patch_Long", 		 "PLANTS",	 false, false,   false, 								  Desire("ADD", 10, 0.2), false },
	{ "Lilypad1", 				 "PLANTS",	 false, false,   false, 								  false,				  false },
	{ "Lilypad2", 				 "PLANTS",	 false, false,   false, 								  false,				  false },
	{ "Lilypad3", 				 "PLANTS",	 false, false,   false, 								  false,				  false },
	{ "Lilypad4", 				 "PLANTS",	 false, false,   false, 								  false,				  false },
--| Bushes |--
	{ "Bush1_Small", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush1_Medium", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Bush1_Large", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 10, 0.5), false },
	{ "Bush1_Long", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush2_Small", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush2_Medium", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Bush2_Large", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 10, 0.5), false },
	{ "Bush2_Long", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush3_Small", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush3_Medium", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Bush3_Large", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 10, 0.5), false },
	{ "Bush3_Long", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush4_Small", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush4_Medium", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Bush4_Large", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 10, 0.5), false },
	{ "Bush4_Long", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush5_Small", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
	{ "Bush5_Medium", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Bush5_Large", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 10, 0.5), false },
	{ "Bush5_Long", 			 "BUSHES",	 false, false,   false,									  Desire("ADD", 5,  0.3), false },
--| Saplings |--
	{ "Sapling1", 				 "SAPLINGS", false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Sapling2", 				 "SAPLINGS", false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Sapling3", 				 "SAPLINGS", false, false,   false,									  Desire("ADD", 7,  0.4), false },
	{ "Sapling4", 				 "SAPLINGS", false, false,   false,									  Desire("ADD", 7,  0.4), false },
--| Trees |--
	{ "Tree1_Green", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree1_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree1_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree1_Red", 				 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree2_Green",  			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree2_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree2_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree2_Red", 	 			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree3_Green",  			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree3_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree3_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree3_Red", 	 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree4_Green",  			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree4_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree4_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree4_Red", 	 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree5_Green", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree5_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree5_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree5_Red", 				 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree6_Green", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree6_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree6_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree6_Red", 				 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree7_Green", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree7_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree7_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree7_Red", 				 "TREES",	 false, "TREE",  {ZoneCircle( 0.4, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree8_Green", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.6, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree8_Yellow", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.6, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree8_Orange", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.6, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree8_Red", 				 "TREES",	 false, "TREE",  {ZoneCircle( 0.6, {0, 0}, 10 )},		  Desire("ADD", 15, 0.5), false },
	{ "Tree_Swamp1", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Swamp2", 			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Swamp3", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Swamp4", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Dead1", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.8, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Dead2", 			 "TREES",	 false, "TREE",  {ZoneCircle( 1,   {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Dead3", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.2, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Dead4", 			 "TREES",	 false, "TREE",  {ZoneCircle( 0.3, {0, 0}, 10 )},		  false,				  false },
	{ "Tree_Fallen1", 			 "TREES",	 false, false,   {ZoneSquare( {0.4, 6.7}, {0, 0} )},	  false,				  false },
	{ "Tree_Fallen2", 			 "TREES",	 false, false,   {ZoneSquare( {0.4, 6.7}, {0, 0} )},	  false,				  false },
	{ "Tree_Stump", 			 "TREES",	 false, false,   {ZoneCircle( 0.8, {0, 0}, 10 )},		  false,				  false },
	{ "Mushroom_Log", 			 "TREES",	 false, false,   {ZoneSquare( {1.2, 0.2}, {0, 0} )},	  false,				  false },
--| Hedges |--
	{ "Hedge_Full", 			 "HEDGES",	 false, "MINOR", {ZoneSquare( {4.5, 0.5}, {0, 0} )},	  false,				  false },
	{ "Hedge_Half", 			 "HEDGES",	 false, "MINOR", {ZoneSquare( {2, 0.5}, {0, 0} )},		  false,				  false },
	{ "Hedge_Full_Short", 		 "HEDGES",	 false, "MINOR", {ZoneSquare( {4.5, 0.5}, {0, 0} )},	  false,				  false },
	{ "Hedge_Half_Short", 		 "HEDGES",	 false, "MINOR", {ZoneSquare( {2, 0.5}, {0, 0} )},		  false,				  false },
	{ "Hedge_Full_Angled", 		 "HEDGES",	 false, "MINOR", {ZoneSquare( {4.5, 0.5}, {0, 0} )},	  false,				  false },
	{ "Hedge_Half_Angled", 		 "HEDGES",	 false, "MINOR", {ZoneSquare( {2, 0.5}, {0, 0} )},		  false,				  false },
	{ "Hedge_Full_Curved", 		 "HEDGES",	 false, "MINOR", {ZonePoints( {{-0.1, 0.1},{0.8, 1.2},
											 							 {0.8, 2},   {1, 2},
											 							 {1, 1.2},   {0.1, -0.1},
											 							 {-1.2, -1}, {-2, -1.0},
											 							 {-2, -0.8}, {-1.2, -0.8}})}, false,				  false },
	{ "Hedge_Full_Short_Curved", "HEDGES",	 false, "MINOR", {ZonePoints( {{-0.1, 0.1},{0.8, 1.2},
											 							 {0.8, 2},   {1, 2},
											 							 {1, 1.2},   {0.1, -0.1},
											 							 {-1.2, -1}, {-2, -1.0},
											 							 {-2, -0.8}, {-1.2, -0.8}})}, false,				  false },
	{ "Hedge_Full_Archway", 	 "HEDGES",	 false, "MINOR", {ZoneSquare( {1.4, 0.5}, {-1.6, 0} ),
														      ZoneSquare( {1.4, 0.5}, { 1.6, 0} )},	  false,				  false },
	{ "Hedge_Half_Archway", 	 "HEDGES",	 false, "MINOR", {ZoneSquare( {0.1, 0.5}, {-0.95, 0} ),
														      ZoneSquare( {0.1, 0.5}, { 0.95, 0} )},  false,				  false },
	{ "Hedge_Pillar", 			 "HEDGES",	 false, "MINOR", {ZoneSquare( {0.7, 0.7}, {0, 0} )},	  false,				  false },
	{ "Hedge_Pillar_Short", 	 "HEDGES",	 false, "MINOR", {ZoneSquare( {0.7, 0.7}, {0, 0} )},	  false,				  false },
	{ "Hedge_Deco_Sphere", 		 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Egg", 		 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Teardrop", 	 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Cone", 	 	 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Club", 		 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Spade", 		 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Heart", 		 "HEDGES",	 false, "MINOR", false,									  false,				  false },
	{ "Hedge_Deco_Diamond", 	 "HEDGES",	 false, "MINOR", false,									  false,				  false },
--| Stones |--
	{ "Boulder_Small1", 		 "STONES",	 false, false,   {ZoneCircle( 1.1, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Small2", 		 "STONES",	 false, false,   {ZoneCircle( 0.8, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Small3", 		 "STONES",	 false, false,   {ZoneCircle( 1.1, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Small4", 		 "STONES",	 false, false,   {ZoneCircle( 0.9, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Large1", 		 "STONES",	 false, false,   {ZoneCircle( 2.2, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Large2",			 "STONES",	 false, false,   {ZoneCircle( 1.9, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Large3", 		 "STONES",	 false, false,   {ZoneCircle( 1.9, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Boulder_Large4", 		 "STONES",	 false, false,   {ZoneCircle( 1.9, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Stone_Flat1", 			 "STONES",	 false, false,   {ZoneCircle( 1.9, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Stone_Flat2", 			 "STONES",	 false, false,   {ZoneCircle( 1.5, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Stone_Flat3", 			 "STONES",	 false, false,   {ZoneCircle( 1.2, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Stone_Flat4", 			 "STONES",	 false, false,   {ZoneCircle( 1.5, {0, 0}, 10 )},		  Desire("ADD", 10, 0.4), false },
	{ "Stone_Tall1", 			 "STONES",	 false, false,   {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 7,  0.2), false },
	{ "Stone_Tall2", 			 "STONES",	 false, false,   {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 7,  0.2), false },
	{ "Stone_Tall3", 			 "STONES",	 false, false,   {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 7,  0.2), false },
	{ "Stone_Tall4", 			 "STONES",	 false, false,   {ZoneCircle( 0.3, {0, 0}, 10 )},		  Desire("ADD", 7,  0.2), false },
	{ "Stone1", 				 "STONES",	 false, false,   {ZoneSquare( {0.9, 0.3}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone2", 				 "STONES",	 false, false,   {ZoneSquare( {0.9, 0.4}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone3", 				 "STONES",	 false, false,   {ZoneSquare( {0.6, 0.6}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone4", 				 "STONES",	 false, false,   {ZoneSquare( {0.3, 0.3}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone5", 				 "STONES",	 false, false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone6", 				 "STONES",	 false, false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone7", 				 "STONES",	 false, false,   {ZoneSquare( {0.9, 0.3}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone8", 				 "STONES",	 false, false,   {ZoneSquare( {1.2, 0.7}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
	{ "Stone9", 				 "STONES",	 false, false,   {ZoneSquare( {1.2, 0.7}, {0, 0} )},	  Desire("ADD", 7,  0.2), false },
--| Water Shapes |--
	{ "Water_Circle_Small", 	 "WATER",	 true,  false,   {ZoneCircle( 1,   {0, 0}, 16 )},		  false,				  false },
	{ "Water_Circle_Medium",	 "WATER",	 true,  false,   {ZoneCircle( 2.2, {0, 0}, 16 )},		  false,				  false },
	{ "Water_Circle_Large", 	 "WATER",	 true,  false,   {ZoneCircle( 4.8, {0, 0}, 16 )},		  false,				  false },
	{ "Water_Circle_XLarge", 	 "WATER",	 true,  false,   {ZoneCircle( 9.8, {0, 0}, 16 )},		  false,				  false },
	{ "Water_Square_Small", 	 "WATER",	 true,  false,   {ZoneSquare( {1.2, 1.2}, {0, 0} )},	  false,				  false },
	{ "Water_Square_Medium",	 "WATER",	 true,  false,   {ZoneSquare( {3.2, 3.2}, {0, 0} )},	  false,				  false },
	{ "Water_Square_Large", 	 "WATER",	 true,  false,   {ZoneSquare( {7.2, 7.2}, {0, 0} )},	  false,				  false },
	{ "Water_Square_XLarge", 	 "WATER",	 true,  false,   {ZoneSquare( {15.2, 15.2}, {0, 0} )},	  false,				  false }
}
for k, v in pairs(buildingTable) do
	BuildingPart(v)
end

---------------------------
--| Theme List Function |--
---------------------------
local ThemeList = {}
local function ThemeSetList(value)
	local color = 	 value[1]
	local tablePos = value[2]
	local tableValue = { SetName = "WATER_" .. color .. "_NAME",  MaterialList = { "WATER_" .. color .. "_MATERIAL" } }
	table.insert(ThemeList, tablePos, tableValue)
end

------------------------
--| Theme List Table |--
------------------------
local themeTable = {
	{ "BLUE",  1 },
	{ "BROWN", 2 },
	{ "GREEN", 3 },
	{ "GREY",  4 },
	{ "TEAL",  5 },
}
for k, v in pairs(themeTable) do
	ThemeSetList(v)
end

-------------------
--| Core Assets |--
-------------------
NatureDeco:registerAssetId("models/core.fbx/Prefab/Nature_Core", "PREFAB_NATURE_CORE")
NatureDeco:registerAssetId("models/cover.fbx/Prefab/Nature_Cover", "PREFAB_NATURE_COVER")
NatureDeco:registerAsset({
	DataType = "BUILDING_PART",
	Id = "NATURE_CORE",
	Name = "NATURE_NAME",
	AssetBuildingFunction = "BUILDING_FUNCTION_NATURE_CORE",
	IsVisibleWhenBuilt = false,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_NATURE_CORE"
	},
	DesirabilityModifiers = {
		{
			Desirability = "DESIRABILITY_RESIDENTIAL",
			Type = "ADD",
			Radius = 1,
			Value = 0
		}
	}
})
NatureDeco:registerAsset({
	DataType = "BUILDING_PART",
	Id = "NATURE_COVER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_NATURE_COVER"
	}
})

-------------------------
--| Unlockable Assets |--
-------------------------
NatureDeco:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_NATURE_UNLOCK",
    DaysToFirst = 1,
    ConditionList = {
        {
            DataType = "GAME_CONDITION_BUILDING_BUILT",
            AssetBuilding = "BUILDING_VILLAGE_CENTER",
        },
    },
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "NATURE_DECORATIONS",
                },
            },
        }
    }
})
NatureDeco:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_NATURE_UNLOCK",
    }
})

----------------
--| Core Job |--
----------------
NatureDeco:registerAsset({
	DataType = "JOB",
	Id = "JOB_NATURE_CORE",
	JobName = "JOB_NATURE_CORE_NAME",
	IsLockedByDefault = false,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})

---------------------
--| Core Function |--
---------------------
NatureDeco:registerAsset({
	DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_NATURE_CORE",
	Name = "BUILDING_FUNCTION_NATURE_CORE_NAME",
	WorkerCapacity = 0,
	RelatedJob = {
		Job = "JOB_NATURE_CORE",
		Behavior = "BEHAVIOR_WORK"
	}
})

-------------------------
--| Monument Building |--
-------------------------
NatureDeco:registerAsset({
	DataType = "BUILDING",
	Id = "NATURE_DECORATIONS",
	Name = "NATURE_NAME",
	Description = "NATURE_DESC",
	BuildingType = "MODS",
	AssetMiniatureBuildingPart = "NATURE_COVER",
	AssetCoreBuildingPart = "NATURE_CORE",
	IsEditable = true,
	AssetBuildingPartList = AssetList,
	MaterialSetList = ThemeList
})

---------------------------
--| Fantasy Decorations |--
---------------------------
NatureDeco:overrideAsset({
	Id = "NATURE_DECORATIONS",
	AssetBuildingPartList = {
		Action = "APPEND",
		"BUSH_PART",
		"BUSH2_PART",
		"BUSH_BERRIES_RED_PART",
		"BUSH_BERRIES_BLUE_PART",
		"BUSH_BLUE_PART",
		"BUSH_PURPLE_PART",
		"BUSH_RED_PART",
		"BUSH_YELLOW_PART",
		"PLANTER_STONE_LARGE_PART",
		"PLANTER_STONE_LARGE2_PART",
		"FLOWERS_RED_PART",
		"FLOWERS_ORANGE_PART",
		"FLOWERS_PINK_PART",
		"FLOWERS_PINK2_PART",
		"FLOWERS_YELLOW_PART",
		"FLOWERS_YELLOW_LIGHT_PART",
		"FLOWERS_TEAL_PART",
		"FLOWERS_BLUE_PART",
		"FLOWERS_BLUE_LIGHT_PART",
		"FLOWERS_PURPLE_PART",
		"FLOWERS_PURPLE2_PART",
		"FLOWERS_PURPLE_LIGHT_PART",
		"FLOWERS_WHITE_PART",
		"FLOWERS_WHITE2_PART",
		"FLOWERS_WHITE3_PART",
		"FLOWERS_STRANGE_PART",
		"FLOWERS_GREEN_PART",
		"FLOWERS_GREEN2_PART",
	}
})