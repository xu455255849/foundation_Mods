local mod = ...



-- Add honey mead as a production option at the Tavern -----------------------------------------------------------------

-- Function
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_MEAD",
	Name = "BUILDING_MEAD_NAME",
    WorkerCapacity = 2,
    ProductionCycleDurationInSec = 30,
    RelatedJob = {
        Job = "BREWER",
        Behavior = "BEHAVIOR_WORK",
    },
    InputInventoryCapacity = {
        { Resource = "HONEY", Quantity = 30 },
        { Resource = "WATER", Quantity = 10 },
	},
    ResourceListNeeded = {
        { Resource = "HONEY", Quantity = 3 },
        { Resource = "WATER", Quantity = 1 },
	},
	ResourceProduced = {
        { Resource = "RESOURCE_MEAD", Quantity = 3 },
    },
})

-- Sub-building
mod:registerAsset({
    DataType = "BUILDING",
    Id = "BUILDING_MEAD",
    Name = "BUILDING_MEAD_NAME",
    Description = "BUILDING_MEAD_DESC",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_MEAD",
    IsEditable = true,
    RequiredPartList = {
        {
            Category = "ROOM",
            Min = 1,
        },
        {
            Category = "CHIMNEY",
            Min = 1,
        },
        {
            Category = "DOOR",
            Min = 1,
        },
    },
})

-- Tavern
mod:overrideAsset({
    Id = "MONUMENT_TAVERN",
    SubAssetBuildingList = {
        Action = "APPEND",
        "BUILDING_MEAD",
    },
})
