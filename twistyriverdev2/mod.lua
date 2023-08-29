local mapMod = foundation.createMod();

mapMod:registerAssetId("maps/heightmap.png", "HEIGHT_MAP")
mapMod:registerAssetId("maps/material_mask.png", "MATERIAL_MASK")
mapMod:registerAssetId("maps/coniferous_density.png", "CONIFEROUS_DENSITY_MAP")
mapMod:registerAssetId("maps/deciduous_density.png", "DECIDUOUS_DENSITY_MAP")
mapMod:registerAssetId("maps/berries_density.png", "BERRIES_DENSITY_MAP")
mapMod:registerAssetId("maps/fish_density.png", "FISH_DENSITY_MAP")
mapMod:registerAssetId("maps/rock_density.png", "ROCK_DENSITY_MAP")


-- Register Custom Map
mapMod:register({
	DataType = "CUSTOM_MAP",
	Id = "MAP_TWISTYRIVER",
	HeightMap = "HEIGHT_MAP",
	MaterialMask = "MATERIAL_MASK",
	MinHeight = -5,
	MaxHeight = 150,
	VillagePathList = {
		{
			Entrance = { 16, 0, 333 },
			Exit = { 16, 0, 333 }
		},
		{
			Entrance = { 1013, 0, 632 },
			Exit = { 1013, 0, 632 }
		},
		{
			Entrance = { 1012, 0, 483 },
			Exit = { 1012, 0, 483 }
		},
	},
	SpawnList = {
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 687 , 26 , 192 },  -- X, Z, Y
			Orientation = { 0.0, 0.1 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 660 , 21 , 193 },  -- X, Z, Y
			Orientation = { 0.0, 0.7 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 661 , 18 , 181 },  -- X, Z, Y
			Orientation = { 0.0, 0.3 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 667 , 21 , 166 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 644 , 15 , 384 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 646 , 14 , 400 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 646 , 18 , 415 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 547 , 7 , 561 },  -- X, Z, Y
			Orientation = { 0.0, 40.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 557 , 7 , 566 },  -- X, Z, Y
			Orientation = { 0.0, 90.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 561 , 7 , 578 },  -- X, Z, Y
			Orientation = { 0.0, 140.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 525 , 0 , 460 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.1, 1.3 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 525 , 0 , 444 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.5 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 513 , 0 , 450 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.2, 1.4, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 520 , 33 , 780 },  -- X, Z, Y
			Orientation = { 0.0, 45.0 , 0.0},
			Scale = { 1.0, 1.4, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 528 , 35 , 785 },  -- X, Z, Y
			Orientation = { 0.0, 5.0 , 0.0},
			Scale = { 1.0, 1.6, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 538 , 30 , 784 },  -- X, Z, Y
			Orientation = { 0.0, 15.0 , 0.0},
			Scale = { 1.0, 1.6, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 547 , 30 , 782 },  -- X, Z, Y
			Orientation = { 0.0, 2.0 , 0.0},
			Scale = { 1.0, 1.6, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 692 , 14 , 408 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 686 , 17 , 421 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 261 , 10 , 236 },  -- X, Z, Y
			Orientation = { 0.0, 1.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 259 , 10 , 246 },  -- X, Z, Y
			Orientation = { 0.0, 5.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 248 , 8 , 252 },  -- X, Z, Y
			Orientation = { 0.0, 9.0 , 0.0},
			Scale = { 1.6, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 474 , 8 , 158 },  -- X, Z, Y
			Orientation = { 0.0, 67.0 , 0.0},
			Scale = { 1.0, 1.0, 1.4 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 467 , 8 , 148 },  -- X, Z, Y
			Orientation = { 0.0, 67.0 , 0.0},
			Scale = { 1.0, 1.0, 1.4 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 821 , 24 , 795 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 851 , 24 , 783 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 832 , 24 , 789 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 724 , 13 , 742 },  -- X, Z, Y
			Orientation = { 0.0, 10.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 869 , 0 , 380 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 864 , 0 , 393 },  -- X, Z, Y
			Orientation = { 0.0, 5.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 860 , 0 , 383 },  -- X, Z, Y
			Orientation = { 0.0, 30.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 358 , 31 , 725 },  -- X, Z, Y
			Orientation = { 0.0, 10.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 365 , 31 , 716 },  -- X, Z, Y
			Orientation = { 0.0, 40.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 376 , 31 , 714 },  -- X, Z, Y
			Orientation = { 0.0, 8.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 371 , 31 , 726 },  -- X, Z, Y
			Orientation = { 0.0, 19.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 365 , 37 , 726 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 220 , 15 , 585 },  -- X, Z, Y
			Orientation = { 0.0, 0.0 , 0.0},
			Scale = { 1.0, 1.0, 1.2 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 225 , 10 , 577 },  -- X, Z, Y
			Orientation = { 0.0, 8.0 , 0.0},
			Scale = { 1.0, 1.0, 1.2 },
			PatchBeforeVersion = "1.1.0"
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 236 , 13 , 583 },  -- X, Z, Y
			Orientation = { 0.0, 8.0 , 0.0},
			Scale = { 1.3, 1.0, 1.0 },
			PatchBeforeVersion = "1.1.0"
		},
	},	
	DensitySpawnList = {
		{
			-- Create forest of Deciduous trees and a few smaller Pine trees
			DensityMap = "DECIDUOUS_DENSITY_MAP",
			Density = 0.8,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_TREE_SYCAMORE", "PREFAB_TREE_OAK", "PREFAB_TREE_POPLAR" },
					RandomWeight = 1,
					OffsetSizeRange = {
						Min = 0.75,
						Max = 1.0
					},
					OrientationRange = {
						Min = { 0, -180, 0},
						Max = { 0, 180, 0}
					},
					ScaleRange = {
						Min = 1.0,
						Max = 1.5
					},
					ColorRange = {
						--Min = { 0.8, 0.8, 0.8, 1 },
						--Max = { 1, 1, 1, 1 }
						Min = { 0.7, 0.7, 0.7, 1 },
						Max = { 0.75, 0.75, 0.75, 1 }
					}
				},
				{
					PrefabList = { "PREFAB_TREE_PINE" },
					RandomWeight = 0.01,
					OffsetSizeRange = {
						Min = 0.5,
						Max = 0.9
					},
					OrientationRange = {
						Min = { 0, -180, 0},
						Max = { 0, 180, 0}
					},
					ScaleRange = {
						Min = 0.7,
						Max = 1.5
					},
					ColorRange = {
						Min = { 0.6, 0.6, 0.6, 1 },
						Max = { 0.6, 0.6, 0.6, 1}
					}
				}
			}
		},
		
		
		{
			-- Create forest of Pine trees
			DensityMap = "CONIFEROUS_DENSITY_MAP",
			Density = 0.9,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_TREE_PINE" },
					RandomWeight = 0.1,
					OffsetSizeRange = {
						Min = 0.75,
						Max = 1
					},
					OrientationRange = {
						Min = { 0, -180, 0},
						Max = { 0, 180, 0}
					},
					ScaleRange = {
						Min = 0.95,
						Max = 2.0
					},
					ColorRange = {
						Min = { 0.5, 0.5, 0.5, 1 },
						Max = { 0.55, 0.55, 0.55, 1 }
					}
				}
			}
		},
		{
		-- Create berries resources containers
			DensityMap = "BERRIES_DENSITY_MAP",
			Density = 1,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_RESOURCE_BERRIES" },
					RandomWeight = 0,
					OffsetSizeRange = {
						Min = 1,
						Max = 1
					},
					OrientationRange = {
						Min = { 0.0, -180, 0.0},
						Max = { 0.0, 180, 0.0}
					},
					ScaleRange = {
						Min = 1,
						Max = 1
					},
					ColorRange = {
						Min = { 0.8, 0.8, 0.8, 1 },
						Max = { 1, 1, 1, 1 }
					}
				}
			}
		},
		{
		-- Create rocks resources containers
			DensityMap = "ROCK_DENSITY_MAP",
			Density = 1,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_RESOURCE_ROCK" },
					RandomWeight = 0,
					OffsetSizeRange = {
						Min = 1,
						Max = 1
					},
					OrientationRange = {
						Min = { 0.0, -180, 0.0},
						Max = { 0.0, 180, 0.0}
					},
					ScaleRange = {
						Min = 1,
						Max = 1
					},
					ColorRange = {
						Min = { 0.8, 0.8, 0.8, 1 },
						Max = { 1, 1, 1, 1 }
					}
				}
			}
		},
		
        {
                -- Create fish shoals
                DensityMap = "FISH_DENSITY_MAP",
                Density = 1,
                PrefabConfigList = {
                {
                    PrefabList = { "PREFAB_RESOURCE_FISH" },
                    RandomWeight = 0.1,
                    OffsetSizeRange = {
                        Min = 0.75,
                        Max = 1
                    },
                    OrientationRange = {
                        Min = { 0, -180, 0},
                        Max = { 0, 180, 0}
                    },
                    ScaleRange = {
                        Min = 0.85,
                        Max = 1.15
                    },
                    ColorRange = {
                        Min = { 0.8, 0.8, 0.8, 1 },
                        Max = { 1, 1, 1, 1 }
                    }
                }
            }
	},
}	
})