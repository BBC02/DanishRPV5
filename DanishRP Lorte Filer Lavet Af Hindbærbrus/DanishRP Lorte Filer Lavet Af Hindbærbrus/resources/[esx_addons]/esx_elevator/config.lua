Config                   = {}
Config.Locale            = 'en'
Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 3.0
Config.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}
-- permissions = {"police", "ambulance",}
Config.positions = {
	["PillBox"] = {
	{etage = 1, pos = {340.0534, -584.6341, 28.7968}, name = "Garage", }, -- Kun dem med de jobs kan komme ind
	{etage = 3, pos = {330.15148925781,-601.18859863281,43.284088134766}, name = "Lobby", }, -- Alle kan komme ind (permissions SKAL fjernes hvis alle skal kunne bruge den!)
	{etage = 4, pos = {338.3507, -584.5155, 74.16171}, name = "Taget", }
	}
}

