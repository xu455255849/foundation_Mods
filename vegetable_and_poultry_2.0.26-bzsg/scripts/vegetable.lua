local mod = ...




-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/VegetablePlot1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/VegetableFarm2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetProcessor("models/VegetableCart2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Bean.001", "PREFAB_VEGETABLEFARM_PLANT_BEAN1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Broccoli.001", "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Cabbage.001", "PREFAB_VEGETABLEFARM_PLANT_CABBAGE1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Beet.001", "PREFAB_VEGETABLEFARM_PLANT_BEET1")

mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Bean.002", "PREFAB_VEGETABLEFARM_PLANT_BEAN2")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Broccoli.002", "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Cabbage.002", "PREFAB_VEGETABLEFARM_PLANT_CABBAGE2")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plant.Beet.002", "PREFAB_VEGETABLEFARM_PLANT_BEET2")

mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plot.Part.001", "PREFAB_VEGETABLEFARM_PLOT1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Plot.Part.002", "PREFAB_VEGETABLEFARM_PLOT2")

mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Resource.Vegetable.Part", "PREFAB_VEGETABLEFARM_RESOURCEVISUAL")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Hat.Part.001", "PREFAB_VEGETABLEFARM_HAT1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Hat.Part.002", "PREFAB_VEGETABLEFARM_HAT2")

mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Fence.Part.001", "PREFAB_VEGETABLEFARM_FENCE1")
mod:registerAssetId("models/VegetablePlot1.fbx/Prefab/Fence.Part.002", "PREFAB_VEGETABLEFARM_FENCE2")

mod:registerAssetId("models/VegetableFarm2.fbx/Prefab/Farm.Part.001", "PREFAB_VEGETABLEFARM_FARM1")
mod:registerAssetId("models/VegetableFarm2.fbx/Prefab/Door.Part.001", "PREFAB_VEGETABLEFARM_DOOR1")
mod:registerAssetId("models/VegetableFarm2.fbx/Prefab/Shed.Part.001", "PREFAB_VEGETABLEFARM_SHED1")

mod:registerAssetId("models/VegetableCart2.fbx/Prefab/RESOURCE_VEGETABLE.PART", "PREFAB_VEGETABLEFARM_MARKETCART")

mod:registerAssetId("models/Textures/colors.png", "TEXTURE_COLOR")




-- Material -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_VEGETABLEFARM_COLOR",
	HasAlphaTest = false,
	AlbedoTexture = "TEXTURE_COLOR"
})

mod:registerAssetId("models/VegetableFarm2.fbx/Materials/Material.ThatchEdge", "MATERIAL_VEGETABLEFARM_THATCH")
mod:overrideAsset({
    Id = "MATERIAL_VEGETABLEFARM_THATCH",
    HasAlphaTest = true
})



-- Grounding -------------------------------------------------------------------------------------
for i = 1, 70, 1 do
	mod:registerPrefabComponent("models/VegetablePlot1.fbx/Prefab/Plot.Part.001/Attach_Minor." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

for i = 71, 135, 1 do
	mod:registerPrefabComponent("models/VegetablePlot1.fbx/Prefab/Plot.Part.002/Attach_Minor." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
end

for i = 1, 10, 1 do
	mod:registerPrefabComponent("models/VegetablePlot1.fbx/Prefab/Fence.Part.001/Fence." .. string.sub("000" .. i, -3), {DataType = "COMP_GROUNDED"})
	mod:registerPrefabComponent("models/VegetablePlot1.fbx/Prefab/Fence.Part.002/Fence." .. string.sub("000" .. i + 10, -3), {DataType = "COMP_GROUNDED"})
end

mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Door.Part.001/Door.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Barrel.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.001", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.002", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.003", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.004", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.005", {DataType = "COMP_GROUNDED"})
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Basket.006", {DataType = "COMP_GROUNDED"})

-- mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEET1", {DataType = "COMP_GROUNDED", AutoDisable = true })
-- mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_CABBAGE1", {DataType = "COMP_GROUNDED", AutoDisable = true })
-- mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEAN1", {DataType = "COMP_GROUNDED", AutoDisable = true })
-- mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BROCCOLI1", {DataType = "COMP_GROUNDED", AutoDisable = true })




-- Attach Type -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEET1", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_CABBAGE1", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEAN1", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BROCCOLI1", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })

mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001", { DataType = "COMP_BUILDING_PART", BuildingPartType = "MINOR" })
mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Shed.Part.001/Attach_Minor.004", { DataType = "COMP_BUILDING_ATTACH_NODE", AttachNodeTypeList = { "MINOR" }, ForbidRotation = true })

mod:registerPrefabComponent("models/VegetableFarm2.fbx/Prefab/Door.Part.001", { DataType = "COMP_BUILDING_PART", BuildingPartType = "DOOR" })




-- Vegetable Plot Component -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLOT1", { DataType = "COMP_VEGETABLEPLOT" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLOT2", { DataType = "COMP_VEGETABLEPLOT" })



-- Resource Type: Vegetable Farm -------------------------------------------------------------------------------------
mod:registerEnumValue( "RESOURCE_TYPE", "VEGETABLEFARM_RESOURCE_TYPE" )



-- Resource Visual -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "RESOURCE_VEGETABLE",
    ResourceVisualPrefab = "PREFAB_VEGETABLEFARM_RESOURCEVISUAL"
})



-- Crop Field Element -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEET2", { DataType = "COMP_CROP_FIELD_ELEMENT" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_CABBAGE2", { DataType = "COMP_CROP_FIELD_ELEMENT" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2", { DataType = "COMP_CROP_FIELD_ELEMENT" })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEAN2", { DataType = "COMP_CROP_FIELD_ELEMENT" })



-- Plantable -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEET2", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 1.0 })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_CABBAGE2", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 1.0 })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 1.0 })
mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_PLANT_BEAN2", { DataType = "COMP_PLANTABLE", MinSpaceBetweenPlant = 1.0 })

mod:registerAssetId("icons/Beet.png", "ICON_VEGETABLEFARM_BEET", "ATLAS_CELL")
mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_VEGETABLEFARM_BEET",
    Name = "PLANTABLE_VEGETABLEFARM_BEET_NAME",
    Icon = "ICON_VEGETABLEFARM_BEET",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEET2",
    MinimumScale = 0.85, -- min size at full growth
    MaximumScale = 1.15 -- max size at full growth
})

mod:registerAssetId("icons/Cabbage.png", "ICON_VEGETABLEFARM_CABBAGE", "ATLAS_CELL")
mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_VEGETABLEFARM_CABBAGE",
    Name = "PLANTABLE_VEGETABLEFARM_CABBAGE_NAME",
    Icon = "ICON_VEGETABLEFARM_CABBAGE",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_CABBAGE2",
    MinimumScale = 0.85,
    MaximumScale = 1.15
})

mod:registerAssetId("icons/Bean.png", "ICON_VEGETABLEFARM_BEAN", "ATLAS_CELL")
mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_VEGETABLEFARM_BEAN",
    Name = "PLANTABLE_VEGETABLEFARM_BEAN_NAME",
    Icon = "ICON_VEGETABLEFARM_BEAN",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEAN2",
    MinimumScale = 0.85,
    MaximumScale = 1.15
})

mod:registerAssetId("icons/Broccoli.png", "ICON_VEGETABLEFARM_BROCCOLI", "ATLAS_CELL")
mod:registerAsset({
    DataType = "PLANTABLE",
    Id = "PLANTABLE_VEGETABLEFARM_BROCCOLI",
    Name = "PLANTABLE_VEGETABLEFARM_BROCCOLI_NAME",
    Icon = "ICON_VEGETABLEFARM_BROCCOLI",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2",
    MinimumScale = 0.85,
    MaximumScale = 1.15
})



-- Resource Container -------------------------------------------------------------------------------------
mod:registerPrefabComponent( "PREFAB_VEGETABLEFARM_PLANT_BEET2", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_VEGETABLE_RAW",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 0.85, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})

mod:registerPrefabComponent( "PREFAB_VEGETABLEFARM_PLANT_CABBAGE2", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_VEGETABLE_RAW",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 0.85, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})

mod:registerPrefabComponent( "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_VEGETABLE_RAW",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 0.85, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})

mod:registerPrefabComponent( "PREFAB_VEGETABLEFARM_PLANT_BEAN2", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "RESOURCE_VEGETABLE_RAW",
    IsReplenishable = false,
    ResourceValue = 1.0, -- how many are gathered with each pick
    AvailableQuantity = 1, -- maximum container stock
    Radius = 0.85, -- distance from container that the villager will stand to pick
    IsDestroyWhenEmpty = true,
    HasMaximumWorkstation = false
})



-- Paths: Vegetable cart -------------------------------------------------------------------------------------
mod:registerAssetId("models/VegetableCart2.fbx/Prefab/RESOURCE_VEGETABLE.PART/PATH_A_1", "PATH_VEGCART_1")
mod:registerAssetId("models/VegetableCart2.fbx/Prefab/RESOURCE_VEGETABLE.PART/PATH_B_1", "PATH_VEGCART_2")
mod:registerAssetId("models/VegetableCart2.fbx/Prefab/RESOURCE_VEGETABLE.PART/PATH_C_1", "PATH_VEGCART_3")
mod:registerAssetId("models/VegetableCart2.fbx/Prefab/RESOURCE_VEGETABLE.PART/PATH_D_1", "PATH_VEGCART_4")

mod:registerPrefabComponent("PREFAB_VEGETABLEFARM_MARKETCART", {
    DataType = "COMP_BUILDING_PART",
    PathList = {
        {
            PathType = BUILDING_PATH_TYPE.DEFAULT,
            WayPointList = { "PATH_VEGCART_1" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_VEGCART_2" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_VEGCART_3" }
        },
        {
            PathType = BUILDING_PATH_TYPE.PICKUP,
            WayPointList = { "PATH_VEGCART_4" }
        },
    }
})



-- Building -------------------------------------------------------------------------------------
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SET_VEGETABLEFARM1")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SET_VEGETABLEFARM2")
mod:registerEnumValue ("BUILDING_PART_TYPE", "BUILDING_PART_SET_VEGETABLEFARM3")

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_VEGETABLEFARM",
	Name = "BUILDING_VEGETABLEFARM_NAME",
	Description = "BUILDING_VEGETABLEFARM_DESC",
	BuildingType = "FOOD_PRODUCTION",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetMiniatureBuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE",
    SubAssetBuildingList = {
        "BUILDING_VEGETABLEFARM_FARM",
        "BUILDING_VEGETABLEFARM_PLOT",
    },
    -- AssetBuildingPartList = {
    --     "BUILDING_PART_VEGETABLEFARM_FARM",

    --     "BUILDING_PART_VEGETABLEFARM_PLOT1",
    --     "BUILDING_PART_VEGETABLEFARM_PLOT2",

    --     "BUILDING_PART_VEGETABLEFARM_FENCE1",
    --     "BUILDING_PART_VEGETABLEFARM_FENCE2",
    --     "BUILDING_PART_VEGETABLEFARM_MARKETCART",
	-- },
	IsEditable = true
})

-- Free Form
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_VEGETABLEFARM_FARM",
	Name = "BUILDING_VEGETABLEFARM_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_VEGETABLEFARM_FARM1",
        "BUILDING_PART_VEGETABLEFARM_FARM2",
        "BUILDING_PART_VEGETABLEFARM_FARM3",
        "BUILDING_PART_VEGETABLEFARM_FARM4",
        "BUILDING_PART_VEGETABLEFARM_MARKETCART",
	},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 1,
        },
    },
})

-- Fixed plots
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_VEGETABLEFARM_PLOT",
	Name = "BUILDING_FUNCTION_VEGETABLEFARM_PLOT_NAME",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingPartList = {
        "BUILDING_PART_VEGETABLEFARM_PLOT1",
        "BUILDING_PART_VEGETABLEFARM_PLOT2",
        "BUILDING_PART_VEGETABLEFARM_FENCE1",
        "BUILDING_PART_VEGETABLEFARM_FENCE2",
        "BUILDING_PART_VEGETABLEFARM_MARKETCART",
},
	IsEditable = true,
    RequiredPartList = {
        {
            Category = "PRODUCTION",
            Min = 1,
            Max = 4,
        },
    },
})


-- Unlockable
local marketCart = nil
if foundation.isModLoaded("16b72059-8e2b-4e58-8d1f-82a0a03f2cb3") then -- Market carts
    marketCart = {
        {
            OwnerBuilding = "BUILDING_MARKETCART",
            AssetBuildingPartList = {
                "BUILDING_PART_VEGETABLEFARM_MARKETCART",
            },
        },
    }
end

mod:registerAssetId("icons/UnlockableVegetable.png", "ICON_UNLOCKABLE_BUILDING_VEGETABLEFARM", "ATLAS_CELL")
mod:registerAsset({
    DataType = "UNLOCKABLE",
    Id = "UNLOCKABLE_BUILDING_VEGETABLEFARM",
    Name = "BUILDING_VEGETABLEFARM_NAME",
    UnlockableImage = "ICON_UNLOCKABLE_BUILDING_VEGETABLEFARM",
    DataCost = {
        ResourceCollection = {
            {
                Resource = "GOLD_COINS",
                Quantity = 75,
            },
        },
    },
    PrerequisiteUnlockableList = {},
    ActionList = {
        {
            DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
            BuildingProgressData = {
                AssetBuildingList = {
                    "BUILDING_VEGETABLEFARM",
                },
                AdditionalBuildingUnlockList = marketCart,
                WallList = {
                    "WALL_POULTRYFARM_WOVENFENCE",
                },
            },
        },
    },
})

mod:overrideAsset({
    Id = "PROGRESS_TIER_COMMON_T2",
    UnlockableList = {
        Action = "APPEND",
        "UNLOCKABLE_BUILDING_VEGETABLEFARM",
    },
})



-- NO LONGER USED, KEPT FOR SAVE COMPATIBILITY --
-- Job -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_VEGETABLEFARM_PLOT",
	JobName = "JOB_VEGETABLEFARM_NAME",
	JobDescription = "JOB_VEGETABLEFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 25.0, -- default 30
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                }, 
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "FORESTER",
            },
        },
	}
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_VEGETABLEFARM_PLOT"
    }
})



-- Building Function: Vegetable Plot -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_PLOT",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_PLOT_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 25,
    RelatedJob = { 
        -- Job = "JOB_VEGETABLEFARM_PLOT",
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "WATER", Quantity = 10 },
		{ Resource = "RESOURCE_COMPOST", Quantity = 10 }
	},
    ResourceListNeeded = {
		{ Resource = "WATER", Quantity = 1 },
		{ Resource = "RESOURCE_COMPOST", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE", Quantity = 1 }
    },
})



-- Building Function: Vegetable Cart (sell directly to villagers) -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_MARKET",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_MARKETCART",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_CART_NAME",
    WorkerCapacity = 1,
    RelatedJob = {
        Job = "MARKET_TENDER",
        Behavior = "BEHAVIOR_MARKET_TENDING"
    },
	TypeList = { "VEGETABLEFARM_RESOURCE_TYPE" },
	IsOverrideCapacity = true,
	CapacityPerSlot = 20,
	-- InputInventoryCapacity = {
	-- 	{ Resource = "RESOURCE_VEGETABLE", Quantity = 50 },
	-- },
    -- ResourceListNeeded = {
	-- 	{ Resource = "RESOURCE_VEGETABLE", Quantity = 10 },
	-- },
	-- ResourceProduced = {
	-- 	-- { Resource = "RESOURCE_VEGETABLE_SELL", Quantity = 10 },
	-- 	{ Resource = "RESOURCE_VEGETABLE", Quantity = 10 },
	-- }
})



-- Building Part: Plants -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET",
	Name = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEET1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_PLANT_CABBAGE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = -15.0,
            CameraPitchOffset = 35.0
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN",
	Name = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEAN1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI",
	Name = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
    },
})



-- Building Part: Vegetable Plot 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT1_BEET_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT1_CABBAGE_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT1_BEAN_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT1_BROCCOLI_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT1",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_VEGETABLEFARM_PLOT1_BEET_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT1_CABBAGE_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT1_BEAN_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT1_BROCCOLI_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0,
        },
    },
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {10.5, 10.5}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true },
			},
		},
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_PLOT",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "RESOURCE_COMPOST", Quantity = 10 },
                { Resource = "WATER", Quantity = 5 },
                { Resource = "TOOL", Quantity = 1 },
            },
		},
	},
})



-- Building Part: Vegetable Plot 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT2_BEET_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT2" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEET" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT2_CABBAGE_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT2" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_CABBAGE" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT2_BEAN_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT2" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BEAN" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT2_BROCCOLI_ASSEMBLAGE",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_PLOT2" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_PLANT_BROCCOLI" },
        },
	},
})

mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_PLOT2",
	Name = "BUILDING_PART_VEGETABLEFARM_PLOT_NAME",
    Category = "PRODUCTION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
		RandomPartList = {
			"BUILDING_PART_VEGETABLEFARM_PLOT2_BEET_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT2_CABBAGE_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT2_BEAN_ASSEMBLAGE",
			"BUILDING_PART_VEGETABLEFARM_PLOT2_BROCCOLI_ASSEMBLAGE",
        },
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },	
    },
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {7.5, 13.5}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true } 
			},
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_PLOT",
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "RESOURCE_COMPOST", Quantity = 10 },
                { Resource = "WATER", Quantity = 5 },
                { Resource = "TOOL", Quantity = 1 },
            },
		},
	},
})



-- Building Part: Fence 1 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_FENCE1",
	Name = "BUILDING_PART_VEGETABLEFARM_FENCE_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_FENCE1",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
	},
	BuildingZone = {
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {10.5, 10.5}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
			},
		}
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		},
	},
})



-- Building Part: Fence 2 -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_FENCE2",
	Name = "BUILDING_PART_VEGETABLEFARM_FENCE_NAME", 
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_FENCE2",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 25.0
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {7.5, 13.5}, {0, 0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false } 
			},
		}
	},
	Cost = {
        ResourceNeededList = {
            {
                { Resource = "WOOD", Quantity = 4 },
            },
		},
	},
})



-- Building Part: Vegetable Cart -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_VEGETABLEFARM_MARKETCART",
	Name = "BUILDING_PART_VEGETABLEFARM_CART_NAME",
    Category = "MARKET_STALL",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = "PREFAB_VEGETABLEFARM_MARKETCART",
        MiniatureConfig = {
            ClipUnderGround = true,
            GroupHeight = 0.0,
            CameraPosition = { 0, 0, 0 },
            OrientationOffset = 0.0,
            CameraPitchOffset = 20.0
        },
	},
	BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createRectangle( {1, 1}, {0.0, 0.0} ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = true }
			}
		}
	},
	AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_MARKETCART",
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 5 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
		ResourceNeededList = {
            {
                { Resource = "PLANK", Quantity = 2 }
            },
		}
	},
	DesirabilityModifiers = { {
		Desirability = "DESIRABILITY_RESIDENTIAL",
		Type = "ADD",
		Radius = 25.0,
		Value = 0.5
	} }
})



-- Zone -------------------------------------------------------------------------------------
mod:registerAssetId("icons/Zone.png", "ICON_VEGETABLEFARM_ZONE", "ATLAS_CELL")
mod:registerAsset({
    DataType = "ZONE",
    Id = "ZONE_VEGETABLEFARM",
    Name = "ZONE_VEGETABLEFARM_NAME",
    Icon = "ICON_VEGETABLEFARM_ZONE",
    HoverIcon = "ICON_VEGETABLEFARM_ZONE",
    SelectionIcon = "ICON_VEGETABLEFARM_ZONE",
    Description = "ZONE_VEGETABLEFARM_NAME",
    Color = {0.40, 1.70, 0.60, 0.9}, -- RGB A = Light green
    DesirabilityLayerToShow = "DESIRABILITY_FERTILITY"
})



-- Farm Field Config -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_VEGETABLEFARM_BEET",
    ZoneType = "ZONE_VEGETABLEFARM",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEET2",
    HasPlantingCycle = true,
    IsScaling = true,
    RowDistance = 1.5,
    ItemDistance = 1.15,
    RandomOrientation = {0, 360},
    RandomPositionOffset = {-.15, 0.15},
    SourceMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    HarvestedMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingTextureList = {
        "TEXTURE_COLOR",
    },
    HarvestingTextureList = {
        "TEXTURE_COLOR",
    },
    AlphaTestThreshold = 0.5
})

mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_VEGETABLEFARM_CABBAGE",
    ZoneType = "ZONE_VEGETABLEFARM",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_CABBAGE2",
    HasPlantingCycle = true,
    IsScaling = false,
    RowDistance = 1.75,
    ItemDistance = 1.75,
    RandomOrientation = {0, 345},
    RandomPositionOffset = {-.15, 0.15},
    SourceMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    HarvestedMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingTextureList = {
        "TEXTURE_COLOR",
    },
    HarvestingTextureList = {
        "TEXTURE_COLOR",
    },
    AlphaTestThreshold = 0.5
})

mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_VEGETABLEFARM_BEAN",
    ZoneType = "ZONE_VEGETABLEFARM",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BEAN2",
    HasPlantingCycle = true,
    IsScaling = true,
    RowDistance = 1.5,
    ItemDistance = 1.15,
    RandomOrientation = {0, 345},
    RandomPositionOffset = {-.1, 0.1},
    SourceMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    HarvestedMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingTextureList = {
        "TEXTURE_COLOR",
    },
    HarvestingTextureList = {
        "TEXTURE_COLOR",
    },
    AlphaTestThreshold = 0.5
})

mod:registerAsset({
    DataType = "FARM_FIELD_CONFIG",
    Id = "FARM_FIELD_CONFIG_VEGETABLEFARM_BROCCOLI",
    ZoneType = "ZONE_VEGETABLEFARM",
    PlantPrefab = "PREFAB_VEGETABLEFARM_PLANT_BROCCOLI2",
    HasPlantingCycle = true,
    IsScaling = false,
    RowDistance = 1.75,
    ItemDistance = 1.45,
    RandomOrientation = {0, 345},
    RandomPositionOffset = {-.15, 0.15},
    SourceMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    HarvestedMaterial = "MATERIAL_VEGETABLEFARM_COLOR",
    GrowingTextureList = {
        "TEXTURE_COLOR",
    },
    HarvestingTextureList = {
        "TEXTURE_COLOR",
    },
    AlphaTestThreshold = 0.5
})



-- Growing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_GROWING",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                }, 
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "GRAPE_CARING"
            },
        },
	}
})



-- Sowing Setup -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_SOWING",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                }, 
            },
            { -- ALL
                LeftHandObject = {
                    Model = "PREFAB_TOOL_FARMER_SEED_BAG",
                    WorkAttachName = "SeedBag_Anchor",
                    WalkAttachName = "SeedBag_Anchor"
                },
                WalkAnimation = "WALKING",
                IdleAnimation = "FORESTER"
            },
        },
	},
})



-- Harvest Setup: -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "INTERACTIVE_LOCATION_SETUP",
    Id = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_HARVEST",
    PurposeList = {
        "WORK",
    },
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT2",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT2",
                }, 
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "GATHER"
            },
        },
	},
})



-- Job: Vegetable Farmer (field worker) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_VEGETABLEFARM_FARM",
	JobName = "JOB_VEGETABLEFARM_NAME",
	JobDescription = "JOB_VEGETABLEFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_FARMER",
    UseWorkplaceBehavior = true,
    -- ProductionDelay = 2.0, -- time to spend pulling the plant out of the ground
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "FORESTER",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_VEGETABLEFARM_FARM",
    },
})



-- NO LONGER USED, KEPT FOR SAVE COMPATIBILITY --
-- Job: Vegetable Farmer (shed worker / food processor) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "JOB",
	Id = "JOB_VEGETABLEFARM_SHED",
	JobName = "JOB_VEGETABLEFARM_NAME",
	JobDescription = "JOB_VEGETABLEFARM_DESC",
	IsLockedByDefault = false,
	DefaultBehavior = "BEHAVIOR_WORK",
    -- ProductionDelay = 5.0,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        CharacterSetupDataGendered = {
            { -- MALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- FEMALE
                HatList = {
                    "PREFAB_VEGETABLEFARM_HAT1",
                },
            },
            { -- ALL
                WalkAnimation = "WALKING",
                IdleAnimation = "IDLE",
            },
        },
	},
})

mod:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "JOB_VEGETABLEFARM_SHED"
    }
})



-- Building Function: Beets -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_BEET",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_BEET_NAME",
    WorkerCapacity = 3,
    ProductionCycleDurationInSec = 1,
    RelatedJob = {
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_FARMER",
    },
    -- InputInventoryCapacity = {
    -- 	{ Resource = "WATER", Quantity = 5 },
    -- 	-- { Resource = "RESOURCE_DUNG", Quantity = 5 }
    -- },
    ResourceListNeeded = {
        { Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
    },
    ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 6},
    GrowDuration = {6, 10},
    GrowWaitDuration = {10, 12},
    HarvestDuration = {12, 18},
    RestDuration = {18, 21},

    QuantityToHarvestPerStep = 2,
    HarvestStepsCount = 10,
    QuantityToPlantPerStep = 1,
    PlantingStepsCount = 1,
    ResourceValuePerGather = 0.15,
    
    CropFieldConfig = "FARM_FIELD_CONFIG_VEGETABLEFARM_BEET",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_GROWING", -- new in version 1.6.21
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_SOWING",
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_HARVEST"
})



-- Building Function: Cabbage -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_CABBAGE",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_CABBAGE_NAME",
    WorkerCapacity = 3,
    ProductionCycleDurationInSec = 1,
    RelatedJob = {
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_FARMER",
    },
    -- InputInventoryCapacity = {
	-- 	{ Resource = "WATER", Quantity = 5 },
	-- 	{ Resource = "RESOURCE_DUNG", Quantity = 5 }
	-- },
    ResourceListNeeded = {
		{ Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 6},
	GrowDuration = {6, 10},
	GrowWaitDuration = {10, 12},
	HarvestDuration = {12, 18},
	RestDuration = {18, 21},

    QuantityToHarvestPerStep = 2,
	HarvestStepsCount = 5,
	QuantityToPlantPerStep = 1,
	PlantingStepsCount = 1,
	ResourceValuePerGather = 0.25,

    CropFieldConfig = "FARM_FIELD_CONFIG_VEGETABLEFARM_CABBAGE",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_GROWING", -- new in version 1.6.21
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_SOWING", 
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_HARVEST"
})



-- Building Function: Beans -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_BEAN",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_BEAN_NAME",
    WorkerCapacity = 3,
    ProductionCycleDurationInSec = 1,
    RelatedJob = { 
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_FARMER",
    },
    -- InputInventoryCapacity = {
	-- 	{ Resource = "WATER", Quantity = 5 },
	-- 	{ Resource = "RESOURCE_DUNG", Quantity = 5 }
	-- },
    ResourceListNeeded = {
		{ Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 6},
	GrowDuration = {6, 10},
	GrowWaitDuration = {10, 12},
	HarvestDuration = {12, 18},
	RestDuration = {18, 21},

    QuantityToHarvestPerStep = 2,
	HarvestStepsCount = 20,
	QuantityToPlantPerStep = 1,
	PlantingStepsCount = 1,
	ResourceValuePerGather = 0.25,

    CropFieldConfig = "FARM_FIELD_CONFIG_VEGETABLEFARM_BEAN",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_GROWING", -- new in version 1.6.21
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_SOWING", 
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_HARVEST"
})



-- Building Function: Broccoli -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_FARM",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_BROCCOLI",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_BROCCOLI_NAME",
    WorkerCapacity = 3,
    ProductionCycleDurationInSec = 1,
    RelatedJob = { 
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_FARMER",
    },
    -- InputInventoryCapacity = {
	-- 	{ Resource = "WATER", Quantity = 5 },
	-- 	{ Resource = "RESOURCE_DUNG", Quantity = 5 }
	-- },
    ResourceListNeeded = {
		{ Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 1 },
    },

    -- there is a max total cycle of 21 days so if you plan beyond that, it will be cut short
    SowingDurationPerc = {0, 6},
	GrowDuration = {6, 10},
	GrowWaitDuration = {10, 12},
	HarvestDuration = {12, 18},
	RestDuration = {18, 21},

    QuantityToHarvestPerStep = 2,
	HarvestStepsCount = 5,
	QuantityToPlantPerStep = 1,
	PlantingStepsCount = 1,
	ResourceValuePerGather = 0.25,

    CropFieldConfig = "FARM_FIELD_CONFIG_VEGETABLEFARM_BROCCOLI",
    GrowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_GROWING", -- new in version 1.6.21
    SowingSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_SOWING", 
    HarvestSetup = "INTERACTIVE_LOCATION_SETUP_VEGETABLEFARM_HARVEST"
})



-- Building Function: Vegetable shed -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_VEGETABLEFARM_SHED",
    Name = "BUILDING_FUNCTION_VEGETABLEFARM_SHED_NAME",
    WorkerCapacity = 1,
    ProductionCycleDurationInSec = 1,
    RelatedJob = {
        -- Job = "JOB_VEGETABLEFARM_SHED",
        Job = "JOB_VEGETABLEFARM_FARM",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "WATER", Quantity = 20 },
		{ Resource = "RESOURCE_COMPOST", Quantity = 20 },
		{ Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 50 },
	},
    ResourceListNeeded = {
		{ Resource = "WATER", Quantity = 1 },
		{ Resource = "RESOURCE_COMPOST", Quantity = 1 },
		{ Resource = "RESOURCE_VEGETABLE_RAW", Quantity = 6 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_VEGETABLE", Quantity = 12 },
    },
})



-- Building part: Vegetable Farm (storage and work building) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE1",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.001" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.001" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE2",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.001" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.002" },
        },
    },
})


mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE3",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.001" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.003" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE4",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.002" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.001" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE5",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.002" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.004" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE6",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.003" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.002" },
        },
    },
})

mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE7",
    Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_ASSEMBLAGE",
		CoreRandomBuildingPartList = { "PREFAB_VEGETABLEFARM_FARM1" },
		MandatoryBuildingPartList = {
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_SHED", OptionalAttachNodeString = "Attach_Minor.003" },
			{ BuildingPart = "BUILDING_PART_VEGETABLEFARM_DOOR", OptionalAttachNodeString = "Attach_Door.004" },
        },
    },
})

for i = 1, 4 do
    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = "BUILDING_PART_VEGETABLEFARM_FARM" .. i,
        -- Name = "BUILDING_PART_VEGETABLEFARM_FARM_NAME",
        Category = "PRODUCTION",
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_RANDOM_PART",
            RandomPartList = {
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE1",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE2",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE3",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE4",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE5",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE6",
                "BUILDING_PART_VEGETABLEFARM_FARM_ASSEMBLAGE7",
            },
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0.0,
                CameraPosition = { 0, 2.6, -21 },
                OrientationOffset = 0.0,
                CameraPitchOffset = 0.0,
            },
        },
        BuildingZone = {
            ZoneEntryList = {
                { 
                    Polygon = polygon.createRectangle( {5.25, 5.25}, {0.0, 0.0}),
                    Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
                },
            },
        },
        -- AssetBuildingFunction = "BUILDING_FUNCTION_ASSIGNABLE_VEGETABLEFARM",
        Cost = {
            BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 20 } },
            UpkeepCost = { { Resource = "GOLD", Quantity = 1 } },
            ResourceNeededList = {
                {
                    { Resource = "WOOD", Quantity = 10 },
                    { Resource = "STONE", Quantity = 6 },
                    { Resource = "PLANK", Quantity = 6 },
                    { Resource = "TOOL", Quantity = 8 },
                },
            },
        },
    })
end

mod:overrideAsset({ Id = "BUILDING_PART_VEGETABLEFARM_FARM1", Name = "BUILDING_VEGETABLEFARM_BEET_NAME", AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_BEET", })
mod:overrideAsset({ Id = "BUILDING_PART_VEGETABLEFARM_FARM2", Name = "BUILDING_VEGETABLEFARM_CABBAGE_NAME", AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_CABBAGE", })
mod:overrideAsset({ Id = "BUILDING_PART_VEGETABLEFARM_FARM3", Name = "BUILDING_VEGETABLEFARM_BEAN_NAME", AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_BEAN", })
mod:overrideAsset({ Id = "BUILDING_PART_VEGETABLEFARM_FARM4", Name = "BUILDING_VEGETABLEFARM_BROCCOLI_NAME", AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_BROCCOLI", })



-- Building part: Vegetable Shed 1 (water, compost collection and vegetable processing) -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_SHED",
    Name = "BUILDING_PART_VEGETABLEFARM_SHED_NAME",
    AssetBuildingFunction = "BUILDING_FUNCTION_VEGETABLEFARM_SHED",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_VEGETABLEFARM_SHED1",
    }, 
	BuildingZone = { 
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle( {5.25, 2.5}, {0.0, 0.0}),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
            {
                Polygon = polygon.createRectangle( {3.5, 1.25}, {0.0, 0.0}),
                Type = { DEFAULT = false, NAVIGABLE = true, GRASS_CLEAR = true },
            },
		},
	},
})



-- Building part: Door -------------------------------------------------------------------------------------
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_VEGETABLEFARM_DOOR",
    Name = "BUILDING_PART_VEGETABLEFARM_DOOR_NAME",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_VEGETABLEFARM_DOOR1",
    },
})



-- -- Add vegetable plots the House monuments ----------------------------------------------------------------------------------------------
-- mod:overrideAsset({
-- 	Id = "BUILDING_HOUSE",
-- 	AssetBuildingPartList = {
--         Action = "APPEND",
--         "BUILDING_PART_VEGETABLEFARM_PLOT1",
--         "BUILDING_PART_VEGETABLEFARM_PLOT2",
--         "BUILDING_PART_VEGETABLEFARM_FENCE1",
--         "BUILDING_PART_VEGETABLEFARM_FENCE2",
--     },
-- })

