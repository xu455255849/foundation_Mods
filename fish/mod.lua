local FishFarm = foundation.createMod()

FishFarm:override({
    Id = "BUILDING_FUNCTION_FISHING_HUT",
    ResourceProduced = {
        {
            Resource = "FISH",
            Quantity = 15
        }
    }
})