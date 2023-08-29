local FantasyDeco = ...

--------------------------
--| Path Node Function |--
--------------------------
local function PathNode(value)
	local partName = value[1]
	local pathCode = value[2]
	local fileName = value[3]
	local pathName = string.upper(partName) .. "_PATH_" .. pathCode
	FantasyDeco:registerAssetId("models/" .. fileName .. ".fbx/Prefab/" .. partName .. "_Part/" .. pathName, pathName)
end

-----------------------
--| Path Node Table |--
-----------------------
local nodeTable = {
	{ "Water_Source_Barrel",   "A1", "water_source" },
	{ "Water_Source_Barrel",   "B1", "water_source" },
	{ "Water_Source_Barrel",   "C1", "water_source" },
	{ "Water_Source_Barrel",   "D1", "water_source" },
	{ "Water_Source_Basin",    "A1", "water_source" },
	{ "Water_Source_Handpump", "A1", "water_source" },
	{ "Water_Source_Handpump", "B1", "water_source" },
	{ "Water_Source_Handpump", "C1", "water_source" },
	{ "Water_Source_Well", 	   "A1", "water_source" },
	{ "Water_Source_Well", 	   "B1", "water_source" },
	{ "Water_Source_Well", 	   "C1", "water_source" },
	{ "Water_Source_Well", 	   "D1", "water_source" },
	{ "Water_Source_Well", 	   "E1", "water_source" },
	{ "Water_Source_Well", 	   "F1", "water_source" }
}
for k, v in pairs(nodeTable) do
	PathNode(v)
end

-------------------------------
--| Path Component Function |--
-------------------------------
local function PathComp(value)
	local partName = value[1]
	local fileName = value[2]
	local pathList = value[3]
    FantasyDeco:registerPrefabComponent("models/" .. fileName .. ".fbx/Prefab/" .. partName .. "_Part", {
        DataType = "COMP_BUILDING_PART",
        PathList = pathList
    })
end

----------------------------
--| Path Component Table |--
----------------------------
local function PathList(pathType, pathList)
	return {PathType = pathType, WayPointList = pathList}
end
local Default = BUILDING_PATH_TYPE.DEFAULT
-- local Pickup =  BUILDING_PATH_TYPE.PICKUP
local pathTable = {
	{ "Water_Source_Barrel",   "water_source", {PathList(Default, { "WATER_SOURCE_BARREL_PATH_A1" }),
							    				PathList(Default, { "WATER_SOURCE_BARREL_PATH_B1" }),
							    				PathList(Default, { "WATER_SOURCE_BARREL_PATH_C1" }),
							    				PathList(Default, { "WATER_SOURCE_BARREL_PATH_D1" })}},
	{ "Water_Source_Basin",    "water_source", {PathList(Default, { "WATER_SOURCE_BASIN_PATH_A1" })}},
	{ "Water_Source_Handpump", "water_source", {PathList(Default, { "WATER_SOURCE_HANDPUMP_PATH_A1" }),
							    				PathList(Default, { "WATER_SOURCE_HANDPUMP_PATH_B1" }),
							    				PathList(Default, { "WATER_SOURCE_HANDPUMP_PATH_C1" })}},
	{ "Water_Source_Well", 	   "water_source", {PathList(Default, { "WATER_SOURCE_WELL_PATH_A1" }),
												PathList(Default, { "WATER_SOURCE_WELL_PATH_B1" }),
												PathList(Default, { "WATER_SOURCE_WELL_PATH_C1" }),
												PathList(Default, { "WATER_SOURCE_WELL_PATH_D1" }),
												PathList(Default, { "WATER_SOURCE_WELL_PATH_E1" }),
												PathList(Default, { "WATER_SOURCE_WELL_PATH_F1" })}}
}
for k, v in pairs(pathTable) do
	PathComp(v)
end