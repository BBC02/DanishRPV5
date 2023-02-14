Config = {}
Config.Locale = 'en'

Config.Main = {
	MenuAlign = 'top-left', -- Menu Align. Current will show on Top Left.
	DrawDistance = 20, -- Draw Distance to Markers.
	AdvVehShop = false, -- Set to true if using esx_advancedvehicleshop.
	Commands = false, -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
	ParkVehicles = true, -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
	KickCheaters = true, -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
	CustomKickMsg = true, -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.
	GiveSocMoney = true, -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
	ShowVehLoc = true, -- true = Will show Location of Vehicles in the Garage Menus.
	Spacers = true, -- true = Shows Spacers in Menus.
	PoundTimer = false, -- true = Uses Pound Timer
	PoundWait = 0, -- How many Minutes someone must wait before Opening Pound Menu Again.
	JPoundTimer = false, -- true = Uses Job Pound Timer
	JPoundWait = 0, -- How many Minutes someone must wait before Opening Job Pound Menu Again.
	DamageMult = true, -- true = Costs more to Store a Broken/Damaged Vehicle.
	MultAmount = 90  -- Higher Number = Higher Repair Price.
}

Config.Blips = {
	Garages = {Sprite = 290, Color = 38, Display = 2, Scale = 0.5}, -- Public Garage Blip.
	PGarages = {Sprite = 290, Color = 53, Display = 2, Scale = 0.5}, -- Private Garage Blip.
	Pounds = {Sprite = 67, Color = 64, Display = 2, Scale = 0.5}, -- Pound Blip.
	JGarages = {Sprite = 290, Color = 49, Display = 2, Scale = 0.5}, -- Job Garage Blip.
	JPounds = {Sprite = 67, Color = 49, Display = 2, Scale = 0.5}, -- Job Pound Blip.
}

Config.Ambulance = {
	Garages = false, -- true = Allows use of Ambulance Garages.
	Pounds = false, -- true = Allows use of Ambulance Pounds.
	Blips = false, -- true = Use Ambulance Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Ambulance Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Police = {
	Garages = false, -- true = Allows use of Police Garages.
	Pounds = false, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Police Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Mechanic = {
	Garages = false, -- true = Allows use of Mechanic Garages.
	Pounds = false, -- true = Allows use of Mechanic Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 150, -- How much it Costs to get Vehicles from Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Aircrafts = {
	Garages = false, -- true = Allows use of Aircraft Garages.
	Blips = false, -- true = Use Aircraft Blips.
	PoundP = 2500, -- How much it Costs to get Vehicles from Aircraft Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
	}
}

Config.Boats = {
	Garages = true, -- true = Allows use of Boat Garages.
	Blips = true, -- true = Use Boat Blips.
	PoundP = 500, -- How much it Costs to get Vehicles from Boat Pound.
	Markers = {
		Points = {Type = 25, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 25, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 25, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
	}
}

Config.Cars = {
	Garages = true, -- true = Allows use of Car Garages.
	Blips = true, -- true = Use Car Blips.
	PoundP = 10000, -- How much it Costs to get Vehicles from Car Pound.
	Markers = {
		Points = {Type = 36, r = 9, g = 105, b = 0, x = 0.8, y = 0.8, z = 0.8}, -- Green Color / Standard Size Circle.
		Delete = {Type = 25, r = 9, g = 105, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 25, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
	}
}

Config.Pvt = {
	Garages = true, -- Set to true if using esx_property & want Private Car Garages for Properties
	Markers = {
		Points = {Type = 25, r = 9, g = 105, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 25, r = 9, g = 105, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Red Color / Big Size Circle.
	}
}

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(302.95, -1453.5, 28.97),
		Spawner = vector3(300.33, -1431.91, 29.8),
		Spawner2 = vector3(313.36, -1465.17, 46.51),
		Deleter = vector3(300.33, -1431.91, 28.8),
		Deleter2 = vector3(313.36, -1465.17, 45.51),
		Heading = 226.71,
		Heading2 = 318.34
	}
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(425.41, -1003.43, 29.71),
		Spawner = vector3(434.28, -1015.8, 28.83),
		Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(462.95, -1014.56, 27.07),
		Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 90.46,
		Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Police

-- Start of Mechanic
Config.MechanicGarages = {
	Los_Santos = {
		Marker = vector3(-344.25, -123.4, 38.01),
		Spawner = vector3(-370.1, -108.28, 37.68),
		Deleter = vector3(-370.1, -108.28, 37.68),
		Heading = 73.9
	}
}

Config.MechanicPounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Mechanic

-- Start of Aircrafts
Config.AircraftGarages = {
	Los_Santos_Airport = {
		Marker = vector3(-1617.14, -3145.52, 12.99),
		Spawner = vector3(-1657.99, -3134.38, 12.99),
		Deleter = vector3(-1642.12, -3144.25, 12.99),
		Heading = 330.11
	},
	Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	},
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2082.36, 4806.06, 40.07),
		Heading = 115.04
	}
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-735.87, -1325.08, 0.6),
		Spawner = vector3(-718.87, -1320.18, -0.47),
		Deleter = vector3(-731.15, -1334.71, -0.47),
		Heading = 45.0
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1333.2, 4269.92, 30.5),
		Spawner = vector3(1334.61, 4264.68, 29.86),
		Deleter = vector3(1323.73, 4269.94, 29.86),
		Heading = 87.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-283.74, 6629.51, 6.3),
		Spawner = vector3(-290.46, 6622.72, -0.47),
		Deleter = vector3(-304.66, 6607.36, -0.47),
		Heading = 52.0
	}
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 4.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	}
	--[[Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 32.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 6.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	}]]--
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {
	Los_Santos = {
		Marker = vector3(230.37,-797.23,30.18),
		Spawner = vector3(230.37,-797.23,30.08),
		Deleter = vector3(214.85,-791.30,29.90),
		Heading = 157.84
	},
	Sandy_MC = {
		Marker = vector3(253.3318, -1161.4640, 29.1498),
		Spawner = vector3(253.3318, -1161.4640, 29.1498),
		Deleter = vector3(253.3318, -1161.4640, 29.1498),
		Heading = 159.82
	},
	
	Sandy_Shores = {
		Marker = vector3(1722.66, 3713.74, 33.80),
		Spawner = vector3(1722.66, 3713.74, 33.80),
		Deleter = vector3(1722.66, 3713.74, 33.71),
		Heading = 21.22
	},
	Paleto_Bay = {
		Marker = vector3(128.78, 6622.99, 31.40),
		Spawner = vector3(128.78, 6622.99, 31.40),
		Deleter = vector3(126.36, 6608.41, 30.9),
		Heading = 315.01
	},
	Mission_Row_PD = {
		Blips = false, -- true = Use Ambulance Blips.
		Marker = vector3(431.17,-981.49,25.35),
		Spawner = vector3(431.17,-981.49,25.35),
		Deleter = vector3(426.3184, -991.8826, 24.78),
		Heading = 180.00
	},
	Brothas = {
		Marker = vector3(-1464.0328369141,-25.622114181519,54.246923065186),
		Spawner = vector3(-1464.0328369141,-25.622114181519,54.246923065186),
		Deleter = vector3(-1462.9986572266,-41.500305175781,53.679403167725),
		Heading = 236.000
	},
	Groove_Street = {
		Marker = vector3(-54.79,-1836.66,26.17),
		Spawner = vector3(-54.79,-1836.66,26.17),
		Deleter = vector3(-66.8,-1831.1,26.0),
		Heading = 319.69
	},
	Lufthavn_Garage = {
		Marker = vector3(-975.15,-2701.45,13.48),
		Spawner = vector3(-975.15,-2701.45,13.86),
		Deleter = vector3(-970.53,-2703.17,12.96),
		Heading = 64.32
	},
	Container_Garage = {
		Marker = vector3(822.48,-3144.44,5.52),
		Spawner = vector3(822.48,-3144.44,5.52),
		Deleter = vector3(808.68,-3137.89,4.99),
		Heading = 1.25
	},
	Sandy_Secret = {
		Blips = false,
		Marker = vector3(1124.18,2647.89,37.61),
		Spawner = vector3(1124.18,2647.89,37.61),
		Deleter = vector3(1131.5,2663.91,37.2),
		Heading = 2.03
	},
	Vindrue_Mark = {
		Blips = false,
		Marker = vector3(-1889.87,2045.57,140.49),
		Spawner = vector3(-1889.87,2045.57,140.49),
		Deleter = vector3(-1889.73,2045.76,139.90),
		Heading = 250.0
	},
	Skraldemand_Sted = {
		Blips = false,
		Marker = vector3(-369.27,-1525.62,27.38),
		Spawner = vector3(-369.27,-1525.62,27.38),
		Deleter = vector3(-354.95,-1521.76,26.82),
		Heading = 177.0
	},
	Badehotel = {
		Blips = false,
		Marker = vector3(-3018.54,100.33,11.26),
		Spawner = vector3(-3018.54,100.33,11.26),
		Deleter = vector3(-2999.63,87.56,10.65),
		Heading = 329.0
	},
	Revisor = {
		Blips = false,
		Marker = vector3(-1520.38,-557.52,25.32),
		Spawner = vector3(-1520.38,-557.52,25.32),
		Deleter = vector3(-1527.6005859375,-562.26794433594,24.807225799561),
		Heading = 119.0
	},
	Playboy = {
		Blips = false,
		Marker = vector3(-1525.69,88.52,56.17),
		Spawner = vector3(-1525.69,88.52,56.17),
		Deleter = vector3(-1531.9990234375,79.502403259277,54.756938934326),
		Heading = 257.0
	},
	Impound_Garage = {
		Blips = false,
		Marker = vector3(406.22,-1644.27,28.91),
		Spawner = vector3(406.22,-1644.27,28.91),
		Deleter = vector3(402.02,-1632.51,28.32),
		Heading = 227.13
	},
   	Ballas = {
		Blips = false,
        Marker = vector3(-224.42,-1699.37,33.60),
        Spawner = vector3(-224.42,-1699.37,33.60),
        Deleter = vector3(-216.05, -1691.58, 33.09),
        Heading = 53.018
 	},
	lafam = {
        Marker = vector3(1377.87,-596.10,73.90),
        Spawner = vector3(1377.87,-596.10,73.90),
        Deleter = vector3(1377.87, -595.98, 73.38),
        Heading = 53.018
	},	
	Los_Santos_1 = {
		Marker = vector3(290.56,-337.84,44.58),
		Spawner = vector3(290.56,-337.84,44.58),
		Deleter = vector3(283.24, -342.28, 44),
		Heading = 158.00
	},
	Mirror_Park = {
		Marker = vector3(1041.18,-775.54,57.64),
		Spawner = vector3(1041.18,-775.54,57.64),
		Deleter = vector3(1046.56, -770.66, 57.1),
		Heading = 359.00
	},
	Sandy_Shores_Medical = {
		Marker = vector3(1829.79,3662.55,33.58),
		Spawner = vector3(1829.79,3662.55,33.58),
		Deleter = vector3(1825.2, 3659.55, 33.15),
		Heading = 210.01
	},
	Pillbox_hill_1 = {
		Marker = vector3(45.05,-852.43,30.38),
		Spawner = vector3(45.05,-852.43,30.38),
		Deleter = vector3(65.7, -851.56, 29.89),
		Heading = 160.63
	},
	Pillbox_hill_2 = {
		Marker = vector3(-284.12,-895.69,30.70),
		Spawner = vector3(-284.12,-895.69,30.70),
		Deleter = vector3(-302.19, -899.04, 30.08),
		Heading = 257.6
	},
	Pillbox_Hospital = {
		Marker = vector3(335.32,-623.98,28.90),
		Spawner = vector3(335.32,-623.98,28.90),
		Deleter = vector3(342.36, -631.91, 28.30),
		Heading = 247.6
	},
	West_winewood_1 = {
		Marker = vector3(-334.63,290.88,85.42),
		Spawner = vector3(-334.63,290.88,85.42),
		Deleter = vector3(-348.63, 272.58, 84.35),
		Heading = 180.27
	},
	Hawick = {
		Marker = vector3(544.83,-140.73,58.47),
		Spawner = vector3(544.83,-140.73,58.47),
		Deleter = vector3(551.72, -141.34, 58.1),
		Heading = 90.91
	},
	San_Andreas_Del_Perro_FWY = {
		Marker = vector3(-2035.12,-471.05,11.00),
		Spawner = vector3(-2035.12,-471.05,11.00),
		Deleter = vector3(-2023.68, -472.18, 10.46),
		Heading = 230.0
	},
	NDG = {
		Blips = false,
		Marker = vector3(1405.71,1118.45,114.46),
		Spawner = vector3(1405.71,1118.45,114.46),
		Deleter = vector3(1401.0400390625, 1118.4521484375, 113.84770751953),
		Heading = 90.0
	},
	Pizzaria = {
		Blips = false,
		Marker = vector3(805.05,-727.61,27.27),
		Spawner = vector3(805.05,-727.61,27.27),
		Deleter = vector3(809.60, -732.80, 26.68),
		Heading = 130.0
	},
	Bilforhandler = {
		Blips = false,
		Marker = vector3(-737.21,-1032.33,12.38),
		Spawner = vector3(-737.21,-1032.33,12.38),
		Deleter = vector3(-744.37,-1037.14,11.81),
		Heading = 119.0
	},
	Redline = {
		Blips = false,
		Marker = vector3(-552.69,-897.61,24.04),
		Spawner = vector3(-552.69,-897.61,24.04),
		Deleter = vector3(-744.37,-1037.14,11.81),
		Heading = 179.0
	},
	Sicarios = {
		Blips = false,
		Marker = vector3(1000.9567, -2522.0908, 28.3028),
		Spawner = vector3(1000.9567, -2522.0908, 28.3028),
		Deleter = vector3(1000.9567, -2522.0908, 28.3028),
		Heading = 354.057
	},
	Gambino = {
		Blips = false,
		Marker = vector3(834.7096, -3234.6787, -98.6991),
		Spawner = vector3(834.7096, -3234.6787, -98.6991),
		Deleter = vector3(834.7096, -3234.6787, -98.6991),
		Heading = 256.0699
	},
	PDM = {
		Blips = false,
		Marker = vector3(-11.9855, -1084.9757, 26.6882),
		Spawner = vector3(-11.9855, -1084.9757, 26.6882),
		Deleter = vector3(-11.9855, -1084.9757, 26.6882),
		Heading = 127.5999
	},
	Leasing = {
		BLips = false,
		Marker = vector3(-789.0153, -198.3870, 37.2838),
		Spawner = vector3(-789.0153, -198.3870, 37.2838),
		Deleter = vector3(-789.0153, -198.3870, 37.2838),
		Heading = 285.7022
	},
	Faengsel = {
		Marker = vector3(1862.37,2565.15,45.29),
		Spawner = vector3(1862.37,2565.15,45.29),
		Deleter = vector3(1855.45, 2627.91, 44.77),
		Heading = 357.22
	},
	Spawn = {
		Marker = vector3(-517.2874, -264.4481, 35.37036),
		Spawner = vector3(-517.2874, -264.4481, 35.37036),
		Deleter = vector3(-517.2874, -264.4481, 35.37036),
		Heading = 106.344
	},
	BilforhandlerINPOUND = {
		Marker = vector3(-208.6756, -1168.7725, 23.0441),
		Spawner = vector3(-208.6756, -1168.7725, 23.0441),
		Deleter = vector3(-208.6756, -1168.7725, 23.0441),
		Heading = 88.6968
	},
	LSC = {
		Marker = vector3(-367.9023, -122.5633, 38.6961),
		Spawner = vector3(-367.9023, -122.5633, 38.6961),
		Deleter = vector3(-367.9023, -122.5633, 38.6961),
		Heading = 121.8287
	},
	VestTatoo = {
		Marker = vector3(-3148.3887, 1086.2943, 20.6694),
		Spawner = vector3(-3148.3887, 1086.2943, 20.6694),
		Deleter = vector3(-3148.3887, 1086.2943, 20.6694),
		Heading = 163.6297
	},
	VestTatoo = {
		Marker = vector3(1689.8539, 4774.4878, 41.9215),
		Spawner = vector3(1689.8539, 4774.4878, 41.9215),
		Deleter = vector3(1689.8539, 4774.4878, 41.9215),
		Heading = 209.2779
	}
}

Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 28.29),
		Spawner = vector3(411.5692, -1637.2268, 29.2919),
		Heading = 218.9476
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 37.65),
		Spawner = vector3(1627.84, 3788.45, 33.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 30.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	},
	Bilforhandler = {
		Marker = vector3(-191.9683, -1162.4967, 23.6714),
		Spawner = vector3(-191.2327, -1173.8660, 23.0441),
		Heading = 204.2670
	}
}
-- End of Cars

-- Start of Private Cars
Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	MazeBankBuilding_Main = {
		Private = "MazeBankBuilding",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveRich = {
		Private = "ExecutiveRich",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveCool = {
		Private = "ExecutiveCool",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	LomBank_Main = {
		Private = "LomBank",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	MazeBankWest_Main = {
		Private = "MazeBankWest",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	IntegrityWay_Main = {
		Private = "IntegrityWay",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay28 = {
		Private = "IntegrityWay28",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay30 = {
		Private = "IntegrityWay30",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	DellPerroHeights_Main = {
		Private = "DellPerroHeights",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	MiltonDrive_Main = {
		Private = "MiltonDrive",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern1Apartment = {
		Private = "Modern1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern2Apartment = {
		Private = "Modern2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern3Apartment = {
		Private = "Modern3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody1Apartment = {
		Private = "Mody1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody2Apartment = {
		Private = "Mody2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody3Apartment = {
		Private = "Mody3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal1Apartment = {
		Private = "Regal1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal2Apartment = {
		Private = "Regal2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal3Apartment = {
		Private = "Regal3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	RichardMajesticApt2_Main = {
		Private = "RichardMajesticApt2",
		Marker = vector3(-887.5, -349.58, 33.53),
		Spawner = vector3(-886.03, -343.78, 33.53),
		Deleter = vector3(-894.32, -349.33, 33.53),
		Heading = 206.79
	},
	WildOatsDrive_Main = {
		Private = "WildOatsDrive",
		Marker = vector3(-178.65, 503.45, 135.85),
		Spawner = vector3(-189.98, 505.8, 133.48),
		Deleter = vector3(-189.28, 500.56, 132.93),
		Heading = 282.62
	},
	WhispymoundDrive_Main = {
		Private = "WhispymoundDrive",
		Marker = vector3(123.65, 565.75, 183.04),
		Spawner = vector3(130.11, 571.47, 182.42),
		Deleter = vector3(131.97, 566.77, 181.95),
		Heading = 270.71
	},
	NorthConkerAvenue2044_Main = {
		Private = "NorthConkerAvenue2044",
		Marker = vector3(348.18, 443.01, 146.7),
		Spawner = vector3(358.39, 437.06, 144.27),
		Deleter = vector3(351.38, 438.86, 145.66),
		Heading = 285.911
	},
	NorthConkerAvenue2045_Main = {
		Private = "NorthConkerAvenue2045",
		Marker = vector3(370.69, 430.76, 144.11),
		Spawner = vector3(392.88, 434.54, 142.17),
		Deleter = vector3(389.72, 429.95, 141.81),
		Heading = 264.94
	},
	HillcrestAvenue2862_Main = {
		Private = "HillcrestAvenue2862",
		Marker = vector3(-688.71, 597.57, 142.64),
		Spawner = vector3(-683.72, 609.88, 143.28),
		Deleter = vector3(-685.26, 601.08, 142.36),
		Heading = 338.06
	},
	HillcrestAvenue2868_Main = {
		Private = "HillcrestAvenue2868",
		Marker = vector3(-752.75, 624.90, 141.2),
		Spawner = vector3(-749.32, 628.61, 141.48),
		Deleter = vector3(-754.28, 631.58, 141.2),
		Heading = 197.14
	},
	HillcrestAvenue2874_Main = {
		Private = "HillcrestAvenue2874",
		Marker = vector3(-859.01, 695.95, 147.93),
		Spawner = vector3(-863.68, 698.72, 147.05),
		Deleter = vector3(-855.66, 698.77, 147.81),
		Heading = 341.77
	},
	MadWayneThunder_Main = {
		Private = "MadWayneThunder",
		Marker = vector3(-1290.95, 454.52, 96.66),
		Spawner = vector3(-1297.62, 459.28, 96.48),
		Deleter = vector3(-1298.09, 468.95, 96.0),
		Heading = 285.652
	},
	TinselTowersApt12_Main = {
		Private = "TinselTowersApt12",
		Marker = vector3(-616.74, 56.38, 42.73),
		Spawner = vector3(-620.59, 60.10, 42.73),
		Deleter = vector3(-621.13, 52.69, 42.73),
		Heading = 109.316
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	MedEndApartment1_Main = {
		Private = "MedEndApartment1",
		Marker = vector3(240.23, 3102.84, 41.49),
		Spawner = vector3(233.58, 3094.29, 41.49),
		Deleter = vector3(237.52, 3112.63, 41.39),
		Heading = 93.91
	},
	MedEndApartment2_Main = {
		Private = "MedEndApartment2",
		Marker = vector3(246.08, 3174.63, 41.72),
		Spawner = vector3(234.15, 3164.37, 41.54),
		Deleter = vector3(240.72, 3165.53, 41.65),
		Heading = 102.03
	},
	MedEndApartment3_Main = {
		Private = "MedEndApartment3",
		Marker = vector3(984.92, 2668.95, 39.06),
		Spawner = vector3(993.96, 2672.68, 39.06),
		Deleter = vector3(994.04, 2662.1, 39.13),
		Heading = 0.61
	},
	MedEndApartment4_Main = {
		Private = "MedEndApartment4",
		Marker = vector3(196.49, 3027.48, 42.89),
		Spawner = vector3(203.1, 3039.47, 42.08),
		Deleter = vector3(192.24, 3037.95, 42.89),
		Heading = 271.3
	},
	MedEndApartment5_Main = {
		Private = "MedEndApartment5",
		Marker = vector3(1724.49, 4638.13, 42.31),
		Spawner = vector3(1723.98, 4630.19, 42.23),
		Deleter = vector3(1733.66, 4635.08, 42.24),
		Heading = 117.88
	},
	MedEndApartment6_Main = {
		Private = "MedEndApartment6",
		Marker = vector3(1670.76, 4740.99, 41.08),
		Spawner = vector3(1673.47, 4756.51, 40.91),
		Deleter = vector3(1668.46, 4750.83, 40.88),
		Heading = 12.82
	},
	MedEndApartment7_Main = {
		Private = "MedEndApartment7",
		Marker = vector3(15.24, 6573.38, 31.72),
		Spawner = vector3(16.77, 6581.68, 31.42),
		Deleter = vector3(10.45, 6588.04, 31.47),
		Heading = 222.6
	},
	MedEndApartment8_Main = {
		Private = "MedEndApartment8",
		Marker = vector3(-374.73, 6187.06, 30.54),
		Spawner = vector3(-377.97, 6183.73, 30.49),
		Deleter = vector3(-383.31, 6188.85, 30.49),
		Heading = 223.71
	},
	MedEndApartment9_Main = {
		Private = "MedEndApartment9",
		Marker = vector3(-24.6, 6605.99, 30.45),
		Spawner = vector3(-16.0, 6607.74, 30.18),
		Deleter = vector3(-9.36, 6598.86, 30.47),
		Heading = 35.31
	},
	MedEndApartment10_Main = {
		Private = "MedEndApartment10",
		Marker = vector3(-365.18, 6323.95, 28.9),
		Spawner = vector3(-359.49, 6327.41, 28.83),
		Deleter = vector3(-353.47, 6334.57, 28.83),
		Heading = 218.58
	}
	-- End of VENT Custom Garages
}
-- End of Private Cars
