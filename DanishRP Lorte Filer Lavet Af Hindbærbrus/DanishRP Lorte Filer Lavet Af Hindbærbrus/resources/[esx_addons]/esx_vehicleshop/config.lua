Config                            = {}
Config.DrawDistance               = 25.0
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale                     = 'da'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LL NNNNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 2
Config.PlateNumbers  = 5
Config.PlateUseSpace = false

Config.MinPriceProcent = 0.4 -- 40% af den opringelige pris kan den sælges til minimum. Fx bilen koster 250K minimum pris = 100K
Config.ShowPriceInShowcase = false -- Skal prisen vises i kataloget?

Config.Blip = vector3(-765.5987, -1049.6661, 13.02)

Config.Zones = {

	ShopEntering = {
		Pos   = {
			vector3(-765.5987, -1049.6661, 13.02),
			vector3(-767.5310, -1052.5181, 13.02),
		}, -- Hvor du sælger køretøjerne
		Size  = {x = 0.7, y = 0.7, z = 0.7},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-754.8383, -1078.0645, 11.36), -- Hvor den viser bilerne for bossen
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = -20.0,
		Type    = -1
	},

	VehSpawn = {
		Pos     = {
			vector3(-768.5442, -1028.3416, 13.70),
		},  -- Hvor den spawner den købte bil
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = {
			160.15,
			157.77,
			156.45,
			162.04,
		},
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-799.3715, -1018.7031, 20.18), -- Boss Menu
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Type  = -1
	},

	ResellVehicle = {
		Pos   = vector3(-6.82, -1088.11, 27.04), -- Sælg dit køretøj
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Type  = 29
	},

    ShowcaseZone = {
        Pos     = vector3(-763.6005, -1005.6107, 13.00), -- Hvor kunden kan se bilerne
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 219.45,
		Type    = -1
    },

    ShowCaseMarker = {
        Pos   = vector3(-770.9623, -1041.5905, 13.20), -- Zonen du aktivere for at showcase
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 25
    }
}

Config.DemoZones = {
    OpenMenu = {
        Pos = {
			vector3(-778.5825, -1044.7771, 14.13),
		}, -- Menu til at vise biler frem som sælgeren bruger
        Size = {x = 0.5, y = 0.5, z = 0.5},
        Type = 36
    },
    
    SpawnVehicle = {
        Pos = {
			vector3(-776.9767, -1038.3455, 13.71),
		}, -- Hvor bilen spawner
        Heading = {
			23.9,
			211.84,
			274.94,
			20.03,
			257.44,
			336.21,
		}
    },
    
    DeleteVehicle = {
        Pos = {
			vector3(-776.9767, -1038.3455, 13.20),
		}, --Hvor du deleter bilen
        Size = {x = 1.5, y = 1.5, z = 1.5},
        Type = 25
    }
}
