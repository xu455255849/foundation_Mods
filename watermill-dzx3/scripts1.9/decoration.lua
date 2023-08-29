local decoration, _prefix = ...

decoration:registerEnumValue ("BUILDING_PART_TYPE", "DECORATION")

function registerDecorationPart(_nameFbx, _namePart, _nameAsset, _resourceNeeded)
    -- Apply building asset processor
    decoration:registerAssetProcessor(_nameFbx, {
	DataType = "BUILDING_ASSET_PROCESSOR"
    })

    -- Register prefab node
    decoration:registerAssetId(_nameFbx .. "/Prefab/" .. _namePart, _prefix .. "_" .. _nameAsset .. "_PREFAB")

    -- Register part
    decoration:registerAsset({
	DataType = "BUILDING_PART",
	Id = _prefix .. "_" .. _nameAsset .. "_PART",
	Name = _prefix .. "_" .. _nameAsset .. "_NAME",
	Description = _prefix .. "_" .. _nameAsset .. "_DESC",
	Category = "DECORATION",
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab = _prefix .. "_" .. _nameAsset .. "_PREFAB",
                MiniatureConfig = {
                        DataType = "BUILDING_MINIATURE_CONFIG",
                        ClipUnderGround = false
                }
	},
      IsMovableWhenBuilt = true,
	Cost = {
		UpkeepCost = {
			{ Resource = "GOLD", Quantity = _NoSandbox*0 }
		},
		ResourceNeededList = {_resourceNeeded}
	}
    })
end

registerDecorationPart("models/decoration/sacs.fbx", "SacsPart", "SACS", {})

function registerObjectToSnapPart(_nameFbx, _namePart, _nameAsset, _resourceNeeded)
    registerDecorationPart(_nameFbx, _namePart, _nameAsset, _resourceNeeded)

    decoration:registerPrefabComponent(_nameFbx .. "/Prefab/" .. _namePart, {
	DataType = "COMP_GROUNDED",
	SetOrientation = true
    })
end

registerObjectToSnapPart("models/decoration/planks.fbx", "PlanksPart", "PLANKS",
                         { -- List of RESOURCE_QUANTITY_PAIR
			     { Resource = "PLANK", Quantity = _NoSandbox*1 }
                         }
)
registerObjectToSnapPart("models/decoration/smallBoat.fbx", "SmallBoatPart", "SMALL_BOAT",
                         { -- List of RESOURCE_QUANTITY_PAIR
			     { Resource = "PLANK", Quantity = _NoSandbox*1 }
                         }
)


