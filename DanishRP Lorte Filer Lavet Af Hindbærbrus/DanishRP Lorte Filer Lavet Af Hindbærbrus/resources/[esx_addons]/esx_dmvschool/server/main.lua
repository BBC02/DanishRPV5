ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_dmvschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('esx2_dmvschool:addLicense')
AddEventHandler('esx2_dmvschool:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('esx_dmvschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('esx2_dmvschool:pay')
AddEventHandler('esx2_dmvschool:pay', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('bank', price)
	TriggerClientEvent('esx:showNotification', _source, _U('you_paid', ESX.Math.GroupDigits(price)))
end)


ESX.RegisterServerCallback('dmvschool_niggapay', function(source, cb, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local IsValid = false
	if xPlayer.getAccount('bank').money >= price then
		IsValid = true
	else
		IsValid = false
	end
	cb(IsValid)
 end)
