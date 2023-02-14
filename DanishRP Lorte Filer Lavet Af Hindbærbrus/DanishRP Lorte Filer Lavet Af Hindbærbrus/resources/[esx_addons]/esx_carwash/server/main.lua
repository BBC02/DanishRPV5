ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_carwash:canAfford', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.EnablePrice then
		if xPlayer.getAccount('bank').money >= Config.Price then
			xPlayer.removeAccountMoney('bank', Config.Price)
			cb(true)
		else
			cb(false)
		end
	else
		cb(true)
	end
end)