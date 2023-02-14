ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('luke_maildelivery:Payment')
AddEventHandler('luke_maildelivery:Payment', function(payment, token)
    local _source = source
    if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil and xPlayer.job.name == 'mail' then
        if Config.PaymentInCash then
            xPlayer.addMoney(payment)
        else
            xPlayer.addAccountMoney('bank', payment)
        end
    end

    xPlayer.showNotification("Du blev betalt ~g~DKK ".. payment)
end)