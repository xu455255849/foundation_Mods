local WaterMill = ...

WaterMill:registerAssetId("models/Flow.png", WaterMillPrefix .. "_FLOW_TEXTURE")

WaterMill:registerAsset({
	DataType = "MATERIAL",
	Id = WaterMillPrefix .. "_FLOW_MATERIAL",
        AlbedoColor = COL_WHITE,
	AlbedoTexture = WaterMillPrefix .. "_FLOW_TEXTURE"
})

WaterMill:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = WaterMillPrefix .. "_FLOW_PARTICLE_SYSTEM",
	Material = WaterMillPrefix .. "_FLOW_MATERIAL",
	BillboardBehavior = "XZ",
	Duration = 20,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 6,
	StartSpeed = { 0, 0 },
	StartSize = { 4, 4 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 1,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_BOX",
		Size = { 0, 0.001, 0 },
                Rotation = { 0, 0, 0 },
                Position = { 0, 0, 0 }
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, 0, 2 },
		ValueB = { 0, 0, 2 },
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 0.4, 0.4, 1, 0.4} },
			{ T = 1, Color = { 0.4, 0.4, 1, 0.4} }
		},
		AlphaList = {
			{ T = 0, Alpha = 0 }, -- 0 = transparent
			{ T = 0.1, Alpha = 80 },
			{ T = 0.9, Alpha = 80 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 1 }
	},
	RotationOverLifetime = { 0, 0 },
})
