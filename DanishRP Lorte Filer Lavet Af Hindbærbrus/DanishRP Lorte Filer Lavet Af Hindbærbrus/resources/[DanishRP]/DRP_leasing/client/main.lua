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


local ESX = nil

local Firmaer = {}
local vedFirma = nil
local iShopMenu = false
local LastVehicles = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()


    
    local CompanyZone = PolyZone:Create(Config.Firma.PolyZone, {name = "leasing", debugPoly = false})
    table.insert(Firmaer, CompanyZone)
    
    CompanyZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
        if isPointInside then
            vedFirma = true
        end

        if not isPointInside then
            vedFirma = false
        end
    end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)
-- Tilføjer blip på kortet
Citizen.CreateThread(function()
    local spawnCoords = vector3(Config.Firma.SolgteBiler.x, Config.Firma.SolgteBiler.y, Config.Firma.SolgteBiler.z)
    local blip = AddBlipForCoord(spawnCoords)

    SetBlipSprite(blip, Config.blipID)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 16)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('K&M Leasing')
    EndTextCommandSetBlipName(blip)

end)



-- QTARGET START

for key, coord in pairs(Config.Firma["Computerr"]) do 
    exports.qtarget:AddBoxZone(key .. "_leasing_computer", coord, 3.0, 2.0, {
        name = key .. "_leasing_computer",
        minZ = coord.z - 3.0,
        maxZ = coord.z + 3.0,
    }, {
        options = {
            {
                icon = "fas fa-book-open",
                label = "Medarbejder Menu",
                action = function()
                    OpenLeasingMenu()
                end,
                canInteract = function()
                    return ESX.PlayerData.job.name == "cardealer"
                end,
            },
            {
                icon = "fas fa-money-check-alt",
                label = "Økonomi",
                action = function()
                    okonomi()
                end,
                canInteract = function()
                    return ESX.PlayerData.job.name == "cardealer"
                end,
            },
            {
                icon = "far fa-briefcase",
                label = "Åben Boss Menu",
                action = function()
                    OpenBossMenu()
                end,
                canInteract = function()
                    local gradeName = ESX.PlayerData.job.grade_name
                    return ESX.PlayerData.job.name == "cardealer" and gradeName == "boss"
                end,
            },
        },
        distance = 3.5
    })
end


for k,v in pairs(Config.Firma["DemoBiler"]) do
    exports.qtarget:AddBoxZone(k .. "demobil", v.pos, 2.0, 1.0, {
        name="MissionRowDutyClipboard",
        heading=11.0,
        debugPoly=false,
        minZ = v.pos.z - 3.0,
        maxZ = v.pos.z + 3.0,
        }, {
            options = {
                {
                    event = function()
                        local veh =  ESX.Game.GetClosestVehicle()
                        ESX.Game.DeleteVehicle(veh)

                    end,
                    icon = "fas fa-trash-alt",
                    label = "Fjern Køretøj",
                    job = "cardealer",
                },
            },
            distance = 3.5
    })    
end




AddEventHandler('valdemar_les:menu1', function()
    if ESX.PlayerData.job.name == "cardealer" then
        OpenLeasingMenu()
    else
        print("ikke det rigtige job")
    end
end)


for k,v in pairs(Config.Firma["DemoBiler"]) do
    exports.qtarget:AddBoxZone(k .. "_leasing_demo", v.pos, 3.0, 1.0, {
        name = k .. "_leasing_demo",
        minZ = v.pos.z - 3.0,
        maxZ = v.pos.z + 3.0,
    }, {
        options = {
            {
                icon = "fas fa-book-open",
                label = "Åben Demo biler",
                action = function()
                    DemoBilMenu(v.spawnPoint)
                end,
                canInteract = function()
                    return ESX.PlayerData.job.name == "cardealer"
                end,
            },
        },
        distance = v.distance
    })
end
--[[
exports.qtarget:Vehicle({
    options = {
        {
            icon = "fas fa-trash-alt",
            label = "Fjern køretøj",
            action = function(entity)
                
                    ESX.Game.DeleteVehicle(entity)
        
            canInteract = function()
                return ESX.PlayerData.job.name == "cardealer"
            end,
        },
        {
            icon = "fas fa-soap",
            label = "Vask Køretøjet",
            action = function(entity)
                VaskVehicle(entity)
            end,
            canInteract = function()
                return ESX.PlayerData.job.name == "cardealer"
            end,
        },
    },
    distance = 2.0
})
--]]

for k,v in pairs(Config.Firma["Katalog"]) do
    exports.qtarget:AddBoxZone(k .. "_leasing_catelog", v.pos, 3.0, 1.0, {
        name = k .. "_leasing_catelog",
        minZ = v.pos.z - 3.0,
        maxZ = v.pos.z + 3.0,
    }, {
        options = {
            {
                icon = "fas fa-book-open",
                label = "Åben Katalog",
                action = function()
                    KatlogMenu(v.spawnPoint)
                end,
                canInteract = function()
                    return ESX.PlayerData.job.name == "cardealer"
                end
            },
        },
        distance = v.distance
    })
end




-- QTARGET SLUT


--FUNKTIONER

okonomi = function()
    ESX.UI.Menu.CloseAll()

    local Elements = {
        {label = "Tjek ubetalte Regninger", name = "element1"}
      }
      
      ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Example_Menu", {
        title = "Example Menu", -- The Name of Menu to show to users,
        align    = 'left', -- top-left | top-right | bottom-left | bottom-right | center |
        elements = Elements -- define elements as the pre-created table
      }, function(data,menu) -- OnSelect Function
        --- for a simple element
        if data.current.name == "element1" then
            menu.close()
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dataidlookup', {
                title = 'Angiv id på person',
            }, function(data2, menu2)
                local id = tonumber(data2.value)
                print(id)

                if id == nil then
                    menu2.close()
                else
                    menu2.close()
                    ESX.TriggerServerCallback('valdemar_leasing:tjekRegninger', function(liste) 
                        menu2.close()
                        local data = {}
                        for i=1, #liste, 1 do
                            table.insert(data, {label = '<span style="color: #90ee90;">Kunde: </span>' .. liste[i].ejer .. '<span style="color: #90ee90;"> Produkt: </span>' .. liste[i].tekst .. ' <span style="color: #90ee90;">Pris:</span> ' .. liste[i].pris .. ',-', value = 'data'})
                        end

                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), 'adsfasdf', {
                            title = 'Liste over regninger',
                            align = 'left',
                            elements = data
                        }, function(data3, menu3)


                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end, id)
                end




            end, function(data2, menu2)
                menu2.close()
            end)







        end -- menu 1 end
      end, function(data, menu) -- Cancel Function
        print("Closing Menu")
        menu.close() -- close menu
      end)
end


VaskVehicle = function(vehicle)
    local spiller = PlayerPedId()

    if DoesEntityExist(vehicle) then 
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 20000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Rengør køretøjet",
            Animation = {
                scenario = "WORLD_HUMAN_MAID_CLEAN",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(vehicle) then
                    SetVehicleDirtLevel(vehicle, 0.0)
                    exports['mythic_notify']:DoHudText('success', 'Køretøjet blev vasket', 5000)
                end
            end
        })
    else 
        exports['mythic_notify']:DoHudText('error', 'Der blev ikke fundet et køretøj i nærheden', 5000)
    end
end

networkControl = function(entity)
    local netId = NetworkGetNetworkIdFromEntity(entity)
    
    local attempts = 0
    while not NetworkHasControlOfNetworkId(netId) do
        NetworkRequestControlOfNetworkId(netId)
        
        attempts = attempts + 1
        if attempts == 100 then
            return false
        end
        Wait(0)
    end
    
    return true
end

pairsByKeys = function(t, f)
    local a = {}
    for n in pairs(t) do 
        table.insert(a, n) 
    end

    table.sort(a, f)

    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then 
            return nil
        else 
            return a[i], t[a[i]]
        end
    end

    return iter
end


DeleteShopInsideVehicles = function()
	while #LastVehicles > 0 do
		local vehicle = LastVehicles[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(LastVehicles, 1)
	end
end

StartShopMenu = function()
    Citizen.CreateThread(function()
        while iShopMenu do 
            Citizen.Wait(1)

            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        end
    end)
end

WaitForVehicleToLoad = function(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)

			DisableControlAction(0, Keys['TOP'], true)
			DisableControlAction(0, Keys['DOWN'], true)
			DisableControlAction(0, Keys['LEFT'], true)
			DisableControlAction(0, Keys['RIGHT'], true)
			DisableControlAction(0, 176, true) -- ENTER key
			DisableControlAction(0, Keys['BACKSPACE'], true)

			drawLoadingText('Vent venligts...', 255, 255, 255, 255)
		end
	end
end

KatlogMenu = function(spawnPoint)
    ESX.UI.Menu.CloseAll() -- Lukker alle menuer

    iShopMenu = true
    StartShopMenu()
    local spiller = PlayerPedId()
    FreezeEntityPosition(spiller, true)
    SetEntityVisible(spiller, false)

    local KatalogCoords = GetEntityCoords(spiller)
    print(spawnPoint.x)
    local spawnCoords = vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z)
    SetEntityCoords(spiller, spawnCoords)

    local vehiclesByCategory = {}
    local elements = {}
    local firstVehicleData   = nil

    for category, cars in pairsByKeys(Config.Biler) do 
        local isEmployeeOnly = false
        for i=1, #Config.MedArbejder, 1 do 
            if category == Config.MedArbejder[i] then 
                isEmployeeOnly = true
            end 
        end

        if isEmployeeOnly and ESX.PlayerData.job.name ~= "cardealer" then
            goto continue
        end
        if isEmployeeOnly and ESX.PlayerData.job.grade_name ~= "boss" then
            goto continue
        end

        vehiclesByCategory[category] = {}
        local options = {}

        for i=1, #cars, 1 do 
            table.insert(options, ('%s'):format(cars[i].name))
            table.insert(vehiclesByCategory[category], cars[i])
        end
        local name = category:gsub("%_", " ")   
        table.insert(elements, {
            name = category,
            label = name,
            value = 0,
            type = 'slider',
            options = options
        })

        ::continue::
    end
    if #elements == 0 then 
        table.insert(elements, {label = 'Ingen biler til salg pt.', value = 'nocars'})
    end 

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = 'Leasing - Katelog',
		align    = 'top-left',
		elements = elements
	}, function (data, menu)
		menu.close()
		
		DeleteShopInsideVehicles()

		local spiller = PlayerPedId()
		FreezeEntityPosition(spiller, false)
		SetEntityVisible(spiller, true)
		SetEntityCoords(spiller, catalogCoords)

		IsInShopMenu = false

        ESX.Game.Teleport(spiller, {x = -772.7642, y = -1035.1160, z = 14.5627, heading = 100.0}, function()
        end) 
	end, function (data, menu)
		menu.close()

		DeleteShopInsideVehicles()

		local spiller = PlayerPedId()
		FreezeEntityPosition(spiller, false)
		SetEntityVisible(spiller, true)
		SetEntityCoords(spiller, catalogCoords)

		IsInShopMenu = false
        ESX.Game.Teleport(spiller, {x = -772.7642, y = -1035.1160, z = 14.5627, heading = 100.0}, function()
        end) 
	end, function (data, menu)
		local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
		local spiller   = PlayerPedId()

		DeleteShopInsideVehicles()
		WaitForVehicleToLoad(vehicleData.model)

		ESX.Game.SpawnLocalVehicle(vehicleData.model, spawnCoords, spawnPoint.w, function (vehicle)
			TaskWarpPedIntoVehicle(spiller, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(vehicleData.model)

            table.insert(LastVehicles, vehicle)
		end)
	end)

	if firstVehicleData ~= nil then
		DeleteShopInsideVehicles()
		WaitForVehicleToLoad(firstVehicleData.model)

		ESX.Game.SpawnLocalVehicle(firstVehicleData.model, spawnCoords, spawnPoint.w, function (vehicle)
			TaskWarpPedIntoVehicle(spiller, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(firstVehicleData.model)

            table.insert(LastVehicles, vehicle)
		end)
	end
end

-- Demo car Menu
DemoBilMenu = function(spawnPoint)
    if ESX.PlayerData.job.name ~= "cardealer" then
        return
    end

    local vehiclesByCategory = {}
	local elements = {}

    for category, cars in pairsByKeys(Config.Biler) do
        local isEmployeeOnly = false
        for i=1, #Config.MedArbejder, 1 do
            if category == Config.MedArbejder[i] then
                isEmployeeOnly = true
            end
        end

        if isEmployeeOnly and ESX.PlayerData.job.name ~= "cardealer" then
            goto continue
        end

        if isEmployeeOnly and ESX.PlayerData.job.grade_name ~= "boss" then
            goto continue
        end

        vehiclesByCategory[category] = {}
        local options = {}


        for i=1, #cars, 1 do
            table.insert(options, cars[i].name)
            table.insert(vehiclesByCategory[category], cars[i])
        end


        local name = category:gsub("%_", " ")



        table.insert(elements, {
			name    = category,
			label   = name,
			value   = 0,
			type    = 'slider',
			options = options
		})

        ::continue::
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'demo_vehicles', {
        title = 'Leasing - Demo Bil',
        align = 'top-left',
        elements = elements,
    }, function(data, menu)
        menu.close()
        
        local vehicle = vehiclesByCategory[data.current.name][data.current.value + 1]
        local spawnCoords = vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z)
        ESX.Game.SpawnVehicle(vehicle.model, spawnCoords, spawnPoint.w, function(vehicle)
            SetVehicleNumberPlateText(vehicle, "LEAS" .. GetPlayerServerId(PlayerId()))
            local nPlade = ESX.Game.GetVehicleProperties(vehicle).plate
            local nModel = ESX.Game.GetVehicleProperties(vehicle).model
            exports['t1ger_keys']:GiveTemporaryKeys(nPlade, GetDisplayNameFromVehicleModel(nModel), 'test/Firma bil')
        -- plate; is the plate variable of the vehicle 
        -- name; is the vehicle display name, using GetLabelText() and GetDisplayNameFromVehicleModel()
        -- type; is the label shown in keys menu, after the plate.
        -- I for example use: 'stolen' -for keys gotten from NPCs at gunpoint aim

        end)
    end, function(data, menu)
        menu.close()
    end)
end


-- BOSS MENU HER:
OpenBossMenu = function()
    Wait(5)
    print("hejsa")
    ESX.UI.Menu.CloseAll()
    TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data2, menu2)
        menu2.close()
    end, { wash = false }) -- disable washing money
end



-- BOSS MENU SLUT HER:


-- KØB BIL TIL LAGER:
KobBilLager = function()
    ESX.UI.Menu.CloseAll()
    if ESX.PlayerData.job.name ~= "cardealer" then
        return
    end

    local vehiclesByCategory = {}
	local elements = {}

    for category, cars in pairsByKeys(Config.Biler) do
        local isEmployeeOnly = false
        for i=1, #Config.MedArbejder, 1 do
            if category == Config.MedArbejder[i] then
                isEmployeeOnly = true
            end
        end

        if isEmployeeOnly and ESX.PlayerData.job.name ~= "cardealer" then
            goto continue
        end

        if isEmployeeOnly and ESX.PlayerData.job.grade_name ~= "boss" then
            goto continue
        end

        vehiclesByCategory[category] = {}
        local options = {}

        for i=1, #cars, 1 do
            table.insert(options, ('%s - <span style="color: #90ee90;">(%s DKK)</span>'):format(cars[i].name, ESX.Math.GroupDigits(cars[i].price)))
            table.insert(vehiclesByCategory[category], cars[i])
        end

        local name = category:gsub("%_", " ")

        table.insert(elements, {
			name    = category,
			label   = name,
			value   = 0,
			type    = 'slider',
			options = options
		})

        ::continue::
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_vehicles', {
        title = 'Opkøb bil til lager',
        align = 'top-left',
        elements = elements,
    }, function(data, menu)
        menu.close()

        local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = 'Køb bil : ' .. vehicleData.name,
			align = 'top-left',
			elements = {
				{label = 'Nej',  value = 'no'},
				{label = 'Ja', value = 'yes'}
			}
		}, function(data2, menu2)
            if data2.current.value == 'yes' then
                print('BILMODEL:' .. vehicleData.name .. ' PRIS: ' .. ESX.Math.GroupDigits(vehicleData.price) )
                ESX.TriggerServerCallback('valdemar_leasing:kobBil', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        menu2.close()
                        OpenLeasingMenu()
                        ESX.ShowNotification('Du har købt en ~g~' .. vehicleData.name .. '~s~ for ~g~' .. ESX.Math.GroupDigits(vehicleData.price) .. ' DKK')
                    else
                        ESX.ShowNotification('Firmaet har ikke råd til at købe modellen: ~r~' .. vehicleData.name .. '~s~ Hjem')
                    end
                end, vehicleData, GeneratePlate())
            elseif data2.current.value == 'no' then
                menu2.close()
            end
        end, function (data2, menu2)
			menu2.close()
		end)
    end, function(data, menu)
        menu.close()
    end) 
end

OpenLeaseCarMenu = function()
    ESX.UI.Menu.CloseAll()

    ESX.TriggerServerCallback('valdemar_leasing:getBiler', function(Vehicles)
        local elements = {}

        for i=1, #Vehicles, 1 do
            table.insert(elements, {
                label = ('%s - <span style="color: #90ee90;">(%s DKK)</span>'):format(Vehicles[i].name, ESX.Math.GroupDigits(Vehicles[i].price)),
                value = i
            })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sell_vehicles', {
            title = 'Sælg Køretøj',
            align = 'top-left',
            elements = elements,
        }, function(data, menu)
            menu.close()

            local vehicleData = Vehicles[data.current.value]
            
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
                title = 'Antal Dage',
            }, function(data2, menu2)
                local amount = tonumber(data2.value)
                if amount == nil or amount < 0 then
                    ESX.ShowNotification('Ugyldig Værdi')
                else
                    menu2.close()

                    local elements = {
                        {label = ('0.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((0/100)*Vehicles[data.current.value].price)), value = 0.00},
                        {label = ('2.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((2/100)*Vehicles[data.current.value].price)), value = 2.0},
                        {label = ('4.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((4/100)*Vehicles[data.current.value].price)), value = 4.0},
                        {label = ('6.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((6/100)*Vehicles[data.current.value].price)), value = 6.0},
                        {label = ('8.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((8/100)*Vehicles[data.current.value].price)), value = 8.0},
                        {label = ('10.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((10/100)*Vehicles[data.current.value].price)), value = 10.00},
                        {label = ('12.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((12/100)*Vehicles[data.current.value].price)), value = 12.00},
                        {label = ('14.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((14/100)*Vehicles[data.current.value].price)), value = 14.00},
                        {label = ('16.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((16/100)*Vehicles[data.current.value].price)), value = 16.00},
                        {label = ('0.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((0/100)*Vehicles[data.current.value].price)), value = 0.00},
                        {label = ('11.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((11/100)*Vehicles[data.current.value].price)), value = 11.00},
                        {label = ('12.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((12/100)*Vehicles[data.current.value].price)), value = 12.00},
                        {label = ('13.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((13/100)*Vehicles[data.current.value].price)), value = 13.00},
                        {label = ('14.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((14/100)*Vehicles[data.current.value].price)), value = 14.00},
                        {label = ('15.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((15/100)*Vehicles[data.current.value].price)), value = 15.00},
                        {label = ('16.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((16/100)*Vehicles[data.current.value].price)), value = 16.00},
                        {label = ('17.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((17/100)*Vehicles[data.current.value].price)), value = 17.00},
                        {label = ('18.00%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((18/100)*Vehicles[data.current.value].price)), value = 18.00},
                        --{label = ('6.0%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((6.0/100)*Vehicles[data.current.value].price)), value = 6.0},
                        --{label = ('6.5%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((6.5/100)*Vehicles[data.current.value].price)), value = 6.5},
                        --{label = ('7.0%s - <span style="color: #90ee90;">(%s DKK)</span>'):format("%", ESX.Math.GroupDigits((7/100)*Vehicles[data.current.value].price)), value = 7.0},
                    }
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sell_procent_vehicles', {
                        title = '% del',
                        align = 'top-left',
                        elements = elements,
                    }, function(data3, menu3)
                        menu3.close()
                        ESX.TriggerServerCallback('valdemar_lesaing:ledeigeBiler', function(AvailableVehicles)
                            
                            local elements = {}

                            for i=1, #AvailableVehicles, 1 do
                                table.insert(elements, {
                                    label = ('Nummerplade: %s - <span style="color: #90ee90;">(Udlejet total: 0)</span>'):format(AvailableVehicles[i].plate),
                                    value = i
                                })
                            end

                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'select_available_vehicles', {
                                title = 'Vælg Køretøj',
                                align = 'top-left',
                                elements = elements,
                            }, function(data4, menu4)
                                menu4.close()

                                local playerPed = PlayerPedId()

                                local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
                                local elements = {}

                                if #playersNearby > 0 then
                                    for i = 1, #playersNearby, 1 do
                                        if playersNearby[i] ~= PlayerId() then
                                            table.insert(elements, {label = GetPlayerName(playersNearby[i]), value = playersNearby[i]})
                                        end
                                    end
                    
                                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite', {
                                        title = 'Sælg køretøjer',
                                        align = 'top-left',
                                        elements = elements,
                                    }, function(data5, menu5)
                                        menu5.close()
                                        
                                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'extended', {
                                                title = 'Pris hver dag?'
                                            }, function(data6, menu6)
                                                local tuningprice = tonumber(data6.value)
                                                local procent = data3.current.value
                                                if tuningprice == nil then
                                                    ESX.ShowNotification('Ugyldig Værdi')
                                                end

                                                if tuningprice ~= nil then
                                                    menu6.close()

                                                    if ESX.PlayerData.job.grade_name == "boss" then
                                                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'demo_vehicles', {
                                                            title = 'Er dette en firma bil?(KUN TIL ANSATTE)',
                                                            align = 'top-left',
                                                            elements = {
                                                                {label = "Ja", value = true},
                                                                {label = "Nej", value = false},
                                                            }
                                                        }, function(data7, menu7)
                                                            menu7.close()
                                                            print("her")
                                                            local isEmployeeOnly = data7.current.value
                                                            TriggerServerEvent('valdemar_leasing:setOwend', GetPlayerServerId(data5.current.value), Vehicles[data.current.value].name, AvailableVehicles[data4.current.value].plate, vehicleData.stored, amount, procent, tuningprice, isEmployeeOnly, Vehicles[data.current.value].price)
                                                        end, function(data7, menu7)
                                                            menu7.close()
                                                        end)
                                                    end

                                                    if ESX.PlayerData.job.grade_name ~= "boss" then
                                                        print("EJ BOOS")
                                                        print(GetPlayerServerId(data5.current.value))
                                                        TriggerServerEvent('valdemar_leasing:setOwend', GetPlayerServerId(data5.current.value), Vehicles[data.current.value].name, AvailableVehicles[data4.current.value].plate, vehicleData.stored, amount, procent, tuningprice, false)
                                                    end
                                                    TriggerEvent('valdemar_leasing:givBil', AvailableVehicles[data4.current.value].plate, Vehicles[data.current.value].name, GetPlayerServerId(data5.current.value))
                                                end
                                            end, function(data6, menu6)
                                                menu6.close()
                                            end)

                                    end, function(data5, menu5)
                                        menu5.close()
                                    end)
                                else
                                  ESX.ShowNotification('IGEN SPILLER')
                                end
                            end, function(data4, menu4)
                                menu4.close()
                            end)
                        end, Vehicles[data.current.value].name)

                    end, function(data3, menu3)
                        menu3.close()
                    end)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
            
        end, function(data, menu)
            menu.close()
        end)
    end)
end



OpenSellVehcile = function()
    ESX.UI.Menu.CloseAll()

    ESX.TriggerServerCallback('valdemar_leasing:sellLager', function(liste)
        local elements = {
            head = { 'MODEL:','UDBETALING','NUMMERPLADE','FUNKTIONER'},
            rows = {}
        }

        for i=1, #liste, 1 do 
            table.insert(elements.rows, {
                data = liste[i],
                cols = {
                    liste[i].model,
                    liste[i].pris,
                    liste[i].plate,
                    '{{' .. 'Sælg Køretøj' .. '|sell_vehicle}}'
                }
            })
        end
        ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'bil_liste', elements, function(data, menu)
            if data.value == 'sell_vehicle' then
                local bil = data.data 
                print('SÆLGER:' ..bil.model)
                print('PLATE:' .. bil.plate)
                TriggerServerEvent('valdemar_leasing:sellBilLager', bil.model, bil.plate, bil.pris)
            end 
        end, function(data, menu)
            menu.close()
        end)

    end)
end


OpenLeasingMenu = function()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lesaing_menu_hoved', {
        title = 'Leasing - hoved skærm',
        align = 'top-left',
        elements = {
            {label = 'Opret Fraktura',  value = 'create_b'},
            {label = 'Lease Køretøj',   value = 'lease'},
            {label = 'Opkøb køretøj',   value = 'opkob'},
            {label = 'Sælg Køretøj',    value = 'sellBil'},
            {label = 'Leaset Biler',    value = 'nleaset'},
        }
    }, function(data, menu)
        local yes = data.current.value
        if yes == 'create_b' then 
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
                title = 'Beløb?'
            }, function(data2, menu2)
                local amount = tonumber(data2.value)
                if amount == nil or amount < 0 then
                    ESX.ShowNotification('Ugyldig værdi')
                else
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Ingen spiller i nærheden')
                    else
                        menu2.close()
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_cardealer', 'Regning sendt fra leasing.', amount)
                    end
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif yes == 'lease' then 
            OpenLeaseCarMenu()
        elseif yes == 'opkob' then 
            KobBilLager()
        elseif yes == 'sellBil' then
            OpenSellVehcile()
        elseif yes == 'nleaset' then 
            OpenLeasingList()
        end
    end, function(data, menu)
        menu.close()
    end)
end

OpenLeasingList = function()
    ESX.TriggerServerCallback('valdemar_leasing:listeSolgt', function(liste)
        local elements = {
            head = {'SÆLGER:', 'TAGER:', 'NUMMERPLADE:', 'MODEL:', 'UDBETALING', 'BETALING:', 'DATO:', 'UDLØBER:', 'FUNKTIONER'},
            rows = {}
        }

        for i=1, #liste, 1 do
            local pris = liste[i].pris
            table.insert(elements.rows, {
                data = liste[i],
                cols = {
                    liste[i].seller,
                    liste[i].navn,
                    liste[i].plate,
                    liste[i].model,
                    liste[i].pris .. 'kr',
                    liste[i].sats,
                    liste[i].sDato,
                    liste[i].uDato,
                    '{{' .. 'TRÆK TILBAGE' .. '|return_vehicle}} {{' .. 'FORLÆNG' .. '|extend_lease}}'
                }
            })
        end

        ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'leasing_aktiv_valde', elements, function(data,menu)
            if data.value == 'return_vehicle' then 
                local bil = data.data
                
                menu.close()
                TriggerServerEvent('valdemar_leasing:TagTilbage', bil.model, bil.plate, bil.pris)
            end
        
        
        
        
        end, function(data, menu)
            menu.close()
        end)
        
    
    
    
    
    
    
    end)
end

-- events start -- 
RegisterNetEvent('valdemar_leasing:givBil')
AddEventHandler('valdemar_leasing:givBil', function(plate, model, owner)
    print("tissemand")
    if ESX.PlayerData.job.name ~= "cardealer" then
        return
    end

    print("hejsa12312313123")

    local spawnCoords = vector3(Config.Firma.SolgteBiler.x, Config.Firma.SolgteBiler.y, Config.Firma.SolgteBiler.z)
    ESX.Game.SpawnVehicle(model, spawnCoords, Config.Firma.SolgteBiler.w, function(vehicle)
        local newPlate = plate
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)

        TriggerServerEvent('valdemar_leasing:serverDataNy', owner, vehicleProps)
    end)
end)

-- events slut


-- ulties:
drawLoadingText = function(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

DrawText3D = function(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 90)
    end
end



pairsByKeys = function(t, f)
    local a = {}
    for n in pairs(t) do 
        table.insert(a, n) 
    end

    table.sort(a, f)

    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then 
            return nil
        else 
            return a[i], t[a[i]]
        end
    end

    return iter
end



local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateBogstaver) .. ' ' .. GetRandomNumber(Config.PlateNummere))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateBogstaver) .. GetRandomNumber(Config.PlateNummere))
		end

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end