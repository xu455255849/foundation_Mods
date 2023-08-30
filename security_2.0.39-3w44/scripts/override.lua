local mod = ...




-- Assignable function list
function AppendSecurityFunction(listId, func)

    mod:overrideAsset({
        Id = listId,
        AssetFunctionList = {
            Action = "APPEND",
            func,
        }
    })

end



-- Security generator
function AttachSecurityGenerator(prefab, base, worker)

    mod:registerPrefabComponent(prefab, {
        DataType = "COMP_SECURITY_POINTS",
        BasePoints = base,
        WorkerPoints = worker
    })

    mod:registerPrefabComponent(prefab, {
        -- DataType = "COMP_SECURITY_OVERLAY"
        DataType = "COMP_SECURITY_OVERLAY_INIT"
    })

end



-- Frontier Fortifications mod -------------------------------------------------------------------------------------
if (foundation.isModLoaded("7c53a142-5dc3-4947-aa65-37d591ca927c")) then

    mod:overrideAsset({
        Id = "BUILDING_PART_FRONTIER_KEEP1",
        AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_CONSTABLE"
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_FRONTIER_TOWER1",
        AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD1"
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_FRONTIER_TOWER2",
        AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD1"
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_FRONTIER_GATE1",
        AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD1"
    })

    mod:overrideAsset({
        Id = "BUILDING_PART_FRONTIER_GATE4",
        AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD1"
    })

    mod:registerPrefabComponent("PREFAB_FRONTIER_KEEP1", { DataType = "COMP_SECURITY_POINTS", BasePoints = 4, WorkerPoints = 2 } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER1", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER2", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_GATE1", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_GATE4", { DataType = "COMP_SECURITY_POINTS", BasePoints = 2, WorkerPoints = 2 } )

    -- mod:registerPrefabComponent("PREFAB_FRONTIER_KEEP1", { DataType = "COMP_SECURITY_OVERLAY" } )
    -- mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER1", { DataType = "COMP_SECURITY_OVERLAY" } )
    -- mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER2", { DataType = "COMP_SECURITY_OVERLAY" } )
    -- mod:registerPrefabComponent("PREFAB_FRONTIER_GATE1", { DataType = "COMP_SECURITY_OVERLAY" } )
    -- mod:registerPrefabComponent("PREFAB_FRONTIER_GATE4", { DataType = "COMP_SECURITY_OVERLAY" } )

    mod:registerPrefabComponent("PREFAB_FRONTIER_KEEP1", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER1", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_TOWER2", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_GATE1", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )
    mod:registerPrefabComponent("PREFAB_FRONTIER_GATE4", { DataType = "COMP_SECURITY_OVERLAY_INIT" } )

    mod:overrideAsset({
        Id = "BUILDING_FRONTIER_FORTIFICATION",
        AssetBuildingPartList = {
            Action = "APPEND",
            "BUILDING_PART_SECURITY_PATROLPOINT",
        },
    })



end



-- Material Set List - -------------------------------------------------------------------------------
local materialSetList = {
    Action = "APPEND",
    {
        SetName = "MATERIAL_SET_SECURITY1_NAME",
        MaterialList = {
            "MATERIAL_SECURITY_STONE1_4",
            "MATERIAL_SECURITY_STONE1_5",
            "MATERIAL_SECURITY_STONE1_6",
            "MATERIAL_SECURITY_STONE1_7",
            "MATERIAL_SECURITY_STONE1_8",
            "MATERIAL_SECURITY_STONE1_9",
            "MATERIAL_SECURITY_ROOF1_4",
            "MATERIAL_SECURITY_ROOF1_5",
            "MATERIAL_SECURITY_ROOF1_6",
            "MATERIAL_SECURITY_ROOF1_7",
            "MATERIAL_SECURITY_ROOF1_8",
            "MATERIAL_SECURITY_ROOF1_9",
            "MATERIAL_SECURITY_WOOD1",
            "MATERIAL_SECURITY_WOOD3",
            "MATERIAL_SECURITY_WOOD5",
            "MATERIAL_SECURITY_WOOD7",
            "MATERIAL_SECURITY_WOOD9",
        },
    },
    {
        SetName = "MATERIAL_SET_SECURITY2_NAME",
        MaterialList = {
            "MATERIAL_SECURITY_STONE2_4",
            "MATERIAL_SECURITY_STONE2_5",
            "MATERIAL_SECURITY_STONE2_6",
            "MATERIAL_SECURITY_STONE2_7",
            "MATERIAL_SECURITY_STONE2_8",
            "MATERIAL_SECURITY_STONE2_9",
            "MATERIAL_SECURITY_ROOF1_4",
            "MATERIAL_SECURITY_ROOF1_5",
            "MATERIAL_SECURITY_ROOF1_6",
            "MATERIAL_SECURITY_ROOF1_7",
            "MATERIAL_SECURITY_ROOF1_8",
            "MATERIAL_SECURITY_ROOF1_9",
            "MATERIAL_SECURITY_WOOD1",
            "MATERIAL_SECURITY_WOOD3",
            "MATERIAL_SECURITY_WOOD5",
            "MATERIAL_SECURITY_WOOD7",
            "MATERIAL_SECURITY_WOOD9",
        },
    },
    {
        SetName = "MATERIAL_SET_SECURITY3_NAME",
        MaterialList = {
            "MATERIAL_SECURITY_STONE3_4",
            "MATERIAL_SECURITY_STONE3_5",
            "MATERIAL_SECURITY_STONE3_6",
            "MATERIAL_SECURITY_STONE3_7",
            "MATERIAL_SECURITY_STONE3_8",
            "MATERIAL_SECURITY_STONE3_9",
            "MATERIAL_SECURITY_ROOF2_4",
            "MATERIAL_SECURITY_ROOF2_5",
            "MATERIAL_SECURITY_ROOF2_6",
            "MATERIAL_SECURITY_ROOF2_7",
            "MATERIAL_SECURITY_ROOF2_8",
            "MATERIAL_SECURITY_ROOF2_9",
            "MATERIAL_SECURITY_WOOD2", -- round tower top wood part
            "MATERIAL_SECURITY_WOOD4",
            "MATERIAL_SECURITY_WOOD6",
            "MATERIAL_SECURITY_WOOD8",
            "MATERIAL_SECURITY_WOOD10",
        },
    },
    {
        SetName = "MATERIAL_SET_SECURITY4_NAME",
        MaterialList = {
            "MATERIAL_SECURITY_STONE4_4",
            "MATERIAL_SECURITY_STONE4_5",
            "MATERIAL_SECURITY_STONE4_6",
            "MATERIAL_SECURITY_STONE4_7",
            "MATERIAL_SECURITY_STONE4_8",
            "MATERIAL_SECURITY_STONE4_9",
            "MATERIAL_SECURITY_ROOF2_4",
            "MATERIAL_SECURITY_ROOF2_5",
            "MATERIAL_SECURITY_ROOF2_6",
            "MATERIAL_SECURITY_ROOF2_7",
            "MATERIAL_SECURITY_ROOF2_8",
            "MATERIAL_SECURITY_ROOF2_9",
            "MATERIAL_SECURITY_WOOD2", -- round tower top wood part
            "MATERIAL_SECURITY_WOOD4",
            "MATERIAL_SECURITY_WOOD6",
            "MATERIAL_SECURITY_WOOD8",
            "MATERIAL_SECURITY_WOOD10",
        },
    },
}



-- Lord Manor
-- note: adding the security points is dealt with in the component script
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_LORD_MANOR", "BUILDING_FUNCTION_SECURITY_GUARD2") -- does not exist in 1.9 onward
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_RUSTIC_LORD_MANOR",
	Name = "CATEGORY_BUILDING_PART_SETLIST_SECURITY2",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD_EMBED",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        "BUILDING_PART_SECURITY_CONSTABLED",
        "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER_DOOR5",
        "BUILDING_PART_SECURITY_PATROLPOINT",
        "BUILDING_PART_SECURITY_WALL2",
        "BUILDING_PART_SECURITY_GATE2",
        "BUILDING_PART_SECURITY_WALL_DOOR2",

        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_WALL",
        "BUILDING_PART_SECURITY_GATE",
        "BUILDING_PART_SECURITY_WALL_DOOR",
        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
        "BUILDING_PART_SECURITY_BANNER",
        "BUILDING_PART_SECURITY_PATROLPOINT",
    },
    MaterialSetList = materialSetList,
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_RUSTIC_LORD_MANOR_PRISON",
	Name = "BUILDING_FUNCTION_SECURITY_PRISON_NAME",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_PRISON_EMBED",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER_DOOR5",
        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
    },
    MaterialSetList = materialSetList,
})



-- Wooden Keep
-- note: adding the security points is dealt with in the component script
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_KEEP", "BUILDING_FUNCTION_SECURITY_GUARD2") -- does not exist in 1.9 onward
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_KEEP", "BUILDING_FUNCTION_SECURITY_PRISON") -- does not exist in 1.9 onward
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_WOODEN_KEEP",
	Name = "CATEGORY_BUILDING_PART_SETLIST_SECURITY2",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD_EMBED_SOLDIER",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER_DOOR5",
        "BUILDING_PART_SECURITY_WALL2",
        "BUILDING_PART_SECURITY_GATE2",
        "BUILDING_PART_SECURITY_WALL_DOOR2",
        "BUILDING_PART_SECURITY_PATROLPOINT",

        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_WALL",
        "BUILDING_PART_SECURITY_GATE",
        "BUILDING_PART_SECURITY_WALL_DOOR",
        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
        "BUILDING_PART_SECURITY_BANNER",
        "BUILDING_PART_SECURITY_PATROLPOINT",
    },
    MaterialSetList = materialSetList,
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_WOODEN_KEEP_PRISON",
	Name = "BUILDING_FUNCTION_SECURITY_PRISON_NAME",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_PRISON_EMBED",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER_DOOR5",
        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
    },
    MaterialSetList = materialSetList,
})


-- Stone Keep
-- note: adding the security points is dealt with in the component script
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_KEEP", "BUILDING_FUNCTION_SECURITY_GUARD2") -- does not exist in 1.9 onward
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_KEEP", "BUILDING_FUNCTION_SECURITY_PRISON") -- does not exist in 1.9 onward

-- moved to Security.lua

-- mod:overrideAsset({
--     Id = "MONUMENT_WOODEN_KEEP",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_SECURITY_WOODEN_KEEP",
--     },
-- })



-- Monastery
-- note: adding the security points is dealt with when the function is selected
-- AppendSecurityFunction("BUILDING_FUNCTION_LIST_MONASTERY", "BUILDING_FUNCTION_SECURITY_GUARD_MONK") -- does not exist in 1.9 onward
mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_MONASTERY",
	Name = "CATEGORY_BUILDING_PART_SETLIST_SECURITY2",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD_MONK",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        -- "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_WALL",
        "BUILDING_PART_SECURITY_GATE",
        "BUILDING_PART_SECURITY_WALL_DOOR",

        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
        "BUILDING_PART_SECURITY_PATROLPOINT",
    },
    MaterialSetList = materialSetList,
})

mod:registerAsset({
	DataType = "BUILDING",
	Id = "BUILDING_SECURITY_MONASTERY_PRISON",
	Name = "BUILDING_FUNCTION_SECURITY_PRISON_NAME",
	Description = "BUILDING_SECURITY_DESC",
	AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_PRISON_EMBED",
    AssetMiniatureBuildingPart = "BUILDING_PART_SECURITY_BANNER",
    AssetBuildingPartList = {
        -- "BUILDING_PART_SECURITY_TOWER7",
        "BUILDING_PART_SECURITY_TOWER1",
        "BUILDING_PART_SECURITY_TOWER2",
        "BUILDING_PART_SECURITY_TOWER3",
        "BUILDING_PART_SECURITY_TOWER4",
        "BUILDING_PART_SECURITY_TOWER5",
        "BUILDING_PART_SECURITY_TOWER6",
        "BUILDING_PART_SECURITY_TOWER_DOOR",
        "BUILDING_PART_SECURITY_TOWER_WINDOW1",
        "BUILDING_PART_SECURITY_TOWER_WINDOW2",
    },
    MaterialSetList = materialSetList,
})

-- mod:overrideAsset({
--     Id = "MONUMENT_MONASTERY",
--     SubAssetBuildingList = {
--         Action = "APPEND",
--         "BUILDING_SECURITY_MONASTERY",
--     },
-- })


mod:overrideAsset({
    Id = "MONUMENT_MONASTERY",
    MaterialSetList = materialSetList,
})



-- Giant Gate masterpiece
-- note: adding the security points is dealt with in the component script
mod:overrideAsset({
    Id = "BUILDING_PART_GATE_ROUND_TOWER",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD2"
})

mod:overrideAsset({
    Id = "BUILDING_PART_GATE_ROUND_WATCHTOWER",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD2"
})

mod:overrideAsset({
    Id = "BUILDING_PART_GATE_TOWER",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD2"
})

mod:overrideAsset({
    Id = "BUILDING_PART_GATE_WATCHTOWER",
    AssetBuildingFunction = "BUILDING_FUNCTION_SECURITY_GUARD2"
})
