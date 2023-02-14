exports.qtarget:AddTargetBone({'boot'},{
	options = {
		{
			event = "openbag",
			icon = "fa-solid fa-truck-arrow-right",
			label = "Åben bagagerummet",
			num = 1
		},
	},
	distance = 2
})

RegisterNetEvent('openbag')
AddEventHandler('openbag', function()
    exports.ox_inventory:openInventory('player', 8)
end)