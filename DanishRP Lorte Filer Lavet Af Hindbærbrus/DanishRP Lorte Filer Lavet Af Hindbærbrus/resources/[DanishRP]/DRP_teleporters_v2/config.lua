Config = {}

Config.DrawDistance = 15.0

Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Green Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.Design = {
	[1] = {
		interior = {
			them = 'cool',
			chairs = {
				status = 'on'
			}
		},
		sign = {
			text = 'Advokaterne\nHolm & Co',
			color = 'black',
			font = 'font5'
		}
	},
	[6] = {
		interior = {
			them = 'conservative',
			chairs = {
				status = 'on'
			}
		},
		sign = {
			text = 'B&K Revision',
			color = 'black',
			font = 'font5'
		}
	},
	[7] = {
		interior = {
			them = 'polished',
			chairs = {
				status = 'on'
			}
		},
		sign = {
			text = 'Continental Security',
			color = 'black',
			font = 'font5'
		}
	},
	[10] = {
		interior = {
			them = 'contrast',
			chairs = {
				status = 'on'
			}
		},
		sign = {
			text = 'D&D Ejendomsmægler',
			color = 'black',
			font = 'font5'
		}
	},
}

Config.Pads = {
	-- Holm & Co Advokat / Testet
	[1] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind til Holm & Co',
			MenuText = 'Gå ind til Holm & Co',
			Name = 'FinanceOffice2',
			Lock = true,
			LockStatus = true,
			Bucket = 1,
			Position = {x = -238.24, y = -774.4, z = 34.30},
			TeleportPoint = { coords = {x = -75.89, y = -824.69, z = 242.44}, h = 339.5},
			SteamID = {
				['steam:110000100007589'] = true,
				['steam:110000100a9253d'] = true,
				['steam:11000011a2ebc8f'] = true,
			},
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud fra Holm & Co',
			MenuText = 'Gå ud fra Holm & Co',
			Lock = true,
			LockStatus = true,
			Position = {x = -77.4, y = -826.39, z = 243.59},
			TeleportPoint = { coords = {x = -239.79, y = -773.74, z = 33.09}, h = 72.749794006348},
			SteamID = {
				['steam:110000100007589'] = true,
				['steam:110000100a9253d'] = true,
				['steam:11000011a2ebc8f'] = true,
			}
		}
	},
	-- Hospitalet / Testet
	[2] = {
		[1] = {
			Text = 'Tryk [E] for at gå op til helikopterpladsen',
			MenuText = 'Gå op til helikopterpladsen',
			Position = {x = 332.87, y = -569.35, z = 43.42},
			TeleportPoint = { coords = {x = 339.05, y = -584.02, z = 73.179}, h = 248.5 }
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ned fra helikopterpladsen',
			MenuText = 'Gå ned fra helikopterpladsen',
			Position = {x = 339.05, y = -584.02, z = 74.30},
			TeleportPoint = { coords = {x = 332.87, y = -569.35, z = 42.3}, h = 155.5 }
		}
	},
	[3] = {
		[1] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 330.1, y = -601.08, z = 43.43},
			TeleportPoint = { coords = {x = 344.69, y = -586.28, z = 27.79}, h = 250.0 }
		},
	
		[2] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 344.69, y = -586.28, z = 28.91},
			TeleportPoint = { coords = {x = 330.1, y = -601.08, z = 42.31}, h = 71.5 }
		}
	},
	[4] = {
		[1] = {
			Text = 'Tryk [E] for at gå op til hospitalet',
			MenuText = 'Gå op til hospitalet',
			Position = {x = 341.46, y = -581.03, z = 28.89},
			TeleportPoint = { coords = {x = 331.95, y = -595.57, z = 42.31}, h = 69.5 }
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ned i parkeringskælderen',
			MenuText = 'Gå ned i parkeringskælderen',
			Position = {x = 331.95, y = -595.57, z = 43.43},
			TeleportPoint = { coords = {x = 341.46, y = -581.03, z = 27.79}, h = 75.5 }
		}
	},
	-- Hvidvask / Testet
	[5] = {
		[1] = {
			Text = 'Tryk [E] for at gå gennem døren',
			MenuText = 'Gå gennem døren',
			Position = {x = -58.36, y = 6441.78, z = 32.68},
			TeleportPoint = { coords = {x = 1138.1, y = -3198.82, z = -40.54}, h = 8.5 }
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå gennem døren',
			MenuText = 'Gå gennem døren',
			Position = {x = 1138.1, y = -3198.82, z = -39.42},
			TeleportPoint = { coords = {x = -58.36, y = 6441.78, z = 32.68}, h = 43.52 }
		}
	},
	-- B&K Revision / Testet
	[6] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind til B&K Revision',
			MenuText = 'Gå op til B&K Revision',
			Name = 'FinanceOffice3',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -1581.59, y = -558.01, z = 35.12},
			TeleportPoint = { coords = {x = -1579.22, y = -564.63, z = 107.55}, h = 212.5 },
			authorizedJobs = { ['revisor'] = true }
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud fra B&K Revision',
			MenuText = 'Gå ud fra B&K Revision',
			Name = 'FinanceOffice3',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -1579.22, y = -564.63, z = 108.67},
			TeleportPoint = { coords = {x = -1581.59, y = -558.01, z = 34.00}, h = 35.5 },
			authorizedJobs = { ['revisor'] = true }
		}
	},
	-- Continental Security / Testet
	[7] = {
		[2] = {
			Text = 'Tryk [E] for at gå ind til Continental Security',
			MenuText = 'Gå ind til Continental Security',
			Name = 'FinanceOffice1',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -141.36, y = -620.93, z = 168.95},
	 		TeleportPoint = { coords = {x = -60.34, y = 360.24, z = 112.08}, h = 180.5 },
			authorizedJobs = { ['security'] = true }
		},
	
		[1] = {
			Text = 'Tryk [E] for at gå ud fra Continental Security',
			MenuText = 'Gå ud fra Continental Security',
			Name = 'FinanceOffice1',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -60.34, y = 360.24, z = 113.20},
	 		TeleportPoint = { coords = {x = -141.36, y = -620.93, z = 167.83}, h = 245.5 },
			authorizedJobs = { ['security'] = true }
		}
	},
	-- Savage Skulls / Testet
	[8] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind til Privat Ejendom',
			MenuText = 'Gå ind til Privat Ejendom',
			Lock = true,
			LockStatus = true,
			Position = {x = 910.18, y = -1065.34, z = 38.07},
			TeleportPoint = { coords = {x = 1121.07, y = -3152.50, z = -38.01}, h = 3.5 },
			keyItem = 'gang8_1'
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud fra Privat Ejendom',
			MenuText = 'Gå ud fra Privat Ejendom',
			Lock = true,
			LockStatus = true,
			Position = {x = 1121.07, y = -3152.50, z = -36.89},
			TeleportPoint = { coords = {x = 910.18, y = -1065.34, z = 36.95},  h = 181.5 },
			keyItem = 'gang8_1'
		}
	},
	[9] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind til Garagen',
			MenuText = 'Gå ind til Garagen',
			AllowVehicle = true,
			Lock = true,
			LockStatus = true,
			Position = {x = 908.55, y = -1059.84, z = 32.95},
			TeleportPoint = { coords = {x = 1109.4, y = -3162.38, z = -38.0}, h = 357.5 },
			keyItem = 'gang8_1'
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud fra Garagen',
			MenuText = 'Gå ud fra Garagen',
			AllowVehicle = true,
			Lock = true,
			LockStatus = true,
			Position = {x = 1110.08, y = -3163.53, z = -37.38},
			TeleportPoint = { coords = {x = 907.12, y = -1059.61, z = 32.46},  h = 87.48 },
			keyItem = 'gang8_1'
		}
	},
	-- D&D Ejendomsmægleren / Testet
	[10] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind til D&D Ejendomsmægleren',
			MenuText = 'Gå ind til D&D Ejendomsmægleren',
			Name = 'FinanceOffice2',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -66.75, y = -802.38, z = 44.46},
        	TeleportPoint = { coords = {x = -75.89, y = -824.69, z = 242.44}, h = 339.5},
			authorizedJobs = { ['realestate'] = true }
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud fra D&D Ejendomsmægleren',
			MenuText = 'Gå ud fra D&D Ejendomsmægleren',
			Name = 'FinanceOffice2',
			Lock = true,
			LockStatus = true,
			Bucket = 0,
			Position = {x = -77.4, y = -826.39, z = 243.59},
        	TeleportPoint = { coords = {x = -66.8, y = -802.39, z = 43.3}, h = 344.5},
			authorizedJobs = { ['realestate'] = true }
		}
	},
	-- Gambino Bunkeren / Testet
	[11] = {
		[1] = {
			Text = 'Tryk [E] for at gå ind i bunkeren',
			MenuText = 'Gå ind i bunkeren',
			AllowVehicle = true,
			KeyLock = 896200,
			Position = {x = -3030.63, y = 3334.23, z = 10.12},
			TeleportPoint = { coords = {x = 890.12, y = -3246.21, z = -99.23}, h = 90.5}
		},
	
		[2] = {
			Text = 'Tryk [E] for at gå ud af bunkeren',
			MenuText = 'Gå ud af bunkeren',
			AllowVehicle = true,
			Position = {x = 890.12, y = -3246.21, z = -98.28},
			TeleportPoint = { coords = {x = -3030.63, y = 3334.23, z = 10.12}, h = 280.0},
			authorizedJobs = { ['gambino'] = true }
		}
	},
	-- Humane Labs / Testet
	[12] = {
		[1] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 3540.69, y = 3676.09, z = 21.46},
        	TeleportPoint = { coords = {x = 3540.68, y = 3675.9, z = 27.45}, h = 168.5}
		},
	
		[2] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 3540.68, y = 3675.9, z = 28.57},
        	TeleportPoint = { coords = {x = 3540.69, y = 3676.09, z = 20.34}, h = 167.5}
		}
	},
	-- TBF / Testet
	[13] = {
		[1] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = -613.04, y = -1624.26, z = 33.01},
        	TeleportPoint = { coords = {x = -615.37, y = -1619.59, z = 41.04}, h = 90.0}
		},
	
		[2] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = -615.37, y = -1619.59, z = 41.04},
        	TeleportPoint = { coords = {x = -613.04, y = -1624.26, z = 33.01}, h = 175.0}
		}
	},
	-- FIB
	[14] = {
		[1] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 136.17, y = -761.90, z = 45.95},
        	TeleportPoint = { coords = {x = 136.17, y = -761.90, z = 241.20}, h = 157.06 }
		},
	
		[2] = {
			Text = 'Tryk [E] for at benytte elevatoren',
			MenuText = 'Benyt elevatoren',
			Position = {x = 136.17, y = -761.90, z = 242.68},
        	TeleportPoint = { coords = {x = 136.17, y = -761.90, z = 44.90},  h = 157.06 }
		}
	}
}

Config.Targets = {
	[1] = {
		name = 'changingroom',
		coords = vector3(-77.79, -812.73, 243.39),
		width = 1.45,
		depth = 0.8,
		heading = 340,
		minZ = 233.69,
		maxZ = 245.29,
		options = {
			{
				icon = "fa-solid fa-clothes-hanger",
				label = "Omklædning",
				action = function()
					exports.drp_clothing:OpenClothingMenu('', true)
				end
			},
		}
	},
	[10] = {
		name = 'changingroom',
		coords = vector3(-77.79, -812.73, 243.39),
		width = 1.45,
		depth = 0.8,
		heading = 340,
		minZ = 233.69,
		maxZ = 245.29,
		options = {
			{
				icon = "fa-solid fa-clothes-hanger",
				label = "Omklædning",
				action = function()
					exports.drp_clothing:OpenClothingMenu('', true)
				end
			},
		}
	}
}
