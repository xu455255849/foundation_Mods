local MedievalWall = ...

-----------------------------------
--| Extended Building Functions |--
-----------------------------------
MedievalWall:registerAsset({
    DataType = "BUILDING_FUNCTION_SINGLE_DOOR",
    Id = "BUILDING_FUNCTION_IRON_GATE_DOOR",
	Description = "ANIMATED_GATE_IRON_GATE_DOOR_DESC",
	TriggeringDistance = 3.0,
	OpeningAngle = 100.0,
	OpeningSpeed = 3.0,
	OpenHoldTime = 3.0,
    DoorPivotPoint = { 0.59, 0, 0 }
})
MedievalWall:registerAsset({
    DataType = "BUILDING_FUNCTION_SINGLE_DOOR",
    Id = "BUILDING_FUNCTION_IRON_GATE_SINGLE",
	Description = "ANIMATED_GATE_IRON_GATE_SINGLE_DESC",
	TriggeringDistance = 3.0,
	OpeningAngle = 90.0,
	OpeningSpeed = 1.7,
	OpenHoldTime = 1.7,
    DoorPivotPoint = { 1.209, 0, 0 }
})
MedievalWall:registerAsset({
    DataType = "BUILDING_FUNCTION_DOUBLE_DOOR",
    Id = "BUILDING_FUNCTION_IRON_GATE_DOUBLE",
	Description = "ANIMATED_GATE_IRON_GATE_DOUBLE_DESC",
	TriggeringDistance = 3.0,
	OpeningAngle = 90.0,
	OpeningSpeed = 1.7,
	OpenHoldTime = 1.7,
    LeftPivotPoint = { 2.525, 0, 0 },
    RightPivotPoint = { -2.525, 0, 0 }
})

----------------------------------------
--| Building Part Miniature Function |--
----------------------------------------
local function Miniature(value)
	local partName = value[1]
	local camPos = 	 value[2]
	MedievalWall:overrideAsset({
		Id = string.upper(partName) .. "_PART",
		ConstructorData = {
			MiniatureConfig = {
	            ClipUnderGround = false,
	            GroupHeight = 0,
	            CameraPosition = camPos,
	            OrientationOffset = 0,
	            CameraPitchOffset = 0
	        }
		}
	})
end

-------------------------------------
--| Building Part Miniature Table |--
-------------------------------------
local miniatureTable = {	--| LeftRight, UpDown, InOut |--
	{ "Deco_Pillar_Sundial",  		{ 0, 0.1, -2 }},
	{ "Deco_Pillar_Dragon",  	 	{ 0, 0.4, -3 }},
	{ "Ornament_Spear",  			{ 0, 0.19, -1.1 }},
	{ "Ornament_Spear_Gold",  		{ 0, 0.19, -1.1 }}
}
for k, v in pairs(miniatureTable) do
	Miniature(v)
end

----------------------------------
--| Pathway Collision Function |--
----------------------------------
local function PathwayCollision(partName)
	local pathModel = "models/stonewall.fbx/Prefab/" .. partName
	local pathBlank = "models/stonewall.fbx/Prefab/" .. partName .. "_Blank"
	MedievalWall:registerPrefabComponent(pathModel, { DataType = "COMP_GROUNDED" })
	MedievalWall:registerPrefabComponent(pathBlank, { DataType = "COMP_GROUNDED" })
	MedievalWall:registerPrefabComponent(pathBlank, { DataType = "COMP_RIGID_BODY", Mass = 0 })
	MedievalWall:configurePrefabFlagList(pathBlank, { "TERRAIN" })
end
for i = 0, 24 do --| Clean Square Pathway |--
	PathwayCollision("Pathway_Clean_Square_Part/Clean1." .. string.sub("0" .. i, -2))
end
for i = 0, 14 do --| Clean Corner Pathway |--
	PathwayCollision("Pathway_Clean_Corner_Part/Clean2." .. string.sub("0" .. i, -2))
end
for i = 0, 19 do --| Clean Cross Pathway |--
	PathwayCollision("Pathway_Clean_Cross_Part/Clean3." .. string.sub("0" .. i, -2))
end
for i = 0, 224 do --| Clean XL Square Pathway |--
	PathwayCollision("Pathway_Clean_XL_Square_Part/Clean4." .. string.sub("00" .. i, -3))
end
for i = 0, 14 do --| Messy Square Pathway |--
	PathwayCollision("Pathway_Messy_Square_Part/Messy1." .. string.sub("0" .. i, -2))
end
for i = 0, 10 do --| Messy Corner Pathway |--
	PathwayCollision("Pathway_Messy_Corner_Part/Messy2." .. string.sub("0" .. i, -2))
end
for i = 0, 15 do --| Messy Cross Pathway |--
	PathwayCollision("Pathway_Messy_Cross_Part/Messy3." .. string.sub("0" .. i, -2))
end
for i = 0, 134 do --| Messy XL Square Pathway |--
	PathwayCollision("Pathway_Messy_XL_Square_Part/Messy4." .. string.sub("00" .. i, -3))
end

-----------------------------------
--| Custom Attach Node Function |--
-----------------------------------
local function CustomAttach(partName, nodeName, attachName)
	MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partName .. "_Part/Attach_" .. nodeName, {
		DataType = "COMP_BUILDING_ATTACH_NODE",
		AttachNodeTypeList = { attachName }
	})
end
--| 1 Attach Point |--
	CustomAttach("Ornament_Cross", 				"Ornament.01", 			 "ORNAMENT")
	CustomAttach("Ornament_Cross_Gold", 		"Ornament.02", 			 "ORNAMENT")
	CustomAttach("Ornament_Fleur", 				"Ornament.03", 			 "ORNAMENT")
	CustomAttach("Ornament_Fleur_Gold",			"Ornament.04", 			 "ORNAMENT")
	CustomAttach("Ornament_Spear", 				"Ornament.05", 			 "ORNAMENT")
	CustomAttach("Ornament_Spear_Gold", 		"Ornament.06", 			 "ORNAMENT")
	CustomAttach("Ornament_Star", 				"Ornament.07", 			 "ORNAMENT")
	CustomAttach("Ornament_Star_Gold", 			"Ornament.08", 			 "ORNAMENT")
--| 2 Attach Points |--
for i = 0, 1 do
	CustomAttach("Pathway_Clean_Corner", 		"Brick_Corner1."   .. i, "PATHWAY")
	CustomAttach("Pathway_Messy_Corner", 		"Brick_Corner2."   .. i, "PATHWAY")
end
--| 3 Attach Points |--
for i = 0, 2 do
	CustomAttach("Iron_Gate_Fence_Half", 		"Ornament_Half."   .. i, "ORNAMENT")
end
--| 4 Attach Points |--
for i = 0, 3 do
	CustomAttach("Base_Brick",					"Brick_Base1."     .. i, "PATHWAY")
	CustomAttach("Base_Cobblestone",			"Brick_Base2."     .. i, "PATHWAY")
	CustomAttach("Pathway_Clean_Square",		"Brick_Square1."   .. i, "PATHWAY")
	CustomAttach("Pathway_Messy_Square",		"Brick_Square2."   .. i, "PATHWAY")
	CustomAttach("Pathway_Clean_XL_Square",		"Brick_XLSquare1." .. i, "PATHWAY")
	CustomAttach("Pathway_Messy_XL_Square",		"Brick_XLSquare2." .. i, "PATHWAY")
	CustomAttach("Pathway_Clean_Cross",			"Brick_Cross1."    .. i, "PATHWAY")
	CustomAttach("Pathway_Messy_Cross",			"Brick_Cross2."    .. i, "PATHWAY")
end
--| 6 Attach Points |--
for i = 0, 5 do
	CustomAttach("Iron_Gate_Fence_Full", 		"Ornament_Full."   .. i, "ORNAMENT")
	CustomAttach("Iron_Gate_Fence_Full_Curved", "Ornament_Curved." .. i, "ORNAMENT")
end

------------------------------------
--| Grounding Component Function |--
------------------------------------
local function GroundingComp(value)
	local partName = value[1]
	MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partName, {
		DataType = "COMP_GROUNDED"
	})
end

---------------------------------
--| Grounding Component Table |--
---------------------------------
local groundTable = {
--| FEBF Triggers |--
	{ "Iron_Gate_Door_Animated_Part/Trigger1" },
	{ "Iron_Gate_Single_Animated_Part/Trigger2" },
	{ "Iron_Gate_Double_Animated_Part/Trigger3" },
--| Pavilion Pillars |--
	{ "Pavilion_Part/Base1" },
	{ "Pavilion_Part/Base2" },
	{ "Pavilion_Part/Base3" },
	{ "Pavilion_Part/Base4" },
	{ "Pavilion_Part/Base5" },
	{ "Pavilion_Part/Base6" },
--| Draggable Wall Pillars |--
	{ "Wall_Iron_Fleur_Dark_Part/PillarD1" },
	{ "Wall_Iron_Dark_Part/PillarD2" },
	{ "Wall_Stone_Dark_Part/PillarD3" },
	{ "Wall_Iron_Fleur_Light_Part/PillarL1" },
	{ "Wall_Iron_Light_Part/PillarL2" },
	{ "Wall_Stone_Light_Part/PillarL3" },
}
for k, v in pairs(groundTable) do
	GroundingComp(v)
end