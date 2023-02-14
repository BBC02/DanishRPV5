Config                            = {}
Config.DrawDistance               = 25.0
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale                     = 'da'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

Config.ShowPriceInShowcase = false -- Skal prisen vises i kataloget?

Config.MinPriceProcent = 0.4

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-805.82, -1368.57, 5.18), -- Hvor du sælger køretøjerne
		Size  = {x = 0.7, y = 0.7, z = 0.7},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-708.93, -1335.36, -0.29), -- Hvor den viser bilerne for bossen
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 140.39,
		Type    = -1
	},

	VehSpawn = {
		Pos     = vector3(-790.19, -1407.06, -0.47),  -- Hvor den spawner den købte bil
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 227.78,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-787.7, -1350.57, 5.18), -- Boss Menu
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Type  = -1
	},

    GiveBackVehicle = {
		Pos   = vector3(-847.72, -1343.33, 1.22),
		Size  = {x = 3.0, y = 3.0, z = 3.0},
		Type  = 24
	},

	ResellVehicle = {
		Pos   = vector3(-826.53, -1403.67, 0.43), -- Sælg dit køretøj
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 1
	},

    ShowcaseZone = {
        Pos     = vector3(-708.93, -1335.36, -0.29), -- Hvor kunden kan se bilerne
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 140.39,
		Type    = -1
    },

    ShowCaseMarker = {
        Pos   = vector3(-823.78, -1350.55, 4.15), -- Zonen du aktivere for at showcase
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Type  = 25
    }
}

Config.DemoZones = {
    OpenMenu = {
        Pos = vector3(-762.7, -1375.86, 1.6), -- Menu til at vise biler frem som sælgeren bruger
        Size = {x = 1.0, y = 1.0, z = 1.0},
        Type = 35
    },
    
    SpawnVehicle = {
        Pos = vector3(-768.8, -1378.34, 0.1), -- Hvor bilen spawner
        Heading = 228.0
    },
    
    DeleteVehicle = {
        Pos = vector3(-768.8, -1378.34, 0.12), --Hvor du deleter bilen
        Size = {x = 4.5, y = 4.5, z = 2.0},
        Type = 25
    }
}
