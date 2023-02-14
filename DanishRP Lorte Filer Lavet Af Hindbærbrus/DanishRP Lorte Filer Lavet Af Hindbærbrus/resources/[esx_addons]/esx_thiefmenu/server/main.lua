ESX = nil
local DISCORD_WEBHOOK = ""
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx_okradanie:handcuff')
AddEventHandler('esx_okradanie:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('ziptie', 1)
	TriggerClientEvent('esx_okradanie:handcuff', target)
end)

RegisterNetEvent('esx_thiefmenu:handcuff')
AddEventHandler('esx_thiefmenu:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem("ziptie").count >= 1 then
		TriggerClientEvent('esx_thiefmenu:handcuff', target)
	else
		TriggerClientEvent('esx:showNotification', source, "Du har ingen strips")
	end
end)

RegisterNetEvent("giveback")
AddEventHandler("giveback", function(strips)
	local xPlayer = xPlayer.GetPlayerFromId(source)
	if strips then
		xPlayer.removeInventoryItem("ziptie", 1)
	else
		xPlayer.addInventoryItem("ziptie", 1)
	end
end)

RegisterServerEvent('esx_thiefmenu:drag')
AddEventHandler('esx_thiefmenu:drag', function(target)
	TriggerClientEvent('esx_thiefmenu:drag', target, source)
end)

RegisterNetEvent('esx_okradanie:drag')
AddEventHandler('esx_okradanie:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_okradanie:drag', target, source)
end)

RegisterServerEvent('esx_okradanie:putInVehicle')
AddEventHandler('esx_okradanie:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_okradanie:putInVehicle', target)
end)

RegisterServerEvent('esx_okradanie:OutVehicle')
AddEventHandler('esx_okradanie:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_okradanie:OutVehicle', target)
end)

RegisterServerEvent('esx_okradanie:message')
AddEventHandler('esx_okradanie:message', function(target, msg)
	local steam = GetPlayerName(source)
	local steam2 = GetPlayerName(target)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

ESX.RegisterServerCallback('esx_okradanie:sitem', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = xPlayer.getInventoryItem(item).count
    cb(quantity)
end)

RegisterServerEvent('esx_thiefmenu:confiscatePlayerItem')
AddEventHandler('esx_thiefmenu:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local steam = GetPlayerName(_source)
	local steam2 = GetPlayerName(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then
		
			-- can the player carry the said amount of x item?
			if not sourceXPlayer.canCarryItem(itemName, amount) then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				if targetXPlayer.getInventoryItem(itemName).count >= amount then
					targetXPlayer.removeInventoryItem(itemName, amount)
					sourceXPlayer.addInventoryItem   (itemName, amount)
					TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
					TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
					PerformHttpRequest("https://discordapp.com/api/webhooks/1003066027619401789/O4i0lY38TFnZDrborZQ4sy8eaW6EgN9q9-yahHrWyU09ivR27zUp6iaC2QIpqqAZVpGQ", function(err, text, headers) end, 'POST', json.encode({content = steam.." tog " ..amount.. " " ..itemName .. " fra " .. steam2.. "!", tts = false}), { ['Content-Type'] = 'application/json' })
				else
					TriggerClientEvent('esx:showNotification', _source, "Du en idiot, du kan ikke dupe.")
				end	
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))
		PerformHttpRequest("https://discordapp.com/api/webhooks/1003066027619401789/O4i0lY38TFnZDrborZQ4sy8eaW6EgN9q9-yahHrWyU09ivR27zUp6iaC2QIpqqAZVpGQ", function(err, text, headers) end, 'POST', json.encode({content = steam.." tog " ..amount..itemName .. " fra " .. steam2.. "!", tts = false}), { ['Content-Type'] = 'application/json' })

	elseif itemType == 'item_weapon' then
		if targetXPlayer.getWeapon(itemName) then
			if amount == nil then amount = 0 end
			targetXPlayer.removeWeapon(itemName, amount)
			sourceXPlayer.addWeapon(itemName, amount)

			TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
			TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
			PerformHttpRequest("https://discordapp.com/api/webhooks/1003066027619401789/O4i0lY38TFnZDrborZQ4sy8eaW6EgN9q9-yahHrWyU09ivR27zUp6iaC2QIpqqAZVpGQ", function(err, text, headers) end, 'POST', json.encode({content = steam.." tog " ..itemName .. " med " ..amount.. " fra " ..steam2.. "!", tts = false}), { ['Content-Type'] = 'application/json' })
		else
			PerformHttpRequest("https://discordapp.com/api/webhooks/1003066472190464141/kU_7LVrJcGGNPU94jEFuSIXY9U7yxB8zwKIHzv4uWSbXWXaOXNfxtwrltiFPtdgAiOTh", function(err, text, headers) end, 'POST', json.encode({content = steam.." prøved og dupe et våben", tts = false}), { ['Content-Type'] = 'application/json' })
			TriggerClientEvent('esx:showNotification', _source, "Møder du selv i support, eller skal vi hive dig?.")
		end
	end
end)

ESX.RegisterServerCallback('esx_thiefmenu:getOtherPlayerData', function(source, cb, target)

	if Config.EnableESXIdentity then

		local xPlayer = ESX.GetPlayerFromId(target)

		local identifier = xPlayer.getIdentifier()

		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			identifier = identifier,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		-- TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
		-- 	if status ~= nil then
		-- 		data.drunk = math.floor(status.percent)
		-- 	end
		-- end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end

	else

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

	end

end)

RegisterServerEvent('esx_thiefmenu:OutVehicle')
AddEventHandler('esx_thiefmenu:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_thiefmenu:OutVehicle', target)
end)

RegisterServerEvent('esx_thiefmenu:putInVehicle')
AddEventHandler('esx_thiefmenu:putInVehicle', function(target)
	TriggerClientEvent('esx_thiefmenu:putInVehicle', target)
end)


RegisterServerEvent('elf3dme:shareDisplay')
AddEventHandler('elf3dme:shareDisplay', function(text)
	TriggerClientEvent('elf3dme:triggerDisplay', -1, text, source)
end)