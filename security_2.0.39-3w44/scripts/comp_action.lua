local mod = ...



-- Game Action data -------------------------------------------------------------------------------------
local DATA_SECURITY_ACTION = {
	TypeName = "DATA_SECURITY_ACTION",
	ParentType = "GAME_ACTION",
	Properties = {
		-- {
        --     Name = "SeasonCurrent",
        --     Type = "string",
        --     Default = "Spring",
        --     Flags = { "SAVE_GAME" }
        -- },
    },
}

mod:registerClass(DATA_SECURITY_ACTION)


