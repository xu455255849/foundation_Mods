local Pastry = ...
-- Register model for stocking asset

Pastry:overrideAsset({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_HEN_BREEDER"
    }
})

Pastry:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_HEN_BREEDER"
    }
})

Pastry:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_HEN_BREEDER"
    }
})

Pastry:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_HEN_BREEDER"
    }
})

-- Register Hen Breeder job
Pastry:registerAsset({
	DataType = "JOB",
	Id = _PastryPrefix .. "_HEN_BREEDER",
	JobName = _PastryPrefix .. "_HEN_BREEDER_NAME",
	JobDescription = _PastryPrefix .. "_HEN_BREEDER_DESC",
        CharacterSetup = {
            LeftHandObject = {
                Model = "PREFAB_TOOL_FARMER_SEED_BAG",
                WorkAttachName = "SeedBag_Anchor",
                WalkAttachName = "SeedBag_Anchor"
            },
            IdleAnimation = "SEED"
        },
	IsLockedByDefault = false,
	UseWorkplaceBehavior = true,
        AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})

Pastry:overrideAsset({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_DAIRY_MAID"
    }
})

Pastry:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_DAIRY_MAID"
    }
})

Pastry:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_DAIRY_MAID"
    }
})

Pastry:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        _PastryPrefix .. "_DAIRY_MAID"
    }
})

-- Register Dairy Maid job
Pastry:registerAsset({
	DataType = "JOB",
	Id = _PastryPrefix .. "_DAIRY_MAID",
	JobName = _PastryPrefix .. "_DAIRY_MAID_NAME",
	JobDescription = _PastryPrefix .. "_DAIRY_MAID_DESC",
	IsLockedByDefault = false,
	UseWorkplaceBehavior = true,
        AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})
