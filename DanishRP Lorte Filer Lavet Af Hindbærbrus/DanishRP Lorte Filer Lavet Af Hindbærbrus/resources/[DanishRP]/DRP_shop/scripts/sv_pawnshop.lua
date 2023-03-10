ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end) 

RegisterServerEvent("drp_Shop:sellItem:sellItem")
AddEventHandler("drp_Shop:sellItem:sellItem", function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.PawnshopItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('drp_Shop:sellItem: %s attempted to sell an invalid item!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		TriggerClientEvent("r3_notifications:client:sendNotification", source, "You don't have enough of that item!", "error", 5000)
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)
	TriggerClientEvent("r3_notifications:client:sendNotification", source, "Du solgte " .. amount .. " " .. xItem.label .. " for " .. ESX.Math.GroupDigits(price) " DKK", "success", 5000)
end)