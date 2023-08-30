local mod = ...



-- Building Asset Processor -------------------------------------------------------------------------------------
mod:registerAssetProcessor("models/Alert1.fbx", { DataType = "BUILDING_ASSET_PROCESSOR" })



-- Prefabs -------------------------------------------------------------------------------------
mod:registerAssetId("models/Alert1.fbx/Prefab/Alert.Part", "PREFAB_SECURITY_ALERT")



-- Building Function: Alert -------------------------------------------------------------------------------------
-- Used to track alerts with the Resource toolbar
mod:registerAsset({
    DataType = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
    Id = "BUILDING_FUNCTION_SECURITY_ALERT",
	Name = "EVENT_SECURITY_CRIME_TITLE",
	ResourceGenerated = "RESOURCE_ALERT",
	IsInfinite = false,
})



-- Component: Security Alert -------------------------------------------------------------------------------------
local COMP_SECURITY_ALERT = {
	TypeName = "COMP_SECURITY_ALERT",
	ParentType = "COMPONENT",
	Properties = {
		{ Name = "Timer", Type = "integer", Default = 2, Flags = { "SAVE_GAME" } },
    }
}

-- Register Component
mod:registerClass(COMP_SECURITY_ALERT)


-- Attach component
mod:registerPrefabComponent("PREFAB_SECURITY_ALERT", { DataType = "COMP_SECURITY_ALERT" } )

