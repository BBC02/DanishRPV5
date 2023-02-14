local isInWeaponMenu = false

local hasWeaponDelivery = false
local weaponDeliveryLocation = nil
local weaponDeliveryVehicle = nil
local weaponDeliveryBlip = nil

OpenWeaponShop = function(entity)
    isInWeaponMenu = true

    PlayPedAmbientSpeechWithVoiceNative(entity, "CHAT_RESP", "g_f_y_ballas_01_black_mini_01", "SPEECH_PARAMS_FORCE", 1)
    TriggerServerEvent("srp_illegaljobs:OpenWeaponShop")
end

RegisterNetEvent('srp_illegaljobs:RefreshWeaponUI')
AddEventHandler('srp_illegaljobs:RefreshWeaponUI', function(forceOpen, guns, gang, next, orders, missions)
    if not isInWeaponMenu and not forceOpen then
        return
    end

    if forceOpen then
        isInWeaponMenu = true
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        openWeapon = isInWeaponMenu,
        setGunCategories = guns ~= nil,
        gunCategories = guns,
        setReputation = gang ~= nil,
        reputation = gang,
        setNextReputation = next ~= nil,
        nextReputation = next,
        setOrderedItems = orders ~= nil,
        orderedItems = orders,
        setReputationMissions = missions ~= nil,
        reputationMissions = missions,
        setDeficitMulitplier = true,
        deficitMulitplier = GlobalState.deficitMulitplier,
        setMinimumDelivery = true,
        minimumDelivery = GlobalState.minimumDelivery,
    })
end)

RegisterNUICallback('levelup', function(data, cb)
    TriggerServerEvent("srp_illegaljobs:UpgradeWeaponShop")

    cb('ok')
end)

RegisterNUICallback('refresh', function(data, cb)
    TriggerServerEvent("srp_illegaljobs:RefreshWeaponMissions")

    cb('ok')
end)

RegisterNUICallback('deliver', function(data, cb)
    AddToWeaponMission(tonumber(data.index) + 1)

    cb('ok')
end)

RegisterNUICallback('complete', function(data, cb)
    TriggerServerEvent("srp_illegaljobs:CompleteMissionItem", tonumber(data.index) + 1)

    cb('ok')
end)

RegisterNUICallback('buyweapons', function(data, cb)
    local weaponData = {}
    weaponData["items"] = data.weaponCart
    weaponData["isDelivered"] = data.weaponDelivered
    weaponData["totalMinutes"] = data.weapontotalMinutes

    TriggerServerEvent("srp_illegaljobs:BuyCart", weaponData)

    cb('ok')
end)

RegisterNUICallback('cancelorder', function(data, cb)
    TriggerServerEvent("srp_illegaljobs:CancelOrder", tonumber(data.index) + 1)

    cb('ok')
end)

RegisterNUICallback('collectorder', function(data, cb)
    TriggerServerEvent("srp_illegaljobs:CollectOrder", tonumber(data.index) + 1)

    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    if isInWeaponMenu then
        TriggerServerEvent("srp_illegaljobs:CloseWeaponShop")
    end

    isInWeaponMenu = false

    cb('ok')
end)

AddToWeaponMission = function(index)
    local PlayerData = ESX.GetPlayerData()

    local inventoryElements = {}
    for i = 1, #PlayerData.inventory, 1 do
        if PlayerData.inventory[i].count > 0 then
            table.insert(inventoryElements, {
                label = PlayerData.inventory[i].label .. ' x' .. PlayerData.inventory[i].count,
                quantity = PlayerData.inventory[i].count,
                value = PlayerData.inventory[i].name,
                name = PlayerData.inventory[i].label,
                action = 'add'
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'property_person_inventory', {
        title = 'Mission Inventar',
        align = 'bottom-right',
        elements = inventoryElements
    }, function(data1, menu1)
        if data1.current.action == 'add' then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'property_add_list', {
                title = 'Antal'
            }, function(data2, menu2)
                local quantity = tonumber(data2.value)

                if not quantity then
                    ESX.ShowNotification('Ugyldig indtastning')
                end

                if quantity then
                    TriggerServerEvent("srp_illegaljobs:DeliverMissionItems", index, data1.current.value, quantity)
                    menu1.close()
                end

                menu2.close()
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data1, menu1)
        menu1.close()
        collectgarbage()
    end)
end

StartWeaponDelivery = function()
    Citizen.CreateThread(function()
        hasWeaponDelivery = true

        while hasWeaponDelivery do
            Citizen.Wait(500)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            local vehicleLocation = vector3(weaponDeliveryLocation.x, weaponDeliveryLocation.y, weaponDeliveryLocation.z)
            local distance = #(playerCoords - vehicleLocation)
            if distance <= Config.CarSpawnDistance then
                hasWeaponDelivery = false

                SpawnVehicle(weaponDeliveryVehicle, vehicleLocation, weaponDeliveryLocation.w, function(vehicle)
                    local truckPlate = exports['srp_VEHICLESHOP']:GeneratedCustomPlate('GAMB', 4)
                    SetVehicleNumberPlateText(vehicle, truckPlate)

                    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                    TriggerServerEvent("esx_jobvehicle:setVehicleOwned", vehicleProps)

                    SetVehicleMaxMods(vehicle)
                    exports["srp_FUEL"]:SetFuel(vehicle, 100)

                    TriggerServerEvent('srp_illegaljobs:addTrunkitem', GetVehicleClass(vehicle), truckPlate)

                    if DoesBlipExist(weaponDeliveryBlip) then
                        RemoveBlip(weaponDeliveryBlip)
                    end
                end)
            end
        end
    end)
end

RegisterNetEvent('srp_illegaljobs:StartWeaponDelivery')
AddEventHandler('srp_illegaljobs:StartWeaponDelivery', function(location, deliverySize)
    weaponDeliveryLocation = location

    local vehicleLocation = vector3(weaponDeliveryLocation.x, weaponDeliveryLocation.y, weaponDeliveryLocation.z)
    CreateBlipRoute(vehicleLocation, 'Find køretøjet', function(blip)
        weaponDeliveryBlip = blip

        if deliverySize < 30 then
            weaponDeliveryVehicle = "burrito"
        end

        if deliverySize >= 30 and deliverySize <= 80 then
            weaponDeliveryVehicle = "mule2"
        end

        if deliverySize > 80 then
            weaponDeliveryVehicle = "pounder"
        end

        StartWeaponDelivery()
    end)
end)
