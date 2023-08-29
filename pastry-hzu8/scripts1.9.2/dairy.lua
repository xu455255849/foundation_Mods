local DairyAddition = ...

DairyAddition:overrideAsset({
                Id = "BUILDING_FUNCTION_DAIRY_FARM",
                Name = DairyAdditionPrefix .. "_BUILDING_FUNCTION_DAIRY_FARM_NAME"
})

DairyAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_ASSIGNABLE",
                Id = DairyAdditionPrefix .. "_ASSIGNABLE_FUNCTION",
                AuthorizedFunctionList = DairyAdditionPrefix .. "_FUNCTION_LIST"
})

DairyAddition:registerAsset({
		DataType = "BUILDING_FUNCTION_LIST",
                Id = DairyAdditionPrefix .. "_FUNCTION_LIST",
                AssetFunctionList = {
                       "BUILDING_FUNCTION_DAIRY_FARM",
                       _PastryPrefix .. "_CREAMERY_FUNCTION",
                }
})

DairyAddition:overrideAsset({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_DAIRY_FARM",
	AssetBuildingFunction = DairyAdditionPrefix .. "_ASSIGNABLE_FUNCTION"
})
