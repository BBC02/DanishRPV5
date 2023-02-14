RegisterNetEvent('esx_policejob:sendCategories')
AddEventHandler('esx_policejob:sendCategories', function(categories)
	Categories = categories
end)

RegisterNetEvent('esx_policejob:sendVehicles')
AddEventHandler('esx_policejob:sendVehicles', function(vehicles)
	Vehicles = vehicles
end)


function getVehicles()
	ESX.TriggerServerCallback('getCategories', function(categories)
		Categories = categories
	end)

	ESX.TriggerServerCallback('getVehicles', function(vehicles)
		Vehicles = vehicles
	end)
end

function givevehicle()
	-- if #Vehicles == 0 then
	-- 	print('[esx_vehicleshop] [^3ERROR^7] No vehicles found')
	-- 	return
	-- end

	IsInShopMenu = true

	ESX.UI.Menu.CloseAll()

	local playerPed = PlayerPedId()

	local vehiclesByCategory = {}
	local elements           = {}
	local firstVehicleData   = nil

	for i=1, #Categories, 1 do
		vehiclesByCategory[Categories[i].name] = {}
	end

	for i=1, #Vehicles, 1 do
		if IsModelInCdimage(GetHashKey(Vehicles[i].model)) then
			table.insert(vehiclesByCategory[Vehicles[i].category], Vehicles[i])
		else
			print(('[esx_vehicleshop] [^3ERROR^7] Vehicle "%s" does not exist'):format(Vehicles[i].model))
		end
	end

	for k,v in pairs(vehiclesByCategory) do
		table.sort(v, function(a, b)
			return a.name < b.name
		end)
	end

	for i=1, #Categories, 1 do
		local category         = Categories[i]
		local categoryVehicles = vehiclesByCategory[category.name]
		local options          = {}

		for j=1, #categoryVehicles, 1 do
			local vehicle = categoryVehicles[j]

			if i == 1 and j == 1 then
				firstVehicleData = vehicle
			end

			table.insert(options, ('%s <span style="color:green;">%s</span>'):format(vehicle.name, _U('generic_shopitem', ESX.Math.GroupDigits(vehicle.price))))
		end

		table.sort(options)

		table.insert(elements, {
			name    = category.name,
			label   = category.label,
			value   = 0,
			type    = 'slider',
			max     = #Categories[i],
			options = options
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = 'Sælger menu',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('buy_vehicle_shop', vehicleData.name, ESX.Math.GroupDigits(vehicleData.price)),
			align = 'top-left',
			elements = {
				{label = 'Nej',  value = 'no'},
				{label = 'Ja', value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
					local generatedPlate = GeneratePlate()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 3.0 then
					ESX.TriggerServerCallback('esx_policejob:buyVehicle', function(success)
						if success then
							menu2.close()
							menu.close()
                            local aheadVehName = GetDisplayNameFromVehicleModel(vehicleData.model)
                            local vehicleName = GetLabelText(aheadVehName)
                            print(vehicleName,aheadVehName)
							ESX.Game.SpawnVehicle(vehicleData.model, vector3(458.92, -993.07, 25.22), 0.5, function(vehicle)
								-- TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								SetVehicleNumberPlateText(vehicle, generatedPlate)
                                exports['t1ger_keys']:SetVehicleLocked(vehicle, 0)
							end)
						else
							ESX.ShowNotification(_U('not_enough_money'))
						end
					end, vehicleData.model, generatedPlate, GetPlayerServerId(closestPlayer), vehicleData.category)
                else
                    ESX.ShowNotification(_U('no_players_nearby'))
                end
			else
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
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
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		ESX.TriggerServerCallback('esx_policejob:isPlateTaken', function(isPlateTaken)
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

	ESX.TriggerServerCallback('esx_policejob:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end
