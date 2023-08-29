local floppyZenithWood = foundation.createMod()

floppyZenithWood:override({
    Id = "BUILDING_FUNCTION_WOODCUTTER",
    ResourceProduced = {
        {
            Resource = "WOOD",
            Quantity = 10
        }
    }
})