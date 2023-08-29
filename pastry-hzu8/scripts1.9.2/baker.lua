local BakerAddition = ...

BakerAddition:overrideAsset({
                Id = "BUILDING_FUNCTION_BAKERY",
                Name = BakerAdditionPrefix .. "_BUILDING_FUNCTION_BAKERY_NAME"
})

BakerAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_ASSIGNABLE",
                Id = BakerAdditionPrefix .. "_ASSIGNABLE_FUNCTION",
                AuthorizedFunctionList = BakerAdditionPrefix .. "_FUNCTION_LIST"
})

BakerAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_LIST",
                Id = BakerAdditionPrefix .. "_FUNCTION_LIST",
                AssetFunctionList = {
                       "BUILDING_FUNCTION_BAKERY",
	                 _PastryPrefix .. "_RECIPE_1_FUNCTION",
	                 _PastryPrefix .. "_RECIPE_2_FUNCTION",
                }
})

BakerAddition:overrideAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_BAKERY",
	AssetBuildingFunction = BakerAdditionPrefix .. "_ASSIGNABLE_FUNCTION"
})
