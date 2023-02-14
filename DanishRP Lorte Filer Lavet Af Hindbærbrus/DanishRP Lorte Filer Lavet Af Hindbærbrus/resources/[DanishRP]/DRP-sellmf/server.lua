ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gris:itemhandler')
AddEventHandler('gris:itemhandler', function(price, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(item).count >= 1 then
        xPlayer.addAccountMoney('bank', price)
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du solgte 1x ' .. item .. ''})
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke 1x ' .. item .. ''})
   end
end)