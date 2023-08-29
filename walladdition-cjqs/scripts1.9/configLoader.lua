local configLoader = ...

config = {}

local json = configLoader:dofile("libraries/dkjson.lua")
local success = ""
local content = ""

success, content = configLoader:readFileAsString("config/mod_config.json")
config = json.decode(content)