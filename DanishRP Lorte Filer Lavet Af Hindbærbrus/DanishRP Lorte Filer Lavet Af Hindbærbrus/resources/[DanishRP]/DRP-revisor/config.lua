Config = {}

--====================
--==    Generalt    ==
--====================
Config.Locale = 'da'
Config.DrawDistance = 25.0

Config.MarkerColor = {63, 102, 4, 200}
Config.BossMenu = vector3(-651.230774, 854.676941, 229.337769)

--================
--==    Blip    ==
--================
Config.Blip = {}

Config.Blip.Enable = true

Config.Blip.coords = vector3(-657.876892, 886.219788, 229.304077)
Config.Blip.sprite = 182
Config.Blip.display = 4
Config.Blip.scale = 0.7

--====================
--==    Hvidvask    ==
--====================
Config.Hvidvask = {}

Config.Hvidvask.Loc = vector3(-669.639526, 889.885742, 225.142090)
Config.Hvidvask.Marker = {
    type = 29,
    scale = vector3(0.7, 0.7, 0.7),
    bobUpAndDown = false,
    faceCamera = true,
    rotate = false
}

Config.Hvidvask.TimeAmount = 50000 -- Hvor mange penge skal der hvidvaskes i minuttet.
Config.Hvidvask.Take = 0.20