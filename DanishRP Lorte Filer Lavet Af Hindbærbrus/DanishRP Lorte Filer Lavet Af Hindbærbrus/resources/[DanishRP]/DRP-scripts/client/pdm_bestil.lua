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

exports['qtarget']:AddBoxZone("pdmbestil", vector3(-767.2177, -1049.8329, 13.0208), 2, 1, {
    name="Bilforhandler",
    heading=0,
    minZ=23.42,
    maxZ=29.42
    }, {
        options = {
            {
                event = "bestil",
                icon = "fas fa-garage",
                label = "Bestil køretøjer hjem",
                job = "cardealer",
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

RegisterNetEvent('bestil')
AddEventHandler('bestil', function()
    ESX.UI.Menu.CloseAll()
    local keyboard, item, amount = exports["nh-keyboard"]:Keyboard({
        header = "", 
        rows = {"KØRETØJS SPAWNKODE", "ANTAL"}
    })
    if keyboard then
		if item and tonumber(amount) then
			TriggerServerEvent('refillstock', item, tonumber(amount))
		end
    end
end)