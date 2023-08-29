local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Livestock3.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Asset -------------------------------------------------------------------------------------
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPasture.Part.001", "PREFAB_LIVESTOCKFARM_SHEEPPASTURE1")

mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepYard.Part.001", "PREFAB_LIVESTOCKFARM_SHEEPYARD1")
mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepYard.Part.002", "PREFAB_LIVESTOCKFARM_SHEEPYARD2")
mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepYard.Part.003", "PREFAB_LIVESTOCKFARM_SHEEPYARD3")
mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepYard.Part.004", "PREFAB_LIVESTOCKFARM_SHEEPYARD4")

-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.001", "PREFAB_LIVESTOCKFARM_SHEEPPEN1")
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.002", "PREFAB_LIVESTOCKFARM_SHEEPPEN2")
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.003", "PREFAB_LIVESTOCKFARM_SHEEPPEN3")
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.004", "PREFAB_LIVESTOCKFARM_SHEEPPEN4")
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.005", "PREFAB_LIVESTOCKFARM_SHEEPPEN5")
-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.006", "PREFAB_LIVESTOCKFARM_SHEEPPEN6")
mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.007", "PREFAB_LIVESTOCKFARM_SHEEPPEN7")
mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepPen.Part.008", "PREFAB_LIVESTOCKFARM_SHEEPPEN8")

-- mod:registerAssetId("models/Livestock3.fbx/Prefab/SheepSpawner", "PREFAB_LIVESTOCKFARM_SHEEPSPAWNER")



-- Transparency -------------------------------------------------------------------------------------
mod:registerAssetId("models/Livestock3.fbx/Materials/Material.Hay3", "MATERIAL_LIVESTOCKFARM_SHEEP_HAY3")
mod:overrideAsset({
    Id = "MATERIAL_LIVESTOCKFARM_SHEEP_HAY3",
    HasAlphaTest = true
})

-- mod:registerAssetId("models/Livestock3.fbx/Materials/Material.Grass1", "MATERIAL_LIVESTOCKFARM_SHEEP_GRASS1")
-- mod:overrideAsset({
--     Id = "MATERIAL_LIVESTOCKFARM_SHEEP_GRASS1",
--     HasAlphaTest = true
-- })

-- mod:registerAssetId("models/Livestock3.fbx/Materials/Material.Flowers1", "MATERIAL_LIVESTOCKFARM_SHEEP_FLOWERS1")
-- mod:overrideAsset({
--     Id = "MATERIAL_LIVESTOCKFARM_SHEEP_FLOWERS1",
--     HasAlphaTest = true
-- })



-- Grounding -------------------------------------------------------------------------------------
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Bucket.013", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/DungHeap.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Hay.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Hay.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Hay.009", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Trough.001", {DataType = "COMP_GROUNDED"})
for i=1, 14, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Bucket.014", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Bucket.017", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/DungHeap.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Hay.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Hay.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Hay.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Trough.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/DungHeap.002", {DataType = "COMP_GROUNDED"})
for i=15, 18, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end
for i=51, 60, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Bucket.015", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Bucket.018", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/DungHeap.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Hay.006", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Hay.007", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Hay.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Trough.003", {DataType = "COMP_GROUNDED"})
for i=61, 74, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Bucket.016", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/DungHeap.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Hay.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Hay.011", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Hay.012", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Trough.004", {DataType = "COMP_GROUNDED"})
for i=75, 88, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepYard.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/Bucket.001", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/Bucket.002", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/Bucket.003", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/Hook.001", {DataType = "COMP_GROUNDED"})
-- for i=19, 26, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.002/Bucket.004", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.002/Bucket.005", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.002/Hook.002", {DataType = "COMP_GROUNDED"})
-- for i=27, 34, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.002/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.003/Bucket.006", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.003/Bucket.007", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.003/Bench.003", {DataType = "COMP_GROUNDED"})
-- for i=35, 42, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.003/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.004/Bucket.008", {DataType = "COMP_GROUNDED"})
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.004/Bench.004", {DataType = "COMP_GROUNDED"})
-- for i=43, 50, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.004/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- for i=105, 112, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.005/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

-- for i=113, 120, 1 do
-- 	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.006/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
-- end

mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.007/Bucket.009", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.007/Bucket.010", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.007/Bucket.011", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.007/Hook.003", {DataType = "COMP_GROUNDED"})
for i = 122, 129, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.007/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.008/Bucket.008", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.008/Bucket.012", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.008/Bench.004", {DataType = "COMP_GROUNDED"})
for i = 130, 137, 1 do
	mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.008/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end



-- -- Resource Generator -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.001/TallowGenerator.001", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })
-- mod:registerPrefabComponent("models/Livestock3.fbx/Prefab/SheepPen.Part.002/TallowGenerator.002", { DataType = "COMP_LIVESTOCKFARM_RESOURCEGENERATOR", ResourceGenerator = "BUILDING_FUNCTION_LIVESTOCKFARM_TALLOW", })



-- Building Part: Sheep Yard -------------------------------------------------------------------------------------
-- local poly1a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -4.00, -4.00 },
-- 	{ -4.00, 4.00 },
-- 	{ 4.00, 4.00 },
-- 	{ 4.00, -4.00 },
-- 	{ -4.00, -4.00 },
-- 	{ -4.5, -7.0 },
-- 	{ 4.5, -7.0 },
-- 	{ 4.5, 4.5 },
-- 	{ -4.5, 4.5 },
-- 	{ -4.5, -7.0 },
-- }

-- local poly1b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -2.50, -2.50 },
-- 	{ -2.50, 2.50 },
-- 	{ 2.50, 2.50 },
-- 	{ 2.50, -2.50 },
-- 	{ -2.50, -2.50 },
-- 	{ -3.00, -3.00 },
-- 	{ 3.00, -3.00 },
-- 	{ 3.00, 3.00 },
-- 	{ -3.00, 3.00 },
-- 	{ -3.00, -3.00 },
-- }

local poly1a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -4.00, -4.00 },
	{ -4.00, 4.00 },
	{ 4.00, 4.00 },
	{ 4.00, -4.00 },
	{ -4.00, -4.00 },
	{ -4.5, -7.0 },
	{ 4.5, -7.0 },
	{ 4.5, 4.5 },
	{ -4.5, 4.5 },
	{ -4.5, -7.0 },
}

local poly1b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ -3.00, -3.00 },
	{ -3.00, 3.00 },
	{ 3.00, 3.00 },
	{ 3.00, -3.00 },
	{ -3.00, -3.00 },
	{ -3.75, -3.75 },
	{ 3.75, -3.75 },
	{ 3.75, 3.75 },
	{ -3.75, 3.75 },
	{ -3.75, -3.75 },
}

local poly1c = { -- y, x     Facing x in Blender: y increases going left, x increases going down
	{ 4.5, -7.0 },
	{ 4.5, 4.5 },
	{ -4.5, 4.5 },
	{ -4.5, -7.0 },
}

-- local poly3 = {

-- }

for i=1, 4, 1 do

    -- -- Limit output inventory size
    -- mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_SHEEPYARD" .. i, {
    --     DataType = "COMP_RESOURCE_DEPOT",
    --     Capacity = 10,
    --     OutgoingReservedResources = {},
    --     IncomingReservedResources = {},
    -- })

    -- Building part
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD" .. i,
        Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD" .. i .. "_NAME",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPYARD" .. i,
            MiniatureConfig = {
                ClipUnderGround = false,
                GroupHeight = 0.0,
                CameraPosition = { 0.5, 4.4, -10 },
                OrientationOffset = -15.0,
                CameraPitchOffset = 25.0
            },
        },
    })

end

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD",
	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPYARD_NAME",
    Category = "PRODUCTION",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_LIVESTOCKFARM_SHEEPYARD1",
			"BUILDING_PART_LIVESTOCKFARM_SHEEPYARD2",
			"BUILDING_PART_LIVESTOCKFARM_SHEEPYARD3",
			"BUILDING_PART_LIVESTOCKFARM_SHEEPYARD4",
		},
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0.5, 4.4, -10 },
            OrientationOffset = -15.0,
            CameraPitchOffset = 25.0
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = poly1a,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            {
                Polygon = poly1b,
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
            },
            -- {
            --     Polygon = polygon.createRectangle( {10, 4}, {0.0, -5.0} ),
            --     Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            -- },
            -- {
            --     Polygon = polygon.createRectangle( {10, 10}, {0.0, 0.0} ),
            --     Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            -- },
            {
                Polygon = polygon.createCircle( 5, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
            },
            {
                Polygon = polygon.createCircle( 1.5, {3.0, -5.5}, 8 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
            {
                Polygon = polygon.createCircle( 1.5, {-3.0, -5.5}, 8 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPYARD",
    Cost = {
        BuildRightTaxes = {
            { Resource = "GOLD_COINS", Quantity = 100 },
            -- { Resource = "RESOURCE_SHEEP", Quantity = 10 },
        },
        UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 15 } },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 20 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "TOOL", Quantity = 1 },
            },
        },
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "SUBSTRACT",
        Radius = 20.0,
        Value = 0.5,
    } },
})



-- Building Part: Sheep Pen -------------------------------------------------------------------------------------
-- local poly2a = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -1.70, -1.70 },
-- 	{ -1.70, 1.70 },
-- 	{ 1.70, 1.70 },
-- 	{ 1.70, -1.70 },
-- 	{ -1.70, -1.70 },
-- 	{ -2.20, -2.20 },
-- 	{ 2.20, -2.20 },
-- 	{ 2.20, 2.20 },
-- 	{ -2.20, 2.20 },
-- 	{ -2.20, -2.20 },
-- }

-- local poly2b = { -- y, x     Facing x in Blender: y increases going left, x increases going down
-- 	{ -1.20, -1.20 },
-- 	{ -1.20, 1.20 },
-- 	{ 1.20, 1.20 },
-- 	{ 1.20, -1.20 },
-- 	{ -1.20, -1.20 },
-- 	{ -1.70, -1.70 },
-- 	{ 1.70, -1.70 },
-- 	{ 1.70, 1.70 },
-- 	{ -1.70, 1.70 },
-- 	{ -1.70, -1.70 },
-- }

-- for i=1, 2, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building part
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER_NAME",
--         -- Category = "CORE", 
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i,
--             MiniatureConfig = {
--                 ClipUnderGround = false,
--                 GroupHeight = 0.0,
--                 CameraPosition = { 0, 0, 0 },
--                 OrientationOffset = 0.0,
--                 CameraPitchOffset = 25.0
--             },
--         },
--     })

-- end

-- for i=3, 4, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building part
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK_NAME",
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i,
--             MiniatureConfig = {
--                 ClipUnderGround = false,
--                 GroupHeight = 0.0,
--                 CameraPosition = { 0, 0, 0 },
--                 OrientationOffset = 0.0,
--                 CameraPitchOffset = 25.0
--             },
--         },
--     })

-- end

-- for i=5, 6, 1 do

--     -- Limit output inventory size
--     mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i, {
--         DataType = "COMP_RESOURCE_DEPOT",
--         Capacity = 20,
--         OutgoingReservedResources = {},
--         IncomingReservedResources = {},
--     })

--     -- Building part
--     mod:registerAsset({
--         DataType = "BUILDING_PART",
--         Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR" .. i,
--         Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR_NAME",
--         ConstructorData = {
--             DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--             CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPPEN" .. i,
--             MiniatureConfig = {
--                 ClipUnderGround = false,
--                 GroupHeight = 0.0,
--                 CameraPosition = { 0, 0, 0 },
--                 OrientationOffset = 0.0,
--                 CameraPitchOffset = 25.0
--             },
--         },
--     })

-- end

-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER_NAME",
--     Category = "OTHER",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER1",
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER2",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0
--         },
--     },
--     BuildingZone = {
--         ZoneEntryList = {
--             {
--                 Polygon = poly2a,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--             },
--             {
--                 Polygon = poly2b,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--                 -- Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 -- Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
--             },
--             {
--                 Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
--             },
--             -- {
--             --     Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--             --     Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
--             -- },
--         },
--     },
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
--     Cost = {
--         ResourceNeededList = {
--             {
--                 { Resource = "WOOD", Quantity = 5 },
--                 { Resource = "TOOL", Quantity = 1 },
--             },
--         },
--     },
--     DesirabilityModifiers = { {
--         Desirability = "DESIRABILITY_RESIDENTIAL",
--         Type = "SUBSTRACT",
--         Radius = 20.0,
--         Value = 0.5,
--     } },
-- })

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER_NAME",
    Category = "OTHER",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPPEN7",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 3.1, {0.0, 0.0}, 8 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
    Cost = {
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
            },
        },
    },
    DesirabilityModifiers = { {
        Desirability = "DESIRABILITY_RESIDENTIAL",
        Type = "SUBSTRACT",
        Radius = 20.0,
        Value = 0.5,
    } },
})

-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK_NAME",
--     Category = "OTHER",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK3",
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK4",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0,
--         },
--     },
--     BuildingZone = { 
--         ZoneEntryList = {
--             {
--                 Polygon = poly2a,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--             },
--             {
--                 Polygon = poly2b,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--                 -- Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 -- Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
--             },
--             {
--                 Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
--             },
--             -- {
--             --     Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--             --     Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
--             -- },
--         },
--     },
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK",
--     Cost = {
--         ResourceNeededList = {
--             {
--                 { Resource = "WOOD", Quantity = 5 },
--             },
--         },
--     },
-- })

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK",
	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_MILK_NAME",
    Category = "OTHER",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
	ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_LIVESTOCKFARM_SHEEPPEN8",
        MiniatureConfig = {
            ClipUnderGround = false,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 3.1, {0.0, 0.0}, 8 ),
                Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
            },
        },
    },
    AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK",
    Cost = {
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 5 },
        },
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 6 },
                { Resource = "TOOL", Quantity = 2 },
            },
        },
    },
})

-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR_NAME",
--     Category = "OTHER",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
-- 		RandomPartList = {
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR5",
-- 			"BUILDING_PART_LIVESTOCKFARM_SHEEPPEN_SHEAR6",
-- 		},
--         MiniatureConfig = {
--             ClipUnderGround = false,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 0, 0 },
--             OrientationOffset = 0.0,
--             CameraPitchOffset = 25.0,
--         },
--     },
--     BuildingZone = {
--         ZoneEntryList = {
--             {
--                 Polygon = poly2a,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--             },
--             {
--                 Polygon = poly2b,
--                 Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = false },
--                 -- Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 -- Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true } 
--             },
--             {
--                 Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--                 Type = { DEFAULT = false, NAVIGABLE = false, GRASS_CLEAR = true },
--             },
--             -- {
--             --     Polygon = polygon.createRectangle( {4.4, 4.4}, {0.0, 0.0} ),
--             --     Type = { DEFAULT = true, NAVIGABLE = false, GRASS_CLEAR = true },
--             -- },
--         },
--     },
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEP_SHEAR",
--     Cost = {
--         ResourceNeededList = {
--             {
--                 { Resource = "WOOD", Quantity = 5 },
--                 { Resource = "TOOL", Quantity = 1 },
--             },
--         },
--     },
-- })



-- Building Function: Sheep Yard -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPYARD",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPYARD_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "JOB_LIVESTOCKFARM_HERD",
        -- Job = "SHEPHERD",
        Behavior = "BEHAVIOR_LIVESTOCK_WORK",
        -- Behavior = "BEHAVIOR_WORK",
	},
    InputInventoryCapacity = {
        { Resource = "WATER", Quantity = 30 },
        { Resource = "RESOURCE_HAY", Quantity = 30 },
    },
    ResourceListNeeded = {
        { Resource = "WATER", Quantity = 1 },
        { Resource = "RESOURCE_HAY", Quantity = 1 },
    },
    ResourceProduced = {
        -- { Resource = "RESOURCE_SHEEP", Quantity = 1 },
        { Resource = "WOOL", Quantity = 4 },
        { Resource = "RESOURCE_DUNG", Quantity = 1 },
    },
})

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 30,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         -- Job = "SHEPHERD",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 5 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 2 },
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "BV1_CARCASS", Quantity = 1 },
-- 		{ Resource = "RESOURCE_HIDE", Quantity = 1 },
-- 		-- { Resource = "RESOURCE_TALLOW", Quantity = 1 },
-- 	},
-- })

mod:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_SLAUGHTER_NAME",
    GameRuleModifierList = {
        {
            DataType = "GAME_RULE_MODIFIER_WORKPLACE_RECIPE",
            ResourceProducedToAdd = {
                {
                    Resource = "BV1_CARCASS",
                    Quantity = 1,
                },
                {
                    Resource = "RESOURCE_HIDE",
                    Quantity = 1,
                },
            },
            ResourceProducedToRemove = {
                {
                    Resource = "WOOL",
                    Quantity = 2,
                },
            },
        },
    },
})

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 20,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         -- Job = "SHEPHERD",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 5 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 1 },
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "MILK", Quantity = 2 },
-- 	},
-- })

mod:registerAsset({
    DataType = "BUILDING_FUNCTION",
    Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK",
    Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPPEN_MILK_NAME",
    GameRuleModifierList = {
        {
            DataType = "GAME_RULE_MODIFIER_WORKPLACE_RECIPE",
            ResourceProducedToAdd = {
                {
                    Resource = "MILK",
                    Quantity = 1,
                },
            },
            ResourceProducedToRemove = {
                {
                    Resource = "WOOL",
                    Quantity = 1,
                },
            },
        },
    },
})

-- mod:registerAsset({
--     DataType = "BUILDING_FUNCTION_WORKPLACE",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEP_SHEAR",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEP_SHEAR_NAME",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 25,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_PROCESS",
--         -- Job = "SHEPHERD",
--         Behavior = "BEHAVIOR_LIVESTOCK_WORK",
--         -- Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 5 },
-- 	},
--     ResourceListNeeded = {
-- 		{ Resource = "RESOURCE_SHEEP", Quantity = 1 },
-- 	},
--     ResourceProduced = {
-- 		{ Resource = "WOOL", Quantity = 3 },
-- 	},
-- })

mod:overrideAsset({
    Id = "BUILDING_FUNCTION_SHEEP_FARM",
    ProductionCycleDurationInSec = 40,
    ResourceProduced = {
		{ Resource = "WOOL", Quantity = 4 },
	},
})



-- Spawn animals in yard and pen -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPYARD1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 8, Radius = 2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPYARD2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 8, Radius = 2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPYARD3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 8, Radius = 2 } )
mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPYARD4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 8, Radius = 2 } )

-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN1", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN2", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN3", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN4", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN5", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPPEN6", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1, Radius = 0.2 } )



-- Building Part: Sheep Barn (repupose Sheep Farm) -------------------------------------------------------------------------------------

-- Hide the vanilla monument
mod:overrideAsset({
    Id = "BUILDING_SHEEP_FARM",
    IsHidden = true,
})

mod:overrideAsset({
    Id = "BUILDING_PART_SHEEP_FARM",
    HasMaximumInstancePerBuilding = true,
    MaximumInstancePerBuilding = 1,
})

-- -- Limit output inventory size
-- mod:registerPrefabComponent( "PREFAB_LIVESTOCKFARM_SHEEPPASTURE1", {
--     DataType = "COMP_RESOURCE_DEPOT",
--     Capacity = 10,
--     OutgoingReservedResources = {},
--     IncomingReservedResources = {},
-- })

-- -- Replace original building function with one that will not appear
-- mod:overrideAsset({
--     Id = "BUILDING_PART_SHEEP_FARM",
--     AssetBuildingFunction = "BUILDING_FUNCTION_PUBLIC_LOUNGE_ROOM",
-- })

-- -- Assemblage to provide a prefab for limiting the output inventory
-- mod:registerAsset({
-- 	DataType = "BUILDING_PART",
-- 	Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN_ASSEMBLAGE",
-- 	Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN_NAME",
-- 	ConstructorData = {
-- 		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
-- 		CoreRandomBuildingPartList = { "PREFAB_LIVESTOCKFARM_SHEEPPASTURE1" },
-- 		MandatoryBuildingPartList = {
-- 			{ BuildingPart = "BUILDING_PART_SHEEP_FARM", OptionalAttachNodeString = "Attach_Major.Pasture" },
-- 		}
-- 	},
-- })

-- -- Random
-- mod:registerAsset({
--     DataType = "BUILDING_PART",
--     Id = "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN",
--     Name = "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN_NAME",
--     Category = "PRODUCTION",
--     AssetBuildingFunction = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPBARN",
--     ConstructorData = {
--         DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
--         RandomPartList = {
--             "BUILDING_PART_LIVESTOCKFARM_SHEEPBARN_ASSEMBLAGE",
--         },
--         MiniatureConfig = {
--             ClipUnderGround = true,
--             GroupHeight = 0.0,
--             CameraPosition = { 0, 2.0, -30 },
--             OrientationOffset = 90.0,
--             CameraPitchOffset = 0.0,
--         },
--     },
--     Cost = {
--         BuildRightTaxes = {
--             Action = "APPEND",
--             { Resource = "GOLD_COINS", Quantity = 10 },
--             { Resource = "RESOURCE_SHEEP", Quantity = 10 },
--         },
--     },
-- })



-- -- Building Function: Sheep Fold (pasture) -------------------------------------------------------------------------------------
-- mod:registerAsset({
--     -- DataType = "BUILDING_FUNCTION_WORKPLACE",
--     DataType = "BUILDING_FUNCTION_LIVESTOCK_FARM",
--     Id = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPBARN",
--     Name = "BUILDING_FUNCTION_LIVESTOCKFARM_SHEEPBARN_NAME",
--     SpawningLivestock = "PREFAB_LIVESTOCK_SHEEP",
--     LivestockSpawningLocation = "",
--     SpawnLivestockButtonText = "SPAWN_SHEEP",
--     RemoveLivestockButtonText = "PLEASE_REMOVE_ONE",
--     WorkerCapacity = 1,
--     ProductionCycleDurationInSec = 40,
--     RelatedJob = {
--         Job = "JOB_LIVESTOCKFARM_HERD",
--         -- Job = "SHEPHERD",
--         Behavior = "BEHAVIOR_WORK",
--     },
--     InputInventoryCapacity = {
-- 	},
--     ResourceListNeeded = {
-- 	},
-- 	ResourceProduced = {
--         { Resource = "RESOURCE_SHEEP", Quantity = 1 },
--     },
-- })



-- Job: Barn -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_LIVESTOCKFARM_BARN",
	JobName = "JOB_LIVESTOCKFARM_BARN_NAME",
	JobDescription = "JOB_LIVESTOCKFARM_BARN_DESC",
	IsLockedByDefault = false,
    Hidden = false,
	DefaultBehavior = "BEHAVIOR_FARMER",
    -- ProductionDelay = 6, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_LIVESTOCKFARM_HAT",
                },
            },
            { -- ALL
                RightHandObject = {
                    DataType = "HAND_OBJECT",
                    Model = "PREFAB_TOOL_SHEPHERD_STICK",
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "GUARD",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_LIVESTOCKFARM_BARN",
    },
})



-- -- Spawn sheep in pasture -------------------------------------------------------------------------------------
-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_SHEEP", { DataType = "COMP_ENFORCE_RADIUS", Radius = 2 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_SHEEP", { DataType = "COMP_AGENT", BehaviorTree = "BEHAVIOR_RADIAL_CONFINED_AGENT", RoadPaintSpeed = 0 } )
-- mod:registerPrefabComponent("PREFAB_LIVESTOCKFARM_SHEEPSPAWNER", { DataType = "COMP_LIVESTOCKFARM", PrefabName = "PREFAB_LIVESTOCK_SHEEP", AnimalCount = 1 } )



-- -- Fix issue with Sheep Addition mod interacting with this mod -------------------------------------------------------------------------------------
-- -- Because I have radial movement enforcer to the sheep, the sheep from Sheep addition mod will throw an error if they don't get an enforcer object.
-- -- This component checks to see if sheep have an enforcer, if they don't they get one and this component deletes itself.
-- local COMP_ENFORCE_CHECK = {
-- 	TypeName = "COMP_ENFORCE_CHECK",
-- 	ParentType = "COMPONENT",
-- 	Properties = {
--     }
-- }

-- function COMP_ENFORCE_CHECK:update()

--     local compEnforce = self:getOwner():getComponent("COMP_ENFORCE_RADIUS")
--     local obj = self:getOwner()
--     local parent = obj:getParent()

--     if (compEnforce) then
--         -- mod:log("Found comp enforce")
--         if (parent) then
--             if (parent.Name == "Animals") then
--                 if (not compEnforce.Enforcer) then
--                     compEnforce:setEnforcer(self:getOwner())
--                 end
--             end
--         end
--     end

--     -- mod:log("Removing check comp")
--     self:getOwner():removeComponent(self)

-- end

-- mod:registerClass(COMP_ENFORCE_CHECK)
-- mod:registerPrefabComponent("PREFAB_LIVESTOCK_SHEEP", { DataType = "COMP_ENFORCE_CHECK" })

