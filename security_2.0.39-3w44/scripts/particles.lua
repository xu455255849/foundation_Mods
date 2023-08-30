local mod = ...



-- Materials ------------------------------------------------------------------------------------------
mod:registerAssetId("models/textures/Fire.png", "TEXTURE_SECURITY_FIRE")
mod:registerAssetId("models/textures/Smoke.png", "TEXTURE_SECURITY_SMOKE")
mod:registerAssetId("models/textures/Spark.png", "TEXTURE_SECURITY_SPARK")

mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_SECURITY_FIRE",
	AlbedoTexture = "TEXTURE_SECURITY_FIRE"
})
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_SECURITY_SMOKE",
	AlbedoTexture = "TEXTURE_SECURITY_SMOKE"
})
mod:registerAsset({
	DataType = "MATERIAL",
	Id = "MATERIAL_SECURITY_SPARK",
	AlbedoTexture = "TEXTURE_SECURITY_SPARK"
})



mod:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SECURITY_FIRE",
	Material = "MATERIAL_SECURITY_FIRE",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.8,
	StartSpeed = { 0.5, 0.5 },
	StartSize = { 3.7, 3.7 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.001,
	RateOverTime = 15,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.1, 0, 0.1 },
		ValueB = { -0.1, 0, -0.1 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = { 0.4, 0.4, 0, 1} },
			{ T = 0.5, Color = { 0.4, 0.4, 0.4, 1 } },
			{ T = 1, Color = { 0.1, 0.1, 0.1, 0.5 } }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 10 },
			{ T = 0.2, Alpha = 90 },
			{ T = 0.3, Alpha = 0 },
			{ T = 0.4, Alpha = 0 },
			{ T = 0.5, Alpha = 90 },
			{ T = 0.6, Alpha = 0 },
			{ T = 0.7, Alpha = 40 },
			{ T = 0.8, Alpha = 20 },
			{ T = 0.9, Alpha = 10 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
			{ T = 0, Value = 0.1 },
			{ T = 0.5, Value = 0.2 },
			{ T = 1, Value = 0.3 }
	},
	RotationOverLifetime = { -70, 70 }
})


mod:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SECURITY_SMOKE",
	Material = "MATERIAL_SECURITY_SMOKE",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 4,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 2.5, 2.5 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 2,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.05, 0, 0.05 },
		ValueB = { -0.05, 0, -0.05 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = { 0.4, 0.4, 0, 1} },
			{ T = 0.5, Color = { 0.4, 0.4, 0.4, 1 } },
			{ T = 1, Color = { 0.1, 0.1, 0.1, 0.5 } }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 20 },
			{ T = 0.4, Alpha = 30 },
			{ T = 0.6, Alpha = 40 },
			{ T = 0.7, Alpha = 80 },
			{ T = 0.8, Alpha = 30 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
			{ T = 0.1, Value = 0.2 },
			{ T = 0.5, Value = 0.3 },
			{ T = 1, Value = 0.5 }
	},
	RotationOverLifetime = { -25, 25 }
})


mod:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SECURITY_SPARK",
	Material = "MATERIAL_SECURITY_SPARK",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 2,
	Looping = true,
	Delay = { 0, 1 },
	LifeTime = 1.7,
	StartSpeed = { 0.005, 0.005 },
	StartSize = { 0.8, 0.8 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.2,
	RateOverTime = 4,
	RateOverTimeRandom = 6,
	AlignWithVelocity = true,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 2,
		Radius = 0.1
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.5, -0.1, 0.5 },
		ValueB = { -0.5, -0.1, -0.5 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = { 0.6, 0.4, 0, 1} },
			{ T = 0.5, Color = { 0.6, 0.4, 0.4, 1 } },
			{ T = 1, Color = { 0.1, 0.1, 0.1, 1 } }
		},		
		AlphaList = {
			{ T = 0.1, Alpha = 100 },
			{ T = 0.3, Alpha = 100 },
			{ T = 0.5, Alpha = 50 },
			{ T = 0.7, Alpha = 25 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
			{ T = 0, Value = 0.075 },
			{ T = 0.5, Value = 0.050 },
			{ T = 1, Value = 0.025 }
	},
	RotationOverLifetime = { -50, 50 }
})


mod:registerPrefabComponent("models/Security4.fbx/Prefab/OutlawCamp.001/FireEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_FIRE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/OutlawCamp.001/FireEmitter.002", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_FIRE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/OutlawCamp.001/SmokeEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/OutlawCamp.001/SparkEmitter.001", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SPARK",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/OutlawCamp.001/SparkEmitter.002", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SPARK",
	IsPlaying = true,
	IsEmitting = true
})



mod:registerPrefabComponent("models/Security4.fbx/Prefab/SoldierRally.Part/FireEmitter.003", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_FIRE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/SoldierRally.Part/FireEmitter.004", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_FIRE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/SoldierRally.Part/SmokeEmitter.002", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SMOKE",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/SoldierRally.Part/SparkEmitter.003", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SPARK",
	IsPlaying = true,
	IsEmitting = true
})

mod:registerPrefabComponent("models/Security4.fbx/Prefab/SoldierRally.Part/SparkEmitter.004", {
	DataType = "COMP_PARTICLE_EMITTER",
	ParticleSystem = "PARTICLE_SYSTEM_SECURITY_SPARK",
	IsPlaying = true,
	IsEmitting = true
})