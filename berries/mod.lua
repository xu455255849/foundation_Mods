local BerriesFarm = foundation.createMod()

BerriesFarm:override({
    Id = "BUILDING_FUNCTION_BERRY_TABLE",
    ResourceProduced = {
        {
            Resource = "BERRIES",
            Quantity = 10
        }
    }
})