Config                            = {}

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = false -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 5  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 60 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = {coords = vector3(299.48928833008,-584.67028808594,43.260860443115), heading = 77.017}

Config.OpenMenuSpawn= {x = 266.62, y = -1354.23, z = 24.53}

-- Hash: Ambulance spawn code
-- Detection: How close does one have to be to the ambulance (Lesser number is closer, bigger number is further)
-- Depth: How far into the ambulance does the stretcher go (More positive is closer to cab, more negative is further from cab)
-- Height: How high up is the stretcher in the ambulance (Lesser number is lower, higher number is higher)
Config.Hash = {
	{hash = "gdspeedoa", detection = 4.8, depth = -1.0, height = -0.3},
	{hash = "emsnspeedo", detection = 4.2, depth = -1.0, height = -0.245},
	{hash = "ambulance22", detection = 4.1, depth = -1.0, height = -0.15},
}

Config.Press = {
	open_menu = Keys["Y"],
	take_bed = Keys["E"],
	do_action = Keys["E"],
	out_vehicle_bed = Keys["E"],
	release_bed = Keys["E"],
	in_vehicle_bed = Keys["E"],
	go_out_bed = Keys["E"],
}


Config.Language = {
	name_hospital = 'Stretcher',
	open_menu = 'Press ~b~E',
	do_action = 'Press ~INPUT_CONTEXT~ to interact with stretcher',
	take_bed = "Press ~INPUT_CONTEXT~ to take stretcher",
	release_bed = "Press ~INPUT_CONTEXT~ to drop stretcher",
	in_vehicle_bed = "Press ~INPUT_CONTEXT~ to stow stretcher",
	out_vehicle_bed = "Press ~INPUT_CONTEXT~ to retrieve stretcher",
	go_out_bed = "Get off of bed",
	delete_bed = "Remove bed",
	toggle_backboard = "Toggle backboard",
	lit_1 = "Bed without matela",
	toggle_seat = "Fold seat",
	toggle_lifepak = "Toggle lifepak",
	toggle_bag = "Toggle bag",
	toggle_backpack = "Toggle backpack",
	anim = {
		spawn_command = "Litter",
		lie_back = "Lie on back",
		sit_right = "Sit on right side",
		sit_left = "Sit on left side",
		convulse = "Recieve CPR",
		pls = "Sit on stretcher",
	}
}

Config.AuthorizedVehicles = {
	car = {
		{ model = 'sprinterambulance', label = 'Mercedes-Benz Sprinter 2019 - Ambulance', price = 0},
		{ model = 'ml63akut', label = 'Mercedes-Benz ML63 - Akut', price = 0},
		{ model = 'volvoxc90ambulance', label = 'Volvo XC90 - Akut', price = 0},
		{ model = 'micuambu', label = 'Volvo Micu - Behandlingsplads', price = 0},
		{ model = 'explorerambu', label = 'Ford Explorer - Læge', price = 0},
	},

	helicopter = {
		{model = 'ambumav', label = 'Læge Helikopter'}
	}
}

Config.Hospitals = {

	Pillbox = {

		Blip = {
			coords = vector3(315.60339355469,-590.16143798828,43.284107208252),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(301.47802734375,-599.47473144531,42.284099578857)
		},

		Pharmacies = {
			vector3(306.69998168945,-601.42132568359,42.284111022949)
		},

		Vehicles = {
			{
				Spawner = vector3(339.48330688477,-575.78149414063,28.796844482422),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				Deleters = {
                    {coords = vector3(333.41613769531,-574.57720947266,27.796867370605)},
                    {coords = vector3(326.81683349609,-571.43273925781,27.796865463257)},
					{coords = vector3(352.20367431641,-588.15808105469,74.16170501709)}
                },
				SpawnPoints = {
					{coords = vector3(333.41613769531,-574.57720947266,28.796867370605), heading = 339.10, radius = 4.0},
					{coords = vector3(326.81683349609,-571.43273925781,28.796865463257), heading = 163.6, radius = 4.0},
					{coords = vector3(319.45031738281,-569.29565429688,28.796857833862), heading = 252.78, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(346.01962280273,-578.72772216797,74.161750793457),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(352.08868408203, -588.3642578125, 74.161750793457), heading = 142.7, radius = 10.0}
				}
			}
		}
	}
}


Config.outfits = {
	{
		model = "mp_m_freemode_01",
		job = 'ambulance',
		label = 'Lys T-Shirt',
		mask = {component_id = 1, texture = 0, drawable = 40},
		arms = {component_id = 3, texture = 0, drawable = 109},
		torso = {component_id = 11, texture = 0, drawable =57},
		undershirt = {component_id = 8, texture = 0, drawable = 178},
		pants = {component_id = 4, texture = 0, drawable = 20},
		shoes = {component_id = 6, texture = 0, drawable = 51},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
	  {
		model = "mp_m_freemode_01",
		job = 'ambulance',
		label = 'Mørk Falck T-Shirt',
		mask = {component_id = 1, texture = 0, drawable = 40},
		arms = {component_id = 3, texture = 0, drawable = 109},
		torso = {component_id = 11, texture = 0, drawable = 2},
		undershirt = {component_id = 8, texture = 0, drawable = 214},
		pants = {component_id = 4, texture = 0, drawable = 20},
		shoes = {component_id = 6, texture = 0, drawable = 51},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
	  {
		model = "mp_m_freemode_01",
		job = 'ambulance',
		label = 'Jakke',
		mask = {component_id = 1, texture = 0, drawable = 40},
		arms = {component_id = 3, texture = 0, drawable = 77},
		torso = {component_id = 11, texture = 1, drawable = 407},
		undershirt = {component_id = 8, texture = 2, drawable = 13},
		pants = {component_id = 4, texture = 5, drawable = 145},
		shoes = {component_id = 6, texture = 0, drawable = 25},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
	{
		model = "mp_f_freemode_01",
		job = 'ambulance',
		label = 'Lys T-Shirt',
		mask = {component_id = 1, texture = 0, drawable = 0},
		arms = {component_id = 3, texture = 0, drawable = 122},
		torso = {component_id = 11, texture = 0, drawable = 31},
		undershirt = {component_id = 8, texture = 0, drawable = 15},
		pants = {component_id = 4, texture = 0, drawable = 20},
		shoes = {component_id = 6, texture = 0, drawable = 51},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
	  {
		model = "mp_f_freemode_01",
		job = 'ambulance',
		label = 'Mørk Falck T-Shirt',
		mask = {component_id = 1, texture = 0, drawable = 0},
		arms = {component_id = 3, texture = 0, drawable = 74},
		torso = {component_id = 11, texture = 12, drawable = 394},
		undershirt = {component_id = 8, texture = 0, drawable = 15},
		pants = {component_id = 4, texture = 5, drawable = 145},
		shoes = {component_id = 6, texture = 0, drawable = 25},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
	  {
		model = "mp_f_freemode_01",
		job = 'ambulance',
		label = 'Jakke',
		mask = {component_id = 1, texture = 0, drawable = 0},
		arms = {component_id = 3, texture = 0, drawable = 122},
		torso = {component_id = 11, texture = 0, drawable = 30},
		undershirt = {component_id = 8, texture = 0, drawable = 15},
		pants = {component_id = 4, texture = 0, drawable = 20},
		shoes = {component_id = 6, texture = 0, drawable = 51},
		bag = {component_id = 5, texture = 0, drawable = 0},
		accesories = {component_id = 7, texture = 0, drawable = 0},
		kevlar = {component_id = 9, texture = 0, drawable = 0},
		badge = {component_id = 10, texture = 0, drawable = 0},
		hat = {prop_id = 0, texture = 0, drawable = -2},
		glass = {prop_id = 1, texture = 0, drawable = -2},
		ear = {prop_id = 2, texture = 0, drawable = -2}
	  },
}