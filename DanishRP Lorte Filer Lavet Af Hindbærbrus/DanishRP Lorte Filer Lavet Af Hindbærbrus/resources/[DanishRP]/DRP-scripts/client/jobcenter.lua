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

exports['qtarget']:AddBoxZone("jobcenter", vector3(-542.9, -197.21, 38.24), 1.5, 1.5, {
    name="Jobcenter",
    heading=0,
    minZ=35.24,
    maxZ=41.24
    }, {
        options = {
            {
                event = "gris:openUI2",
                icon = "fas fa-briefcase",
                label = "Åben Job Muligheder",
            },
            {
                event = "gris:openUI",
                icon = "fas fa-briefcase",
                label = "Åben Jobcenter",
            },
        },
distance = 2.0
})