ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_truckerjob:pay')
AddEventHandler('esx_truckerjob:pay', function(payment, token)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	xPlayer.addMoney(tonumber(payment))
end)