local mod = ...



-- Add univeral housing to fulfilling housing need -------------------------------------------------------------------------------------
mod:overrideAsset({
    Id = "NEED_HOUSE_LEVEL_1",
    NeedTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_UNIVERSAL_HOUSING",
    },
})

mod:overrideAsset({
    Id = "NEED_HOUSE_LEVEL_2",
    NeedTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_UNIVERSAL_HOUSING",
    },
})

mod:overrideAsset({
    Id = "NEED_HOUSE_SOLDIER",
    NeedTypeList = {
        Action = "APPEND",
        "RESOURCE_TYPE_UNIVERSAL_HOUSING",
    },
})


