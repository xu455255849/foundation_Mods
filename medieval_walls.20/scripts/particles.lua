local MedievalWall = ...

------------------------
--| Texture Function |--
------------------------
local function Texture(value)
	local fileName = value[1]
	local textureName = string.upper(fileName)
	MedievalWall:registerAssetId("models/particles/" .. fileName .. ".png", textureName .. "_TEXTURE")
	MedievalWall:registerAsset({
		DataType = "MATERIAL",
		Id = textureName .. "_MATERIAL",
		AlbedoTexture = textureName .. "_TEXTURE"
	})
end

---------------------
--| Texture Table |--
---------------------
local textureTable = {
	{ "fire" },
	{ "smoke_grey" },
	{ "spark" }
}
for k, v in pairs(textureTable) do
	Texture(v)
end

---------------------------------
--| Particle Emitter Function |--
---------------------------------
local function ParticleEmitter(value)
	local partName =   value[1]
	local nodeName =   value[2]
	local particleId = value[3]
	MedievalWall:registerPrefabComponent("models/stonewall.fbx/Prefab/" .. partName .. "_Part/" .. nodeName, {
		DataType = "COMP_PARTICLE_EMITTER",
		ParticleSystem = "PARTICLE_SYSTEM_" .. particleId,
		IsPlaying = true,
		IsEmitting = true
	})
end

------------------------------
--| Particle Emitter Table |--
-------------------------------------------------
--| partName[1] - nodeName[2] - particleId[3] |--
-------------------------------------------------
local particleTable = {
	{ "Deco_Pillar_Brazier_On_Fire",  "FireEmitter1", 	   "FIRE" },
	{ "Deco_Pillar_Brazier_On_Fire",  "SmokeEmitter1",	   "SMOKE" },
	{ "Deco_Pillar_Brazier_On_Fire",  "SparkEmitter1",	   "SPARK" },
	{ "Deco_Pillar_Brazier_On_Fire",  "SparkEmitter2",	   "SPARK" },
	{ "Deco_Pillar_Brazier_On_Smoke", "SmokeEmitter2",	   "SMOKE2" },
	{ "Deco_Wall_Torch_On_Fire", 	  "TorchFireEmitter",  "FIRE_TORCH" },
	{ "Deco_Wall_Torch_On_Fire", 	  "TorchSmokeEmitter", "SMOKE_TORCH" }
}
for k, v in pairs(particleTable) do
	ParticleEmitter(v)
end

------------------------
--| Particle Systems |--
------------------------
MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.5,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 2.5, 2.5 },
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
			{ T = 0, Color = {0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = {0.4, 0.4, 0, 1} },
			{ T = 0.5, Color = {0.4, 0.4, 0.4, 1} },
			{ T = 1, Color = {0.1, 0.1, 0.1, 0.5} }
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

MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 6,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 4,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 2.5, 2.5 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 3,
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
			{ T = 1, Color = {0.3, 0.3, 0.3, 1} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 20 },
			{ T = 0.4, Alpha = 40 },
			{ T = 0.5, Alpha = 50 },
			{ T = 0.6, Alpha = 40 },
			{ T = 0.7, Alpha = 30 },
			{ T = 0.8, Alpha = 20 },
			{ T = 1, Alpha = 5 }
		},
	},
	SizeOverLifetime = {
			{ T = 0.1, Value = 0.2 },
			{ T = 0.5, Value = 0.3 },
			{ T = 1, Value = 0.35 }
	},
	RotationOverLifetime = { -50, 50 }
})

MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE2",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 10,
	StartSpeed = { 0.4, 0.4 },
	StartSize = { 3, 3 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 3,
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
			{ T = 1, Color = {0.3, 0.3, 0.3, 1} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 30 },
			{ T = 0.2, Alpha = 45 },
			{ T = 0.4, Alpha = 55 },
			{ T = 0.6, Alpha = 65 },
			{ T = 0.7, Alpha = 55 },
			{ T = 0.8, Alpha = 45 },
			{ T = 0.9, Alpha = 30 },
			{ T = 1, Alpha = 10 }
		},
	},
	SizeOverLifetime = {
			{ T = 0.1, Value = 0.2 },
			{ T = 0.3, Value = 0.3 },
			{ T = 0.7, Value = 0.4 },
			{ T = 1, Value = 0.5 }
	},
	RotationOverLifetime = { -50, 50 }
})

MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SPARK",
	Material = "SPARK_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 2,
	Looping = true,
	Delay = { 0, 1 },
	LifeTime = 1.5,
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
		ValueA = { 0.5, 0, 0.5 },
		ValueB = { -0.5, 0, -0.5 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = {0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = {0.6, 0.4, 0, 1} },
			{ T = 0.5, Color = {0.6, 0.4, 0.4, 1} },
			{ T = 1, Color = {0.1, 0.1, 0.1, 1} }
		},		
		AlphaList = {
			{ T = 0.1, Alpha = 100 },
			{ T = 0.3, Alpha = 100 },
			{ T = 0.5, Alpha = 60 },
			{ T = 0.7, Alpha = 40 },
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

MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE_TORCH",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 3,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.3,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 0.7, 0.7 },
	StartRotation = { -30, 30 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.002,
	RateOverTime = 10,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.05, 0, 0.08 },
		ValueB = { -0.05, 0, 0.08 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = {0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = {0.4, 0.4, 0, 1} },
			{ T = 0.5, Color = {0.4, 0.4, 0.4, 1} },
			{ T = 1, Color = {0.1, 0.1, 0.1, 0.5} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 30 },
			{ T = 0.4, Alpha = 90 },
			{ T = 0.6, Alpha = 50 },
			{ T = 0.8, Alpha = 30 },
			{ T = 0.9, Alpha = 10 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0 },
		{ T = 0.2, Value = 0.2 },
		{ T = 0.7, Value = 0.4 }
	},
	RotationOverLifetime = { -110, 110 },
})
MedievalWall:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE_TORCH",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 2,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 2,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 1, 1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 3,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.05, 0, 0.08 },
		ValueB = { -0.05, 0, 0.08 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 1, Color = {0.3, 0.3, 0.3, 1} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 20 },
			{ T = 0.4, Alpha = 50 },
			{ T = 0.6, Alpha = 80 },
			{ T = 0.7, Alpha = 70 },
			{ T = 0.8, Alpha = 30 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
			{ T = 0.1, Value = 0.3 },
			{ T = 0.5, Value = 0.3 },
			{ T = 1, Value = 0.3 }
	},
	RotationOverLifetime = { -50, 50 }
})