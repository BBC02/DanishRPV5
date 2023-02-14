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
      Wait(100)
  
    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -23.5453, -1094.4486, 27.3052, true)
    local distance2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 273.4681, -1159.4994, 29.3023, true)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if distance < 5.0 and IsPedInVehicle(PlayerPedId(), veh, true) and ESX.PlayerData.job.name == 'cardealer' then
    DrawText3Ds(-23.5453, -1094.4486, 27.3052, '[~g~E~w~] for at parkere ~g~køretøjet')
    elseif distance2 < 5.0 and IsPedInVehicle(PlayerPedId(), veh, true) and ESX.PlayerData.job.name == 'cardealer2' then
    DrawText3Ds(273.4681, -1159.4994, 29.3023, '[~g~E~w~] for at parkere ~g~køretøjet')
    if IsControlPressed(0, 38) then
      TriggerEvent('grisen:parker')
    end
    end
    end
end)

RegisterNetEvent('grisen:parker', function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(veh)
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end