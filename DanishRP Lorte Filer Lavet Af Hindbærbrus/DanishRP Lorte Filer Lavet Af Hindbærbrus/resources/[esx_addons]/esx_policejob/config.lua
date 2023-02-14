Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 21, Armories = 21, BossActions = 21, Vehicles = 21, Helicopters = 21}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 9, g = 105, b = 0}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = false -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = true -- Enable esx service?
Config.MaxInService               = 60 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale                     = 'en'

Config.PlateLetters  = 2
Config.PlateNumbers  = 5
Config.PlateUseSpace = true

Config.PoliceStations = {

	LSPD = {

        Blip = {
            Coords  = vector3(425.1, -979.5, 30.7),
            Sprite  = 60,
            Display = 4,
            Scale   = 0.8,
            Colour  = 29
        },
		
				Cloakrooms = {
					vector3(1.1, 1.1, 1.1),
				},
				
				Armories = {
					vector3(1.1, 1.1, 1.1),
				},
				
				Vehicles = {
					{
						Spawner = vector3(459.53, -986.77, 25.69),
						Deleters = {
							--{coords = vector3(435.93, -975.74, 24.9)},
							{coords = vector3(450.57, -975.74, 24.75)}
						},
						SpawnPoints = {
							{coords = vector3(458.92, -993.07, 25.22), heading = 0.5, radius = 6.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(461.1, -981.5, 44.0),
						Deleters = {
							vector3(461.1, -981.5, 43.6),
						},
						SpawnPoints = {
							{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(463.32, -985.01, 30.69)
				}
		
			},
		
			DAVIS = {
		
				Blip = {
					Coords  = vector3(371.86, -1592.78, 36.95),
					Sprite  = 267,
					Display = 4,
					Scale   = 0.9,
					Colour  = 63
				},
		
				Cloakrooms = {
					vector3(363.2, -1594, 25.5)
				},
		
				Armories = {
					vector3(360.8, -1601.5, 25.5)
				},
		
				Vehicles = {
					{
						Spawner = vector3(380.9, -1621.7, 29.3),
						Deleters = {
							{coords = vector3(400.9, -1619, 28.34)},
						},
						SpawnPoints = {
							{coords = vector3(390.1, -1621, 29.3), heading = 318.1, radius = 6.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(370.98, -1598.61, 36.95),
						Deleters = {
							vector3(362.67, -1598.48, 35.95),
						},
						SpawnPoints = {
							{coords = vector3(362.67, -1598.48, 36.95), heading = 312.83, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(358.2, -1591.7, 31.1)
				}
		
			},
			
			SANDYSHORES = {
		
				Blip = {
					Coords  = vector3(1853.52, 3691.06, 39.05),
					Sprite  = 267,
					Display = 4,
					Scale   = 0.9,
					Colour  = 63
				},
		
				Cloakrooms = {
					vector3(1841.8, 3679.4, 34.2)
				},
		
				Armories = {
					vector3(1838.7, 3685.5, 34.2)
				},
		
				Vehicles = {
					{
						Spawner = vector3(1844.9995, 3689.6860, 33.9746),
						Deleters = {
							{coords = vector3(1860.8884, 3698.8728, 33.9746)}
						},
						SpawnPoints = {
							{coords = vector3(1860.8884, 3698.8728, 33.9746), heading = 130.0, radius = 3.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(1850.3313, 3699.0950, 33.9746),
						Deleters = {
							vector3(1887.34, 3708.98, 31.93),
						},
						SpawnPoints = {
							{coords = vector3(1853.2911, 3706.4934, 33.9746), heading = 209.0, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(1834.2, 3677.2, 38.9)
				}
		
			},
			
			PALETOBAY = {
		
				Blip = {
					Coords  = vector3(-447.54, 6015.8, 31.72),
					Sprite  = 267,
					Display = 4,
					Scale   = 0.9,
					Colour  = 63
				},
		
				Cloakrooms = {
					vector3(-439.8, 6010.1, 37)
				},
		
				Armories = {
					vector3(-449.6, 6014.9, 37)
				},
		
				Vehicles = {
					{
						Spawner = vector3(-460.4, 5997.5, 31.5),
						Deleters = {
							{coords = vector3(-463.9, 5997.4, 30.3)}
						},
						SpawnPoints = {
							{coords = vector3(-471.3, 6000.8, 31.3), heading = 83.0, radius = 6.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(-470.1, 5993.7, 31.3),
						Deleters = {
							vector3(-475.28, 5988.47, 30.34),
						},
						SpawnPoints = {
							{coords = vector3(-475.28, 5988.47, 30.34), heading = 319.45, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(-435.5, 6006.4, 37)
				}
		
			},

			VESPUCCIPD = {
		
				-- Blip = {
				-- 	Coords  = vector3(-1083.2291, -825.8581, 19.0358),
				-- 	Sprite  = 267,
				-- 	Display = 4,
				-- 	Scale   = 0.9,
				-- 	Colour  = 63
				-- },
		
				Cloakrooms = {
					vector3(1841.8, 3679.4, 34.2)
				},
		
				Armories = {
					vector3(1838.7, 3685.5, 34.2)
				},
		
				Vehicles = {
					{
						Spawner = vector3(-1109.0349, -839.5004, 13.3360),
						Deleters = {
							{coords = vector3(-1113.7654, -834.3591, 13.3360)}
						},
						SpawnPoints = {
							{coords = vector3(-1113.7654, -834.3591, 13.3360), heading = 123.8954, radius = 3.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(-1094.1628, -841.0526, 37.7004),
						Deleters = {
							vector3(-1096.1427, -832.1658, 37.7008),
						},
						SpawnPoints = {
							{coords = vector3(-1096.1427, -832.1658, 37.7008), heading = 134.2793, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(1834.2, 3677.2, 38.9)
				}
		
			},

			ROCKFORDPD = {
		
				Blip = {
					Coords  = vector3(-563.8109, -126.8079, 38.4350),
					Sprite  = 267,
					Display = 4,
					Scale   = 0.9,
					Colour  = 63
				},
		
				Cloakrooms = {
					vector3(1841.8, 3679.4, 34.2)
				},
		
				Armories = {
					vector3(1838.7, 3685.5, 34.2)
				},
		
				Vehicles = {
					{
						Spawner = vector3(-563.6154, -116.4603, 33.6502),
						Deleters = {
							{coords = vector3(-565.4717, -121.3891, 33.6502)}
						},
						SpawnPoints = {
							{coords = vector3(-565.4717, -121.3891, 33.6502), heading = 24.3773, radius = 3.0}
						}
					},
				},
		
				Helicopters = {
					{
						Spawner = vector3(-894.6865, -449.3812, 171.8141),
						Deleters = {
							vector3(-894.6865, -449.3812, 171.8141),
						},
						SpawnPoints = {
							{coords = vector3(-894.6865, -449.3812, 171.8141), heading = 129.6304, radius = 10.0}
						}
					}
				},
		
				BossActions = {
					vector3(1834.2, 3677.2, 38.9)
				}
		
			}
		
		}

Config.AuthorizedArmory = {
    {label = _U('combatpistol'), item = 'WEAPON_COMBATPISTOL'},
    {label = _U('flashlight'), item = 'WEAPON_FLASHLIGHT'},
    {label = _U('nightstick'), item = 'WEAPON_NIGHTSTICK'},
    {label = _U('heavypistol'), item = 'WEAPON_HEAVYPISTOL'},
    {label = _U('smg'), item = 'WEAPON_SMG'},
    {label = _U('carbinerifle'), item = 'WEAPON_CARBINERIFLE'},
    {label = _U('smokegrenade'), item = 'WEAPON_SMOKEGRENADE'},
    {label = _U('weapon_suppressor'), item = 'at_suppressor_light'},
    {label = 'Skud (30)', item = 'ammo1'},
    {label = _U('weapon_flashlight'), item = 'at_flashlight'},
    {label = _U('weapon_radio'), item = 'radio'},
    {label = _U('weapon_scope'), item = 'at_scope_small'},
	{label = 'Grip', item = 'at_grip'},
    {label = 'Skudsikkervest', item = 'skudsikkervest100'},
}

Config.AuthorizedCafe = {
    {label = 'Burger', item = 'burger'},
	{label = 'Vand', item = 'water'},
}

Config.AuthorizedVehicles = {
	car = {
		{model = 'passatmarked', label = 'VW Passat - Markeret'}, 
		{model = 'mercedesc250', label = 'Mercedes C250 - Markeret'},
		{model = 'touranmarked', label = 'VW Touran - Markeret'},
		{model = 'volvov90', label = 'Volvo - Markeret'},
		{model = 'explorerpoli', label = 'Ford Explorer - Markeret'},
		{model = 't6marked', label = 'VW T6 - Indsatsleder'},
		{model = 'yamahamc', label = 'BMW R1200 - MC'},
		{model = 'bmwmc', label = 'BMW 800GS - MC'},
		{model = 'tailgatercivil', label = 'Tailgater - Civil'},
		{model = 'jackalcivil', label = 'Jackal - Civil'},
		{model = 'tailgater2civil', label = 'Tailgater S - Civil'},
		{model = 'komodacivil', label = 'Komoda - Civil'},
        {model = 'reblacivil', label = 'Rebla GTS - Civil'},
		{model = 'vstrcivil', label = 'VSTR - Krim'},
		{model = 'oraclecivil', label = 'Oracle - Krim'},
		{model = 'schafter3civil', label = 'Schafter - KRIM'},
		{model = 'dubsta2civil', label = 'Dubsta - KRIM'},
		{model = 'ballercivil', label = 'Baller2 - KRIM'},
		{model = 't6kta', label = 'VW T6 - KRIM'},
		{model = 'xlscivil', label = 'XLS - Romeo'},
		{model = 'pradounmarked', label = 'Toyota Prado - AKS'},
		{model = 'tailgater2', label = 'Tailgater S - Statsadvokat'},
	},

	helicopter = {
		{model = 'politiheli', label = 'Politi Helikopter'}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}




-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	uniform_lang = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 415,   torso_2 = 0,
            decals_1 = 137,   decals_2 = 0,
            arms = 4,       arms_2 = 0,
            pants_1 = 149,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 59,  bproof_2 = 0,
            bags_1 = 0,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 227,  tshirt_2 = 0,
			torso_1 = 400,   torso_2 = 0,
			decals_1 = 137,   decals_2 = 0,
			arms = 3,       arms_2 = 0,
			pants_1 = 145,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			mask_1 = 198, 	mask_2 	= 0,
			bproof_1 = 0,  bproof_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_kort = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 470,   torso_2 = 0,
            decals_1 = 137,   decals_2 = 0,
            arms = 0,       arms_2 = 0,
            pants_1 = 149,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 59,  bproof_2 = 0,
            bags_1 = 0,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 227,  tshirt_2 = 0,
			torso_1 = 401,   torso_2 = 0,
			decals_1 = 137,   decals_2 = 0,
			arms = 9,       arms_2 = 0,
			pants_1 = 145,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			mask_1 = 198, 	mask_2 	= 0,
			bproof_1 = 0,  bproof_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_mc = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 422,   torso_2 = 0,
            decals_1 = 137,   decals_2 = 0,
            arms = 4,       arms_2 = 0,
            pants_1 = 149,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = 114,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 60,  bproof_2 = 0,
            bags_1 = 0,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_jakke = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 414,   torso_2 = 0,
            decals_1 = 137,   decals_2 = 0,
            arms = 0,       arms_2 = 0,
            pants_1 = 149,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 59,  bproof_2 = 0,
            bags_1 = 0,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 227,  tshirt_2 = 0,
			torso_1 = 403,   torso_2 = 0,
			decals_1 = 130,   decals_2 = 0,
			arms = 3,       arms_2 = 0,
			pants_1 = 145,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			mask_1 = 198, 	mask_2 	= 0,
			bproof_1 = 0,  bproof_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_lang_sort = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 480,   torso_2 = 0,
            decals_1 = 137,   decals_2 = 0,
            arms = 4,       arms_2 = 0,
            pants_1 = 149,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 0,  bproof_2 = 0,
            bags_1 = 0,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 227,  tshirt_2 = 0,
			torso_1 = 404,   torso_2 = 0,
			decals_1 = 130,   decals_2 = 0,
			arms = 3,       arms_2 = 0,
			pants_1 = 145,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			mask_1 = 198, 	mask_2 	= 0,
			bproof_1 = 0,  bproof_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_aks = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 420,   torso_2 = 1,
            decals_1 = 19,   decals_2 = 0,
            arms = 4,       arms_2 = 0,
            pants_1 = 148,   pants_2 = 1,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = 116,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 57,  bproof_2 = 0,
            bags_1 = 49,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		}
	},

    uniform_romeo = {
		male = {
            tshirt_1 = 50,  tshirt_2 = 0,
            torso_1 = 420,   torso_2 = 0,
            decals_1 = 19,   decals_2 = 0,
            arms = 4,       arms_2 = 0,
            pants_1 = 148,   pants_2 = 0,
            shoes_1 = 25,   shoes_2 = 0,
            helmet_1 = 116,  helmet_2 = 0,
            chain_1 = 0,    chain_2 = 0,
            ears_1 = -1,     ears_2 = 0,
            mask_1 = 0,     mask_2     = 0,
            bproof_1 = 57,  bproof_2 = 1,
            bags_1 = 49,    bags_2 = 0,
            glasses_1 = 0,  glasses_2 = 0
		},
		female = {
			tshirt_1 = 227,  tshirt_2 = 0,
			torso_1 = 407,   torso_2 = 0,
			decals_1 = 128,   decals_2 = 0,
			arms = 212,       arms_2 = 0,
			pants_1 = 59,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 155,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			mask_1 = 198, 	mask_2 	= 0,
			bproof_1 = 4,  bproof_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			glasses_1 = 36,  glasses_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 59,  bproof_2 = 0
		},
		female = {
			bproof_1 = 11,  bproof_2 = 0
		}
	},

}