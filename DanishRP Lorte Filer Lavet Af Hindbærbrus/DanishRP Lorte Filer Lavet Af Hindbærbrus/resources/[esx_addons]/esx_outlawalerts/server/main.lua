ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--RegisterServerEvent('esx_outlawalert:carJackInProgress')
--AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender, plate2, playerCoords)
local plate2 = plate2
--    TriggerEvent("opkaldsliste:addCall", nil, "Bil tyveri: " ..vehicleLabel.. " Nummerplade: " ..plate2..'.', "police", playerCoords.x, playerCoords.y, playerCoords.z)
--end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
    TriggerEvent("mdt:newCall", "Nogen er oppe og slås!", "Ukendt",
        vector3(targetCoords.x, targetCoords.y, targetCoords.z))
end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'SKUD', ["name"] = 'Skud affyret', ["loc"] = '🌎 ' .. streetName }
    length = 3500
    exports["omik_callist"]:newCall(0, "Der er hørt skud i nærheden af: " .. streetName, "police", targetCoords.x, targetCoords.y)
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('esx_outlawalert:DrugSaleInProgress')
AddEventHandler('esx_outlawalert:DrugSaleInProgress', function(targetCoords, streetName)
    local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
    TriggerClientEvent('Territories:outlawNotify', -1, targetCoords,
        string.format("~r~En~w~ person ~r~prøvede at sælge narkotika tæt på~w~ ~w~%s", streetName))
end)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:panicButton')
AddEventHandler('esx_outlawalert:panicButton', function(targetCoords, streetName, playerGender, playerName)
    mytype = 'police'
    data = { ["code"] = 'PANIK', ["name"] = 'KOLLEGA I NØD', ["loc"] = '🌎 ' .. streetName }
    length = 7000
    TriggerClientEvent('esx_outlawalert:outlawNotify2', -1, mytype, data, length)
    TriggerClientEvent('esx_outlawalert:panicButton', -1, targetCoords)
    TriggerEvent("opkaldsliste:addCall", nil, playerName .. " I NØD VED: 📍 " .. streetName, "police",
        vector3(targetCoords.x, targetCoords.y, targetCoords.z))

end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:robberyInProgress')
AddEventHandler('esx_outlawalert:robberyInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'RØVERI', ["name"] = 'Butiksrøveri igang', ["loc"] = '🌎 ' .. streetName }
    length = 3500
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
    exports["omik_callist"]:newCall(0, "Igangværende røveri ved:  " .. streetName, "police", targetCoords.x, targetCoords.y)

end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:jailbreak')
AddEventHandler('esx_outlawalert:jailbreak', function(playerCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'UDBRUD', ["name"] = 'Fængsel udbrud igang', ["loc"] = '🌎 ' .. streetName }
    length = 5000
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, playerCoords)
    TriggerEvent("opkaldsliste:addCall", nil, "Fængsel udbrud igang ved: 📍 " .. streetName, "police", playerCoords)

end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:houseRobberyinProgress')
AddEventHandler('esx_outlawalert:houseRobberyinProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'RØVERI', ["name"] = 'Husrøveri', ["loc"] = '🌎 ' .. streetName }
    length = 3500
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
    exports["omik_callist"]:newCall(0, "Mistænklig adfærd opdaget ved: " .. streetName, "police", targetCoords.x, targetCoords.y)

end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:pengetransporter')
AddEventHandler('esx_outlawalert:pengetransporter', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'RØVERI', ["name"] = 'Pengetransporter!', ["loc"] = '🌎 ' .. streetName }
    length = 5000
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    exports["omik_callist"]:newCall(0, "Pengetransporter røveri ved: " .. streetName, "police", targetCoords.x, targetCoords.y)
end, false)

RegisterServerEvent('esx_outlawalert:bankrobberyInProgress')
AddEventHandler('esx_outlawalert:bankrobberyInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'RØVERI', ["name"] = 'Bankrøveri!', ["loc"] = '🌎 ' .. streetName }
    length = 5000
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    exports["omik_callist"]:newCall(0, "Bankrøveri ved: " .. streetName, "police", targetCoords.x, targetCoords.y)
end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('esx_outlawalert:hackatm')
AddEventHandler('esx_outlawalert:hackatm', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = { ["code"] = 'RØVERI', ["name"] = 'Atm hack!', ["loc"] = '🌎 ' .. streetName }
    length = 5000
    TriggerClientEvent('esx_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerEvent("opkaldsliste:addCall", nil, "Atm hack ved: 📍 " .. streetName, "police", targetCoords)

end, false)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
    local identifier = GetPlayerIdentifier(source, 0)

    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = identifier,
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            cb(result[1].owner == identifier)
        else
            cb(false)
        end
    end)
end)
