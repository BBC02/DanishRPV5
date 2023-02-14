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

 exports.qtarget:AddTargetModel({0x14D7B4E0}, {
	options = {
		{
			event = "gris-gambino:caropen",
			icon = "fas fa-car",
 			label = "Tilgå garagen",
			job = "gambino",
 			num = 1
 		},
 	},
 	distance = 2
 })

exports.qtarget:AddTargetModel({1792175224}, {
	options = {
		{
			event = "gris-gambino:craft",
			icon = "fas fa-tools",
			label = "Tilgå crafting",
			job = "gambino",
			num = 1
		},
	},
	distance = 2
})


exports.qtarget:AddBoxZone("gambinogarage", vector3(890.91, -3236.26, -98.28), 4, 4, {
	name="Gambino garage",
	heading=0,
	minZ=-95.28,
	maxZ=-101.28
	}, {
		options = {
			{
				event = "gris-gambino:caropen",
				icon = "fas fa-car",
				label = "Tilgå garagen",
				job = "gambino",
			},
		},
		distance = 3.5
})
