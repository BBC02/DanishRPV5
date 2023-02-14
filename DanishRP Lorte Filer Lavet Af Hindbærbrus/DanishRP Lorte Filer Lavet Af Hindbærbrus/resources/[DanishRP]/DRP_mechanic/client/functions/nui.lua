InitBilling = function()
    SendNUIMessage({
        configs = true,
        NameResource = GetCurrentResourceName(),
        translate = Config.BillingTranslation,
        clipboard = Config.BillingClipboard,
        menu = Config.BillingMenu,
        list_adjust = Config.BillingAdjustments
    })
end

CreateInvoice = function(client)
    Citizen.CreateThread(function()
        local data = remoteObject.getPlayersData(client)
        
        if lastVehicle[1] then
            SendNUIMessage({
                createCLipboard = true,
                attendant = data.mechanic,
                client = data.client,
                id_client = tostring(data.clientId),
                vehicle = lastVehicle[1].name,
                plate = ESX.Math.Trim(lastVehicle[1].plate),
                list_options = Config.BillingOptions[ESX.PlayerData.job.name]
            })
        else
            SendNUIMessage({
                createCLipboard = true,
                attendant = data.mechanic,
                client = data.client,
                id_client = tostring(data.clientId),
                vehicle = 'Ukendt',
                plate = 'Ukendt',
                list_options = Config.BillingOptions[ESX.PlayerData.job.name]
            })
        end
        
        SetNuiFocus(true, true)
    end)
end

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    --StopAnim()
    cb('ok')
end)

RegisterNUICallback('saveClipboard', function(data, cb)
    ESX.ShowNotification("Regningen blev givet til: " .. data.id_client)
    if ESX.PlayerData.job.name == 'lsc' then
        TriggerServerEvent("esx_billing:sendBill", tonumber(data.id_client), 'society_' .. ESX.PlayerData.job.name, 'LSC Mekaniker Regning', tonumber(data.price))
    end
    if ESX.PlayerData.job.name == 'mecano' then
        TriggerServerEvent("esx_billing:sendBill", tonumber(data.id_client), 'society_' .. ESX.PlayerData.job.name, 'Auto Exotic Mekaniker Regning', tonumber(data.price))
    end
    
    clearTable(lastVehicle)
    cb('ok')
end)
