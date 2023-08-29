local FantasyDeco = ...

------------------------
--| Texture Function |--
------------------------
local function Texture(value)
	local fileName = value[1]
	local textureName = string.upper(fileName)
	FantasyDeco:registerAssetId("models/particles/" .. fileName .. ".png", textureName .. "_TEXTURE")
	FantasyDeco:registerAsset({
		DataType = "MATERIAL",
		Id = textureName .. "_MATERIAL",
		AlbedoTexture = textureName .. "_TEXTURE"
	})
end

---------------------
--| Texture Table |--
---------------------
local textureTable = {
	{ "candle" },
	{ "fire" },
	{ "smoke_green" },
	{ "smoke_grey" },
	{ "smoke_white" },
	{ "spark" },
	{ "water_drop" },
	{ "water_ripple" },
	{ "water_splash" }
}
for k, v in pairs(textureTable) do
	Texture(v)
end

---------------------------------
--| Particle Emitter Function |--
---------------------------------
local function ParticleEmitter(value)
	local partName =   value[1]
	local fileName =   value[2]
	local nodeName =   value[3]
	local particleId = value[4]
	FantasyDeco:registerPrefabComponent("models/" .. fileName .. ".fbx/Prefab/" .. partName .. "_Part/" .. nodeName, {
		DataType = "COMP_PARTICLE_EMITTER",
		ParticleSystem =  "PARTICLE_SYSTEM_" .. particleId,
		IsPlaying = true,
		IsEmitting = true
	})
end

------------------------------
--| Particle Emitter Table |--
---------------------------------------------------------------
--| partName[1] - fileName[2] - nodeName[3] - particleId[4] |--
---------------------------------------------------------------
local particleTable = {
	{ "Brazier1", 			   "braziers", 		"FireEmitter1", 		 "FIRE" },
	{ "Brazier1", 			   "braziers", 		"SmokeEmitter1", 		 "SMOKE" },
	{ "Brazier1", 			   "braziers", 		"SparkEmitter1-1",		 "SPARK" },
	{ "Brazier1", 			   "braziers", 		"SparkEmitter1-2",		 "SPARK" },
	{ "Brazier2", 			   "braziers", 		"FireEmitter2", 		 "FIRE" },
	{ "Brazier2", 			   "braziers", 		"SmokeEmitter2", 		 "SMOKE" },
	{ "Brazier2", 			   "braziers", 		"SparkEmitter2-1",		 "SPARK" },
	{ "Brazier2", 			   "braziers", 		"SparkEmitter2-2",		 "SPARK" },
	{ "Brazier3", 			   "braziers", 		"FireEmitter3", 		 "FIRE" },
	{ "Brazier3", 			   "braziers", 		"SmokeEmitter3", 		 "SMOKE" },
	{ "Brazier3", 			   "braziers", 		"SparkEmitter3-1",		 "SPARK" },
	{ "Brazier3", 			   "braziers", 		"SparkEmitter3-2",		 "SPARK" },
	{ "Brazier4", 			   "braziers", 		"FireEmitter4", 		 "FIRE2" },
	{ "Brazier4", 			   "braziers", 		"SmokeEmitter4", 		 "SMOKE" },
	{ "Brazier4", 			   "braziers", 		"SparkEmitter4-1",		 "SPARK" },
	{ "Brazier4", 			   "braziers", 		"SparkEmitter4-2",		 "SPARK" },
	{ "Brazier5", 			   "braziers", 		"FireEmitter5", 		 "FIRE" },
	{ "Brazier5", 			   "braziers", 		"SmokeEmitter5", 		 "SMOKE" },
	{ "Brazier5", 			   "braziers", 		"SparkEmitter5-1",		 "SPARK" },
	{ "Brazier5", 			   "braziers", 		"SparkEmitter5-2",		 "SPARK" },
	{ "Brazier6", 			   "braziers", 		"FireEmitter6", 		 "FIRE" },
	{ "Brazier6", 			   "braziers", 		"SmokeEmitter6", 		 "SMOKE" },
	{ "Brazier6", 			   "braziers", 		"SparkEmitter6-1",		 "SPARK" },
	{ "Brazier6", 			   "braziers", 		"SparkEmitter6-2",		 "SPARK" },
	{ "Brazier7", 			   "braziers", 		"FireEmitter7", 		 "FIRE2" },
	{ "Brazier7", 			   "braziers", 		"SmokeEmitter7", 		 "SMOKE" },
	{ "Brazier7", 			   "braziers", 		"SparkEmitter7-1",		 "SPARK" },
	{ "Brazier7", 			   "braziers", 		"SparkEmitter7-2",		 "SPARK" },
	{ "Brazier8", 			   "braziers", 		"FireEmitter8", 		 "FIRE_TORCH" },
	{ "Brazier8", 			   "braziers", 		"SmokeEmitter8", 		 "SMOKE_TORCH" },
	{ "Brazier8", 			   "braziers", 		"SparkEmitter8-1",		 "SPARK" },
	{ "Brazier8", 			   "braziers", 		"SparkEmitter8-2",		 "SPARK" },
	{ "Bonfire", 			   "braziers", 		"FireEmitterBonfire-1",	 "FIRE_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"FireEmitterBonfire-2",	 "FIRE_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"SmokeEmitterBonfire",	 "SMOKE_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"SparkEmitterBonfire-1", "SPARK_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"SparkEmitterBonfire-2", "SPARK_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"SparkEmitterBonfire-3", "SPARK_BONFIRE" },
	{ "Bonfire", 			   "braziers", 		"SparkEmitterBonfire-4", "SPARK_BONFIRE" },
	{ "Torch", 				   "braziers", 		"FireEmitterTorch",		 "FIRE_TORCH" },
	{ "Torch", 				   "braziers", 		"SmokeEmitterTorch",	 "SMOKE_TORCH" },
	{ "Torch2", 			   "braziers", 		"FireEmitterTorch2",	 "FIRE_TORCH2" },
	{ "Torch2", 			   "braziers", 		"SmokeEmitterTorch2",	 "SMOKE_TORCH" },
	{ "Torch2", 			   "braziers", 		"SparkEmitterTorch2-1",	 "SPARK" },
	{ "Torch2", 			   "braziers", 		"SparkEmitterTorch2-2",	 "SPARK" },
	{ "Torch3", 			   "braziers", 		"FireEmitterTorch3",	 "FIRE_TORCH2" },
	{ "Torch3", 			   "braziers", 		"SmokeEmitterTorch3",	 "SMOKE_TORCH" },
	{ "Torch3", 			   "braziers", 		"SparkEmitterTorch3-1",	 "SPARK" },
	{ "Torch3", 			   "braziers", 		"SparkEmitterTorch3-2",	 "SPARK" },
	{ "Torch4", 			   "braziers", 		"FireEmitterTorch4",	 "FIRE_TORCH2" },
	{ "Torch4", 			   "braziers", 		"SmokeEmitterTorch4",	 "SMOKE_TORCH" },
	{ "Torch4", 			   "braziers", 		"SparkEmitterTorch4-1",	 "SPARK" },
	{ "Torch4", 			   "braziers", 		"SparkEmitterTorch4-2",	 "SPARK" },
	{ "Campfire_Signal", 	   "campfire", 		"SignalEmitter1", 		 "SMOKE_SIGNAL" },
	{ "Campfire_Signal", 	   "campfire", 		"SignalEmitter2", 		 "SMOKE_SIGNAL" },
	{ "Campfire_On_Fire", 	   "campfire", 		"FireEmitter1", 		 "FIRE" },
	{ "Campfire_On_Fire", 	   "campfire", 		"FireEmitter2", 		 "FIRE" },
	{ "Campfire_On_Fire", 	   "campfire", 		"SmokeEmitter1", 		 "SMOKE" },
	{ "Campfire_On_Fire", 	   "campfire", 		"SparkEmitter1-1", 		 "SPARK" },
	{ "Campfire_On_Fire", 	   "campfire", 		"SparkEmitter1-2", 		 "SPARK" },
	{ "Cauldron", 			   "cauldron", 		"CauldronEmitter", 		 "SMOKE_GREEN" },
	{ "Candelabra", 		   "lanterns", 		"CandleEmitter1", 		 "CANDLE" },
	{ "Candelabra", 		   "lanterns", 		"CandleEmitter2", 		 "CANDLE" },
	{ "Candelabra", 		   "lanterns", 		"CandleEmitter3", 		 "CANDLE" },
	{ "Candelabra", 		   "lanterns", 		"CandleEmitter4", 		 "CANDLE" },
	{ "Candelabra", 		   "lanterns", 		"CandleEmitter5", 		 "CANDLE" },
	{ "Lantern4", 			   "lanterns", 		"CandleEmitter6", 		 "CANDLE" },
	{ "Lantern8", 			   "lanterns", 		"CandleEmitter7", 		 "CANDLE" },
	{ "Lantern11", 			   "lanterns", 		"BrazierEmitter", 		 "FIRE_LANTERN" },
	{ "Water_Source_Handpump", "water_source", 	"WaterDropEmitter1", 	 "WATER_DROP" },
	{ "Water_Source_Basin",    "water_source", 	"WaterRippleEmitter1", 	 "WATER_RIPPLE" },
	{ "Water_Source_Basin",    "water_source", 	"WaterRippleEmitter2", 	 "WATER_RIPPLE" },
	{ "Water_Source_Basin",    "water_source", 	"WaterRippleEmitter3", 	 "WATER_RIPPLE" },
	{ "Water_Source_Basin",    "water_source", 	"WaterSplashEmitter1", 	 "WATER_SPLASH" },
	{ "Water_Source_Basin",    "water_source", 	"WaterSplashEmitter2", 	 "WATER_SPLASH" },
	{ "Water_Source_Basin",    "water_source", 	"WaterSplashEmitter3", 	 "WATER_SPLASH" }
}
for k, v in pairs(particleTable) do
	ParticleEmitter(v)
end

------------------------
--| Particle Systems |--
------------------------
FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.6,
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
		{ T = 0, Value = 0.05 },
		{ T = 0.1, Value = 0.2 },
		{ T = 0.5, Value = 0.2 },
		{ T = 1, Value = 0.3 }
	},
	RotationOverLifetime = { -70, 70 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE2",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.6,
	StartSpeed = { 0.4, 0.4 },
	StartSize = { 2, 2 },
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
		{ T = 0.1, Value = 0.2 },
		{ T = 0.5, Value = 0.3 },
		{ T = 1, Value = 0.4 }
	},
	RotationOverLifetime = { -70, 70 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE_TORCH",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.8,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 2.3, 2.3 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.004,
	RateOverTime = 15,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, 0.08, 0 },
		ValueB = { 0, 0.08, 0 }
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
			{ T = 0.1, Alpha = 20 },
			{ T = 0.2, Alpha = 40 },
			{ T = 0.3, Alpha = 90 },
			{ T = 0.4, Alpha = 0 },
			{ T = 0.5, Alpha = 90 },
			{ T = 0.6, Alpha = 90 },
			{ T = 0.7, Alpha = 50 },
			{ T = 0.8, Alpha = 30 },
			{ T = 0.9, Alpha = 10 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0.1, Value = 0 },
		{ T = 0.2, Value = 0.1 },
		{ T = 0.3, Value = 0.2 }
	},
	RotationOverLifetime = { -100, 100 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE_TORCH2",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.6,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 2.1, 2.1 },
	StartRotation = { -45, 45 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.004,
	RateOverTime = 10,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, 0.08, 0 },
		ValueB = { 0, 0.08, 0 }
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
			{ T = 0.1, Alpha = 20 },
			{ T = 0.2, Alpha = 40 },
			{ T = 0.3, Alpha = 90 },
			{ T = 0.4, Alpha = 0 },
			{ T = 0.5, Alpha = 90 },
			{ T = 0.6, Alpha = 90 },
			{ T = 0.7, Alpha = 50 },
			{ T = 0.8, Alpha = 30 },
			{ T = 0.9, Alpha = 10 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0.1, Value = 0 },
		{ T = 0.2, Value = 0.1 },
		{ T = 0.3, Value = 0.2 }
	},
	RotationOverLifetime = { -100, 100 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE_BONFIRE",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.7,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1.7,
	StartSpeed = { 0.7, 0.7 },
	StartSize = { 13, 13 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.1,
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
		{ T = 0, Value = 0.05 },
		{ T = 0.1, Value = 0.3 },
		{ T = 0.5, Value = 0.2 },
		{ T = 1, Value = 0.35 }
	},
	RotationOverLifetime = { -70, 70 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_FIRE_LANTERN",
	Material = "FIRE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 1,
	StartSpeed = { 0.3, 0.3 },
	StartSize = { 1.1, 1.1 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 5,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0, 0, 0 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = {0.6, 0.6, 0, 1} },
			{ T = 0.1, Color = {0.4, 0.4, 0, 1} },
			{ T = 0.5, Color = {0.4, 0.4, 0.4, 1} },
			{ T = 1, Color = {0.1, 0.1, 0.1, 1} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 75 },
			{ T = 0.3, Alpha = 100 },
			{ T = 0.5, Alpha = 75 },
			{ T = 0.7, Alpha = 25 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0.1 },
		{ T = 0.3, Value = 0.25 },
		{ T = 1.5, Value = 0.4 }
	},
	RotationOverLifetime = { -50, 50 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE_GREEN",
	Material = "SMOKE_GREEN_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 4,
	StartSpeed = { 0.2, 0.2 },
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
			{ T = 0.1, Alpha = 75 },
			{ T = 0.3, Alpha = 100 },
			{ T = 0.5, Alpha = 75 },
			{ T = 0.7, Alpha = 25 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0.2 },
		{ T = 0.6, Value = 0.3 },
		{ T = 1.2, Value = 0.4 }
	},
	RotationOverLifetime = { -30, 30 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 6,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 5,
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

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE_SIGNAL",
	Material = "SMOKE_WHITE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 6,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 13,
	StartSpeed = { 0.01, 0.01 },
	StartSize = { 0.9, 0.9 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.02,
	RateOverTime = 4,
	RateOverTimeRandom = 4,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.1,
		Radius = 0.0001,
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 0.03, 0, 0.03 },
		ValueB = { -0.03, 0, -0.03 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0.1, Color = {0, 0, 0, 0} },
			{ T = 0.5, Color = {1, 1, 1, 0.5} },
			{ T = 1, Color = {1, 1, 1, 1} }
		},
		AlphaList = {
			{ T = 0.1, Alpha = 5 },
			{ T = 0.2, Alpha = 10 },
			{ T = 0.3, Alpha = 20 },
			{ T = 0.4, Alpha = 20 },
			{ T = 0.5, Alpha = 30 },
			{ T = 0.6, Alpha = 30 },
			{ T = 0.7, Alpha = 20 },
			{ T = 0.8, Alpha = 10 },
			{ T = 0.9, Alpha = 5 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0.9 },
		{ T = 0.7, Value = 1.2 },
		{ T = 1, Value = 1.7 }
	},
	RotationOverLifetime = { -70, 70 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE_BONFIRE",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 10,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 6,
	StartSpeed = { 0.6, 0.6 },
	StartSize = { 12, 12 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.07,
	RateOverTime = 4,
	RateOverTimeRandom = 4,
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
			{ T = 0.2, Alpha = 10 },
			{ T = 0.4, Alpha = 30 },
			{ T = 0.5, Alpha = 40 },
			{ T = 0.6, Alpha = 30 },
			{ T = 0.7, Alpha = 20 },
			{ T = 0.8, Alpha = 10 },
			{ T = 1, Alpha = 5 }
		},
	},
	SizeOverLifetime = {
		{ T = 0.1, Value = 0.2 },
		{ T = 1, Value = 0.35 }
	},
	RotationOverLifetime = { -50, 50 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SMOKE_TORCH",
	Material = "SMOKE_GREY_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3.5,
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
			{ T = 0.4, Alpha = 30 },
			{ T = 0.6, Alpha = 40 },
			{ T = 0.7, Alpha = 70 },
			{ T = 0.8, Alpha = 30 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0.1, Value = 0.3 },
		{ T = 0.5, Value = 0.25 },
		{ T = 1, Value = 0.2 }
	},
	RotationOverLifetime = { -25, 25 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_CANDLE",
	Material = "CANDLE_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	AspectRatio = 0.7,
	Duration = 1,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 0.5,
	StartSpeed = { 0.02, 0.02 },
	StartSize = { 0.43, 0.43 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 10,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 10,
		Radius = 0.02
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 0, 0 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = { 1, 1, 1, 1} },
			{ T = 1, Color = { 0.2, 0.2, 0.2, 0.2 } }
		},
		AlphaList = {
			{ T = 0, Alpha = 0 },
			{ T = 0.4, Alpha = 100 },
			{ T = 1, Alpha = 75 }
		},
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0.05 },
		{ T = 0.5, Value = 0.2 }
	},
	RotationOverLifetime = { 0, 0 },
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SPARK",
	Material = "SPARK_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 2,
	Looping = true,
	Delay = { 0, 1 },
	LifeTime = 1.5,
	StartSpeed = { 0.005, 0.005 },
	StartSize = { 0.9, 0.9 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.2,
	RateOverTime = 6,
	RateOverTimeRandom = 3,
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
			{ T = 0, Color = {0.6, 0.6, 0.6, 1} },
			{ T = 0.5, Color = {0.6, 0.6, 0.6, 1} },
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

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_SPARK_BONFIRE",
	Material = "SPARK_MATERIAL",
	BillboardBehavior = "FACE_CAMERA",
	Duration = 3,
	Looping = true,
	Delay = { 0, 1 },
	LifeTime = 2,
	StartSpeed = { 0.02, 0.02 },
	StartSize = { 3, 3 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = -0.2,
	RateOverTime = 6,
	RateOverTimeRandom = 3,
	AlignWithVelocity = true,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 2,
		Radius = 0.1
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT_RANDOM",
		ValueA = { 1, 0, 1 },
		ValueB = { -1, 0, -1 }
	},
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		ColorList = {
			{ T = 0, Color = {0.6, 0.6, 0.6, 1} },
			{ T = 0.5, Color = {0.6, 0.6, 0.6, 1} },
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
		{ T = 0.5, Value = 0.05 },
		{ T = 1, Value = 0.03 }
	},
	RotationOverLifetime = { -50, 50 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_WATER_DROP",
	Material = "WATER_DROP_MATERIAL",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	AspectRatio = 0.7,
	Duration = 2,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 3,
	StartSpeed = { 0.01, 0.01 },
	StartSize = { 0.1, 0.1 },
	StartRotation = { 0, 0 },
	StartColor = { 0.7, 0.7, 1, 1 },
	GravityModifier = 0.2,
	RateOverTime = 0.3,
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.5,
		Radius = 0.01
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 0.01, 0 }
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0 },
		{ T = 0.05, Value = 1 }
	}
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_WATER_RIPPLE",
	Material = "WATER_RIPPLE_MATERIAL",
	BillboardBehavior = "XZ",
	Duration = 7,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 2,
	StartSpeed = { 0, 0 },
	StartSize = { 0.3, 0.3 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 1 },
	GravityModifier = 0,
	RateOverTime = 3,
	RateOverTimeRandom = 0,
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 20 },
			{ T = 0.4, Alpha = 80 },
			{ T = 0.5, Alpha = 100 },
			{ T = 0.7, Alpha = 80 },
			{ T = 0.8, Alpha = 20 },
			{ T = 1, Alpha = 0 }
		},
	},
	SizeOverLifetime = {
		{ T = 0.1, Value = 0.2 },
		{ T = 1, Value = 1.3 }
	},
	RotationOverLifetime = { -40, 20 }
})

FantasyDeco:registerAsset({
	DataType = "PARTICLE_SYSTEM",
	Id = "PARTICLE_SYSTEM_WATER_SPLASH",
	Material = "WATER_SPLASH_MATERIAL",
	BillboardBehavior = "FACE_CAMERA_Y_ALIGN",
	AspectRatio = 0.8,
	Duration = 1.5,
	Looping = true,
	Delay = { 0, 0 },
	LifeTime = 0.5,
	StartSpeed = { 0.5, 0 },
	StartSize = { 0.12, 0.16 },
	StartRotation = { 0, 0 },
	StartColor = { 1, 1, 1, 0.8 },
	GravityModifier = 0.35,
	RateOverTime = 100,
	RateOverTimeRandom = 50,
	ColorOverLifeTime = {
		DataType = "GRADIENT",
		AlphaList = {
			{ T = 0.1, Alpha = 0 },
			{ T = 0.2, Alpha = 50 },
			{ T = 0.3, Alpha = 100 },
			{ T = 0.5, Alpha = 100 },
			{ T = 0.7, Alpha = 80 },
			{ T = 0.9, Alpha = 70 },
			{ T = 1, Alpha = 60 }
		},
	},
	Shape = {
		DataType = "PARTICLE_EMITTER_SHAPE_CONE",
		Angle = 0.5,
		Radius = 0.01
	},
	LinearVelocity = {
		DataType = "PARTICLE_FLOAT3_VALUE_CONSTANT",
		Value = { 0, 0, 0 }
	},
	SizeOverLifetime = {
		{ T = 0, Value = 0 },
		{ T = 0.1, Value = 1 }
	},
	RotationOverLifetime = { -180, 180 }
})