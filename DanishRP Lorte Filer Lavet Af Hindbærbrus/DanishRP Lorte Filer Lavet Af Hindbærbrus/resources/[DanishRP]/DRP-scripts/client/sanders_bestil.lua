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

exports['qtarget']:AddBoxZone("sanders", vector3(271.62, -1164.98, 29.3), 1.5, 1.5, {
    name="SandersMC",
    heading=0,
    minZ=26.3,
    maxZ=32.3
    }, {
        options = {
            {
                event = "bestil2",
                icon = "fas fa-garage",
                label = "Bestil køretøjer hjem",
                job = "cardealer2",
                canInteract = function(entity)
                if ESX.PlayerData.job.grade_name == "boss" then 
                    return true
                else 
                    return false
                end
            end,
            },
        },
distance = 2.0
})

RegisterNetEvent('bestil2')
AddEventHandler('bestil2', function()
    ESX.UI.Menu.CloseAll()
    local keyboard, item, amount = exports["nh-keyboard"]:Keyboard({
        header = "", 
        rows = {"KØRETØJS SPAWNKODE", "ANTAL"}
    })
    if keyboard then
		if item and tonumber(amount) then
			TriggerServerEvent('refillstock2', item, tonumber(amount))
		end
    end
end)