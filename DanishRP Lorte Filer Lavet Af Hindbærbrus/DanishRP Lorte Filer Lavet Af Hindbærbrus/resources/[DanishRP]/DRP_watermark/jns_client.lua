ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    SendNUIMessage({action = "setPlayerId", id = GetPlayerServerId(PlayerId())})
    TriggerServerEvent("cb_watermark:getPlayers")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent("cb_watermark:getPlayers", true)
end)


RegisterNetEvent('cb_watermark:setPlayers')
AddEventHandler('cb_watermark:setPlayers', function(playerCount)
    SendNUIMessage({action = "setPlayerCount", count = playerCount})
end)