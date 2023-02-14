ESX.RegisterServerCallback('id_job_revisor:hvidvask:hasBlackMoney', function(src, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(src)

    cb(xPlayer.getAccount('black_money').money >= amount)
end)

RegisterNetEvent('id_job_revisor:hvidvask:giveWashedMoney')
AddEventHandler('id_job_revisor:hvidvask:giveWashedMoney', function(amount, procent, eventCode)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if eventCode ~= serverEventCode then
        TriggerEvent('id_anticheat:permBan', src, xPlayer.getIdentifier(), 'TriggerServerEvent', GetCurrentResourceName())
        return
    end

    newAmount = amount * procent
    local companyAmount = newAmount * Config.Hvidvask.Take
    newAmount = amount - newAmount
    amount = math.floor(amount)
    newAmount = math.floor(newAmount)
    companyAmount = math.floor(companyAmount)
    xPlayer.removeAccountMoney('black_money', amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_revisor', function(account)
        account.addMoney(companyAmount)
    end)
    xPlayer.addMoney(newAmount)
    TriggerClientEvent('id_notify:notify', src, {
        title = 'Hvidvaskning',
        message = _U('washing_ended', ESX.Math.GroupDigits(newAmount), ESX.Math.GroupDigits(amount), ESX.Math.GroupDigits(companyAmount)),
        type = 'success'
    })
    TriggerEvent('cb_logs:revisor::washComplete', src, ESX.Math.GroupDigits(amount), procent)
end)