local mod = ...



-- Building Asset Processor  -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/CiderPress2.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Assets -------------------------------------------------------------------------------------
mod:registerAssetId("models/CiderPress2.fbx/Prefab/Cidermill.Part.001", "PREFAB_ORCHARD_CIDERMILL")
mod:registerAssetId("models/CiderPress2.fbx/Prefab/Cidermill.Part.001.Constr", "PREFAB_ORCHARD_CIDERMILL_CONSTR")
mod:registerAssetId("models/CiderPress2.fbx/Prefab/Cidermill.Part.001/Door.001", "PREFAB_ORCHARD_CIDERMILL_DOOR")



-- Grounding  -------------------------------------------------------------------------------------
mod:registerPrefabComponent("PREFAB_ORCHARD_CIDERMILL_DOOR", {DataType = "COMP_GROUNDED"})



-- Sail movement -------------------------------------------------------------------------------------
local COMP_CIDERPRESS = {
    TypeName = "COMP_CIDERPRESS",
    ParentType = "COMPONENT",
    Properties = {
        { Name = "Velocity", Type = "float", Default = 0.3 },
    },
}

function COMP_CIDERPRESS:onEnabled()
    self:getOwner():forEachChild(function(objChild)
        if objChild.Name == "Sail.001" then
            self.Sail = objChild
        end
    end)
end

function COMP_CIDERPRESS:rotateSail()
    local dt = self:getLevel():getDeltaTime()
    self.Sail:rotateLocalY(-self.Velocity * dt)
end

function COMP_CIDERPRESS:update()
    self:rotateSail()
end

mod:registerClass(COMP_CIDERPRESS)

mod:registerPrefabComponent("PREFAB_ORCHARD_CIDERMILL", { DataType = "COMP_BUILDING_PART", FeedbackComponentListToActivate = { { "PREFAB_ORCHARD_CIDERMILL", "COMP_CIDERPRESS" } } })
mod:registerPrefabComponent("PREFAB_ORCHARD_CIDERMILL", { DataType = "COMP_CIDERPRESS", Enabled = false })



-- Building Function: Cider Press -------------------------------------------------------------------------------------
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_CIDERPRESS",
    Name = "BUILDING_CIDERPRESS_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30.0,
    RelatedJob = {
        Job = "MILLER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
		{ Resource = "RESOURCE_FRUIT", Quantity = 25 },
		{ Resource = "WATER", Quantity = 25 },
	},
    ResourceListNeeded = {
		{ Resource = "RESOURCE_FRUIT", Quantity = 2 },
		{ Resource = "WATER", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_CIDER", Quantity = 1 },
    },
})



-- Building: Cider Press -------------------------------------------------------------------------------------
-- mod:registerAsset({
-- 	DataType = "BUILDING",
-- 	Id = "BUILDING_CIDERPRESS",
-- 	Name = "BUILDING_CIDERPRESS_NAME",
-- 	Description = "BUILDING_CIDERPRESS_DESC",
--     BuildingType = "FOOD_PRODUCTION",
--     AssetCoreBuildingPart = "BUILDING_PART_CIDERPRESS",
-- })

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_CIDERPRESS",
	Name = "BUILDING_CIDERPRESS_NAME",
	Description = "BUILDING_CIDERPRESS_DESC",
    BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = "BUILDING_PART_CIDERPRESS",
    IsEditable = true,
})



-- Building part: Cider Press ------------------------------------------------------------------------------------- (FOR COMPATIBILITY WITH SAVED GAMES)
mod:registerAsset({
	DataType = "BUILDING_PART",
    Id = "BUILDING_PART_CIDERPRESS",
	Name = "BUILDING_CIDERPRESS_NAME",
    Category = "PRODUCTION",
    AssetBuildingFunction = "BUILDING_FUNCTION_CIDERPRESS",
    ConstructionVisual = "PREFAB_ORCHARD_CIDERMILL_CONSTR",
	BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createCircle( 3.5, {0.0, 0.0}, 16 ),
                Type = { DEFAULT = true, NAVIGABLE = true, GRASS_CLEAR = false },
            },
		},
	},
    ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_ORCHARD_CIDERMILL",
            MiniatureConfig = {
                ClipUnderGround = true,
                GroupHeight = 0,
                CameraPosition = { -1, 8, -40 },
                OrientationOffset = 0,
                CameraPitchOffset = 0.0,
            },
        },
	Cost = {
		BuildRightTaxes = {	{ Resource = "GOLD", Quantity = 50 } },
		UpkeepCost = { { Resource = "GOLD", Quantity = 10 } },
		ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 5 },
                { Resource = "WOOD", Quantity = 10 },
                { Resource = "PLANK", Quantity = 10 },
                { Resource = "TOOL", Quantity = 10 },
            },
		},
    },
})



-- Taxation: Cider Press -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "TAXATION_FUNCTION_PRODUCTION_FLOUR",
    AssetResourceList = {
        Action = "APPEND",
        "RESOURCE_CIDER",
    },
})
