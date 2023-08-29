local NatureDeco = ...

-----------------------------------
--| Custom Attach Node Function |--
-----------------------------------
local function CustomAttach(value)
	local partName =   value[1]
	local nodeName =   value[2]
	NatureDeco:registerPrefabComponent("models/nature.fbx/Prefab/" .. partName .. "_Part/Attach_" .. nodeName, {
		DataType = "COMP_BUILDING_ATTACH_NODE",
		AttachNodeTypeList = { "TREE" }
	})
end
local attachTable = {
	{ "Tree1_Green",  "Tree1.1" },
	{ "Tree1_Orange", "Tree1.2" },
	{ "Tree1_Red", 	  "Tree1.3" },
	{ "Tree1_Yellow", "Tree1.4" },
	{ "Tree2_Green",  "Tree2.1" },
	{ "Tree2_Orange", "Tree2.2" },
	{ "Tree2_Red", 	  "Tree2.3" },
	{ "Tree2_Yellow", "Tree2.4" },
	{ "Tree3_Green",  "Tree3.1" },
	{ "Tree3_Orange", "Tree3.2" },
	{ "Tree3_Red",    "Tree3.3" },
	{ "Tree3_Yellow", "Tree3.4" },
	{ "Tree4_Green",  "Tree4.1" },
	{ "Tree4_Orange", "Tree4.2" },
	{ "Tree4_Red",    "Tree4.3" },
	{ "Tree4_Yellow", "Tree4.4" },
	{ "Tree5_Green",  "Tree5.1" },
	{ "Tree5_Orange", "Tree5.2" },
	{ "Tree5_Red", 	  "Tree5.3" },
	{ "Tree5_Yellow", "Tree5.4" },
	{ "Tree6_Green",  "Tree6.1" },
	{ "Tree6_Orange", "Tree6.2" },
	{ "Tree6_Red", 	  "Tree6.3" },
	{ "Tree6_Yellow", "Tree6.4" },
	{ "Tree7_Green",  "Tree7.1" },
	{ "Tree7_Orange", "Tree7.2" },
	{ "Tree7_Red", 	  "Tree7.3" },
	{ "Tree7_Yellow", "Tree7.4" },
	{ "Tree8_Green",  "Tree8.1" },
	{ "Tree8_Orange", "Tree8.2" },
	{ "Tree8_Red", 	  "Tree8.3" },
	{ "Tree8_Yellow", "Tree8.4" },
	{ "Tree_Dead1",   "TreeDead.1" },
	{ "Tree_Dead2",   "TreeDead.2" },
	{ "Tree_Dead3",   "TreeDead.3" },
	{ "Tree_Dead4",   "TreeDead.4" },
	{ "Tree_Swamp1",  "TreeSwamp.1" },
	{ "Tree_Swamp2",  "TreeSwamp.2" },
	{ "Tree_Swamp3",  "TreeSwamp.3" },
	{ "Tree_Swamp4",  "TreeSwamp.4" },
	}
for k, v in pairs(attachTable) do
	CustomAttach(v)
end

------------------------------------
--| Grounding Component Function |--
------------------------------------
local function GroundingComp(partName, isOnWater)
	NatureDeco:registerPrefabComponent("models/nature.fbx/Prefab/" .. partName, {
		DataType = "COMP_GROUNDED",
		GroundToWater = isOnWater
	})
end
	GroundingComp("Lilypad1_Part", 					 true)
	GroundingComp("Lilypad2_Part", 					 true)
	GroundingComp("Lilypad3_Part", 					 true)
	GroundingComp("Lilypad4_Part", 					 true)
	GroundingComp("Hedge_Full_Part", 				 false)
	GroundingComp("Hedge_Half_Part", 				 false)
	GroundingComp("Hedge_Full_Short_Part", 			 false)
	GroundingComp("Hedge_Half_Short_Part", 			 false)
	GroundingComp("Hedge_Full_Angled_Part", 		 false)
	GroundingComp("Hedge_Half_Angled_Part", 		 false)
	GroundingComp("Hedge_Full_Curved_Part", 		 false)
	GroundingComp("Hedge_Full_Short_Curved_Part", 	 false)
	GroundingComp("Hedge_Full_Archway_Part", 		 false)
	GroundingComp("Hedge_Half_Archway_Part", 		 false)
	GroundingComp("Hedge_Pillar_Part", 				 false)
	GroundingComp("Hedge_Pillar_Short_Part", 		 false)
for i = 1, 3 do --| 3 Grounded Parts |--
	GroundingComp("Mushroom_Log_Part/Mushroom" .. i, false)
	GroundingComp("Stone4_Part/Set4." .. i, 		 false)
	GroundingComp("Stone5_Part/Set5." .. i, 		 false)
	GroundingComp("Stone8_Part/Set8." .. i, 		 false)
end
for i = 1, 4 do --| 4 Grounded Parts |--
	GroundingComp("Stone6_Part/Set6." .. i,			 false)
	GroundingComp("Stone9_Part/Set9." .. i,			 false)
end
for i = 1, 5 do --| 5 Grounded Parts |--
	GroundingComp("Barrier_Stone_Part/Rock" .. i,	 false)
	GroundingComp("Stone2_Part/Set2." .. i,			 false)
	GroundingComp("Stone3_Part/Set3." .. i,			 false)
end
for i = 1, 6 do --| 6 Grounded Parts |--
	GroundingComp("Stone1_Part/Set1." .. i,			 false)
	GroundingComp("Stone7_Part/Set7." .. i,			 false)
end
for i = 1, 7 do --| 7 Grounded Parts |--
	GroundingComp("Barrier_Wood_Part/Log" .. i,		 false)
end