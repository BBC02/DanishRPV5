Config              = {}
Config.DrawDistance = 20.0
Config.BlipUpdateTime = 3000
Config.CooldownMinutes = 10
Config.Locale = 'en'

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = 759.01, y = -3195.18, z = 4.97},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Colour = 12, --BLIP
		Id = 85, --BLIP
	},
}

Config.ChangePlate = {
	Pos = {x = 2409.33, y = 3033.44, z = 48.15, h = 0.0},
}

Config.CarSpawn = {
	Pos = {x = 774.00, y = -3215.27, z = 5.50, h = 0.0},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = 767.71, y = -3195.20, z = 5.50, alpha = 0.00},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 2130.68, y = 4781.32, z = 39.87},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 37000,
		Cars = {'toreador','rapidgt3','mamba',' dominator7','gauntlet3'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos      = {x = 3333.51, y = 5159.91, z = 17.20},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 33500,
		Cars = {'dominator','swinger','impaler','hermes','gauntlet3'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = -437.56, y = 6254.53, z = 29.02},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 38250,
		Cars = {'dominator','swinger','impaler','hermes','gauntlet3'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = -2177.51, y = 4269.51, z = 47.93},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 34500,
		Cars = {'dukes3','swinger',' dominator8','xa21','raiden'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = 895.02, y = 3603.87, z = 31.72},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 31500,
		Cars = {' dukes3','swinger','impaler','hermes','gauntlet3'},
	},
}

Config.Pickup = {
	--Desert
	--Trevor Airfield 9.22KM
	Pickup1 = {
		Pos      = {x = -700.93, y = -985.44, z = 20.38},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
	--Lighthouse 9.61KM
	Pickup2 = {
		Pos      = {x = -314.31, y = -66.05, z = 54.42},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
	--House in Paleto 12.94KM
	Pickup3 = {
		Pos      = {x = -19.17, y = -672.28, z = 32.33},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
	--Great Ocean Highway 10.47KM
	Pickup4 = {
		Pos      = {x = -444.32, y = -808.64, z = 30.53},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
	--Marina Drive Desert 8.15KM
	Pickup5 = {
		Pos      = {x = -608.86, y = -1033.20, z = 21.78},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
	Pickup6 = {
		Pos      = {x = 40.25, y = -1628.87, z = 29.29},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},
}
