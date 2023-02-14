Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
    while true do
      Wait(3)
  
    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -776.2137, -237.9437, 37.1476, true)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if distance < 5.0 and IsPedInVehicle(PlayerPedId(), veh, true) and ESX.PlayerData.job.name == 'alessio' then
    DrawText3Ds(-776.2137, -237.9437, 37.1476, '[~g~Q~w~] for at slette ~g~køretøjet')
    if IsControlPressed(0, 44) then
      TriggerEvent('grisen2:parker')
    end
    end
    end
end)

RegisterNetEvent('grisen2:parker', function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(veh)
end)