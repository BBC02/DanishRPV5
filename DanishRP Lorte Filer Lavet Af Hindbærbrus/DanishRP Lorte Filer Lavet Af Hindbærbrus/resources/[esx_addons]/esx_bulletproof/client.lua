ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/+removevest', 'Fjern din vest')
end)

RegisterKeyMapping('+removevest', 'Fjern skudsikkervest', 'keyboard', 'i')

RegisterCommand("+removevest", function(source, rawCommand)
    local armour = GetPedArmour(GetPlayerPed(-1))
    if armour == 100 then
        local vest = 'skudsikkervest100'
        TriggerServerEvent('savannah-vest:givevest', vest)
        SetPedArmour(GetPlayerPed(-1), 0)
    elseif armour == 75 then
        local vest = 'skudsikkervest75'
        TriggerServerEvent('savannah-vest:givevest', vest)
        SetPedArmour(GetPlayerPed(-1), 0)
    elseif armour > 51 and armour < 100 then
        local vest = 'skudsikkervest50'
        TriggerServerEvent('savannah-vest:givevest', vest)
        SetPedArmour(GetPlayerPed(-1), 0)
    elseif armour > 24 and armour < 51 then
        local vest = 'skudsikkervest25'
        TriggerServerEvent('savannah-vest:givevest', vest)
        SetPedArmour(GetPlayerPed(-1), 0)
    elseif armour > 0 and armour > 24 then
        SetPedArmour(GetPlayerPed(-1), 0)
    else 
        exports['mythic_notify']:DoHudText('error', 'Du har ikke nogen skudsikkervest på!', 5000)
    end
end)

RegisterNetEvent('savannah-vest:removearmour')
AddEventHandler('savannah-vest:removearmour', function()
    local playerPed = PlayerPedId()

    local dict, anim = 'clothingtie', 'try_tie_negative_a'

    RequestAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(50)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

    exports['progressBars']:startUI(2000, "Fjerner skudsikkervest...")

    Citizen.Wait(2000)
    SetPedArmour(GetPlayerPed(-1), 0)
    exports['mythic_notify']:DoHudText('success', 'Du tog din skudsikkervest vest af', 5000)
end)

RegisterNetEvent('savannah-vest:brugvest100%')
AddEventHandler('savannah-vest:brugvest100%', function()

    local playerPed = PlayerPedId()

    local dict, anim = 'clothingtie', 'try_tie_negative_a'

    RequestAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(50)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

    exports['progressBars']:startUI(1250, "Ifører skudsikkervest...")

    Citizen.Wait(2000)

    AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)

    exports['mythic_notify']:DoHudText('inform', 'Du tog en 100% skudsikkervest på', 5000)
end)



RegisterNetEvent('savannah-vest:brugvest75%')
AddEventHandler('savannah-vest:brugvest75%', function()

    local playerPed = PlayerPedId()

    local dict, anim = 'clothingtie', 'try_tie_negative_a'

    RequestAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(50)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

    exports['progressBars']:startUI(1250, "Ifører skudsikkervest...")

    Citizen.Wait(2000)

    AddArmourToPed(playerPed, 75)
    SetPedArmour(playerPed, 75)

    exports['mythic_notify']:DoHudText('inform', 'Du tog en 75% skudsikkervest på', 5000)
end)



RegisterNetEvent('savannah-vest:brugvest50%')
AddEventHandler('savannah-vest:brugvest50%', function()

    local playerPed = PlayerPedId()

    local dict, anim = 'clothingtie', 'try_tie_negative_a'

    RequestAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(50)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

    exports['progressBars']:startUI(1250, "Ifører skudsikkervest...")

    Citizen.Wait(2000)

    AddArmourToPed(playerPed, 50)
    SetPedArmour(playerPed, 50)

    exports['mythic_notify']:DoHudText('inform', 'Du tog en 50% skudsikkervest på', 5000)
end)



RegisterNetEvent('savannah-vest:brugvest25%')
AddEventHandler('savannah-vest:brugvest25%', function()

    local playerPed = PlayerPedId()
    local dict, anim = 'clothingtie', 'try_tie_negative_a'

    RequestAnimDict(dict)

    while (not HasAnimDictLoaded(dict)) do
        Citizen.Wait(50)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

    exports['progressBars']:startUI(1250, "Ifører skudsikkervest...")

    Citizen.Wait(2000)

    AddArmourToPed(playerPed, 25)
    SetPedArmour(playerPed, 25)

    exports['mythic_notify']:DoHudText('inform', 'Du tog en 25% skudsikkervest på', 5000)
end)
