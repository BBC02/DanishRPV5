local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('savannah-vest:givevest')
AddEventHandler('savannah-vest:givevest', function(vest)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(vest, 1)
	TriggerClientEvent('savannah-vest:removearmour', source)
end)


ESX.RegisterUsableItem('skudsikkervest100', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('skudsikkervest100', 1)

	TriggerClientEvent('savannah-vest:brugvest100%', source)

end)


ESX.RegisterUsableItem('skudsikkervest75', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('skudsikkervest75', 1)

	TriggerClientEvent('savannah-vest:brugvest75%', source)


end)



ESX.RegisterUsableItem('skudsikkervest50', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('skudsikkervest50', 1)

	TriggerClientEvent('savannah-vest:brugvest50%', source)


end)



ESX.RegisterUsableItem('skudsikkervest25', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('skudsikkervest25', 1)

	TriggerClientEvent('savannah-vest:brugvest25%', source)


end)
