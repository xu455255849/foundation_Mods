local FantasyDeco = ...

-----------------------------------
--| Extended Building Functions |--
-----------------------------------
FantasyDeco:registerAsset({
    DataType = "BUILDING_FUNCTION_DOUBLE_DOOR",
    Id = "BUILDING_FUNCTION_DOUBLE_WOODENGATE",
	Description = "ANIMATED_GATE_WOODENGATE_DESC",
	TriggeringDistance = 4.0,
	OpeningAngle = 100.0,
	OpeningSpeed = 1.7,
	OpenHoldTime = 1.7,
    LeftPivotPoint = { 1.7, 0, 0 },
    RightPivotPoint = { -1.7, 0, 0 }
})
FantasyDeco:registerAsset({
    DataType = "BUILDING_FUNCTION_DOUBLE_DOOR",
    Id = "BUILDING_FUNCTION_DOUBLE_WOODENGATE_PALISADE",
	Description = "ANIMATED_GATE_PALISADE_DESC",
	TriggeringDistance = 4.0,
	OpeningAngle = 100.0,
	OpeningSpeed = 1.7,
	OpenHoldTime = 1.7,
    LeftPivotPoint = { 2.0, 0, 0 },
    RightPivotPoint = { -2.0, 0, 0 }
})
FantasyDeco:registerAsset({
    DataType = "BUILDING_FUNCTION_SINGLE_DOOR",
    Id = "BUILDING_FUNCTION_SINGLE_FENCEGATE",
	Description = "ANIMATED_GATE_FENCE7_DESC",
	TriggeringDistance = 3.0,
	OpeningAngle = 100.0,
	OpeningSpeed = 2.0,
	OpenHoldTime = 2.0,
    DoorPivotPoint = { 0.85, 0, 0 },
	DoorNodeName = "Gate"
})
FantasyDeco:registerAsset({
    DataType = "BUILDING_FUNCTION_DOUBLE_DOOR",
    Id = "BUILDING_FUNCTION_DOUBLE_FENCEGATE",
	Description = "ANIMATED_GATE_FENCE8_DESC",
	TriggeringDistance = 4.0,
	OpeningAngle = 100.0,
	OpeningSpeed = 1.7,
	OpenHoldTime = 1.7,
    LeftPivotPoint = { 1.85, 0, 0 },
    RightPivotPoint = { -1.85, 0, 0 }
})

---------------------------
--| Resource Containers |--
---------------------------
FantasyDeco:registerPrefabComponent("models/bushes.fbx/Prefab/Bush_Berries_Blue_Part", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "BERRIES",
    IsReplenishable = true,
    ReplenishDurationInDays = 7,
    ReplenishQuantity = 100,
    ResourceValue = 2,
    AvailableQuantity = 100,
    Radius = 1,
    IsDestroyWhenEmpty = false,
    HasMaximumWorkstation = false
})
FantasyDeco:registerPrefabComponent("models/bushes.fbx/Prefab/Bush_Berries_Red_Part", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "BERRIES",
    IsReplenishable = true,
    ReplenishDurationInDays = 7,
    ReplenishQuantity = 100,
    ResourceValue = 2,
    AvailableQuantity = 100,
    Radius = 1,
    IsDestroyWhenEmpty = false,
    HasMaximumWorkstation = false
})

-----------------------------
--| Interactive Locations |--
-----------------------------
local function Interactive(partName, partNum)
	FantasyDeco:registerPrefabComponent("models/furniture.fbx/Prefab/" .. partName .. "_Part/Attach_" .. partName .. "." .. partNum, {
		DataType = "COMP_INTERACTIVE_LOCATION",
		InteractiveLocationSetup = "INTERACTIVE_LOCATION_SETUP_SITTING_2"
	})
end
for i = 1, 2 do
	Interactive("Bench_Wood1", "0" ..i)
	Interactive("Bench_Wood2", "0" ..i)
	Interactive("Bench_Stone1", "0" ..i)
	Interactive("Bench_Stone2", "0" ..i)
end
Interactive("Chair_Wood1", "01")
Interactive("Chair_Wood2", "01")
Interactive("Stool_Wood1", "01")
Interactive("Stool_Wood2", "01")

-- FantasyDeco:registerAsset({
-- 	DataType = "BUILDING_FUNCTION_ASSIGNABLE",
-- 	Id = "BUILDING_FUNCTION_ASSIGNABLE_FREETIME",
-- 	AuthorizedFunctionList = "ASSIGNABLE_LIST_FREETIME"
-- })
-- FantasyDeco:registerAsset({
-- 	DataType = "ASSIGNABLE_BUILDING_FUNCTION_LIST",
-- 	Id = "ASSIGNABLE_LIST_FREETIME",
-- 	AssetFunctionList = { "BUILDING_FUNCTION_FREETIME1", "BUILDING_FUNCTION_FREETIME2" }
-- })
-- FantasyDeco:registerAsset({
-- 	DataType = "BUILDING_FUNCTION_INTERACTIVE_LOCATION",
-- 	Id = "BUILDING_FUNCTION_FREETIME1",
-- 	Name = "BUILDING_FUNCTION_FREETIME1_NAME",
-- 	AssetInteractiveLocationSetup = "INTERACTIVE_LOCATION_SETUP_SITTING"
-- })
-- FantasyDeco:registerAsset({
-- 	DataType = "BUILDING_FUNCTION_INTERACTIVE_LOCATION",
-- 	Id = "BUILDING_FUNCTION_FREETIME2",
-- 	Name = "BUILDING_FUNCTION_FREETIME2_NAME",
-- 	AssetInteractiveLocationSetup = "INTERACTIVE_LOCATION_SETUP_SITTING_2"
-- })
-- FantasyDeco:registerAsset({
-- 	DataType = "INTERACTIVE_LOCATION_SETUP",
-- 	Id = "INTERACTIVE_LOCATION_FREETIME",
-- 	PurposeList = {
-- 		"FREE_TIME"
-- 	},
-- 	CharacterSetup = {
-- 		DataType = "CHARACTER_SETUP",
-- 		IdleAnimation = "BENCH_SIT_01"
-- 	}
-- })

-----------------------------------
--| Custom Attach Node Function |--
-----------------------------------
local function CustomAttach(partName, fileName, nodeName, attachName)
	FantasyDeco:registerPrefabComponent("models/" .. fileName .. ".fbx/Prefab/" .. partName .. "_Part/Attach_" .. nodeName, {
		DataType = "COMP_BUILDING_ATTACH_NODE",
		AttachNodeTypeList = { attachName }
	})
end
for i = 0, 7 do --| 8 Attach Points |--
	CustomAttach("Grass_Clearing_Small_Square",  "grass_clearing", "GCL_Small."  ..i, "GCL")
	CustomAttach("Grass_Clearing_Medium_Square", "grass_clearing", "GCL_Medium." ..i, "GCL")
	CustomAttach("Grass_Clearing_Large_Square",  "grass_clearing", "GCL_Large."  ..i, "GCL")
	CustomAttach("Grass_Clearing_XLarge_Square", "grass_clearing", "GCL_XLarge." ..i, "GCL")
end
CustomAttach("Planter_Stone_Large",  "flowers",   "Tree.01",  		 "TREE")
CustomAttach("Planter_Stone_Large2", "flowers",   "Tree.02",  		 "TREE")
CustomAttach("Ballista_NS", 		 "siege", 	  "Siege.01", 		 "SIEGE")

----------------------------------------
--| Building Part Miniature Function |--
----------------------------------------
local function Miniature(value)
	local partName = value[1]
	local camPos = 	 value[2]
	FantasyDeco:overrideAsset({
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
	{"Grass_Clearing_Small",  		 { 0, -1.4, -4.5 }},
	{"Grass_Clearing_Medium", 		 { 0, -1.4, -4.5 }},
	{"Grass_Clearing_Large", 		 { 0, -1.4, -4.5 }},
	{"Grass_Clearing_XLarge", 		 { 0, -1.4, -4.5 }},
	{"Grass_Clearing_Small_Square",  { 0, -1.4, -4.5 }},
	{"Grass_Clearing_Medium_Square", { 0, -1.4, -4.5 }},
	{"Grass_Clearing_Large_Square",  { 0, -1.4, -4.5 }},
	{"Grass_Clearing_XLarge_Square", { 0, -1.4, -4.5 }},
	{"Lantern1",  			 		 { 0, 0.3, -2 }},
	{"Lantern2",  			 		 { 0, 0.3, -2 }},
	{"Lantern3",  			 		 { 0, 0.3, -2 }},
	{"Lantern4",  			 		 { 0, 0.3, -2 }},
	{"Lantern5",  			 		 { 0, 0.3, -2 }},
	{"Lantern6",  			 		 { 0, 0.3, -2 }},
	{"Lantern7",  			 		 { 0, 0.3, -2 }},
	{"Lantern8",  			 		 { 0, 0.3, -2 }},
	{"Lantern9",  			 		 { 0, 0.3, -2 }},
	{"Lantern10",  			 		 { 0, 0.3, -2 }},
	{"Lantern11",  			 		 { 0, 0.3, -2 }},
	{"Lantern12",  			 		 { 0, 0.3, -2 }},
	{"Rabbit",  			 		 { 0, 0.3, -2 }},
	{"Frog",  			 			 { 0, 0.1, -1.5 }}
}
for k, v in pairs(miniatureTable) do
	Miniature(v)
end

-------------------------------
--| Grass Clearing Function |--
-------------------------------
local function GrassClear(partName, hardRadius, softRadius, strength)
	FantasyDeco:registerPrefabComponent("models/grass_clearing.fbx/Prefab/" .. partName .. "_Part", {
		DataType = "COMP_DIRT_CIRCLE",
		IsPermanent = true,
		HardRadius = hardRadius,
		SoftRadius = softRadius,
		Strength = 	 strength
	})
end
GrassClear("Grass_Clearing_Small",  0.5, 1.5, 1 )
GrassClear("Grass_Clearing_Medium", 3, 4, 1 )
GrassClear("Grass_Clearing_Large",  5, 7, 1 )
GrassClear("Grass_Clearing_XLarge", 7, 9, 1 )

------------------------------------
--| Grounding Component Function |--
------------------------------------
local function GroundingComp(value)
	local partName =  value[1]
	local fileName =  value[2]
	local isOnWater = value[3]
	local setOrient = value[4]
	FantasyDeco:registerPrefabComponent("models/" .. fileName .. ".fbx/Prefab/" .. partName, {
		DataType = "COMP_GROUNDED",
		GroundToWater = isOnWater,
		SetOrientation = setOrient
	})
end

---------------------------------
--| Grounding Component Table |--
---------------------------------------------------------------
--| partName[1] - fileName[2] - isOnWater[3] - setOrient[4] |--
---------------------------------------------------------------
local groundTable = {
--| FEBF Triggers |--
	{ "Fence7_Part/Trigger1", 						"fences",		  false, false },
	{ "Fence8_Part/Trigger2", 						"fences",		  false, false },
	{ "Woodengate_Animated_Part/Trigger1", 			"doors", 		  false, false },
	{ "Woodengate_Palisade_Animated_Part/Trigger2",	"doors", 		  false, false },
--| Boats |--
	{ "Barge_Part", 								"cart",			  true,  false },
	{ "Barge_Canopy_Part",							"cart",			  true,  false },
	{ "Ship_Merchant_Part",							"cart",			  true,  false },
--| Wagons |--
	{ "Wagon_Part",									"cart",			  false, true },
	{ "Wagon_Canopy_Part",							"cart",			  false, true },
	{ "Wagon_Cage_Part",							"punishment",	  false, true },
--| Siege |--
	{ "Battering_Ram_NS_Part",						"siege",		  false, true },
	{ "Catapult_NS_Part",							"siege",		  false, true },
	{ "Trebuchet_NS_Part",							"siege",		  false, true },
--| Grass Clearing |--
	{ "Grass_Clearing_Small_Square_Part", 			"grass_clearing", false, false },
	{ "Grass_Clearing_Medium_Square_Part", 			"grass_clearing", false, false },
	{ "Grass_Clearing_Large_Square_Part", 			"grass_clearing", false, false },
	{ "Grass_Clearing_XLarge_Square_Part", 			"grass_clearing", false, false },
--| Fences |--
	{ "Fence1_Part", 								"fences", 		  false, false },
	{ "Fence2_Part", 								"fences", 		  false, false },
	{ "Fence3_Part", 								"fences", 		  false, false },
	{ "Fence4_Part", 								"fences", 		  false, false },
	{ "Fence5_Part", 								"fences", 		  false, false },
	{ "Fence6_Part", 								"fences", 		  false, false },
	{ "Fence7_Part", 								"fences", 		  false, false },
	{ "Fence8_Part", 								"fences", 		  false, false },
--| Walls |--
	{ "Wall_Palisade_Part/Log.01", 					"doors", 		  false, false },
	{ "Wall_Palisade_Part/Log.02", 					"doors", 		  false, false },
	{ "Wall_Palisade_Part/Log.03", 					"doors", 		  false, false },
	{ "Wall_Palisade_Part/Log.04", 					"doors", 		  false, false },
	{ "Wall_Palisade_Part/Log.05", 					"doors", 		  false, false },
	{ "Wall_Palisade_Part/Log.06", 					"doors", 		  false, false },
}
for k, v in pairs(groundTable) do
	GroundingComp(v)
end