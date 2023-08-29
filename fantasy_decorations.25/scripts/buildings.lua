local FantasyDeco = ...
local AssetList = {}

------------------------------
--| Building Part Function |--
------------------------------
local function BuildingPart(value)
	local partLower =	value[1]
	local partUpper =	string.upper(partLower)
    local tableName = 	value[2]
	local fileName =	value[3]
	local hasBeauty =	value[4]
	local hasScaling =	value[5]
	local hasAttach =	value[6]
	local hasZone =		value[7]
	local hasDesire =	value[8]
	local hasSplendor =	value[9]
	local hasFunction =	value[10]
	if tableName then
		table.insert(AssetList, partUpper .. "_PART")
	end
	FantasyDeco:registerAssetId("models/" .. fileName .. ".fbx/Prefab/" .. partLower .. "_Part", "PREFAB_" .. partUpper .. "_PART")
	FantasyDeco:registerAsset({
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
	if hasScaling then
		FantasyDeco:overrideAsset({
			Id = partUpper .. "_PART",
			ConstructorData = {
				DataType = "BUILDING_CONSTRUCTOR_SCALER",
				CoreObjectPrefab = "PREFAB_FD_ROOT_PART",
				EndPart = partUpper,
				FillerList = {
					"FD_TILING_PART",
				},
				MinimumScale = 2,
				IsVertical = true
			}
		})
		FantasyDeco:registerAsset({
			DataType = "BUILDING_PART",
			Id = partUpper,
			ConstructorData = {
				DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
				CoreObjectPrefab = "PREFAB_" .. partUpper .. "_PART"
			}
		})
	end
	if hasAttach then
		FantasyDeco:registerPrefabComponent("models/" .. fileName .. ".fbx/Prefab/" .. partLower ..  "_Part", {
			DataType = "COMP_BUILDING_PART",
			BuildingPartType = hasAttach
		})
	end
	if hasZone then
		FantasyDeco:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingZone = {
				ZoneEntryList = hasZone
			}
		})
	end
	if hasDesire then
		FantasyDeco:overrideAsset({
			Id = partUpper .. "_PART",
			DesirabilityModifiers = { hasDesire }
		})
	end
	if hasSplendor then
		FantasyDeco:overrideAsset({
			Id = partUpper .. "_PART",
			EstateSplendor = { hasSplendor }
		})
	end
	if hasFunction then
		FantasyDeco:overrideAsset({
			Id = partUpper .. "_PART",
			BuildingFunction = "BUILDING_FUNCTION_" .. hasFunction
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
local function Desire(type, radius, value)
	return {Desirability = "DESIRABILITY_RESIDENTIAL", Type = type, Radius = radius, Value = value}
end
local function Estate(type, quantity)
	return {Estate = type, Quantity = quantity}
end

---------------------------
--| Building Part Table |--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--| partLower[1] --- tableName[2] --- fileName[3] --- hasBeauty[4] --- hasScaling[5] --- hasAttach[6] --- hasZone[7] --- hasDesire[8] --- hasSplendor[9] --- hasFunction[10] |--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local buildingTable = {
--| Uncategorized |--
	{ "Dragon", 					  "DECO", 	     "statues", 	   20, true,  false,   {ZoneSquare( {2.3, 3.4}, {0, 0} )}, 				 false, Estate("KINGDOM", 10), false },
	{ "Candelabra", 				  "DECO", 	     "lanterns", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wheel", 						  "DECO", 	     "cart", 		   1,  true,  false,   false,											 false, false,				   false },
	{ "Cauldron", 					  "DECO", 	     "cauldron", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Skulls1", 					  "DECO", 	     "skulls", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Cooking_Pot",				  "DECO", 	     "campfire", 	   1,  true,  false,   {ZoneSquare( {0.9, 2}, {0, 0} )}, 				 false, false,				   false },
	{ "Fishing_Net", 				  "DECO", 	     "fishing", 	   1,  true,  false,   false,											 false, false,				   false },
	{ "Hanging_Rope", 				  "DECO", 	     "fishing", 	   1,  true,  false,   {ZoneSquare( {0.3, 0.3}, {0, 0} )}, 				 false, false,				   false },
	{ "Skulls2", 					  "DECO", 	     "skulls", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Sword_Stone", 				  "DECO", 	     "weapons",		   5,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )}, 					 false, Estate("KINGDOM", 5),  false },
	{ "Wheelbarrow", 				  "DECO", 	     "cart", 		   1,  true,  false,   {ZoneSquare( {0.4, 1.6}, {0, 0.1} )}, 			 false, false, 				   false },
	{ "Coffin_Wood", 				  "DECO", 	     "coffin", 		   1,  true,  false,   {ZoneSquare( {0.4, 1.7}, {0, 0} )}, 				 false, false, 				   false },
--| Storage/Vehicles |--
	{ "Wagon", 						  "VEHICLES",    "cart", 		   5,  false, false,   {ZoneSquare( {1.8, 2.8}, {0, -0.1} )}, 			 false, Estate("LABOUR",  2),  false },
	{ "Crane", 						  "VEHICLES",    "cart", 		   5,  true,  false,   {ZoneSquare( {5, 3.5}, {0.8, 0} )}, 				 false, Estate("LABOUR",  5),  false },
	{ "Barge", 						  "VEHICLES",    "cart", 		   5,  false, false,   false,											 false, Estate("LABOUR",  3),  false },
	{ "Ship_Merchant", 				  "VEHICLES",    "cart", 		   5,  false, false,   false,											 false, Estate("LABOUR",  3),  false },
	{ "Wagon_Canopy", 				  "VEHICLES",    "cart", 		   5,  false, false,   {ZoneSquare( {1.8, 2.8}, {0, -0.1} )}, 			 false, Estate("LABOUR",  2),  false },
	{ "Crane_Small", 				  "VEHICLES",    "cart", 		   5,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, Estate("LABOUR",  3),  false },
	{ "Barge_Canopy", 				  "VEHICLES",    "cart", 		   5,  false, false,   false,											 false, Estate("LABOUR",  3),  false },
	{ "Resource_Shed", 				  "VEHICLES",    "cart", 		   5,  true,  false,   {ZoneSquare( {1.9, 2.8}, {0, 0.1} )}, 			 false, Estate("LABOUR",  2),  false },
--|	Resource Shipments |--
	{ "Shipment_Barrel_Large", 		  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Barrels", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Crates", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Furniture", 		  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Planks", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Logs", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Spools", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Pottery", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Grain", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.5}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Hay", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.6}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Thatch", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Coal", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Bricks", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Stones", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Mix1", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Mix2", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Food", 				  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Goods", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Tools", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Shipment_Weapons", 			  "SHIPMENTS",   "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
--| Siege Weapons |--
	{ "Ballista",					  "SIEGE",		 "siege", 		   5,  true,  false,   false,											 false, Estate("KINGDOM", 2),  false },
	{ "Battering_Ram",				  "SIEGE",		 "siege", 		   5,  true,  false,   false,											 false, Estate("KINGDOM", 5),  false },
	{ "Catapult",					  "SIEGE",		 "siege", 		   5,  true,  false,   false,											 false, Estate("KINGDOM", 3),  false },
	{ "Trebuchet",					  "SIEGE",		 "siege", 		   5,  true,  false,   false,											 false, Estate("KINGDOM", 5),  false },
	{ "Ballista_NS",				  "SIEGE",		 "siege", 		   5,  false, "SIEGE", {ZoneCircle( 0.5, {0, 0}, 12 )},					 false, Estate("KINGDOM", 2),  false },
	{ "Battering_Ram_NS",			  "SIEGE",		 "siege", 		   5,  false, false,   {ZoneSquare( {2.5, 5.2}, {0, 0} )},				 false, Estate("KINGDOM", 5),  false },
	{ "Catapult_NS",				  "SIEGE",		 "siege", 		   5,  false, false,   {ZoneSquare( {2.5, 4.6}, {0, 0} )},				 false, Estate("KINGDOM", 3),  false },
	{ "Trebuchet_NS",				  "SIEGE",		 "siege", 		   5,  false, false,   {ZonePoints( {{1.2, 4},
																										 {1.2, 0.6},
																										 {3, -1.6},
																										 {1.2, -4},
																										 {-1.2, -4},
																										 {-3, -1.6},
																										 {-1.2, 0.6},
																										 {-1.2, 4}} )}, 			 		 false, Estate("KINGDOM", 5),  false },
--| Punishment Devices |--
	{ "Pillory",					  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Execution_Block",			  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneSquare( {2.9, 1.3}, {0.4, 0} )},			 false, false, 				   false },
	{ "Wooden_Horse",				  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneSquare( {1.6, 0.3}, {0, 0} )},				 false, false, 				   false },
	{ "Stake",						  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneSquare( {2.9, 1.8}, {0, 0} )},				 false, false, 				   false },
	{ "Wagon_Cage",					  "PUNISHMENT",  "punishment",	   1,  false, false,   {ZoneSquare( {1.8, 3}, {0, 0.2} )},				 false, false, 				   false },
	{ "Hanging_Cages",				  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneCircle( 0.8, {0, 0}, 12 )},					 false, false, 				   false },
	{ "Hanging_Cage",				  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZoneCircle( 0.6, {0, 0}, 12 )},					 false, false, 				   false },
	{ "Guillotine",					  "PUNISHMENT",  "punishment",	   1,  true,  false,   {ZonePoints( {{1.4, 0.5},
																										 {0.6, -1.5},
																										 {-0.6, -1.5},
																										 {-1.4, 0.5},
																										 {-0.6, 1.4},
																										 {0.6, 1.4}} )},					 false, false, 				   false },
--| Weapons |--
	{ "Weapons_Rack1", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.9, 0.3}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Rack2", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.5, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Rack3", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.5, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Rack4", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.4, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Rack5", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.4, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Rack_Bolts", 		  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneSquare( {1.5, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Polished_Stone1",			  "WEAPONS", 	 "siege", 		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Polished_Stone2",			  "WEAPONS", 	 "siege", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.8}, {0, 0} )},				 false, false, 				   false },
	{ "Weapons_Barrel1", 			  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Target", 					  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Target_Axe", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Target_Dagger", 				  "WEAPONS", 	 "weapons",		   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )},					 false, false, 				   false },
--| Tools |--
	{ "Tools_Rack",					  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Tools_Rack_Farm",			  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Tools_Rack_Axes",			  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Tools_Rack_Picks",			  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Tools_Barrel", 				  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Tools_Barrel_Farm", 			  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Tools_Rack_Shovels",			  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
	{ "Tools_Rack_Woodcutting",		  "TOOLS", 		 "tools",		   1,  true,  false,   {ZoneSquare( {1.2, 0.4}, {0, 0} )},				 false, false, 				   false },
--| Lanterns |--
	{ "Lantern1", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern2", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern3", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern4", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern5", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern6", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern7", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern8", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern9", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern10", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern11", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
	{ "Lantern12", 					  "LANTERNS",    "lanterns", 	   1,  false, "RIGHT", false,											 false, false, 				   false },
--| Lantern Posts |--
	{ "Post1", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post2", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.5, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post3", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post4", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post5", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post6", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.5, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post7", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post8", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Post9", 						  "LAMPPOST",    "lanterns", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Post10", 					  "LAMPPOST",    "lanterns", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Post11", 					  "LAMPPOST",    "lanterns", 	   1,  true,  false,   false, 											 false, false, 				   false },
	{ "Post12", 					  "LAMPPOST",    "lanterns", 	   1,  true,  false,   false,											 false, false, 				   false },
--| Braziers |--
	{ "Brazier1", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Brazier2", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Brazier3", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Brazier4", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Brazier5", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Brazier6", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Brazier7", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Brazier8", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Torch", 						  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Torch2", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Torch3", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Torch4", 					  "BRAZIERS",	 "braziers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Campfire", 					  "BRAZIERS",	 "campfire", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Campfire_On_Fire", 			  "BRAZIERS",	 "campfire", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Campfire_Signal", 			  "BRAZIERS",	 "campfire", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Bonfire", 					  "BRAZIERS",	 "braziers", 	   2,  true,  false,   {ZoneCircle( 1.4, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Planters |--
	{ "Planter_Wood", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneSquare( {2, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Pot_Wood1", 					  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Wood2", 					  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneSquare( {0.5, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Pot_Marble1", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, false, 				   false },
	{ "Planter_Stone", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneSquare( {1.4, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Pot_Stone1", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Stone2", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Stone3", 				  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Planter_Stone_Large", 		  "PLANTERS",    "flowers",		   5,  true,  false,   {ZoneCircle( 2.2, {0, 0}, 12 )}, 				 false, false, 				   false },
	{ "Planter_Stone_Large2", 		  "PLANTERS",    "flowers",		   5,  true,  false,   {ZoneSquare( {4.3, 4.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Pot_Clay1", 					  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Clay2", 					  "PLANTERS",    "flowers",		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Flowers |--
	{ "Flowers_Red", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Orange", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Pink", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Pink2", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Yellow", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Yellow_Light", 		  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Teal", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Blue", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Blue_Light", 		  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Purple", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Purple2", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Purple_Light", 		  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_White", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_White2", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_White3", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Strange", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Green", 				  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
	{ "Flowers_Green2", 			  "FLOWERS", 	 "flowers", 	   1,  false, "LEFT",  false,							Desire("ADD", 10, 0.2), false, 				   false },
--| Bushes |--
	{ "Bush", 						  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 5,  0.3), false, 				   false },
	{ "Bush2", 						  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 5,  0.3), false, 				   false },
	{ "Bush_Berries_Red", 			  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 15, 0.5), false, 				   false },
	{ "Bush_Berries_Blue", 			  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 15, 0.5), false, 				   false },
	{ "Bush_Blue", 					  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 20, 0.5), false, 				   false },
	{ "Bush_Purple", 				  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 20, 0.5), false, 				   false },
	{ "Bush_Red", 					  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 20, 0.5), false, 				   false },
	{ "Bush_Yellow", 				  "BUSHES", 	 "bushes", 		   1,  true,  false,   false, 							Desire("ADD", 20, 0.5), false, 				   false },
--| Animals |--
	{ "Cat", 						  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Dog", 						  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Rabbit",						  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Frog",						  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Goose1", 					  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Chicken1", 					  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Chicken2",					  "ANIMALS", 	 "animals", 	   1,  true,  false,   false,											 false, false, 				   false },
--| Water Sources |--
	{ "Water_Source_Handpump", 		  "WATERSOURCE", "water_source",   1,  false, false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 	Desire("ADD", 5, 0.5),	false, 				   "WELL" },
	{ "Water_Source_Barrel", 		  "WATERSOURCE", "water_source",   3,  false, false,   {ZoneCircle( 0.8, {0, 0}, 8 )}, 	Desire("ADD", 10, 1),	false, 				   "WELL" },
	{ "Water_Source_Basin", 		  "WATERSOURCE", "water_source",   5,  false, false,   {ZoneSquare( {2, 1}, {0, 0} )}, 	Desire("ADD", 15, 1.5),	false, 				   "WELL" },
	{ "Water_Source_Well", 		  	  "WATERSOURCE", "water_source",   10, false, false,   {ZoneCircle( 1.3, {0, 0}, 8 )}, 	Desire("ADD", 20, 2),	false, 				   "WELL" },
--| Laundry |--
	{ "Cloth_Line1", 				  "LAUNDRY", 	 "laundry", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Cloth_Line2", 				  "LAUNDRY", 	 "laundry", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Cloth_Line3", 				  "LAUNDRY", 	 "laundry", 	   1,  true,  false,   false,											 false, false, 				   false },
--| Containers |--
	{ "Bucket_Water", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Bucket_Milk", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )},					 false, false, 				   false },
	{ "Tub", 						  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Tub_Milk", 					  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Trough", 					  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneSquare( {2, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Trough_Grain", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneSquare( {2, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Trough_Hay", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneSquare( {2, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Basket_XLarge", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Basket_Large_Berries", 		  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Large_Grapes", 		  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Large_Hops", 			  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Large_Fish", 			  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Berries", 			  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Grapes", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Hops", 				  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Basket_Large_Bread", 		  "CONTAINERS",  "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Pottery |--
	{ "Pot_Water", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Milk", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Honey", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Closed", 				  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Vase1", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Vase2", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Vase3", 					  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pot_Vase_Closed", 			  "POTTERY", 	 "containers", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Barrels |--
	{ "Barrel1", 					  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel2", 					  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneSquare( {0.2, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Barrel3", 					  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneSquare( {0.9, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Barrel_Small1", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneSquare( {0.4, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Barrel_Empty", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneSquare( {0.5, 0.7}, {0, 0} )}, 				 false, false, 				   false },
	{ "Barrel_Beer", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Barrel_Berries", 			  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel_Grapes", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel_Hops", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel_Fish", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel_Honey", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Barrel_Water", 				  "BARRELS", 	 "barrels", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Crates |--
	{ "Crate1", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate2", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {1.2, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate3", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {1, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate4", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {1.1, 1.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate5", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate6", 					  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {1.2, 0.3}, {0.1, 0} )}, 			 false, false, 				   false },
	{ "Crate_Flat1", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Flat2", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {1, 1}, {0, 0} )}, 					 false, false, 				   false },
	{ "Crate_Rope", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Coal", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Iron", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Stone", 				  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Flat_Gold", 			  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Crate_Flat_Iron", 			  "CRATES",		 "crates", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Chest", 						  "CRATES",		 "chest", 		   1,  true,  false,   {ZoneSquare( {0.6, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Chest_Open", 				  "CRATES",		 "chest", 		   1,  true,  false,   {ZoneSquare( {0.6, 0.4}, {0, 0} )}, 				 false, false, 				   false },
--| Cloth Spools |--
	{ "Cloth_Spool1", 				  "CLOTH",		 "cloth", 		   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Cloth_Spool2", 				  "CLOTH",		 "cloth", 		   1,  true,  false,   {ZoneSquare( {0.2, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Cloth_Spool3", 				  "CLOTH",		 "cloth", 		   1,  true,  false,   {ZoneSquare( {0.5, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Cloth_Spool4", 				  "CLOTH",		 "cloth", 		   1,  true,  false,   {ZoneSquare( {0.7, 0.6}, {0, 0} )}, 				 false, false, 				   false },
--| Furniture |--
	{ "Table_Wood1", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneSquare( {1.6, 0.7}, {0, 0} )}, 				 false, false, 				   false },
	{ "Table_Wood2", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneSquare( {1.9, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Chair_Wood1", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Chair_Wood2", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Table_Round1", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Table_Round2", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneCircle( 0.5, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Bench_Wood1", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneSquare( {1.2, 0.1}, {0, 0} )},				 false, false, 				   false },
	{ "Bench_Wood2", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneSquare( {1.2, 0.1}, {0, 0} )},				 false, false, 				   false },
	{ "Stool_Wood1", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Stool_Wood2", 				  "FURNITURE",	 "furniture", 	   1,  true,  false,   {ZoneSquare( {0.1, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Bench_Stone1", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneSquare( {1.6, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Bench_Stone2", 				  "FURNITURE",	 "furniture", 	   2,  true,  false,   {ZoneSquare( {2.1, 0.4}, {0, 0} )}, 				 false, false, 				   false },
--| Grain/Flour Sacks |--
	{ "Sack_Closed", 				  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneCircle( 0.01, {0, 0}, 8 )}, 				 false, false, 				   false },
	{ "Sack_Closed_Side", 			  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneSquare( {0.3, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Sack_Grain",					  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneCircle( 0.01, {0, 0}, 8 )}, 				 false, false, 				   false },
	{ "Sack_Grain_Side", 			  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneSquare( {0.5, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Sack_Square",				  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneSquare( {0.7, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Sack_Square2",				  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneSquare( {0.6, 0.4}, {-0.1, 0} )}, 			 false, false, 				   false },
	{ "Sack_Flour",					  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneCircle( 0.01, {0, 0}, 8 )}, 				 false, false, 				   false },
	{ "Sack_Flour_Side", 			  "GRAINS",		 "sacks", 		   1,  true,  false,   {ZoneSquare( {0.5, 0.1}, {0, 0} )}, 				 false, false, 				   false },
--| Hay Bales |--
	{ "Haybale1", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneSquare( {0.8, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Haybale2", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneSquare( {1.4, 0.8}, {0, 0} )}, 				 false, false, 				   false },
	{ "Haybale3", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneSquare( {1.3, 0.8}, {0, 0} )}, 				 false, false, 				   false },
	{ "Haybale4", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneSquare( {1, 0.8}, {0, 0} )}, 				 false, false, 				   false },
	{ "Haybale5", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneSquare( {1.5, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Haybale6", 					  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneCircle( 0.8, {0, 0}, 10 )}, 				 false, false, 				   false },
	{ "Thatch_Bundle1", 			  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneCircle( 1, {0, 0}, 10 )}, 					 false, false, 				   false },
	{ "Thatch_Bundle2", 			  "HAYBALES",    "haybales", 	   1,  true,  false,   {ZoneCircle( 0.6, {0, 0}, 10 )}, 				 false, false, 				   false },
--| Logs |--
	{ "Logs_Large1", 				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZoneSquare( {2.9, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Logs_Large2", 				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZoneSquare( {2.9, 1.8}, {0, 0} )}, 				 false, false, 				   false },
	{ "Logs_Large3", 				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZonePoints( {{1.6, 0.1},
																										 {1.6, -1.3},
																				   						 {-1.6, -1.3},
																										 {-1.6, 0.1},
																				   						 {-0.3, 2.4},
																										 {0.3, 2.4}} )}, 					 false, false, 				   false },
	{ "Stump",						  "LOGGING",	 "logs", 		   1,  true,  false,   {ZoneCircle( 0.2, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Logs_Small1", 				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZoneSquare( {1.9, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Logs_Small2",				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZoneSquare( {1.5, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Logs_Small3",				  "LOGGING",	 "logs", 		   1,  true,  false,   {ZonePoints( {{1.1, 0.2},
																										 {1.1, -0.4},
																				   						 {-0.9, -0.4},
																										 {-0.9, 1},
																				   						 {-0.2, 1},
																										 {-0.2, 0.2}} )}, 					 false, false, 				   false },
	{ "Logs_Small4",				  "LOGGING", 	 "logs", 		   1,  true,  false,   {ZoneSquare( {1.5, 1.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Firewood1", 					  "LOGGING", 	 "logs", 		   1,  true,  false,   {ZoneSquare( {0.6, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Firewood2",					  "LOGGING", 	 "logs", 		   1,  true,  false,   {ZoneSquare( {0.5, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Firewood_Covered1", 			  "LOGGING", 	 "logs", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Firewood_Covered2",			  "LOGGING", 	 "logs", 		   1,  true,  false,   {ZoneSquare( {0.8, 0.2}, {0, 0} )}, 				 false, false, 				   false },
--| Planks |--
	{ "Planks1", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZoneSquare( {1.4, 0.2}, {0, 0} )}, 				 false, false, 				   false },
	{ "Planks2", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZonePoints( {{-0.75, -0.25},
																										 {-0.35, -0.25},
																				   	  					 {-0.35, 0.5},
																										 {-0.3, 0.5},
																				   	  					 {-0.3, -0.25},
																										 {0.75, -0.25},
																				   	  					 {0.75, -0.3},
																										 {-0.75, -0.3}} )}, 				 false, false, 				   false },
	{ "Planks3", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZoneSquare( {1.4, 0.4}, {0, 0} )}, 				 false, false, 				   false },
	{ "Planks4", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZoneSquare( {1.4, 0.3}, {0, 0} )}, 				 false, false, 				   false },
	{ "Planks5", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZoneSquare( {1.4, 0.5}, {0, 0} )}, 				 false, false, 				   false },
	{ "Planks6", 					  "PLANKS",		 "planks", 		   1,  true,  false,   {ZoneSquare( {1.1, 0.7}, {0, 0} )}, 				 false, false, 				   false },
--| Pumpkins |--
	{ "Pumpkin", 					  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.15, {0, 0}, 8 )}, 				 false, false, 				   false },
	{ "Pumpkin2", 					  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pumpkin3", 					  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pumpkin4", 					  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pumpkin_Carved", 			  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.15, {0, 0}, 8 )}, 				 false, false, 				   false },
	{ "Pumpkin_Carved2", 			  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.1, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pumpkin_Carved3", 			  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )}, 					 false, false, 				   false },
	{ "Pumpkin_Carved4", 			  "PUMPKINS",    "pumpkins", 	   1,  true,  false,   {ZoneCircle( 0.3, {0, 0}, 8 )}, 					 false, false, 				   false },
--| Gravestones |--
	{ "Gravestone1", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone2", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone3", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone4", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone5", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone6", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone7", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone8", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.2, 0.2}, {0, 0} )},				 false, Estate("CLERGY", 1),   false },
	{ "Gravestone9", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )},				 false, Estate("CLERGY", 2),   false },
	{ "Gravestone10", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )},				 false, Estate("CLERGY", 2),   false },
	{ "Gravestone11", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )},				 false, Estate("CLERGY", 2),   false },
	{ "Gravestone12", 				  "GRAVESTONES", "gravestones",    1,  true,  false,   {ZoneSquare( {0.4, 0.4}, {0, 0} )},				 false, Estate("CLERGY", 2),   false },
	{ "Coffin_Stone", 				  "GRAVESTONES", "coffin",		   5,  true,  false,   {ZoneSquare( {1.2, 2.6}, {0, 0} )}, 				 false, Estate("CLERGY", 5),   false },
--| Windows |--
	{ "Window1", 					  "WINDOWS", 	 "windows", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Window2", 					  "WINDOWS", 	 "windows", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Window3", 					  "WINDOWS", 	 "windows", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Window4", 					  "WINDOWS", 	 "windows", 	   1,  true,  false,   false,											 false, false, 				   false },
	{ "Window5", 					  "WINDOWS", 	 "windows", 	   1,  true,  false,   false,											 false, false, 				   false },
--| Doors |--
	{ "Wooden_Door1", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door2", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door3", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door4", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door5", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door6", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Wooden_Door7", 				  "DOORS",		 "doors", 		   1,  true,  false,   false,											 false, false, 				   false },
	{ "Woodengate_Locked", 			  "DOORS",		 "doors", 		   1,  true,  false,   {ZoneSquare( {4, 0.2}, {0, 0} ) }, 				 false, false, 				   false },
--| Animated Gates |--
	{ "Fence7", 					  "GATES",		 "fences", 		   2,  false, "MINOR", {ZoneCircle( 0.7, {1.2, 0.7}, 20 ),
																		   				    ZoneSquare( {0.5, 0.5}, {-1, 0} )}, 			 false, false,				   "SINGLE_FENCEGATE" },
	{ "Fence8", 					  "GATES",		 "fences", 		   2,  false, "MINOR", {ZoneCircle( 1, {-2, 0.7}, 20 ),
																						    ZoneCircle( 1, { 2, 0.7}, 20 )}, 				 false, false,				   "DOUBLE_FENCEGATE" },
	{ "Woodengate_Palisade_Animated", "GATES",		 "doors", 		   5,  false, false,   {ZoneCircle( 1.2, {-2, 0.5}, 20 ),
																						    ZoneCircle( 1.2, { 2, 0.5}, 20 )}, 				 false, false,				   "DOUBLE_WOODENGATE_PALISADE" },
	{ "Woodengate_Animated", 		  "GATES",		 "doors", 		   5,  false, false,   {ZoneCircle( 1.2, {-2, 0.5}, 20 ),
																						    ZoneCircle( 1.2, { 2, 0.5}, 20 )},				 false, false,				   "DOUBLE_WOODENGATE" },
--| Fences |--
	{ "Fence1", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1.7, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Fence2", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1.7, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Fence3", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1.7, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Fence4", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1.7, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Fence5", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1.7, 0.1}, {0, 0} )}, 				 false, false, 				   false },
	{ "Fence6", 					  "FENCES", 	 "fences", 		   1,  false, "MINOR", {ZoneSquare( {1, 1}, {-1, 0} ),
																		   				    ZonePoints( {{1, 0.1},
																										 {1.2, 1.4},
																										 {1.1, 1.4},
																										 {0.9, 0.1}} )}, 					 false, false, 				   false },
--| Grass Clearing |--
	{ "Grass_Clearing_Small", 		  "GRASSCLEAR",	 "grass_clearing", 0,  false, false,   false,						 Desire("SUBSTRACT", 1, 0), false, 				   false },
	{ "Grass_Clearing_Medium", 		  "GRASSCLEAR",	 "grass_clearing", 0,  false, false,   false,						 Desire("SUBSTRACT", 4, 0), false, 				   false },
	{ "Grass_Clearing_Large", 		  "GRASSCLEAR",	 "grass_clearing", 0,  false, false,   false,						 Desire("SUBSTRACT", 6, 0), false, 				   false },
	{ "Grass_Clearing_XLarge", 		  "GRASSCLEAR",	 "grass_clearing", 0,  false, false,   false,						 Desire("SUBSTRACT", 8, 0), false, 				   false },
	{ "Grass_Clearing_Small_Square",  "GRASSCLEAR",	 "grass_clearing", 0,  false, "GCL",   {ZoneNoGrass(true, {2.3, 2.3}, {0, 0})}, 		 false, false, 				   false },
	{ "Grass_Clearing_Medium_Square", "GRASSCLEAR",	 "grass_clearing", 0,  false, "GCL",   {ZoneNoGrass(true, {5.1, 5.1}, {0, 0})}, 		 false, false, 				   false },
	{ "Grass_Clearing_Large_Square",  "GRASSCLEAR",	 "grass_clearing", 0,  false, "GCL",   {ZoneNoGrass(true, {10, 10}, {0, 0})}, 			 false, false, 				   false },
	{ "Grass_Clearing_XLarge_Square", "GRASSCLEAR",	 "grass_clearing", 0,  false, "GCL",   {ZoneNoGrass(true, {15, 15}, {0, 0})}, 			 false, false, 				   false },
--|	Removed Assets |--
	{ "Cart_Cage",					  nil,  		 "punishment",	   1,  true,  false,   {ZoneSquare( {1.8, 3}, {0, 0.2} )},				 false, false, 				   false },
	{ "Cart", 						  nil,   		 "cart", 		   5,  true,  false,   {ZoneSquare( {1.8, 2.8}, {0, -0.1} )}, 			 false, Estate("LABOUR",  2),  false },
	{ "Cart_Canopy", 				  nil,   		 "cart", 		   5,  true,  false,   {ZoneSquare( {1.8, 2.8}, {0, -0.1} )}, 			 false, Estate("LABOUR",  2),  false },
	{ "Barrel_Large", 				  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Barrels", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Crates", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Furniture", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Planks", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Logs", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Spools", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Pottery", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Grain", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.5}, {0, 0} )}, 				 false, false,				   false },
	{ "Hay", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.6}, {0, 0} )}, 				 false, false,				   false },
	{ "Thatch", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Coal", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Bricks", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Stones", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.7}, {0, 0} )}, 				 false, false,				   false },
	{ "Mix1", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Mix2", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Food", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Goods", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Tools", 						  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
	{ "Weapons", 					  nil,   		 "cart", 		   1,  false, "MINOR", {ZoneSquare( {1, 1.9}, {0, 0} )}, 				 false, false,				   false },
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
	local tableValue = {
		SetName = "SET_" .. color .. "_NAME",
		MaterialList = { "CLOTH_" .. color .. "_CART_MATERIAL",
						 "CLOTH_" .. color .. "_LOGS_MATERIAL",
						 "CLOTH_" .. color .. "_SIEGE_MATERIAL",
						 "CLOTH_" .. color .. "_SPOOLS_MATERIAL",
						 "CLOTH_" .. color .. "_WEAPONS_MATERIAL",
						 "CLOTH_" .. color .. "_WELL_MATERIAL" }}
	table.insert(ThemeList, tablePos, tableValue)
end

------------------------
--| Theme List Table |--
------------------------
local themeTable = {
	{ "RED",    1 },
	{ "BLUE",   2 },
	{ "GREEN",  3 },
	{ "YELLOW", 4 },
	{ "PURPLE", 5 },
	{ "BROWN",  6 },
	{ "BLACK",  7 },
	{ "GREY",   8 },
	{ "WHITE",  9 }
}
for k, v in pairs(themeTable) do
	ThemeSetList(v)
end

-------------------
--| Core Assets |--
-------------------
FantasyDeco:registerAssetId("models/core.fbx/Prefab/Fantasy_Deco_Core", "PREFAB_FANTASY_DECO_CORE")
FantasyDeco:registerAssetId("models/cover.fbx/Prefab/Fantasy_Deco_Cover", "PREFAB_FANTASY_DECO_COVER")
FantasyDeco:registerAsset({
	DataType = "BUILDING_PART",
	Id = "FANTASY_DECO_CORE",
	Name = "FANTASY_DECO_NAME",
	AssetBuildingFunction = "BUILDING_FUNCTION_FANTASY_DECO_CORE",
	IsVisibleWhenBuilt = false,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FANTASY_DECO_CORE"
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
FantasyDeco:registerAsset({
	DataType = "BUILDING_PART",
	Id = "FANTASY_DECO_COVER",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FANTASY_DECO_COVER"
	}
})

-------------------------
--| Unlockable Assets |--
-------------------------
FantasyDeco:registerAsset({
    DataType = "EVENT",
    Id = "EVENT_FANTASY_DECO_UNLOCK",
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
                    "FANTASY_DECORATIONS",
                },
            },
        }
    }
})
FantasyDeco:overrideAsset({
    Id = "DEFAULT_BALANCING",
    EventList = {
        Action = "APPEND",
        "EVENT_FANTASY_DECO_UNLOCK",
    }
})

----------------
--| Core Job |--
----------------
FantasyDeco:registerAsset({
	DataType = "JOB",
	Id = "JOB_FANTASY_DECO_CORE",
	JobName = "JOB_FANTASY_DECO_CORE_NAME",
	IsLockedByDefault = false,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})

---------------------
--| Core Function |--
---------------------
FantasyDeco:registerAsset({
	DataType = "BUILDING_FUNCTION_WORKPLACE",
	Id = "BUILDING_FUNCTION_FANTASY_DECO_CORE",
	Name = "BUILDING_FUNCTION_FANTASY_DECO_CORE_NAME",
	IsDescriptionOverride = false,
	WorkerCapacity = 0,
	RelatedJob = {
		Job = "JOB_FANTASY_DECO_CORE",
		Behavior = "BEHAVIOR_WORK"
	}
})

----------------------
--| Scaling Assets |--
----------------------
FantasyDeco:registerAssetId("models/scaling.fbx/Prefab/FD_Root_Part", "PREFAB_FD_ROOT_PART")
FantasyDeco:registerAssetId("models/scaling.fbx/Prefab/FD_Tiling_Part", "PREFAB_FD_TILING_PART")
FantasyDeco:registerAsset({
	DataType = "BUILDING_PART",
	Id = "FD_TILING_PART",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_FD_TILING_PART"
	}
})

-------------------------
--| Monument Building |--
-------------------------
FantasyDeco:registerAsset({
	DataType = "BUILDING",
	Id = "FANTASY_DECORATIONS",
	Name = "FANTASY_DECO_NAME",
	Description = "FANTASY_DECO_DESC",
	BuildingType = "MODS",
	AssetMiniatureBuildingPart = "FANTASY_DECO_COVER",
	AssetCoreBuildingPart = "FANTASY_DECO_CORE",
	IsEditable = true,
	AssetBuildingPartList = AssetList,
	MaterialSetList = ThemeList
})