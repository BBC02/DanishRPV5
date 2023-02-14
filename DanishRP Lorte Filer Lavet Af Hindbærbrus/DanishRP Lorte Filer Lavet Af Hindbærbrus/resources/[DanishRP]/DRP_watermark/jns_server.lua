ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('cb_watermark:getPlayers')
AddEventHandler('cb_watermark:getPlayers', function(sendToAll)
    if sendToAll then
        TriggerClientEvent('cb_watermark:setPlayers', -1, #ESX.GetPlayers())
    else
        TriggerClientEvent('cb_watermark:setPlayers', source, #ESX.GetPlayers())
    end
end)


AddEventHandler('playerDropped', function()
    Citizen.Wait(250)
    TriggerClientEvent('cb_watermark:setPlayers', -1, #ESX.GetPlayers())
end)