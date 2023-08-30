local SaltMarshes = ...

SaltMarshes:registerAssetId("models/water.png", SaltMarshesPrefix .. "_WATER_TEXTURE")

SaltMarshes:registerAsset({
	DataType = "MATERIAL",
	Id = SaltMarshesPrefix .. "_WATER_MATERIAL",
        AlbedoColor = COL_WHITE,
	AlbedoTexture = SaltMarshesPrefix .. "_WATER_TEXTURE"
})

SaltMarshes:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = SaltMarshesPrefix .. "_WATER_PARTICLE_SYSTEM",
	Material = SaltMarshesPrefix .. "_WATER_MATERIAL",
	BillboardBehavior = "XZ",
	Duration = 20,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 20,
	StartSpeed = { 0, 0 },
	StartSize = { 10, 10 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 0.05,
--	BurstList = { { Time = 0, Count =  1 } },
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_BOX",
		Size = { 0, 0.001, 0 },
                Rotation = { 0, 0, 0 },
                Position = { 0, 0, 0 }
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, -0.013, 0 },
		ValueB = { 0, -0.013, 0 },
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 0, 0.2, 1, 1} },
			{ T = 0.1, Color = { 0, 0.2, 1, 1} },
			{ T = 0.7, Color = { 1, 1, 1, 1} },
			{ T = 0.8, Color = { 1, 1, 1, 1} },
			{ T = 0.9, Color = { 1, 1, 1, 1} },
			{ T = 1, Color = { 1, 1, 1, 1 } }
		},
		AlphaList = {
			{ T = 0, Alpha = 255 }, -- 0 = transparent
			{ T = 0.1, Alpha = 255 },
			{ T = 0.2, Alpha = 255 },
			{ T = 0.3, Alpha = 255 },
			{ T = 0.4, Alpha = 255 },
			{ T = 0.5, Alpha = 255 },
			{ T = 0.6, Alpha = 255 },
			{ T = 0.7, Alpha = 255 },
			{ T = 0.8, Alpha = 255 },
			{ T = 0.9, Alpha = 200 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 1 }
	},
	RotationOverLifetime = { 0, 0 },
})
