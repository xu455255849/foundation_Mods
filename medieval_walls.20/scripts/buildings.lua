local MedievalWall = ...
local AssetList = {}

------------------------------
--| Building Part Function |--
------------------------------
local function BuildingPart(value)
	local partLower =	value[1]
	local partUpper =	string.upper(partLower)
    local tableName = 	value[2]
	local hasBeauty =	value[3]
	local hasAttach =	value[4]
	local hasZone =		value[5]
	local hasDesire =	value[6]
	local hasGround =	value[7]
	local hasFunction =	value[8]
	if tableName then
		table.insert(AssetList, partUpper .. "_PART")
	end
	MedievalWall:registerAssetId("models/stonewall.fbx/Prefab/" .. partLower .. "_Part", "PREFAB_" .. partUpper .. "_PART")
	MedievalWall:registerAsset({
		DataType = "BUILDING_PART",
		Id = partUpper .. "_PART",
		Name = partUpper .. "_NAME",
		Description = partUpper .. "_DESC",
		Category = tableName,
		BeautificationValue = hasBeauty,
		IsMovableWhenBuilt = true,
		ConstructorData = {
			DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
			CoreObjectPrefab = "PREFAB_" .. partUpper .. "_PART"
		}
	})
	if hasGround == false and hasAttach then
		MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partLower ..  "_Part", {
			DataType = "COMP_BUILDING_PART",
			BuildingPartType = hasAttach
		})
	end
	if hasAttach == false and hasGround then
		MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partLower ..  "_Part", {
			DataType = "COMP_BUILDING_PART",
			IsAlwaysGrounded = hasGround
		})
	end
	if hasAttach and hasGround then
		MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partLower ..  "_Part", {
			DataType = "COMP_BUILDING_PART",
			BuildingPartType = hasAttach,
			IsAlwaysGrounded = hasGround
		})
	end
	if hasZone then
		MedievalWall:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingZone = {
				ZoneEntryList = hasZone
			},
		})
	end
	if hasDesire then
		MedievalWall:overrideAsset({
			Id = partUpper .. "_PART",
			DesirabilityModifiers = { hasDesire },
		})
	end
	if hasFunction then
		MedievalWall:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingFunction = hasFunction,
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
local function ZoneNoGrass(grassclear, shape, offset)
	return {Type = {DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = grassclear}, Polygon = polygon.createRectangle(shape, offset)}
end

---------------------------
--| Building Part Table |--
----------------------------------------------------------------------------------------------------------------------------------------------------------
--| partLower[1]  ----- tableName[2] ----- hasBeauty[3] ----- hasAttach[4] ----- hasZone[5] ----- hasDesire[6] ----- hasGround[7] ----- hasFunction[8] |--
----------------------------------------------------------------------------------------------------------------------------------------------------------
local buildingPart = {
--| Walls |--
	{ "Wall_Brick_Full", 			  "WALLS",   	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Half", 			  "WALLS",   	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Full_Short", 		  "WALLS",   	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Half_Short", 		  "WALLS",   	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Full_Broken", 	  "WALLS",   	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Half_Broken", 	  "WALLS",   	1,  "MINOR",	{ZoneSquare( {1.8, 0.1}, {-0.1, 0} )},	   false, true,  false },
	{ "Wall_Brick_Full_Short_Broken", "WALLS",   	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )}, 	   false, true,  false },
	{ "Wall_Brick_Half_Short_Broken", "WALLS",   	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Full_Arch", 		  "WALLS",   	1,  "MINOR",	{ZoneSquare( {1.4, 0.1}, {-1.5, 0} ),
													   				 ZoneSquare( {1.4, 0.1}, { 1.5, 0} )},	   false, true,  false },
	{ "Wall_Brick_Half_Arch", 		  "WALLS",   	1,  "MINOR",	{ZoneSquare( {0.2, 0.1}, {-1, 0} ),
													  				 ZoneSquare( {0.2, 0.1}, { 1, 0} )},	   false, true,  false },
	{ "Wall_Brick_Arch", 			  "WALLS",   	1,  "MINOR",	{ZoneSquare( {0.2, 0.1}, {-1, 0} ),
													   				 ZoneSquare( {0.2, 0.1}, { 1, 0} )},	   false, true,  false },
	{ "Wall_Brick_Half_Arch_Broken",  "WALLS",   	1,  "MINOR",	{ZoneSquare( {0.2, 0.1}, {-1, 0} ),
													  				 ZoneSquare( {0.2, 0.1}, { 1, 0} )},	   false, true,  false },
	{ "Wall_Brick_Full_Angled", 	  "WALLS",    	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Wall_Brick_Half_Angled", 	  "WALLS",    	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )}, 		   false, true,  false },
	{ "Wall_Brick_Full_Curved", 	  "WALLS",   	1,  "MINOR",	{ZonePoints( {{-0.1, 0.1},{0.7, 1.2},
																			  {0.8, 2},   {1.0, 2},
																			  {1, 1.2},   {0.1, -0.1},
																			  {-1.2, -1}, {-2, -1.0},
																			  {-2, -0.8}, {-1.2, -0.7}})},	   false, true,  false },
	{ "Wall_Brick_Full_Short_Curved", "WALLS",    	1,  "MINOR",	{ZonePoints( {{-0.1, 0.1},{0.7, 1.2},
																			  {0.8, 2},   {1.0, 2},
																			  {1, 1.2},   {0.1, -0.1},
																			  {-1.2, -1}, {-2, -1.0},
																			  {-2, -0.8}, {-1.2, -0.7}})},	   false, true,  false },
--| Pillars |--
	{ "Pillar_Brick_Square", 		  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Pillar_Brick_Square_Short", 	  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Pillar_Brick_Octo", 			  "PILLARS", 	1,  "MINOR",	{ZoneCircle( 0.2, {0, 0}, 8 )}, 		   false, true,  false },
	{ "Pillar_Brick_Broken1", 		  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Pillar_Cobblestone_Square", 	  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Pillar_Cobblestone_Short", 	  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Pillar_Cobblestone_Octo", 	  "PILLARS", 	1,  "MINOR",	{ZoneCircle( 0.2, {0, 0}, 8 )}, 		   false, true,  false },
	{ "Pillar_Cobblestone_Broken1",	  "PILLARS", 	1,  "MINOR",	{ZoneSquare( {0.2, 0.2}, {0, 0} )}, 	   false, true,  false },
	{ "Base_Brick", 				  "PILLARS", 	1,  "PATHWAY",  {ZoneSquare( {2, 2}, {0, 0} )},			   false, true,  false },
	{ "Base_Cobblestone", 			  "PILLARS", 	1,  "PATHWAY",  {ZoneSquare( {2, 2}, {0, 0} )},			   false, true,  false },
	{ "Pillar_Brick_Fallen", 		  "PILLARS", 	1,  false,		{ZoneSquare( {2.6, 0.1}, {0, 0} )},		   false, false, false },
	{ "Pillar_Cobblestone_Fallen",    "PILLARS", 	1,  false,		{ZoneSquare( {2.6, 0.1}, {0, 0} )}, 	   false, false, false },
	{ "Pillar_Brick_Extention1", 	  "PILLARS", 	1,  "MINOR",	false,									   false, false, false },
	{ "Pillar_Brick_Extention2", 	  "PILLARS", 	1,  "MINOR",	false,									   false, false, false },
	{ "Pillar_Brick_Extention3", 	  "PILLARS", 	1,  "MINOR",	false,									   false, false, false },
--| Iron Fences |--
	{ "Iron_Gate_Fence_Full", 		  "IRONGATE",	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )}, 	   false, true,  false },
	{ "Iron_Gate_Door", 			  "IRONGATE",	1,  "MINOR",	{ZoneSquare( {0.7, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Iron_Gate_Single", 			  "IRONGATE",	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )}, 		   false, true,  false },
	{ "Iron_Gate_Double", 			  "IRONGATE",	1,  "MINOR",	{ZoneSquare( {4.5, 0.1}, {0, 0} )},		   false, true,  false },
	{ "Iron_Gate_Fence_Half", 		  "IRONGATE",	1,  "MINOR",	{ZoneSquare( {2, 0.1}, {0, 0} )}, 		   false, true,  false },
	{ "Iron_Gate_Door_Animated", 	  "IRONGATE",	2,  "MINOR",	{ZoneCircle( 0.5, {-1.1, 0.5}, 20 ),
													   				 ZoneCircle( 0.5, { 1.1, 0.5}, 20 )},	   false, true,  "BUILDING_FUNCTION_IRON_GATE_DOOR" },
	{ "Iron_Gate_Single_Animated", 	  "IRONGATE",   2,  "MINOR",	{ZoneCircle( 1.2, {1.3, 1}, 20 )},		   false, true,  "BUILDING_FUNCTION_IRON_GATE_SINGLE" },
	{ "Iron_Gate_Double_Animated", 	  "IRONGATE",   2,  "MINOR",	{ZoneCircle( 1.5, {-2.3, 0.7}, 20 ),
													   				 ZoneCircle( 1.5, { 2.3, 0.7}, 20 )},	   false, true,  "BUILDING_FUNCTION_IRON_GATE_DOUBLE" },
	{ "Iron_Gate_Fence_Full_Curved",  "IRONGATE",   1,  "MINOR",	{ZonePoints( {{-0.1, 0.1},{0.7, 1.2},
																			  {0.8, 2},   {1.0, 2},
																			  {1, 1.2},   {0.1, -0.1},
																			  {-1.2, -1}, {-2, -1.0},
																			  {-2, -0.8}, {-1.2, -0.7}})},	   false, true,  false },
--| Pathways |--
	{ "Pathway_Clean_XL_Square", 	  "PATHWAYS",   5,  "PATHWAY", 	{ZoneNoGrass(true, {8, 8}, {0, 0})}, 	   false, true,  false },
	{ "Pathway_Clean_Square", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
	{ "Pathway_Clean_Cross", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
	{ "Pathway_Clean_Corner", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
	{ "Pathway_Messy_XL_Square", 	  "PATHWAYS",   5,  "PATHWAY", 	{ZoneNoGrass(true, {8, 8}, {0, 0})}, 	   false, true,  false },
	{ "Pathway_Messy_Square", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
	{ "Pathway_Messy_Cross", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
	{ "Pathway_Messy_Corner", 		  "PATHWAYS",   1,  "PATHWAY", 	{ZoneNoGrass(true, {2.3, 2.3}, {0, 0})},   false, true,  false },
--| Buildings |--
	{ "Pavilion", 					  "BUILDINGS",  10, "MINOR",	{ZoneCircle( 0.5, {-1.7, 3}, 12 ),
													   				 ZoneCircle( 0.5, { 1.7, 3}, 12 ),
													   				 ZoneCircle( 0.5, { 3.4, 0}, 12 ),
													   				 ZoneCircle( 0.5, {-1.7, -3}, 12 ),
													   				 ZoneCircle( 0.5, { 1.7, -3}, 12 ),
													   				 ZoneCircle( 0.5, {-3.4, 0}, 12 )}, 	   false, true,  false },
	{ "Tomb_Tower", 				  "BUILDINGS",  10, "MINOR",	{ZoneSquare( {4, 4}, {0, 0} )}, 		   false, true,  false },
	{ "Tomb", 						  "BUILDINGS",  5,  "MINOR",	{ZoneSquare( {3.0, 4.8}, {0, 0} )}, 	   false, true,  false },
--| Decorations - Walls |--
	{ "Deco_Wall_Banner_Red", 		  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Orange", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Green", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Teal", 		  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Blue", 		  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Purple", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_White", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Banner_Black", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Torch_On_Fire", 	  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Wall_Torch", 			  "WALLDECO",   1,  "MINOR",	false,									   false, false, false },
--| Decorations - Pillars |--
	{ "Deco_Pillar_Cross", 			  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Cross_Large", 	  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Lantern", 		  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Fleurdelis",		  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Dragon", 		  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Brazier_On_Fire",  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Brazier_On_Smoke", "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Brazier_Off", 	  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
	{ "Deco_Pillar_Sundial", 		  "PILLARDECO", 1,  "MINOR",	false,									   false, false, false },
--| Decorations - Ornaments |--
	{ "Ornament_Fleur", 			  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Star", 				  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Cross", 			  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Spear", 			  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Fleur_Gold", 		  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Star_Gold", 		  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Cross_Gold", 		  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
	{ "Ornament_Spear_Gold", 		  "ORNAMENTS",  1,  "ORNAMENT",	false,									   false, false, false },
}
for k, v in pairs(buildingPart) do
	BuildingPart(v)
end

---------------------------
--| Theme List Function |--
---------------------------
local ThemeList = {}
local function ThemeSetList(value)
	local color1 = 	 value[1]
	local color2 = 	 value[2]
	local color3 = 	 value[3]
	local color4 = 	 value[4]
	local color5 = 	 value[5]
	local tablePos = value[6]
	local tableValue = { SetName = color1 .. "_NAME", MaterialList = { color1 .. "_MATERIAL", color2 .. "_MATERIAL", color3 .. "_MATERIAL", color4 .. "_MATERIAL", color5 .. "_MATERIAL" } }
	table.insert(ThemeList, tablePos, tableValue)
end

------------------------
--| Theme List Table |--
------------------------
local themeTable = {
	{ "BRICK_LIGHT", 	 "STONE_LIGHT",		"COBBLESTONE_LIGHT",	 "METAL_IRON_LIGHT", "ROOF_BLACK", 1 },
	{ "BRICK_DARK",  	 "STONE_DARK",		"COBBLESTONE_DARK", 	 "METAL_IRON_DARK",  "ROOF_BLACK", 2 },
	{ "BRICK_TAN_LIGHT", "STONE_TAN_LIGHT", "COBBLESTONE_TAN_LIGHT", "METAL_IRON_LIGHT", "ROOF_BROWN", 3 },
	{ "BRICK_TAN_DARK",	 "STONE_TAN_DARK",  "COBBLESTONE_TAN_DARK",  "METAL_IRON_DARK",  "ROOF_BROWN", 4 }

}
for k, v in pairs(themeTable) do
	ThemeSetList(v)
end

-------------------
--| Core Assets |--
-------------------
MedievalWall:registerAssetId("models/core.fbx/Prefab/Medieval_Wall_Core", "PREFAB_MEDIEVAL_WALL_CORE")
MedievalWall:registerAssetId("models/cover.fbx/Prefab/Medieval_Wall_Cover", "PREFAB_MEDIEVAL_WALL_COVER")
MedievalWall:registerAsset({
	DataType = "BUILDING_PART",
	Id = "MEDIEVAL_WALL_CORE",
	Name = "MEDIEVAL_WALL_NAME",
	AssetBuildingFunction = "BUILDING_FUNCTION_MEDIEVAL_WALL_CORE",
	IsVisibleWhenBuilt = false,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_MEDIEVAL_WALL_CORE"
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
MedievalWall:registerAsset({
	DataType = "BUILDING_PART",
	Id = "MEDIEVAL_WALL_COVER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_MEDIEVAL_WALL_COVER"
	}
})

-------------------------
--| Unlockable Assets |--
-------------------------
MedievalWall:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_MEDIEVAL_WALL_UNLOCK",
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
                    "MEDIEVAL_WALLS",
                },
            },
        }
    }
})
MedievalWall:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_MEDIEVAL_WALL_UNLOCK",
    }
})

----------------
--| Core Job |--
----------------
MedievalWall:registerAsset({
	DataType = "JOB",
	Id = "JOB_MEDIEVAL_WALL_CORE",
	JobName = "JOB_MEDIEVAL_WALL_CORE_NAME",
	IsLockedByDefault = false,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})

---------------------
--| Core Function |--
---------------------
MedievalWall:registerAsset({
	DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_MEDIEVAL_WALL_CORE",
	Name = "BUILDING_FUNCTION_MEDIEVAL_WALL_CORE_NAME",
	WorkerCapacity = 0,
	RelatedJob = {
		Job = "JOB_MEDIEVAL_WALL_CORE",
		Behavior = "BEHAVIOR_WORK"
	}
})

-------------------------
--| Monument Building |--
-------------------------
MedievalWall:registerAsset({
	DataType = "BUILDING",
	Id = "MEDIEVAL_WALLS",
	Name = "MEDIEVAL_WALL_NAME",
	Description = "MEDIEVAL_WALL_DESC",
	BuildingType = "MODS",
	AssetMiniatureBuildingPart = "MEDIEVAL_WALL_COVER",
	AssetCoreBuildingPart = "MEDIEVAL_WALL_CORE",
	IsEditable = true,
	AssetBuildingPartList = AssetList,
	MaterialSetList = ThemeList
})