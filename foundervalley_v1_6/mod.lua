local mapMod = foundation.createMod();

mapMod:registerAssetId("maps/FoundationValley_Heightmap.png", "HEIGHT_MAP")
mapMod:registerAssetId("maps/FoundationValley_MaskID.png", "MATERIAL_MASK")
mapMod:registerAssetId("maps/FondationValley_Berries.png", "BERRIES_DENSITY_MAP")
mapMod:registerAssetId("maps/FondationValley_Rocks.png", "ROCK_DENSITY_MAP")
mapMod:registerAssetId("maps/FondationValley_Fish.png", "FISH_DENSITY_MAP")
mapMod:registerAssetId("maps/FondationValley_deciduous.png", "TREE_DENSITY_MAP1")
mapMod:registerAssetId("maps/FoundationValley_Coniferous.png", "TREE_DENSITY_MAP2")
mapMod:registerAssetId("maps/FoundationValley_Coniferous2.png", "TREE_DENSITY_MAP3")

-- Register Custom Map
mapMod:register({
	DataType = "CUSTOM_MAP",
	Id = "MAP_FoundValley",
	HeightMap = "HEIGHT_MAP",
	MaterialMask = "MATERIAL_MASK",
	MinHeight = -25,
	MaxHeight = 307,
	VillagePathList = {
		{
			Entrance = { 1000, 0, 204 },
			Exit = { 120, 0, 1000 }
		},
		{
			Entrance = { 24, 0, 1000 },
			Exit = { 24, 0, 119 }
		},
		{
			Entrance = { 200, 0, 24 },
			Exit = { 1000, 0, 152 }
		}
	},
	SpawnList = {
		-- Mineral GR1
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 476, 2, 423 },
			Orientation = { 0.0, 190.0, 0.0 },
			Scale = { 2.5, 1.8, 2.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 463, 8, 412 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.1, 1.2, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 484, 6, 438 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR2
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 350, 14, 331 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.85, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 321, 14, 327 },
			Orientation = { 0.0, 280.0, 0.0 },
			Scale = { 1.0, 1.2, 1.85 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 311, 12, 335 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR3
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 650, -9, 405 },
			Orientation = { 0.0, 160.0, 0.0 },
			Scale = { 1.0, 1.8, 1.7 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 640, -3, 421 },
			Orientation = { 0.0, 25.0, 0.0 },
			Scale = { 1.7, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 647, -5, 411 },
			Orientation = { 0.0, 65.0, 0.0 },
			Scale = { 2.3, 1.0, 1.6 },
		},
		-- Mineral GR4
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 543, 30, 392 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.0, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 531, 32, 391 },
			Orientation = { 0.0, 270.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR5
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 503, 19, 130 },
			Orientation = { 0.0, 150.0, 0.0 },
			Scale = { -1.0, 1.0, -1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 517, 21, 132 },
			Orientation = { 0.0, -45.0, 0.0 },
			Scale = { 2.0, 1.0, 2.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 527, 27, 134 },
			Orientation = { 0.0, 120.0, 0.0 },
			Scale = { 1.4, 1.0, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 536, 34, 135 },
			Orientation = { 0.0, 45.0, 15.0 },
			Scale = { 1.2, 0.8, 0.7 },
		},
		-- Mineral GR6
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 388, 46, 78 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.7, 1.2, 1.8 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 400, 42, 90 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.2, 1.0, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 406, 38, 103 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 1.0, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 414, 33, 128 },
			Orientation = { 0.0, 270.0, 0.0 },
			Scale = { 1.1, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 389, 48.5, 142 },
			Orientation = { 0.0, 210.0, 30.0 },
			Scale = { -1.1, 1.1, -1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 383, 50, 142 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { -1.1, 1.2, -1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 384, 50, 110 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 373, 55, 105 },
			Orientation = { 0.0, 30.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR7
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 558, 35, 300 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.3, 0.8, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 558, 30.5, 290 },
			Orientation = { 0.0, 260.0, 0.0 },
			Scale = { 1.2, 1.0, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 567, 26.5, 283 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { -1.0, 1.0, -1.0 },
		},
		-- Mineral GR8
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 244, 50, 116 },
			Orientation = { 0.0, -30.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 254, 55, 119 },
			Orientation = { 0.0, 115.0, 0.0 },
			Scale = { 1.3, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 265, 60, 122 },
			Orientation = { 0.0, -110.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 269, 61, 132 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 265, 51, 140 },
			Orientation = { 0.0, -100.0, -15.0 },
			Scale = { 1.6, 1.3, 1.6 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 260, 46, 147 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.1, 1.3 },
		},
		-- Mineral GR9
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 318, 75, 58 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 170, 58, 25 },
			Orientation = { 0.0, -45.0, 0.0 },
			Scale = { 1.2, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 160, 7, 198 },
			Orientation = { 5.0, -90.0, -15.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 270, 25, 213 },
			Orientation = { 0.0, 180.0, -10.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 427, 12, 222 },
			Orientation = { 0.0, 90.0, -15.0 },
			Scale = { 0.9, 0.9, 0.9 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 589, 31, 351 },
			Orientation = { 15.0, 110.0, 5.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 652, 2, 148 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 2.0, 1.0, 2.0 },
		},
		-- Mineral GR10
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 208, 18, 459 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.1, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 200, 25, 470 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.1, 1.4 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 191, 31, 478 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 1.2, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 212, 36, 513 },
			Orientation = { 0.0, 255.0, 0.0 },
			Scale = { 1.1, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 218, 33, 505 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 1.0, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 224, 25, 499 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.1, 1.1, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 249, 31, 535 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 325, 11, 545 },
			Orientation = { 0.0, 225.0, 15.0 },
			Scale = { 1.7, 0.8, 1.8 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 206, 30, 590 },
			Orientation = { -25.0, 225.0, 10.0 },
			Scale = { 1.0, 1.1, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 215, 23, 602 },
			Orientation = { -25.0, 225.0, -10.0 },
			Scale = { 0.9, 1.0, 1.0 },
		},
		-- Mineral GR11
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 111, 33, 630 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.1, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 115, 36, 618 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.6, 1.0, 1.5 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 128, 38, 614 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 128, 32, 625 },
			Orientation = { 0.0, 50.0, 0.0 },
			Scale = { 1.3, 1.0, 1.4 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 132, 24, 644 },
			Orientation = { 0.0, 75.0, 0.0 },
			Scale = { 1.2, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 135, 18, 654 },
			Orientation = { 0.0, 145.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR12
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 61, 21, 414 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.1, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 82, 39, 506 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.6, 1.0, 1.5 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 42, 32, 758 },
			Orientation = { 0.0, 45.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 73, 10, 821 },
			Orientation = { 0.0, 180.0, 15.0 },
			Scale = { 1.3, 1.0, 1.4 },
		},
		-- Mineral GR13
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 426, 80, 885 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.3, 1.0, 1.4 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 439, 82, 876 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 1.4, 1.2, 1.5 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 440, 90, 885 },
			Orientation = { 0.0, 210.0, 0.0 },
			Scale = { 1.6, 1.0, 1.5 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 446, 95, 890 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR14
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 627, 86, 890 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 638, 86, 892 },
			Orientation = { 0.0, 215.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 649, 90, 893 },
			Orientation = { 0.0, 255.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 695, 97, 882 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 714, 97, 874 },
			Orientation = { 0.0, 235.0, 0.0 },
			Scale = { 1.2, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 711, 105, 888 },
			Orientation = { 0.0, 250.0, 0.0 },
			Scale = { 1.8, 1.0, 1.7 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 731, 114, 893 },
			Orientation = { 0.0, 45.0, 0.0 },
			Scale = { 1.4, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 742, 120, 901 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.4, 1.2, 1.6 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 752, 130, 911 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.5, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 795, 144, 922 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 1.3, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 811, 157, 929 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.6, 1.0, 1.4 },
		},
		-- Mineral GR15
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 982, 156, 815 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.4, 1.1, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 984, 150, 802 },
			Orientation = { 0.0, 215.0, 0.0 },
			Scale = { 1.2, 1.1, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 984, 146, 788 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 1.0, 1.4 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 982, 139, 774 },
			Orientation = { 0.0, 235.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 985, 135, 760 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.2, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 989, 137, 748 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 0.8, 1.0, 0.9 },
		},
		-- Mineral GR16
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 898, 64, 527 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 896, 62, 516 },
			Orientation = { 0.0, 215.0, 0.0 },
			Scale = { 1.1, 1.0, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 893, 65, 503 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.1, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 921, 73, 494 },
			Orientation = { 0.0, 235.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 933, 77, 498 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 894, 61, 479 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 894, 58, 468 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 888, 53, 457 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.0, 1.2 },
		},
		-- Mineral GR17
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 809, 201, 1002 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.7, 1.5, 1.6 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 854, 232, 1009 },
			Orientation = { 0.0, 305.0, 0.0 },
			Scale = { 2.0, 1.6, 1.7 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 932, 225, 964 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.7, 1.5, 1.6 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 958, 235, 970 },
			Orientation = { 0.0, 215.0, 0.0 },
			Scale = { 2.0, 1.6, 1.7 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 977, 240, 975 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 1.6, 1.7, 1.8 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 974, 230, 957 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.6, 1.3, 1.7 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 959, 205, 937 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.7, 1.6, 1.8 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 965, 201, 919 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.6, 1.2, 1.5 },
		},
		-- Mineral GR18
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 858, 90, 777 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 1.1, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 855, 77, 765 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.6, 1.4, 1.5 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 861, 68, 744 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.1, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 832, 41, 702 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 842, 43, 695 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 843, 42, 681 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		-- Mineral GR19
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 533, 33, 789 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 1.2, 1.1, 1.3 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 540, 30, 779 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 559, 13, 752 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.7, 1.5, 1.6 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 572, 11, 744 },
			Orientation = { 0.0, -110.0, 0.0 },
			Scale = { 1.2, 1.3, 1.3 },
		},
		-- Mineral GR20
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 796, 4, 125 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 786, 6, 123 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 759, 0, 355 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 866, 1, 239 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.8, 1.2, 1.9 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 888, 9, 211 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.1, 1.1, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 902, 12, 210 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.3, 1.2, 1.3 },
		},
		-- Mineral GR21
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 439, 31, 769 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 426, 15, 738 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.2, 0.8, 1.2 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 375, -5, 662 },
			Orientation = { 0.0, -90.0, 0.0 },
			Scale = { 2.0, 1.0, 2.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 264, -7, 707 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.2, 1.7, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 224, 13, 860 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 323, 26, 832 },
			Orientation = { 0.0, -70.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 331, 31, 844 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.3, 1.0, 1.2 },
		},
		-- Mineral GR22
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 703, -2, 522 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 0.9, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 552, -6, 526 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.1, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 555, 3, 588 },
			Orientation = { 0.0, 90.0, 0.0 },
			Scale = { 1.0, 0.9, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 556, 4, 600 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_3",
			Position = { 640, 5, 606 },
			Orientation = { 0.0, 180.0, 0.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_2",
			Position = { 733, 14, 635 },
			Orientation = { 0.0, 180.0, 15.0 },
			Scale = { 1.0, 1.0, 1.0 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 766, 15, 628 },
			Orientation = { 0.0, -20.0, 0.0 },
			Scale = { 1.2, 1.0, 1.1 },
		},
		{
			Prefab = "PREFAB_MINERAL_SOURCE_1",
			Position = { 776, 18, 620 },
			Orientation = { 0.0, 0.0, 0.0 },
			Scale = { 1.0, 1.1, 1.0 },
		},
	},
	DensitySpawnList = {
		{
			-- Create forest of Deciduous trees and a few smaller Pine trees
			DensityMap = "TREE_DENSITY_MAP1",
			Density = 0.9,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_TREE_SYCAMORE", "PREFAB_TREE_OAK", "PREFAB_TREE_POPLAR" },
					RandomWeight = 1,
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
				},
				{
					PrefabList = { "PREFAB_TREE_PINE" },
					RandomWeight = 1,
					OffsetSizeRange = {
						Min = 0.15,
						Max = 0.45
					},
					OrientationRange = {
						Min = { 0, -180, 0},
						Max = { 0, 180, 0}
					},
					ScaleRange = {
						Min = 0.7,
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
			-- Create forest of Pine trees
			DensityMap = "TREE_DENSITY_MAP2",
			Density = 0.85,
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
		{
			-- creating Tree Density Map3
			DensityMap = "TREE_DENSITY_MAP3",
			Density = 0.8,
			PrefabConfigList = {
				{
						PrefabList = { "PREFAB_TREE_PINE" },
						RandomWeight = 5.0,
						OffsetSizeRange = {
							Min = 0.75,
							Max = 1.0
					},
						OrientationRange = {
							Min = { 0, -180, 0 },
							Max = { 0, 180, 0 }
					},
						ScaleRange = {
							Min = 0.8,
							Max = 1.2
					},
						ColorRange = {
							Min = { 0.8, 0.8, 0.8, 1 },
							Max = { 1, 1, 1, 1 }
					}
				}
			}
		},
		{
			-- Create berries
			DensityMap = "BERRIES_DENSITY_MAP",
			Density = 1,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_RESOURCE_BERRIES" },
					RandomWeight = 1,
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
		{
			-- Create rocks
			DensityMap = "ROCK_DENSITY_MAP",
			Density = 1,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_RESOURCE_ROCK" },
					RandomWeight = 1,
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
						Min = { 1, 1, 1, 1 },
						Max = { 1, 1, 1, 1 }
					}
				}
			}
		},
		{
			-- Create fish
			DensityMap = "FISH_DENSITY_MAP",
			Density = 1,
			PrefabConfigList = {
				{
					PrefabList = { "PREFAB_RESOURCE_FISH" },
					RandomWeight = 1,
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
						Min = { 1, 1, 1, 1 },
						Max = { 1, 1, 1, 1 }
					}
				}
			}
		}
	}
})