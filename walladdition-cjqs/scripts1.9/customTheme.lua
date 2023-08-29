local StoneGate = ...

StoneGate:dofile(_scriptFolder .. "/configLoader.lua")
-- To define your own theme for Stone Gate Set:
-- You can change the following lines...
_CustomRoofMaterial = config["customTheme"][1]
_CustomWallMaterial = config["customTheme"][2]
_CustomCrenellationMaterial = config["customTheme"][3]
_CustomBasementMaterial = config["customTheme"][4]
_CustomGroundMaterial = config["customTheme"][5]
_CustomFrameMaterial = config["customTheme"][6]
_CustomFlagMaterial = config["customTheme"][7]

StoneGate:log("_CustomRoofMaterial = " .. _CustomRoofMaterial)
StoneGate:log("_CustomWallMaterial = " .. _CustomWallMaterial)
StoneGate:log("_CustomCrenellationMaterial = " .. _CustomCrenellationMaterial)
StoneGate:log("_CustomBasementMaterial = " .. _CustomBasementMaterial)
StoneGate:log("_CustomGroundMaterial = " .. _CustomGroundMaterial)
StoneGate:log("_CustomFrameMaterial = " .. _CustomFrameMaterial)
StoneGate:log("_CustomFlagMaterial = " .. _CustomFlagMaterial)

-- ... amongst these predefined lists:
_RoofMaterialPredefinedList = {
"NOT_USED",
"RED_TILE",
"BLUE_TILE",
"BROWN_TILE",
"LIGHT_GREY_TILE",
"DARK_GREY_TILE",
"RED_SHINGLE",
"BLUE_SHINGLE",
"BROWN_SHINGLE",
"YELLOW_SHINGLE",
"GREEN_SHINGLE",
"WOODEN_MANOR",
"STONE_MANOR",
"BROWN_MONASTERY",
"BLUE_MONASTERY",
"PURPLE_MONASTERY",
"STRAW",
"CUSTOM" }

_WallMaterialPredefinedList = {
"STONE_MANOR",
"BROWN_MONASTERY",
"BLUE_MONASTERY",
"PURPLE_MONASTERY",
"RED_STONE",
"GIANT_GATE",
"WHITE_CHALK",
"SAND_STONE",
"WOOD",
"AMERICAN_SHINGLE",
"CREAM",
"CUSTOM" }

_CrenellationMaterialPredefinedList = {
"STONE_MANOR",
"BROWN_MONASTERY",
"BLUE_MONASTERY",
"PURPLE_MONASTERY",
"RED_STONE",
"GIANT_GATE",
"WHITE_CHALK",
"SAND_STONE",
"CREAM",
"CUSTOM" }

_BasementMaterialPredefinedList = {
"NOT_USED",
"STONE_MANOR",
"BROWN_MONASTERY",
"BLUE_MONASTERY",
"PURPLE_MONASTERY",
"RED_STONE",
"GIANT_GATE",
"SAND_STONE",
"CREAM",
"CUSTOM" }

_GroundMaterialPredefinedList = {
"WHITE_STONE",
"WOOD",
"RED_STONE",
"WATER",
"CUSTOM" }

_FrameMaterialPredefinedList = {
"NOT_USED",
"WHITE_STONE",
"WOOD",
"CREAM",
"CUSTOM" }

_FlagMaterialPredefinedList = {
"NOT_USED",
"RED",
"BLUE",
"GREEN",
"ORANGE",
"PURPLE",
"TURQUOISE",
"CUSTOM" }

