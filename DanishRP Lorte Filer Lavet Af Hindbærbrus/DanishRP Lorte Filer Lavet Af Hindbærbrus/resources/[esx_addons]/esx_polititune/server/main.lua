ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Vehicles = nil
local StarterVehicles = {}

RegisterServerEvent('esx_polititune:buyMod')
AddEventHandler('esx_polititune:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)

	if Config.IsMechanicJobOnly then

		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_redline', function(account)
			societyAccount = account
		end)
		if price < societyAccount.money then
			TriggerClientEvent('esx_polititune:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
			societyAccount.removeMoney(price)
		else
			TriggerClientEvent('esx_polititune:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end

	else
		
		if price < xPlayer.getAccount('bank').money then
			TriggerClientEvent('esx_polititune:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
			xPlayer.removeAccountMoney('bank', price)
			print(price)
		else
			TriggerClientEvent('esx_polititune:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end

	end
end)

-- Count mechanics online in esx legacy
ESX.RegisterServerCallback("esx_polititune:Checkjob", function(source, cb, plate)
	local job = 0
  
	local xPlayers = ESX.GetExtendedPlayers('job', "mechanic") -- Returns xPlayers with the police job
	for _, xPlayer in pairs(xPlayers) do
	  job = job + 1
	 end
	 local xPlayers2 = ESX.GetExtendedPlayers('job', "lsc") -- Returns xPlayers with the police job
	 for _, xPlayer in pairs(xPlayers2) do
	   job = job + 1
	  end
	  print(job)
	 cb(job)
end)
RegisterServerEvent('esx_polititune:buyrepair')
AddEventHandler('esx_polititune:buyrepair', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)

	if price < xPlayer.getAccount('bank').money then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_redline', function(account)
			TriggerClientEvent('esx_polititune:repair', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('repaired',price))
			xPlayer.removeAccountMoney('bank', price)
			account.addMoney(price)
		end)
	else
		TriggerClientEvent('esx_polititune:GoOutOfLS', _source)
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end

end)

RegisterServerEvent('esx_polititune:refreshOwnedVehicle')
AddEventHandler('esx_polititune:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
	{
		['@plate']   = myCar.plate,
		['@vehicle'] = json.encode(myCar)
	})
end)

ESX.RegisterServerCallback('esx_polititune:getVehiclesPrices', function(source, cb)
	if Vehicles == nil then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)

ESX.RegisterServerCallback('esx_polititune:hasMoneyToExit', function(source, cb, price, IsSpecial)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)
	if IsSpecial then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_redline', function(account)
			societyAccount = account
		end)
		cb(true)
		TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
		societyAccount.removeMoney(price)
	else
		if price < xPlayer.getAccount('bank').money then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_redline', function(account)
				cb(true)
				TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
				xPlayer.removeAccountMoney('bank', price)
				account.addMoney(price/4)
			end)
		else
			cb(false)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	end
end)

-- RegisterServerEvent('esx_lscustom:setStarterCarServer')
-- AddEventHandler('esx_lscustom:setStarterCarServer', function(props)
-- 	local _source = source
-- 	local xPlayer = ESX.GetPlayerFromId(_source)
-- 	local identifier = xPlayer.getIdentifier()
-- 	local found = false
-- 	for k,v in pairs(StarterVehicles) do
-- 		if v.identifier == identifier then
-- 			found = true
-- 			v.props = props
-- 		end
-- 	end
-- 	if not found then
-- 		table.insert(StarterVehicles, {identifier = identifier, props = props})
-- 	end
-- end)

-- AddEventHandler('playerDropped', function (reason)
-- 	local _source = source
-- 	local xPlayer = ESX.GetPlayerFromId(_source)
-- 	local identifier = xPlayer.getIdentifier()
-- 	for k,v in pairs(StarterVehicles) do
-- 		if v.identifier == identifier and v.props ~= nil then
-- 			TriggerClientEvent('esx_lscustom:setVehicleProps', -1, v.props)
-- 		end
-- 	end
-- end)

  RegisterServerEvent('esx_polititune:removeStarterCarServer')
  AddEventHandler('esx_polititune:removeStarterCarServer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.getIdentifier()
	for k,v in pairs(StarterVehicles) do
		if v.identifier == identifier then
			v.props = nil
		end
	end
end)