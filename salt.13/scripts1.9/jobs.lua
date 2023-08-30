local SaltProduction = ...

SaltProduction:overrideAsset({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        SaltPrefix .. "_SALT_WORKER"
    }
})

SaltProduction:overrideAsset({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        SaltPrefix .. "_SALT_WORKER"
    }
})

SaltProduction:overrideAsset({
    Id = "COMMONER",
    CompatibleJobList = {
        Action = "APPEND",
        SaltPrefix .. "_SALT_WORKER"
    }
})

SaltProduction:overrideAsset({
    Id = "CITIZEN",
    CompatibleJobList = {
        Action = "APPEND",
        SaltPrefix .. "_SALT_WORKER"
    }
})

-- Register salt worker job
SaltProduction:registerAsset({
	DataType = "JOB",
	Id = SaltPrefix .. "_SALT_WORKER",
	JobName = SaltPrefix .. "_SALT_WORKER_NAME",
	JobDescription = SaltPrefix .. "_SALT_WORKER_DESC",
	IsLockedByDefault = false,
	UseWorkplaceBehavior = true,
        AssetJobProgression = "DEFAULT_JOB_PROGRESSION"
})
