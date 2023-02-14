local isInMarker

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'boatdealer' then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)

            if GetDistanceBetweenCoords(coords, Config.DemoZones.OpenMenu.Pos, false) <= Config.DrawDistance then
                DrawMarker(Config.DemoZones.OpenMenu.Type, Config.DemoZones.OpenMenu.Pos,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                Config.DemoZones.OpenMenu.Size.x, Config.DemoZones.OpenMenu.Size.y, Config.DemoZones.OpenMenu.Size.z,
                Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 200,
                false, true, 2, false, nil, nil, false)

                if GetDistanceBetweenCoords(coords, Config.DemoZones.OpenMenu.Pos, true) <= Config.DemoZones.OpenMenu.Size.z then
                    isInMarker = 'openMenu'
                    ESX.ShowHelpNotification(_U('demo_menu_open_promp'))
                    if IsControlJustReleased(0, 51) then
                        openDemoMenu()
                    end
                end
            elseif isInMarker == 'openMenu' then
                isInMarker = nil
                ESX.UI.Menu.CloseAll()
            end

            if GetDistanceBetweenCoords(coords, Config.DemoZones.DeleteVehicle.Pos, false) <= Config.DrawDistance then
                DrawMarker(Config.DemoZones.DeleteVehicle.Type, Config.DemoZones.DeleteVehicle.Pos,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                Config.DemoZones.DeleteVehicle.Size.x, Config.DemoZones.DeleteVehicle.Size.y, Config.DemoZones.DeleteVehicle.Size.z,
                Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 200,
                false, true, 2, false, nil, nil, false)

                if GetDistanceBetweenCoords(coords, Config.DemoZones.DeleteVehicle.Pos, true) <= Config.DemoZones.DeleteVehicle.Size.z then
                    isInMarker = 'deleteVehicle'
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                    if vehicle ~= 0 and string.find(GetVehicleNumberPlateText(vehicle), 'DEMO') then
                        ESX.ShowHelpNotification(_U('demo_delete_promp'))
                        if IsControlJustReleased(0, 51) then
                            ESX.Game.DeleteVehicle(vehicle)
                            ESX.Game.Teleport(playerPed, Config.DemoZones.OpenMenu.Pos)
                        end
                    elseif vehicle ~= 0 then
                        ESX.ShowHelpNotification(_U('demo_delete_promp_veh'))
                        if IsControlJustReleased(0, 51) then
                            TriggerServerEvent('esx_boatshop:parkVehicle', ESX.Game.GetVehicleProperties(vehicle))
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            elseif isInMarker == 'deleteVehicle' then
                isInMarker = nil
                ESX.UI.Menu.CloseAll()
            end
        else
            Citizen.Wait(500)
        end
    end
end)

openDemoMenu = function()
    ESX.UI.Menu.CloseAll()

    if #Vehicles == 0 then
		print('[esx_boatshop] [^3ERROR^7] No vehicles found')
		return
	end

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
			print(('[esx_boatshop] [^3ERROR^7] Vehicle "%s" does not exist'):format(Vehicles[i].model))
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

			table.insert(options, vehicle.name)
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
		title    = _U('demo_menu_title'),
		align    = 'left',
		elements = elements
	}, function(data, menu)
        menu.close()
		local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
        ESX.Game.SpawnVehicle(vehicleData.model, Config.DemoZones.SpawnVehicle.Pos, Config.DemoZones.SpawnVehicle.Heading, function(vehicle) 
            local vehProps = ESX.Game.GetVehicleProperties(vehicle)
            vehProps.plate = 'DEMO'..GetRandomNumber(4)
            ESX.Game.SetVehicleProperties(vehicle, vehProps)

            exports['LegacyFuel']:SetFuel(vehicle, 100)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        end)
	end, function(data, menu)
		menu.close()
	end)
end