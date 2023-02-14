Config = {}

Config.AllTattooList = json.decode(LoadResourceFile(GetCurrentResourceName(), 'AllTattoos.json'))
Config.TattooCats = {
	{"ZONE_HEAD", "Hovede", {vec(0.0, 0.7, 0.7), vec(0.7, 0.0, 0.7), vec(0.0, -0.7, 0.7), vec(-0.7, 0.0, 0.7)}, vec(0.0, 0.0, 0.5)},
	{"ZONE_LEFT_LEG", "Venstre Ben", {vec(-0.2, 0.7, -0.7), vec(-0.7, 0.0, -0.7), vec(-0.2, -0.7, -0.7)}, vec(-0.2, 0.0, -0.6)},
	{"ZONE_LEFT_ARM", "Venstre Arm", {vec(-0.4, 0.5, 0.2), vec(-0.7, 0.0, 0.2), vec(-0.4, -0.5, 0.2)}, vec(-0.2, 0.0, 0.2)},
	{"ZONE_RIGHT_LEG", "Højere Ben", {vec(0.2, 0.7, -0.7), vec(0.7, 0.0, -0.7), vec(0.2, -0.7, -0.7)}, vec(0.2, 0.0, -0.6)},
	{"ZONE_TORSO", "Torso", {vec(0.0, 0.7, 0.2), vec(0.0, -0.7, 0.2)}, vec(0.0, 0.0, 0.2)},
	{"ZONE_RIGHT_ARM", "Højere Arm", {vec(0.4, 0.5, 0.2), vec(0.7, 0.0, 0.2), vec(0.4, -0.5, 0.2)}, vec(0.2, 0.0, 0.2)},
}

Config.Shops = {
	vec(1321.9570, -1654.2786, 52.2770),
	vec(-1155.6931, -1427.2136, 4.9560),
	vec(324.4682, 180.3318, 103.5881),
	vec(-3169.5710, 1077.6715, 20.8307),
	vec(1864.6434, 3746.8738, 33.0294),
	vec(-294.6743, 6200.9204, 31.4871)
}

Config.interiorIds = {}
for k, v in ipairs(Config.Shops) do
    Config.interiorIds[#Config.interiorIds + 1] = GetInteriorAtCoords(v)
end
Config.outfits = {
	{
	  model = "mp_m_freemode_01",
	  arms = {component_id = 3, texture = 0, drawable = 15},
	  torso = {component_id = 11, texture = 0, drawable = 15},
	  undershirt = {component_id = 8, texture = 0, drawable = 15},
	  pants = {component_id = 4, texture = 0, drawable = 14},
	  shoes = {component_id = 6, texture = 0, drawable = 34},
	  bag = {component_id = 5, texture = 6, drawable = 281},
	  accesories = {component_id = 7, texture = 0, drawable = 0},
	  kevlar = {component_id = 9, texture = 0, drawable = 0},
	  badge = {component_id = 10, texture = 0, drawable = 0}
  
	},
  
	{
	  model = "mp_f_freemode_01",
	  arms = {component_id = 3, texture = 0, drawable = 15},
	  torso = {component_id = 11, texture = 0, drawable = 56},
	  undershirt = {component_id = 8, texture = 3, drawable = 10},
	  pants = {component_id = 4, texture = 0, drawable = 41},
	  shoes = {component_id = 6, texture = 0, drawable = 59},
	  bag = {component_id = 5, texture = 6, drawable = 281},
	  accesories = {component_id = 7, texture = 6, drawable = 281},
	  kevlar = {component_id = 9, texture = 0, drawable = 29},
	  badge = {component_id = 0, texture = 6, drawable = 0},
	  hat = {component_id = 0, texture = 0, drawable = 28}
  
	}
}