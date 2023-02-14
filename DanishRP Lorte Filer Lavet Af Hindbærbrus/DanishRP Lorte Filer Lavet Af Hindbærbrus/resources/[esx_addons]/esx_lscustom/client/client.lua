ESX = nil
local inside = false
local currentpos = nil
local currentgarage = 0

local Menu = SetMenu()
local myveh = {}
local myCar = {}

local VehicleDirtLevel = 0.0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(10)
    end
    
    AddBlips()
end)

RegisterNetEvent('LSC:installMod')
AddEventHandler('LSC:installMod', function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    VehicleDirtLevel = 0.0
    myCar = ESX.Game.GetVehicleProperties(vehicle)
    TriggerServerEvent('LSC:refreshOwnedVehicle', myCar, GetEntityModel(vehicle))
end)


local function f(n)
    return (n + 0.00001)
end

local function LocalPed()
    return GetPlayerPed(-1)
end

function myveh.repair()
    SetVehicleFixed(myveh.vehicle)
end

--Setup main menu
local LSCMenu = Menu.new("Los Santos Customs", "CATEGORIES", 0.16, 0.13, 0.24, 0.36, 0, {255, 255, 255, 255})
LSCMenu.config.pcontrol = false

local blacklistedMods = {
    "gun",
    "armor",
    "torpedo",
    "missile",
    "remote",
    "wire",
    "rocket",
}

IsModAGun = function(mod)
    for k, v in pairs(blacklistedMods) do
        local blacklistedMod = v:upper()
        local name = tostring(GetLabelText(mod)):upper()
        
        if string.find(name, blacklistedMod) then
            print("Found illegal Mod " .. name)
            return true
        end
    end
    
    return false
end

--Add mod to menu
local function AddMod(mod, parent, header, name, info, stock)
    local veh = myveh.vehicle
    SetVehicleModKit(veh, 0)
    if (GetNumVehicleMods(veh, mod) ~= nil and GetNumVehicleMods(veh, mod) > 0) or mod == 18 or mod == 22 then
        local m = parent:addSubMenu(header, name, info, true)
        if stock then
            local btn = m:addPurchase("Stock")
            btn.modtype = mod
            btn.mod = -1
        end
        
        if LSC_Config.prices.mods[mod].startprice then
            local price = LSC_Config.prices.mods[mod].startprice
            for i = 0, tonumber(GetNumVehicleMods(veh, mod)) - 1 do
                local lbl = GetModTextLabel(veh, mod, i)
                if not IsModAGun(lbl) then
                    if lbl ~= nil then
                        local mname = tostring(GetLabelText(lbl))
                        if mname == "NULL" then
                            local btn = m:addPurchase("Custom Part", price)
                            btn.modtype = mod
                            btn.mod = i
                            price = price + LSC_Config.prices.mods[mod].increaseby
                        else
                            local btn = m:addPurchase(mname, price)
                            btn.modtype = mod
                            btn.mod = i
                            price = price + LSC_Config.prices.mods[mod].increaseby
                        end
                    end
                end
            end
        else
            for n, v in pairs(LSC_Config.prices.mods[mod]) do
                btn = m:addPurchase(v.name, v.price)btn.modtype = mod
                btn.mod = v.mod
            end
        end
    end
end

RegisterNetEvent('LSC:cancelInstallMod')
AddEventHandler('LSC:cancelInstallMod', function(reset)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if reset then
        ResetVehicleColors(vehicle)
    end
    
    ESX.Game.SetVehicleProperties(vehicle, myCar)
    SetVehicleDirtLevel(vehicle, VehicleDirtLevel)
end)

LSCustomSelectionMenu = function()
    TriggerServerEvent('lockGarage', true, currentgarage)
    SetPlayerControl(PlayerId(), false, 256)

    local ped = LocalPed()
    local veh = GetVehiclePedIsUsing(ped)

    Citizen.CreateThread(function()
        SetVehicleOnGroundProperly(veh)
        SetVehicleLights(veh, 2)
        SetVehicleInteriorlight(veh, true)
        SetVehicleDoorsLocked(veh, 4)
        SetEntityInvincible(veh, true)
        SetVehRadioStation(veh, 255)

        local heading = LSC_Config.garages[currentgarage].inside.heading
        SetEntityHeading(veh, heading)

        FreezeEntityPosition(veh, true)
        SetEntityCollision(veh, false, false)
        SetPlayerControl(PlayerId(), true)
    end)
end

local function DriveInGarage()
    local ped = LocalPed()
    local veh = GetVehiclePedIsUsing(ped)
    LSCMenu.buttons = {}

    DisplayRadar(false)
    if DoesEntityExist(veh) then
        if currentgarage == 4 or currentgarage == 5 then
            LSCMenu:setTitle("Beeker's Garage")
            LSCMenu.title_sprite = "shopui_title_carmod2"
        elseif currentgarage == 6 then
            LSCMenu:setTitle("Benny's Motorworks")
            LSCMenu.title_sprite = "shopui_title_supermod"
        else
            LSCMenu:setTitle("Los Santos Customs")
            LSCMenu.title_sprite = "shopui_title_carmod"
        end

        LSCMenu.config.controls = LSC_Config.menu.controls
        SetIbuttons({
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_back, 0), "Back"},
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_select, 0), "Select"},
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_up, 0), "Up"},
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_down, 0), "Down"},
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_left, 0), "Left"},
            {GetControlInstructionalButton(1, LSCMenu.config.controls.menu_right, 0), "Right"},
        }, 0)

        LSCMenu:setMaxButtons(LSC_Config.menu.maxbuttons)

        LSCMenu.config.size.width = f(LSC_Config.menu.width) or 0.24;
        LSCMenu.config.size.height = f(LSC_Config.menu.height) or 0.36;

        if type(LSC_Config.menu.position) == 'table' then
            LSCMenu.config.position = {x = LSC_Config.menu.position.x, y = LSC_Config.menu.position.y}
        elseif type(LSC_Config.menu.position) == 'string' then
            if LSC_Config.menu.position == "left" then
                LSCMenu.config.position = {x = 0.16, y = 0.13}
            elseif LSC_Config.menu.position == "right" then
                LSCMenu.config.position = {x = 1 - 0.16, y = 0.13}
            end
        end

        --Theme
        if type(LSC_Config.menu.theme) == "table" then
            LSCMenu:setColors(LSC_Config.menu.theme.text_color, LSC_Config.menu.theme.stext_color, LSC_Config.menu.theme.bg_color, LSC_Config.menu.theme.sbg_color)
        elseif type(LSC_Config.menu.theme) == "string" then
            if LSC_Config.menu.theme == "light" then
                LSCMenu:setColors({r = 255, g = 255, b = 255, a = 255}, {r = 0, g = 0, b = 0, a = 255}, {r = 0, g = 0, b = 0, a = 155}, {r = 255, g = 255, b = 255, a = 255})
            elseif LSC_Config.menu.theme == "darkred" then
                LSCMenu:setColors({r = 255, g = 255, b = 255, a = 255}, {r = 0, g = 0, b = 0, a = 255}, {r = 0, g = 0, b = 0, a = 155}, {r = 200, g = 15, b = 15, a = 200})
            elseif LSC_Config.menu.theme == "bluish" then
                LSCMenu:setColors({r = 255, g = 255, b = 255, a = 255}, {r = 255, g = 255, b = 255, a = 255}, {r = 0, g = 0, b = 0, a = 100}, {r = 0, g = 100, b = 255, a = 200})
            elseif LSC_Config.menu.theme == "greenish" then
                LSCMenu:setColors({r = 255, g = 255, b = 255, a = 255}, {r = 0, g = 0, b = 0, a = 255}, {r = 0, g = 0, b = 0, a = 100}, {r = 0, g = 200, b = 0, a = 200})
            end
        end

        LSCMenu:addSubMenu("CATEGORIES", "categories", nil, false)
        LSCMenu.categories.buttons = {}

        SetVehicleModKit(veh, 0)
        myveh.vehicle = veh
        myveh.model = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
        myveh.color = table.pack(GetVehicleColours(veh))
        myveh.headlightcolor = GetVehicleXenonLightsColor(veh)
        myveh.extracolor = table.pack(GetVehicleExtraColours(veh))
        myveh.interior_color = GetVehicleInteriorColour(veh)
        myveh.neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
        myveh.smokecolor = table.pack(GetVehicleTyreSmokeColor(veh))
        myveh.plateindex = GetVehicleNumberPlateTextIndex(veh)
        myveh.mods = {}

        for i = 0, 48 do
            myveh.mods[i] = {mod = nil}
        end

        for i, t in pairs(myveh.mods) do
            if i == 22 or i == 18 then
                if IsToggleModOn(veh, i) then
                    t.mod = 1
                else
                    t.mod = 0
                end
            elseif i == 23 or i == 24 then
                t.mod = GetVehicleMod(veh, i)
                t.variation = GetVehicleModVariation(veh, i)
            else
                t.mod = GetVehicleMod(veh, i)
            end
        end

        if GetVehicleWindowTint(veh) == -1 or GetVehicleWindowTint(veh) == 0 then
            myveh.windowtint = false
        else
            myveh.windowtint = GetVehicleWindowTint(veh)
        end

        myveh.wheeltype = GetVehicleWheelType(veh)
        myveh.bulletProofTyres = GetVehicleTyresCanBurst(veh)

        local chassis, interior, bumper, fbumper, rbumper = false, false, false, false
        for i = 0, 48 do
            if GetNumVehicleMods(veh, i) ~= nil and GetNumVehicleMods(veh, i) ~= false and GetNumVehicleMods(veh, i) > 0 then
                if i == 1 then
                    bumper = true
                    fbumper = true
                elseif i == 2 then
                    bumper = true
                    rbumper = true
                elseif (i >= 42 and i <= 46) or i == 5 then
                    chassis = true
                elseif i >= 27 and i <= 37 then
                    interior = true
                end
            end
        end

        AddMod(0, LSCMenu.categories, "SPOILER", "Spoiler", "Increase downforce.", true)
        AddMod(3, LSCMenu.categories, "SKIRTS", "Skirts", "Enhance your vehicle's look with custom side skirts.", true)
        AddMod(4, LSCMenu.categories, "EXHAUST", "Exhausts", "Customized sports exhausts.", true)
        AddMod(6, LSCMenu.categories, "GRILLE", "Grille", "Improved engine cooling.", true)
        AddMod(7, LSCMenu.categories, "HOOD", "Hood", "Enhance car engine cooling.", true)
        AddMod(8, LSCMenu.categories, "FENDERS", "Fenders", "Enhance body paneling with custom fenders.", true)
        AddMod(10, LSCMenu.categories, "ROOF", "Roof", "Lower your center of gravity with lightweight roof panels.", true)
        AddMod(12, LSCMenu.categories, "BRAKES", "Brakes", "Increase stopping power and eliminate brake fade.", true)
        AddMod(13, LSCMenu.categories, "TRANSMISSION", "Transmission", "Improved acceleration with close ratio transmission.", true)
        AddMod(14, LSCMenu.categories, "HORN", "Horn", "Custom air horns.", true)
        AddMod(15, LSCMenu.categories, "SUSPENSION", "Suspension", "Upgrade to a sports oriented suspension setup.", true)
        AddMod(16, LSCMenu.categories, "ARMOR", "Armor", "Protect your car's occupants with military spec composite body panels.", true)
        AddMod(18, LSCMenu.categories, "TURBO", "Turbo", "Reduced lag turbocharger.", false)

        if chassis then
            LSCMenu.categories:addSubMenu("CHASSIS", "Chassis", nil, true)
            AddMod(42, LSCMenu.categories.Chassis, "ARCH COVER", "Arch cover", "", true)--headlight trim
            AddMod(43, LSCMenu.categories.Chassis, "AERIALS", "Aerials", "", true)--foglights
            AddMod(44, LSCMenu.categories.Chassis, "ROOF SCOOPS", "Roof Scoops", "", true)--roof scoops
            AddMod(45, LSCMenu.categories.Chassis, "Tank", "Tank", "", true)
            AddMod(46, LSCMenu.categories.Chassis, "DOORS", "Doors", "", true)-- windows
            AddMod(5, LSCMenu.categories.Chassis, "ROLL CAGE", "Roll cage", "Stiffen your chassis with a rollcage.", true)
        end

        LSCMenu.categories:addSubMenu("ENGINE", "Engine", nil, true)
        AddMod(39, LSCMenu.categories.Engine, "ENGINE BLOCK", "Engine Block", "Custom engine block casings.", true)
        AddMod(40, LSCMenu.categories.Engine, "CAM COVER", "Cam Cover", "Optional cam covers.", true)
        AddMod(41, LSCMenu.categories.Engine, "STRUT BRACE", "Strut Brace", "A selection of support struts.", true)
        AddMod(11, LSCMenu.categories.Engine, "ENGINE TUNES", "Engine Tunes", "Increases horsepower.", true)

        if interior then
            LSCMenu.categories:addSubMenu("INTERIOR", "Interior", "Products for maximum style and comfort.", true)
            LSCMenu.categories.Interior:addSubMenu("TRIM", "Trim", "A selection of interior designs.", true)
            AddMod(27, LSCMenu.categories.Interior, "TRIM DESIGN", "Trim Design", "", true)
            AddMod(28, LSCMenu.categories.Interior, "ORNAMENTS", "Ornaments", "Add decorative items to your dash.", true)
            AddMod(29, LSCMenu.categories.Interior, "DASHBOARD", "Dashboard", "Custom control panel designs.", true)
            AddMod(30, LSCMenu.categories.Interior, "DIAL DESIGN", "Dials", "Customize the look of your dials.", true)
            AddMod(31, LSCMenu.categories.Interior, "DOORS", "Doors", "Install door upgrades.", true)
            AddMod(32, LSCMenu.categories.Interior, "SEATS", "Seats", "Options where style meets comfort.", true)
            AddMod(33, LSCMenu.categories.Interior, "STEERING WHEELS", "Steering Wheels", "Customize the link between you and your vehicle.", true)
            AddMod(34, LSCMenu.categories.Interior, "Shifter leavers", "Shifter leavers", "", true)
            AddMod(35, LSCMenu.categories.Interior, "Plaques", "Plaques", "", true)
            AddMod(36, LSCMenu.categories.Interior, "Speakers", "Speakers", "", true)
            AddMod(37, LSCMenu.categories.Interior, "Trunk", "Trunk", "", true)
        end

        interior_color = LSCMenu.categories:addSubMenu("INTERIOR COLOR", "Interior Color", "OBS: IKKE ALLE BILER VIRKER!", true)
        interior_color:addSubMenu("CLASSIC", "Classic", nil, true)
        for n, c in pairs(LSC_Config.prices.classic.colors) do
            local btn = interior_color.Classic:addPurchase(c.name, LSC_Config.prices.classic.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        interior_color:addSubMenu("MATTE", "Matte", nil, true)
        for n, c in pairs(LSC_Config.prices.matte.colors) do
            local btn = interior_color.Matte:addPurchase(c.name, LSC_Config.prices.matte.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        interior_color:addSubMenu("METALS", "Metals", nil, true)
        for n, c in pairs(LSC_Config.prices.metal.colors) do
            local btn = interior_color.Metals:addPurchase(c.name, LSC_Config.prices.metal.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        LSCMenu.categories:addSubMenu("PLATES", "Plates", "Decorative identification.", true)
        LSCMenu.categories.Plates:addSubMenu("LICENSE", "License", "", true)
        for n, mod in pairs(LSC_Config.prices.plates) do
            local btn = LSCMenu.categories.Plates.License:addPurchase(mod.name, mod.price)btn.plateindex = mod.plateindex
        end

        AddMod(25, LSCMenu.categories.Plates, "Plate holder", "Plate holder", "", true)
        AddMod(26, LSCMenu.categories.Plates, "Vanity plates", "Vanity plates", "", true)
        AddMod(38, LSCMenu.categories, "HYDRAULICS", "Hydraulics", "", true)
        AddMod(48, LSCMenu.categories, "Liveries", "Liveries", "A selection of decals for your vehicle.", true)

        if bumper then
            LSCMenu.categories:addSubMenu("BUMPERS", "Bumpers", "Custom front and rear bumpers.", true)
            if fbumper then
                AddMod(1, LSCMenu.categories.Bumpers, "FRONT BUMPERS", "Front bumpers", "Custom front bumpers.", true)
            end
            if rbumper then
                AddMod(2, LSCMenu.categories.Bumpers, "REAR BUMPERS", "Rear bumpers", "Custom rear bumpers.", true)
            end
        end

        local m = LSCMenu.categories:addSubMenu("LIGHTS", "Lights", "Improved night time visibility.", true)
        AddMod(22, LSCMenu.categories.Lights, "HEADLIGHTS", "Headlights", nil, false)
        s = m:addSubMenu("HEADLIGHTS FARVE", "Headlight Color", nil, true)
        for n, c in pairs(LSC_Config.prices.headlightcolor) do
            local btn = s:addPurchase(c.name, c.price)btn.hcolor = c.colorindex
        end
        if not IsThisModelABike(GetEntityModel(veh)) then
            m = m:addSubMenu("NEON KITS", "Neon kits", nil, true)
            m:addSubMenu("NEON LAYOUT", "Neon layout", nil, true)
            local btn = m["Neon layout"]:addPurchase("None")
            for n, mod in pairs(LSC_Config.prices.neonlayout) do
                local btn = m["Neon layout"]:addPurchase(mod.name, mod.price)
            end

            m = m:addSubMenu("NEON COLOR", "Neon color", nil, true)
            for n, mod in pairs(LSC_Config.prices.neoncolor) do
                local btn = m:addPurchase(mod.name, mod.price)btn.neon = mod.neon
            end
        end

        respray = LSCMenu.categories:addSubMenu("RESPRAY", "Respray", "Transforms vehicle appearance.", true)
        pcol = respray:addSubMenu("PRIMARY COLORS", "Primary color", nil, true)
        pcol:addSubMenu("CHROME", "Chrome", nil, true)
        for n, c in pairs(LSC_Config.prices.chrome.colors) do
            local btn = pcol.Chrome:addPurchase(c.name, LSC_Config.prices.chrome.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        pcol:addSubMenu("CLASSIC", "Classic", nil, true)
        for n, c in pairs(LSC_Config.prices.classic.colors) do
            local btn = pcol.Classic:addPurchase(c.name, LSC_Config.prices.classic.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        pcol:addSubMenu("MATTE", "Matte", nil, true)
        for n, c in pairs(LSC_Config.prices.matte.colors) do
            local btn = pcol.Matte:addPurchase(c.name, LSC_Config.prices.matte.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        pcol:addSubMenu("METALLIC", "Metallic", nil, true)
        for n, c in pairs(LSC_Config.prices.metallic.colors) do
            local btn = pcol.Metallic:addPurchase(c.name, LSC_Config.prices.metallic.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] and myveh.extracolor[1] == myveh.color[2] then
                btn.purchased = true
            end
        end

        pcol:addSubMenu("METALS", "Metals", nil, true)
        for n, c in pairs(LSC_Config.prices.metal.colors) do
            local btn = pcol.Metals:addPurchase(c.name, LSC_Config.prices.metal.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        pcol:addSubMenu("CHAMELEON", "Chameleon", nil, true)
        for n, c in pairs(LSC_Config.prices.chameleon.colors) do
            local btn = pcol.Chameleon:addPurchase(c.name, LSC_Config.prices.chameleon.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[1] then
                btn.purchased = true
            end
        end

        scol = respray:addSubMenu("SECONDARY COLORS", "Secondary color", nil, true)
        scol:addSubMenu("CHROME", "Chrome", nil, true)
        for n, c in pairs(LSC_Config.prices.chrome2.colors) do
            local btn = scol.Chrome:addPurchase(c.name, LSC_Config.prices.chrome2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] then
                btn.purchased = true
            end
        end

        scol:addSubMenu("CLASSIC", "Classic", nil, true)
        for n, c in pairs(LSC_Config.prices.classic2.colors) do
            local btn = scol.Classic:addPurchase(c.name, LSC_Config.prices.classic2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] then
                btn.purchased = true
            end
        end

        scol:addSubMenu("MATTE", "Matte", nil, true)
        for n, c in pairs(LSC_Config.prices.matte.colors) do
            local btn = scol.Matte:addPurchase(c.name, LSC_Config.prices.matte2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] then
                btn.purchased = true
            end
        end

        scol:addSubMenu("METALLIC", "Metallic", nil, true)
        for n, c in pairs(LSC_Config.prices.metallic2.colors) do
            local btn = scol.Metallic:addPurchase(c.name, LSC_Config.prices.metallic2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] and myveh.extracolor[1] == btn.colorindex then
                btn.purchased = true
            end
        end

        scol:addSubMenu("METALS", "Metals", nil, true)
        for n, c in pairs(LSC_Config.prices.metal2.colors) do
            local btn = scol.Metals:addPurchase(c.name, LSC_Config.prices.metal2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] then
                btn.purchased = true
            end
        end

        scol:addSubMenu("CHAMELEON", "Chameleon", nil, true)
        for n, c in pairs(LSC_Config.prices.chameleon2.colors) do
            local btn = scol.Chameleon:addPurchase(c.name, LSC_Config.prices.chameleon2.price)btn.colorindex = c.colorindex
            if btn.colorindex == myveh.color[2] then
                btn.purchased = true
            end
        end

        LSCMenu.categories:addSubMenu("WHEELS", "Wheels", "Custom rims, tires and colors.", true)
        wtype = LSCMenu.categories.Wheels:addSubMenu("WHEEL TYPE", "Wheel type", "Custom rims in all styles and sizes.", true)
        if IsThisModelABike(GetEntityModel(veh)) then
            fwheels = wtype:addSubMenu("FRONT WHEEL", "Front wheel", nil, true)
            bwheels = wtype:addSubMenu("BACK WHEEL", "Back wheel", nil, true)
        else
            sportw = wtype:addSubMenu("SPORT WHEELS", "Sport", nil, true)
            musclew = wtype:addSubMenu("MUSCLE WHEELS", "Muscle", nil, true)
            lowriderw = wtype:addSubMenu("LOWRIDER WHEELS", "Lowrider", nil, true)
            suvw = wtype:addSubMenu("SUV WHEELS", "Suv", nil, true)
            offroadw = wtype:addSubMenu("OFFROAD WHEELS", "Offroad", nil, true)
            tunerw = wtype:addSubMenu("TUNER WHEELS", "Tuner", nil, true)
            hughendw = wtype:addSubMenu("HIGHEND WHEELS", "Highend", nil, true)
            bennyorg = wtype:addSubMenu("BENNYS ORIGINAL WHEELS", "Bennys Original", nil, true)
            bennybes = wtype:addSubMenu("BENNYS BESPOKE WHEELS", "Bennys Bespoke", nil, true)
            street = wtype:addSubMenu("STREET WHEELS", "Street", nil, true)
            track = wtype:addSubMenu("TRACK WHEELS", "Track", nil, true)
        end

        m = LSCMenu.categories.Wheels:addSubMenu("WHEEL COLOR", "Wheel color", "Custom wheel colors.", true)
        for n, c in pairs(LSC_Config.prices.wheelcolor.colors) do
            local btn = m:addPurchase(c.name, LSC_Config.prices.wheelcolor.price)btn.colorindex = c.colorindex
        end

        m = LSCMenu.categories.Wheels:addSubMenu("WHEEL ACCESSORIES", "Wheel accessories", "Bulletproof tires and custom burnout smoke.", true)
        for n, mod in pairs(LSC_Config.prices.wheelaccessories) do
            local btn = m:addPurchase(mod.name, mod.price)btn.smokecolor = mod.smokecolor
        end

        m = LSCMenu.categories:addSubMenu("WINDOWS", "Windows", "A selection of tinted windows.", true)
        btn = m:addPurchase("None")btn.tint = false
        for n, tint in pairs(LSC_Config.prices.windowtint) do
            btn = m:addPurchase(tint.name, tint.price)btn.tint = tint.tint
        end

		LSCMenu:Open("categories")
    end
end

local function DriveOutOfGarage()
    Citizen.CreateThread(function()
        local ped = LocalPed()
        local veh = GetVehiclePedIsUsing(ped)
        
        SetEntityCollision(veh, true, true)
        FreezeEntityPosition(ped, false)
        FreezeEntityPosition(veh, false)
        SetVehicleOnGroundProperly(veh)
        SetVehicleDoorsLocked(veh, 0)
        SetEntityInvincible(veh, false)
        SetVehicleLights(veh, 0)
        
        SetEntityVisible(ped, true, 0)
        ClearPedTasks(ped)
        inside = false
        
        TriggerServerEvent('lockGarage', false, currentgarage)
        
        currentgarage = 0
        
        DisplayRadar(true)
        SetPlayerControl(PlayerId(), true)
        SetVehicleDirtLevel(veh, VehicleDirtLevel)
    end)
end

function tableContains(t, val)
    for k, v in pairs(t) do
        if v == val then
            return true
        end
    end
    return false
end

SelectOption = function(pos, i)
    inside = true
    currentpos = pos
    currentgarage = i
    LSCustomSelectionMenu()

    local ped = LocalPed()
    local veh = GetVehiclePedIsUsing(ped)
    SetVehicleDirtLevel(veh, 0.0)

    lib.registerContext({
        id = 'lscustom_selection',
        title = 'LS Custom Valg',
        onExit = function()
            DriveOutOfGarage()
        end,
        options = {
            {
                title = 'LS Custom',
                description = 'Normale LS Custom',
                onSelect = function()
					DriveInGarage()
                end
            },
            {
                title = 'Nulstil Farver',
                description = 'Nulstil alle farver',
                onSelect = function()
                    ResetVehicleColors(veh, true)
                end
            }
        },
        {
            id = 'lscustom_rgb',
            title = 'RGB Farver',
            menu = 'lscustom_selection',
			onExit = function()
				DriveOutOfGarage()
			end,
            options = {
                {
					title = 'Primær RGB Farve',
					description = 'Ændre farve på køretøj',
                    metadata = {
                        ['Pris'] = LSC_Custom_Config.price['primary'] .. ',-'
                    },
					onSelect = function()
                        if GetIsVehiclePrimaryColourCustom(veh) then
                            local r, g, b = GetVehicleCustomPrimaryColour(veh)
                            ToggleNUI(true, 'primary', veh, { r, g, b })
                            return
                        end

                        ToggleNUI(true, 'primary', veh, { 255, 255, 255 })
					end
				},
                {
					title = 'Sekundær RGB Farve',
					description = 'Ændre farve på køretøj',
                    metadata = {
                        ['Pris'] = LSC_Custom_Config.price['secondary'] .. ',-'
                    },
					onSelect = function()
                        if GetIsVehicleSecondaryColourCustom(veh) then
                            local r, g, b = GetVehicleCustomSecondaryColour(veh)
                            ToggleNUI(true, 'secondary', veh, { r, g, b })
                            return
                        end

						ToggleNUI(true, 'secondary', veh, { 255, 255, 255 })
					end
				},
				{
					title = 'Neon RGB Farve',
					description = 'Ændre farve på neonlys',
                    metadata = {
                        ['Pris'] = LSC_Custom_Config.price['neon'] .. ',-'
                    },
					onSelect = function()
                        local r, g, b = GetVehicleNeonLightsColour(veh)
						ToggleNUI(true, 'neon', veh, {r, g, b})
					end
				},
				-- {
				-- 	title = 'Xenon RGB Farve',
				-- 	description = 'Ændre farve på xenonlys',
				-- 	onSelect = function()
                --         local n, r, g, b = GetVehicleXenonLightsCustomColor(veh)

                --         if n then
                --             ToggleNUI(true, 'xenon', veh, { r, g, b })
                --             return
                --         end

				-- 		ToggleNUI(true, 'xenon', veh, { 255, 255, 255 })
				-- 	end
				-- },
                {
					title = 'Dæg Røg RGB Farve',
					description = 'Ændre farve på dæk røg',
                    metadata = {
                        ['Pris'] = LSC_Custom_Config.price['tire'] .. ',-'
                    },
					onSelect = function()
                        local r, g, b = GetVehicleTyreSmokeColor(veh)
						ToggleNUI(true, 'tire', veh, {r, g, b})
					end
				},
            }
        }
    })
    
    lib.showContext('lscustom_selection')
end

ToggleNUI = function(value, type, veh, color)
    myCar = ESX.Game.GetVehicleProperties(veh)

    if value and type then
        SendNUIMessage({
            ui = 'open',
            type = type,
            currentColor = color
        })
        SetNuiFocus(true, true)
        return
    end

    SendNUIMessage({
        ui = 'close',
        type = ''
    })
    SetNuiFocus(false, false)
end

local freecam = false
RegisterNUICallback('event', function(data, cb)
    local ped = LocalPed()
    local veh = GetVehiclePedIsUsing(ped)

    if data.freecam then
        if not freecam then
            SetNuiFocus(true, false)
            SetNuiFocusKeepInput(true)
            freecam = true
            return cb('ok')
        end

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(false)
        freecam = false
        return cb('ok')
    end

    if data.colorChange and data.type then
        RGBColorChanger(data.colorChange.r, data.colorChange.g, data.colorChange.b, data.type, veh)
        return cb('ok')
    end

    if data.action then
        if data.action == 'buy' or data.action == 'cancel' then
            if data.action == 'buy' then
                lib.callback('drp_lscustoms:accountCheck', false, function(response)
                    if response then
                        PlayRespraySound()
                        return
                    end

                    lib.notify({
                        title = 'Problem opstået!',
                        description = 'Du har ikke penge nok til at ændre køretøjet',
                        type = 'error'
                    })
                end, GetVehicleNumberPlateText(veh), data.type)
            end

            if data.action == 'cancel' then
                ResetVehicleColors(veh)
                ESX.Game.SetVehicleProperties(veh, myCar)
            end

            SendNUIMessage({
                ui = 'close',
                type = ''
            })
            SetNuiFocus(false, false)
            Wait(100)
            lib.showContext('lscustom_rgb')
            return cb('ok')
        end
    end
end)

RGBColorChanger = function(r, g, b, type, veh)
    if r and g and b and type then
        if type == 'primary' then
            SetVehicleCustomPrimaryColour(veh, r, g, b)
            SetVehicleColours(veh, 0, 0)
            SetVehicleExtraColours(veh, 0, 0)
            return
        end

        if type == 'secondary' then
            SetVehicleCustomSecondaryColour(veh, r, g, b)
            SetVehicleColours(veh, 0, 0)
            SetVehicleExtraColours(veh, 0, 0)
            return
        end

        if type == 'neon' then
            SetVehicleNeonLightsColour(veh, r, g, b)
            return
        end

        if type == 'xenon' then
            SetVehicleXenonLightsCustomColor(veh, r, g, b)
            return
        end

        if type == 'tire' then
            SetVehicleModKit(veh, 0)
            ToggleVehicleMod(veh, 20, true)
            SetVehicleTyreSmokeColor(veh, r, g, b)
            return
        end
    end

    DriveOutOfGarage()
    return
end

ResetVehicleColors = function(veh, type)
    ClearVehicleCustomPrimaryColour(veh)
    ClearVehicleCustomSecondaryColour(veh)
    ClearVehicleXenonLightsCustomColor(veh)
    SetVehicleColours(veh, 0, 0)
    SetVehicleExtraColours(veh, 0, 0)
    if type then
        Wait(100)
        lib.showContext('lscustom_selection')
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local letSleep = true
        
        if inside == false then
            local ped = LocalPed()
            if IsPedSittingInAnyVehicle(ped) then
                local veh = GetVehiclePedIsUsing(ped)
                if DoesEntityExist(veh) then
                    if GetPedInVehicleSeat(veh, -1) == ped and (IsThisModelACar(GetEntityModel(veh)) or IsThisModelABike(GetEntityModel(veh)) or IsThisModelAQuadbike(GetEntityModel(veh)) or IsThisModelABoat(GetEntityModel(veh)) or IsThisModelAJetski(GetEntityModel(veh))) then
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        
                        for i, pos in ipairs(LSC_Config.garages) do
                            local Position = vector3(pos.inside.x, pos.inside.y, pos.inside.z)
                            local distance = #(playerCoords - Position)
                            
                            if distance <= 5.0 then
                                letSleep = false
                                
                                if not tableContains(LSC_Config.ModelBlacklist, GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()) then
                                    if pos.locked then
                                        if not LSC_Config.lock then
                                            if IsControlJustPressed(1, 201) then
                                                VehicleDirtLevel = GetVehicleDirtLevel(veh)
												SelectOption(pos, i)
                                            else
                                                Draw3DText(Position.x, Position.y, Position.z + 0.98, "[Tryk ~p~ENTER~w~ - ~b~Los Santos Customs~w~]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                                            end
                                        else
                                            Draw3DText(Position.x, Position.y, Position.z + 0.98, "[~r~Låst, vent venligst~w~]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                                        end
                                    end
                                    
                                    if not pos.locked then
                                        if IsControlJustPressed(1, 201) then
                                            VehicleDirtLevel = GetVehicleDirtLevel(veh)
											SelectOption(pos, i)
                                        else
                                            Draw3DText(Position.x, Position.y, Position.z + 0.98, "[Tryk ~p~ENTER~w~ - ~b~Los Santos Customs~w~]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                                        end
                                    end
                                else
                                    Draw3DText(Position.x, Position.y, Position.z + 0.98, "[~r~Denne bil kan ikke blive opgraderet~w~]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                                end
                            end
                        end
                    end
                end
            end
        end
        
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

function LSCMenu:OnMenuClose(m)
    DriveOutOfGarage()
end

function LSCMenu:onSelectedIndexChanged(name, button)
    name = name:lower()
    local m = LSCMenu.currentmenu
    local price = button.price
    local veh = myveh.vehicle
    p = m.parent or self.name
    
    if m == "main" then
        m = self
    end
    
    CheckPurchases(m)
    m = m.name:lower()
    p = p:lower()
    
    if m == "chrome" or m == "classic" or m == "matte" or m == "metals" or m == "chameleon" then
        if p == "interior color" then
            SetVehicleInteriorColour(veh, button.colorindex, myveh.color[2])
        elseif p == "primary color" then
            if m == "chameleon" then
                SetVehicleColours(veh, button.colorindex, button.colorindex)
                SetVehicleExtraColours(veh, 0, 0)
                myveh.extracolor[1] = 0
                myveh.extracolor[2] = 0
            else
                SetVehicleColours(veh, button.colorindex, myveh.color[2])
            end
        else
            if m == "chameleon" then
                SetVehicleColours(veh, button.colorindex, button.colorindex)
                SetVehicleExtraColours(veh, 0, 0)
                myveh.extracolor[1] = 0
                myveh.extracolor[2] = 0
            else
                SetVehicleColours(veh, myveh.color[1], button.colorindex)
            end
        end
    elseif m == "metallic" then
        if p == "primary color" then
            SetVehicleColours(veh, button.colorindex, myveh.color[2])
            SetVehicleExtraColours(veh, myveh.color[2], myveh.extracolor[2])
        else
            SetVehicleColours(veh, myveh.color[1], button.colorindex)
            SetVehicleExtraColours(veh, button.colorindex, myveh.extracolor[2])
        end
    elseif m == "wheel color" then
        SetVehicleExtraColours(veh, myveh.extracolor[1], button.colorindex)
    elseif button.modtype and button.mod then
        if button.modtype ~= 18 and button.modtype ~= 22 then
            if button.wtype then
                SetVehicleWheelType(veh, button.wtype)
            end
            SetVehicleMod(veh, button.modtype, button.mod)
        elseif button.modtype == 22 then
            ToggleVehicleMod(veh, button.modtype, button.mod)
        elseif button.modtype == 18 then
            end
    elseif m == "license" then
        SetVehicleNumberPlateTextIndex(veh, button.plateindex)
    elseif m == "headlight color" then
        SetVehicleXenonLightsColor(veh, button.hcolor)
    elseif m == "neon color" then
        SetVehicleNeonLightsColour(veh, button.neon[1], button.neon[2], button.neon[3])
    elseif m == "windows" then
        SetVehicleWindowTint(veh, button.tint)
    end
    
    if m == "horn" then
        --Maybe some way of playing the horn?
        OverrideVehHorn(veh, false, 0)
        if IsHornActive(veh) or IsControlPressed(1, 86) then
            StartVehicleHorn(veh, 10000, "HELDDOWN", 1)
        end
    end
end

function LSCMenu:onButtonSelected(name, button)
    --Send the selected button to server
    if button.price then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped)
        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerServerEvent("LSC:buttonSelected", name, button, plate)
    end
end

--So we get the button back from server +  bool that determines if we can prchase specific item or not
RegisterNetEvent("LSC:buttonSelected")
AddEventHandler("LSC:buttonSelected", function(name, button, canpurchase)
    name = name:lower()
    local m = LSCMenu.currentmenu
    local price = button.price
    local veh = myveh.vehicle
    if m == "main" then
        m = LSCMenu
    end
    
    mname = m.name:lower()
    if mname == "chrome" or mname == "classic" or mname == "matte" or mname == "metals" or mname == "chameleon" then
        if m.parent == "Interior Color" then
            if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
                myveh.interior_color = button.colorindex
                PlayRespraySound()
            end
        else
            if m.parent == "Primary color" then
                if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
                    if mname == "chameleon" then
                        myveh.color[1] = button.colorindex
                        myveh.color[2] = button.colorindex
                    else
                        myveh.color[1] = button.colorindex
                    end
                    PlayRespraySound()
                end
            else
                if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
                    if mname == "chameleon" then
                        myveh.color[1] = button.colorindex
                        myveh.color[2] = button.colorindex
                    else
                        myveh.color[2] = button.colorindex
                    end
                    PlayRespraySound()
                end
            end
        end
    elseif mname == "metallic" then
        if m.parent == "Primary color" then
            if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
                myveh.color[1] = button.colorindex
                myveh.extracolor[1] = myveh.color[2]
                PlayRespraySound()
            end
        else
            if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
                myveh.extracolor[1] = button.colorindex
                myveh.color[2] = button.colorindex
                PlayRespraySound()
            end
        end
    elseif mname == "liveries" or mname == "hydraulics" or mname == "horn" or mname == "tank" or mname == "ornaments" or mname == "arch cover" or mname == "aerials" or mname == "roof scoops" or mname == "doors" or mname == "roll cage" or mname == "engine block" or mname == "cam cover" or mname == "strut brace" or mname == "trim design" or mname == "ormnametns" or mname == "dashboard" or mname == "dials" or mname == "seats" or mname == "steering wheels" or mname == "plate holder" or mname == "vanity plates" or mname == "shifter leavers" or mname == "plaques" or mname == "speakers" or mname == "trunk" or mname == "armor" or mname == "suspension" or mname == "transmission" or mname == "brakes" or mname == "engine tunes" or mname == "roof" or mname == "hood" or mname == "grille" or mname == "roll cage" or mname == "exhausts" or mname == "skirts" or mname == "rear bumpers" or mname == "front bumpers" or mname == "spoiler" then
        if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
            myveh.mods[button.modtype].mod = button.mod
            SetVehicleMod(veh, button.modtype, button.mod)
            PlayWrenchSound()
        end
    elseif mname == "fenders" then
        if button.name == "Stock" or button.purchased or CanPurchase(price, canpurchase) then
            if button.name == "Stock" then
                myveh.mods[8].mod = button.mod
                myveh.mods[9].mod = button.mod
                SetVehicleMod(veh, 9, button.mod)
                SetVehicleMod(veh, 8, button.mod)
            else
                myveh.mods[button.modtype].mod = button.mod
                SetVehicleMod(veh, button.modtype, button.mod)
            end
            PlayWrenchSound()
        end
    elseif mname == "turbo" or mname == "headlights" then
        if button.name == "None" or button.name == "Stock Lights" or button.purchased or CanPurchase(price, canpurchase) then
            myveh.mods[button.modtype].mod = button.mod
            ToggleVehicleMod(veh, button.modtype, button.mod)
            PlayWrenchSound()
        end
    elseif mname == "headlight color" then
        if button.purchased or CanPurchase(price, canpurchase) then
            myveh.headlightcolor = button.hcolor
            SetVehicleXenonLightsColor(veh, button.hcolor)
            PlayWrenchSound()
        end
    elseif mname == "neon layout" then
        if button.name == "None" then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
            myveh.neoncolor[1] = 255
            myveh.neoncolor[2] = 255
            myveh.neoncolor[3] = 255
            SetVehicleNeonLightsColour(veh, 255, 255, 255)
            PlayWrenchSound()
        elseif button.purchased or CanPurchase(price, canpurchase) then
            if not myveh.neoncolor[1] then
                myveh.neoncolor[1] = 255
                myveh.neoncolor[2] = 255
                myveh.neoncolor[3] = 255
            end
            SetVehicleNeonLightsColour(veh, myveh.neoncolor[1], myveh.neoncolor[2], myveh.neoncolor[3])
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
            PlayWrenchSound()
        end
    elseif mname == "neon color" then
        if button.purchased or CanPurchase(price, canpurchase) then
            myveh.neoncolor[1] = button.neon[1]
            myveh.neoncolor[2] = button.neon[2]
            myveh.neoncolor[3] = button.neon[3]
            SetVehicleNeonLightsColour(veh, button.neon[1], button.neon[2], button.neon[3])
            PlayWrenchSound()
        end
    elseif mname == "windows" then
        if button.name == "None" or button.purchased or CanPurchase(price, canpurchase) then
            myveh.windowtint = button.tint
            SetVehicleWindowTint(veh, button.tint)
            PlayWrenchSound()
        end
    elseif mname == "sport" or mname == "muscle" or mname == "lowrider" or mname == "back wheel" or mname == "front wheel" or mname == "highend" or mname == "suv" or mname == "offroad" or mname == "tuner" or mname == "bennys original" or mname == "bennys bespoke" or mname == "street" or mname == "track" then
        if button.purchased or CanPurchase(price, canpurchase) then
            myveh.wheeltype = button.wtype
            myveh.mods[button.modtype].mod = button.mod
            SetVehicleWheelType(veh, button.wtype)
            SetVehicleMod(veh, button.modtype, button.mod)
            PlayWrenchSound()
        end
    elseif mname == "wheel color" then
        if button.purchased or CanPurchase(price, canpurchase) then
            myveh.extracolor[2] = button.colorindex
            SetVehicleExtraColours(veh, myveh.extracolor[1], button.colorindex)
            PlayWrenchSound()
        end
    elseif mname == "wheel accessories" then
        if button.name == "Stock Tires" then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 23, myveh.mods[23].mod, false)
            myveh.mods[23].variation = false
            if IsThisModelABike(GetEntityModel(veh)) then
                SetVehicleModKit(veh, 0)
                SetVehicleMod(veh, 24, myveh.mods[24].mod, false)
                myveh.mods[24].variation = false
            end
            PlayWrenchSound()
        elseif button.name == "Custom Tires" and (button.purchased or CanPurchase(price, canpurchase)) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 23, myveh.mods[23].mod, true)
            myveh.mods[23].variation = true
            if IsThisModelABike(GetEntityModel(veh)) then
                SetVehicleModKit(veh, 0)
                SetVehicleMod(veh, 24, myveh.mods[24].mod, true)
                myveh.mods[24].variation = true
            end
            PlayWrenchSound()
        elseif button.name == "Bulletproof Tires" and (button.purchased or CanPurchase(price, canpurchase)) then
            if GetVehicleTyresCanBurst(myveh.vehicle) then
                myveh.bulletProofTyres = false
                SetVehicleTyresCanBurst(veh, false)
            else
                myveh.bulletProofTyres = true
                SetVehicleTyresCanBurst(veh, true)
            end
            PlayWrenchSound()
        elseif button.smokecolor ~= nil and (button.purchased or CanPurchase(price, canpurchase)) then
            SetVehicleModKit(veh, 0)
            myveh.mods[20].mod = true
            ToggleVehicleMod(veh, 20, true)
            myveh.smokecolor = button.smokecolor
            SetVehicleTyreSmokeColor(veh, button.smokecolor[1], button.smokecolor[2], button.smokecolor[3])
            PlayWrenchSound()
        end
    elseif mname == "license" then
        if button.purchased or CanPurchase(price, canpurchase) then
            myveh.plateindex = button.plateindex
            SetVehicleNumberPlateTextIndex(veh, button.plateindex)
            PlayWrenchSound()
        end
    end
    
    CheckPurchases(m)
end)

function PlayWrenchSound()
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'wrench', 0.3)
end

function PlayRespraySound()
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'respray', 0.3)
end

function LSCMenu:OnMenuChange(last, current)
    UnfakeVeh()
    if last == "main" then
        last = self
    end
    if last.name == "categories" and current.name == "main" then
        LSCMenu:Close()
    end
end

--Bunch of checks
function CheckPurchases(m)
    name = m.name:lower()
    if name == "chrome" or name == "classic" or name == "matte" or name == "metals" then
        if m.parent == "Interior Color" then
            for i, b in pairs(m.buttons) do
                if b.purchased and b.colorindex ~= myveh.interior_color then
                    if b.purchased ~= nil then
                        b.purchased = false
                    end
                    b.sprite = nil
                elseif b.purchased == false and b.colorindex == myveh.interior_color then
                    if b.purchased ~= nil then
                        b.purchased = true
                    end
                    b.sprite = "garage"
                end
            end
        else
            if m.parent == "Primary color" then
                for i, b in pairs(m.buttons) do
                    if b.purchased and b.colorindex ~= myveh.color[1] then
                        if b.purchased ~= nil then b.purchased = false end
                        b.sprite = nil
                    elseif b.purchased == false and b.colorindex == myveh.color[1] then
                        if b.purchased ~= nil then b.purchased = true end
                        b.sprite = "garage"
                    end
                end
            else
                for i, b in pairs(m.buttons) do
                    if b.purchased and (b.colorindex ~= myveh.color[1] or myveh.extracolor[1] ~= myveh.color[2]) then
                        if b.purchased ~= nil then b.purchased = false end
                        b.sprite = nil
                    elseif b.purchased == false and b.colorindex == myveh.color[1] and myveh.extracolor[1] == myveh.color[2] then
                        if b.purchased ~= nil then b.purchased = true end
                        b.sprite = "garage"
                    end
                end
            end
        end
    elseif name == "metallic" then
        if m.parent == "Primary color" then
            for i, b in pairs(m.buttons) do
                if b.purchased and b.colorindex ~= myveh.color[1] then
                    if b.purchased ~= nil then b.purchased = false end
                    b.sprite = nil
                elseif b.purchased == false and b.colorindex == myveh.color[1] then
                    if b.purchased ~= nil then b.purchased = true end
                    b.sprite = "garage"
                end
            end
        else
            for i, b in pairs(m.buttons) do
                if b.purchased and (b.colorindex ~= myveh.color[2] or myveh.extracolor[1] ~= b.colorindex) then
                    if b.purchased ~= nil then b.purchased = false end
                    b.sprite = nil
                elseif b.purchased == false and b.colorindex == myveh.color[2] and myveh.extracolor[1] == b.colorindex then
                    if b.purchased ~= nil then b.purchased = true end
                    b.sprite = "garage"
                end
            end
        end
    elseif name == "armor" or name == "suspension" or name == "transmission" or name == "brakes" or name == "engine tunes" or name == "roof" or name == "fenders" or name == "hood" or name == "grille" or name == "roll cage" or name == "exhausts" or name == "skirts" or name == "rear bumpers" or name == "front bumpers" or name == "spoiler" then
        for i, b in pairs(m.buttons) do
            if b.mod == -1 then
                if myveh.mods[b.modtype].mod == -1 then
                    if b.purchased ~= nil then b.purchased = true end
                    b.sprite = "garage"
                else
                    if b.purchased ~= nil then b.purchased = false end
                    b.sprite = nil
                end
            elseif b.mod == 0 or b.mod == false then
                if myveh.mods[b.modtype].mod == false or myveh.mods[b.modtype].mod == 0 then
                    if b.purchased ~= nil then b.purchased = true end
                    b.sprite = "garage"
                else
                    if b.purchased ~= nil then b.purchased = false end
                    b.sprite = nil
                end
            else
                if myveh.mods[b.modtype].mod == b.mod then
                    if b.purchased ~= nil then b.purchased = true end
                    b.sprite = "garage"
                else
                    if b.purchased ~= nil then b.purchased = false end
                    b.sprite = nil
                end
            end
        end
    elseif name == "neon layout" then
        for i, b in pairs(m.buttons) do
            if b.name == "None" then
                if IsVehicleNeonLightEnabled(myveh.vehicle, 0) == false and IsVehicleNeonLightEnabled(myveh.vehicle, 1) == false and IsVehicleNeonLightEnabled(myveh.vehicle, 2) == false and IsVehicleNeonLightEnabled(myveh.vehicle, 3) == false then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            elseif b.name == "Front,Back and Sides" then
                if IsVehicleNeonLightEnabled(myveh.vehicle, 0) and IsVehicleNeonLightEnabled(myveh.vehicle, 1) and IsVehicleNeonLightEnabled(myveh.vehicle, 2) and IsVehicleNeonLightEnabled(myveh.vehicle, 3) then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            end
        end
    elseif name == "neon color" then
        for i, b in pairs(m.buttons) do
            if b.neon[1] == myveh.neoncolor[1] and b.neon[2] == myveh.neoncolor[2] and b.neon[3] == myveh.neoncolor[3] then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    elseif name == "windows" then
        for i, b in pairs(m.buttons) do
            if myveh.windowtint == b.tint then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    elseif name == "sport" or name == "muscle" or name == "lowrider" or name == "back wheel" or name == "front wheel" or name == "highend" or name == "suv" or name == "offroad" or name == "tuner" then
        for i, b in pairs(m.buttons) do
            if myveh.mods[b.modtype].mod == b.mod and myveh.wheeltype == b.wtype then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    elseif name == "wheel color" then
        for i, b in pairs(m.buttons) do
            if b.colorindex == myveh.extracolor[2] then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    elseif name == "wheel accessories" then
        for i, b in pairs(m.buttons) do
            if b.name == "Stock Tires" then
                if GetVehicleModVariation(myveh.vehicle, 23) == false then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            elseif b.name == "Custom Tires" then
                if GetVehicleModVariation(myveh.vehicle, 23) then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            elseif b.name == "Bulletproof Tires" then
                if GetVehicleTyresCanBurst(myveh.vehicle) == false then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            elseif b.smokecolor ~= nil then
                local col = table.pack(GetVehicleTyreSmokeColor(myveh.vehicle))
                if col[1] == b.smokecolor[1] and col[2] == b.smokecolor[2] and col[3] == b.smokecolor[3] then
                    b.sprite = "garage"
                else
                    b.sprite = nil
                end
            end
        end
    elseif name == "license" then
        for i, b in pairs(m.buttons) do
            if myveh.plateindex == b.plateindex then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    elseif name == "tank" or name == "ornaments" or name == "arch cover" or name == "aerials" or name == "roof scoops" or name == "doors" or name == "roll cage" or name == "engine block" or name == "cam cover" or name == "strut brace" or name == "trim design" or name == "ornametns" or name == "dashboard" or name == "dials" or name == "seats" or name == "steering wheels" or name == "plate holder" or name == "vanity plates" or name == "shifter leavers" or name == "plaques" or name == "speakers" or name == "trunk" or name == "headlights" or name == "turbo" or name == "hydraulics" or name == "liveries" or name == "horn" then
        for i, b in pairs(m.buttons) do
            if myveh.mods[b.modtype].mod == b.mod then
                b.sprite = "garage"
            else
                b.sprite = nil
            end
        end
    end
end

--Show notifications and return if item can be purchased
function CanPurchase(price, canpurchase)
    if canpurchase then
        if LSCMenu.currentmenu == "main" then
            LSCMenu:showNotification("Your vehicle has been repaired.")
        else
            LSCMenu:showNotification("Item purchased.")
        end
        return true
    else
        LSCMenu:showNotification("~r~You cannot afford this purchase.")
        return false
    end
end

--Unfake vehicle, or in other words reset vehicle stuff to real so all the preview stuff would be gone
function UnfakeVeh()
    local veh = myveh.vehicle
    SetVehicleModKit(veh, 0)
    SetVehicleWheelType(veh, myveh.wheeltype)
    for i, m in pairs(myveh.mods) do
        if i == 22 or i == 18 then
            ToggleVehicleMod(veh, i, m.mod)
        elseif i == 23 or i == 24 then
            SetVehicleMod(veh, i, m.mod, m.variation)
        else
            SetVehicleMod(veh, i, m.mod)
        end
    end
    SetVehicleXenonLightsColor(veh, myveh.headlightcolor)
    SetVehicleColours(veh, myveh.color[1], myveh.color[2])
    SetVehicleInteriorColour(veh, myveh.interior_color)
    SetVehicleExtraColours(veh, myveh.extracolor[1], myveh.extracolor[2])
    SetVehicleNeonLightsColour(veh, myveh.neoncolor[1], myveh.neoncolor[2], myveh.neoncolor[3])
    SetVehicleNumberPlateTextIndex(veh, myveh.plateindex)
    SetVehicleWindowTint(veh, myveh.windowtint)
end

--Still the good old way of adding blips
function AddBlips()
    for k, v in ipairs(LSC_Config.garages) do
        if v.blip then
            local blip = AddBlipForCoord(v.inside.x, v.inside.y, v.inside.z)
            SetBlipSprite(blip, 72)
            SetBlipAsShortRange(blip, true)
        end
    end
end

--Adding all blips on first spawn
local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
    if firstspawn == 0 then
        TriggerServerEvent('getGarageInfo')
        firstspawn = 1
    end
end)

--Locks the garage if someone enters it
RegisterNetEvent('lockGarage')
AddEventHandler('lockGarage', function(tbl)
    for i, garage in ipairs(tbl) do
        LSC_Config.garages[i].locked = garage.locked
    end
end)

--This is something new o_O, just some things to draw instructional buttons
local Ibuttons = nil
--Set up scaleform
function SetIbuttons(buttons, layout)
    Citizen.CreateThread(function()
        if not HasScaleformMovieLoaded(Ibuttons) then
            Ibuttons = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
            while not HasScaleformMovieLoaded(Ibuttons) do
                Citizen.Wait(0)
            end
        else
            Ibuttons = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
            while not HasScaleformMovieLoaded(Ibuttons) do
                Citizen.Wait(0)
            end
        end
        local sf = Ibuttons
        local w, h = GetScreenResolution()
        PushScaleformMovieFunction(sf, "CLEAR_ALL")
        PopScaleformMovieFunction()
        PushScaleformMovieFunction(sf, "SET_DISPLAY_CONFIG")
        PushScaleformMovieFunctionParameterInt(w)
        PushScaleformMovieFunctionParameterInt(h)
        PushScaleformMovieFunctionParameterFloat(0.03)
        PushScaleformMovieFunctionParameterFloat(0.98)
        PushScaleformMovieFunctionParameterFloat(0.01)
        PushScaleformMovieFunctionParameterFloat(0.95)
        PushScaleformMovieFunctionParameterBool(true)
        PushScaleformMovieFunctionParameterBool(false)
        PushScaleformMovieFunctionParameterBool(false)
        PushScaleformMovieFunctionParameterInt(w)
        PushScaleformMovieFunctionParameterInt(h)
        PopScaleformMovieFunction()
        PushScaleformMovieFunction(sf, "SET_MAX_WIDTH")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunction()
        
        for i, btn in pairs(buttons) do
            PushScaleformMovieFunction(sf, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(i - 1)
            PushScaleformMovieFunctionParameterString(btn[1])
            PushScaleformMovieFunctionParameterString(btn[2])
            PopScaleformMovieFunction()
        
        end
        if layout ~= 1 then
            PushScaleformMovieFunction(sf, "SET_PADDING")
            PushScaleformMovieFunctionParameterInt(10)
            PopScaleformMovieFunction()
        end
        PushScaleformMovieFunction(sf, "DRAW_INSTRUCTIONAL_BUTTONS")
        PushScaleformMovieFunctionParameterInt(layout)
        PopScaleformMovieFunction()
    end)
end

function Draw3DText(x, y, z, str, r, g, b, a, font, scaleSize, enableProportional, enableCentre, enableOutline, enableShadow, sDist, sR, sG, sB, sA)
    local onScreen, worldX, worldY = World3dToScreen2d(x, y, z)
    local gameplayCamX, gameplayCamY, gameplayCamZ = table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(1.0, scaleSize)
        SetTextFont(font)
        SetTextColour(r, g, b, a)
        SetTextEdge(2, 0, 0, 0, 150)
        
        if enableProportional then
            SetTextProportional(1)
        end
        
        if enableOutline then
            SetTextOutline()
        end
        
        if enableShadow then
            SetTextDropshadow(sDist, sR, sG, sB, sA)
            SetTextDropShadow()
        end
        
        if enableCentre then
            SetTextCentre(1)
        end
        
        SetTextEntry("STRING")
        AddTextComponentString(str)
        DrawText(worldX, worldY)
    end
end

GetWheelType = function(name)
    local wheelType = -1
    if name == "Sport" then
        wheelType = 0
    end
    
    if name == "Muscle" then
        wheelType = 1
    end
    
    if name == "Lowrider" then
        wheelType = 2
    end
    
    if name == "Suv" then
        wheelType = 3
    end
    
    if name == "Offroad" then
        wheelType = 4
    end
    
    if name == "Tuner" then
        wheelType = 5
    end
    
    if name == "Front wheel" or name == "Back wheel" then
        wheelType = 6
    end
    
    if name == "Highend" then
        wheelType = 7
    end
    
    if name == "Bennys Original" then
        wheelType = 8
    end
    
    if name == "Bennys Bespoke" then
        wheelType = 9
    end
    
    if name == "Street" then
        wheelType = 11
    end
    
    if name == "Track" then
        wheelType = 12
    end
    
    return wheelType
end

