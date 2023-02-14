local jobName = "carjack"

local sellingBlip = nil
local scrapBlip = nil

local isVehicleScrapping = false
local isSellingVehicle = false
local isInScrapZone = false

local vehicleColors = {}
local spawnedVehiclePlate = nil
local centerZone = nil

local DeliveryZone = nil
local DeliverysZones = {
    {
        vector2(2384.4091796875, 3119.4179687500),
        vector2(2403.0083007812, 3160.3994140625),
        vector2(2435.1926269531, 3160.5522460938),
        vector2(2435.3168945312, 3026.4602050781),
        vector2(2328.6794433594, 3025.8662109375),
        vector2(2328.6577148438, 3069.0300292969),
        vector2(2329.4658203125, 3079.5556640625),
        vector2(2348.9494628906, 3079.8093261719),
        vector2(2364.5683593750, 3085.9624023438),
        vector2(2372.4104003906, 3093.6589355469),
        vector2(2379.4460449219, 3105.1010742188),
    }, {
        vector2(1562.9506835938, -2206.3652343750),
        vector2(1550.9676513672, -2200.5478515625),
        vector2(1544.4345703125, -2190.4567871094),
        vector2(1525.2006835938, -2181.5532226562),
        vector2(1512.4260253906, -2179.8359375000),
        vector2(1492.5977783203, -2168.1528320312),
        vector2(1484.0806884766, -2151.6440429688),
        vector2(1489.7207031250, -2083.4392089844),
        vector2(1493.7257080078, -2069.0388183594),
        vector2(1504.1682128906, -2057.6928710938),
        vector2(1520.7929687500, -2052.5161132812),
        vector2(1556.8426513672, -2069.2661132812),
        vector2(1563.5798339844, -2087.2160644531),
        vector2(1572.1821289062, -2119.2497558594),
        vector2(1578.8967285156, -2159.6953125000),
        vector2(1575.6601562500, -2180.3962402344),
        vector2(1571.7596435547, -2195.2871093750),
    }
}

local VehicleDeliverys = {
    vector3(-1283.86, -3418.89, 13.52),
    vector3(236.85, -3314.69, 5.37),
    vector3(1204.45, -3116.33, 5.12),
}

local SpawnVehicles = {
    vector4(-841.17, -813.49, 19.28, 20.5),
    vector4(-760.67, -439.38, 35.63, 96.5),
    vector4(-1280.85, -433.16, 34.19, 215.5),
    vector4(-1333.17, -210.85, 42.99, 37.5),
    vector4(-1821.40, 808.71, 138.40, 43.5),
    vector4(-3156.39, 1132.42, 20.41, 160.5),
    vector4(-3161.02, 1029.98, 20.38, 296.5),
    vector4(-2180.24, -404.05, 12.68, 136.5),
    vector4(-2192.12, -382.04, 12.84, 48.5),
    vector4(-2038.1, -260.03, 22.95, 148.5),
    vector4(-1867.65, -301.34, 48.71, 221.5),
    vector4(-1716.79, -495.37, 37.63, 198.5),
    vector4(-1234.56, -200.22, 38.86, 160.5),
    vector4(-333.78, 71.84, 63.92, 269.5),
    vector4(-130.36, -23.19, 57.68, 70.5),
    vector4(655.47, 160.07, 92.24, 340.5),
    vector4(1259.32, -420.01, 68.99, 305.5),
    vector4(1344.54, -727.2, 66.37, 77.5),
    vector4(1036.45, -1864.91, 28.89, 204.5),
    vector4(1047.97, -2114.48, 32.31, 214.5),
    vector4(302.74, -2500.17, 5.95, 227.5),
    vector4(-220.46, -2670.27, 5.56, 92.5),
    vector4(-355.05, -2797.95, 5.56, 203.5),
    vector4(211.13, -2014.35, 18.22, 194.5),
    vector4(47.24, -1803.99, 24.98, 53.5),
    vector4(-600.82, -1172.79, 16.2, 90.5),
    vector4(-850.25, -1088.92, 8.76, 30.5),
    vector4(-1237.0, -1404.34, 3.83, 212.5),
    vector4(-1271.35, -1336.29, 3.76, 19.5),
    vector4(-1320.92, -1217.88, 4.34, 22.5),
}

local Vehicles = {
    "yosemite",
    "dukes",
    "sabregt",
    "buccaneer",
    "dominator",
    "asbo",
    "club",
    "issi2",
    "fugitive",
    "asterope",
    "glendale2",
    "baller",
    "fq2",
    "mesa",
    'windsor',
    'toros',
    'seven70',
    'baller3',
    'dominator3',
    'ninef',
    'ninef2',
    'schlagen',
    'cogcabrio',
    'dominator2',
    'kamacho',
    'elegy',
    'granger',
    "comet6",
    "tailgater2",
    "paragon",
    "jester4",
    "gauntlet5",
    "gauntlet4",
    "jugular",
    "coquette4",
    "reaper",
    "banshee2",
    "pfister811",
    "schafter4",
    "vstr",
    "komoda",
    "cypher",
    "sultanrs",
    "rebla",
    "buffalo2",
    "landstalker2",
}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    exports.qtarget:

Vehicle({
        options = {
            {
                icon = "fas fa-cars",
                label = "Start Scrap af køretøjet",
                action = function(entity)
                    StartDismandleVehicle(entity)
                end,
                canInteract = function(entity)
                    local plate = GetVehicleNumberPlateText(entity)
                    return isInScrapZone and spawnedVehiclePlate == plate and not isVehicleScrapping
                end,
            },
        },
        distance = 2
    })

    collectgarbage()
end)

StartCarJackRobbery = function()


    local TimeWait = exports.srp_tools:random(2, 4)
    TimeWait = (TimeWait * 60) * 1000

    DrawBusySpinner("Afventer lokationen på bilen")

    local start = GetGameTimer()
    while GetGameTimer() - start < TimeWait do
        Wait(10000);
    end

    StopBusySpinner()

    local selectedVehicleSpot = exports['srp_tools']:random(1, #SpawnVehicles)
    local vehicleSpot = SpawnVehicles[selectedVehicleSpot]
    local spawnVehicleCoords = vector3(vehicleSpot.x, vehicleSpot.y, vehicleSpot.z)

    local offsetBlip = (exports['srp_tools']:random(20, 30)) + 0.0
    local spotOffsetCoords = vector3(vehicleSpot.x + offsetBlip, vehicleSpot.y + offsetBlip, vehicleSpot.z)
    local blip = AddBlipForRadius(spotOffsetCoords.x, spotOffsetCoords.y, spotOffsetCoords.z, 150.0)

    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 70)
    SetBlipAlpha(blip, 75)
    SetBlipAsShortRange(blip, true)

    local selectedVehicleNumber = exports['srp_tools']:random(1, #Vehicles)
    local selectedVehicle = Vehicles[selectedVehicleNumber]

    local model = GetHashKey(selectedVehicle)
    local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(model))

    exports['mythic_notify']:SendAlert('inform', 'Find køretøjet og stjæl det.', 5000)
    DrawBusySpinner(("Find den markerede %s og stjæl den"):format(vehicleName))

    local spawnedVehicle = nil
    local hasSpawnVehicle = false
    spawnedVehiclePlate = nil

    while not hasSpawnVehicle do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local distance = #(playerCoords - spawnVehicleCoords)
        if distance <= 100.0 and spawnedVehiclePlate == nil then
            SpawnVehicle(model, spawnVehicleCoords, vehicleSpot.w, function(vehicle)
                spawnedVehicle = vehicle

                spawnedVehiclePlate = GetVehicleNumberPlateText(vehicle)
                vehicleColors = table.pack(GetVehicleColours(vehicle))
            end)
        end

        if distance <= offsetBlip and DoesEntityExist(spawnedVehicle) then
            RemoveBlip(blip)

            local blip = AddBlipForEntity(spawnedVehicle)
            SetBlipSprite(blip, 225)
            SetBlipColour(blip, 1)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(vehicleName)
            EndTextCommandSetBlipName(blip)

            hasSpawnVehicle = true
        end
    end

    local hasEnteredVehicle = false
    while not hasEnteredVehicle do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local vehiclePlate = GetVehicleNumberPlateText(vehicle)
            hasEnteredVehicle = (vehiclePlate == spawnedVehiclePlate)

            if hasEnteredVehicle then
                RemoveBlip(GetBlipFromEntity(vehicle))
            end
        end
    end

    StopBusySpinner()

    local selecteddeliverySpot = exports['srp_tools']:random(1, #DeliverysZones)
    local deliverySpotZone = DeliverysZones[selecteddeliverySpot]

    DeliveryZone = PolyZone:Create(deliverySpotZone, { name = "carJackVehicle", debugPoly = false })
    centerZone = DeliveryZone.center

    centerZone = vector3(centerZone.x, centerZone.y, 0.0)
    exports['mythic_notify']:SendAlert('inform', 'Kør køretøjet til Scrap stedet eller aflevere bilen', 5000)

    DeliveryZone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
        if isPointInside then
            isInScrapZone = true
            RemoveBlip(scrapBlip)

            exports['mythic_notify']:SendAlert('inform', 'Scrap køretøjet (Øjet)', 5000)
        end

        if not isPointInside then
            isInScrapZone = false

            scrapBlip = AddBlipForCoord(centerZone.x, centerZone.y, centerZone.z)
            SetBlipSprite(scrapBlip, 473)
            SetBlipColour(scrapBlip, 1)
            SetBlipAsShortRange(scrapBlip, false)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Drop off sted")
            EndTextCommandSetBlipName(scrapBlip)
        end
    end)

    Citizen.CreateThread(function()
        isSellingVehicle = true

        local vehicleSellingPointID = exports['srp_tools']:random(1, #VehicleDeliverys)
        local vehicleSellingPoint = VehicleDeliverys[vehicleSellingPointID]

        sellingBlip = AddBlipForCoord(vehicleSellingPoint.x, vehicleSellingPoint.y, vehicleSellingPoint.z)
        SetBlipSprite(sellingBlip, 108)
        SetBlipColour(sellingBlip, 2)
        SetBlipAsShortRange(sellingBlip, false)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Aflevere bil")
        EndTextCommandSetBlipName(sellingBlip)

        while isSellingVehicle do
            Citizen.Wait(2)

            local letSleep = true
            local playerPed = PlayerPedId()
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local vehiclePlate = GetVehicleNumberPlateText(vehicle)

                local vehicleCoords = GetEntityCoords(vehicle)
                local distance = #(vehicleCoords - vehicleSellingPoint)

                if distance <= 5.0 and vehiclePlate == spawnedVehiclePlate then
                    ESX.ShowHelpNotification('Tryk ~INPUT_CONTEXT~ for at aflevere bilen')

                    if IsControlJustReleased(0, Keys['E']) and (GetGameTimer() - Time) > 1000 then
                        local color = table.pack(GetVehicleColours(vehicle))
                        if vehicleColors[1] == color[1] then
                            exports['mythic_notify']:SendAlert("error", 'Du har ikke ændret den primære farve.')
                        end

                        if vehicleColors[2] == color[2] then
                            exports['mythic_notify']:SendAlert("error", 'Du har ikke ændret den sekundære farve.')
                        end

                        if vehicleColors[1] ~= color[1] and vehicleColors[2] ~= color[2] then
                            hasTask = true
                            FreezeEntityPosition(vehicle, true)

                            local deliveryTime = 10 * 1000
                            exports['progressBars']:startUI(deliveryTime, "Afleverer Køretøj")
                            Citizen.Wait(deliveryTime)

                            isSellingVehicle = false

                            isInScrapZone = false
                            DeliveryZone:destroy()

                            if DoesBlipExist(scrapBlip) then
                                RemoveBlip(scrapBlip)
                            end

                            if DoesBlipExist(sellingBlip) then
                                RemoveBlip(sellingBlip)
                            end

                            local class = GetVehicleClass(vehicle)
                            TriggerServerEvent('carjack:jobReward')
                            hasTask = false

                            DeleteVehicle(vehicle)
                        end
                    end

                    letSleep = false
                end
            end

            if letSleep then
                Citizen.Wait(500)
            end
        end
    end)

end

StartDismandleVehicle = function(vehicle)
    local _vehicle = vehicle
    isVehicleScrapping = true

    Citizen.CreateThread(function()
        local bodyParts = {
            { bone = "door_dside_f", key = 0, isDoor = true },
            { bone = "door_pside_f", key = 1, isDoor = true },
            { bone = "door_dside_r", key = 2, isDoor = true },
            { bone = "door_pside_r", key = 3, isDoor = true },
            { bone = "bonnet", key = 4, isDoor = true },
            { bone = "boot", key = 5, isDoor = true },
            { bone = "wheel_lf", key = 0, isDoor = false },
            { bone = "wheel_rf", key = 1, isDoor = false },
            { bone = "wheel_lm1", key = 2, isDoor = false },
            { bone = "wheel_rm1", key = 3, isDoor = false },
            { bone = "wheel_lr", key = 4, isDoor = false },
            { bone = "wheel_rr", key = 5, isDoor = false },
        }

        while isVehicleScrapping do
            Citizen.Wait(2)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            if not hasTask and not IsPedInAnyVehicle(playerPed, true) then
                local hasFoundPart = false

                for i = 0, #bodyParts, 1 do
                    local part = bodyParts[i]
                    if part ~= nil and not hasFoundPart then
                        local partIndex = GetEntityBoneIndexByName(_vehicle, part.bone)

                        if partIndex ~= -1 then
                            if part.isDoor and not IsVehicleDoorDamaged(_vehicle, part.key) then
                                hasFoundPart = true

                                local doorCoords = GetWorldPositionOfEntityBone(_vehicle, partIndex)
                                local distance = #(playerCoords - doorCoords)

                                if distance <= 2.0 then
                                    DrawText3D(doorCoords.x, doorCoords.y, doorCoords.z, 'Tryk ~r~[E]~w~ for at fjerne døren')

                                    if IsControlJustReleased(0, Keys['E']) and (GetGameTimer() - Time) > 1000 then
                                        Time = GetGameTimer()

                                        hasTask = true
                                        SetVehicleDoorOpen(_vehicle, part.key, false, true)

                                        TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'weld')
                                        FreezeEntityPosition(playerPed, true)

                                        exports['progressBars']:startUI(5000, "Fjerner døren")
                                        Citizen.Wait(5000)

                                        SetVehicleDoorBroken(_vehicle, part.key, true)

                                        TriggerEvent('srp_animation:EmoteCancel')
                                        FreezeEntityPosition(playerPed, false)
                                        hasTask = false
                                    end
                                end
                            end

                            if not part.isDoor and not IsVehicleTyreBurst(_vehicle, part.key) then
                                hasFoundPart = true

                                local wheelCoords = GetWorldPositionOfEntityBone(_vehicle, partIndex)
                                local distance = #(playerCoords - wheelCoords)
                                if distance <= 1.5 then
                                    DrawText3D(wheelCoords.x, wheelCoords.y, wheelCoords.z, 'Tryk ~r~[E]~w~ for at fjerne hjulet')

                                    if IsControlJustReleased(0, Keys['E']) and (GetGameTimer() - Time) > 1000 then
                                        Time = GetGameTimer()

                                        hasTask = true
                                        TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'mechanic3')
                                        FreezeEntityPosition(playerPed, true)

                                        exports['progressBars']:startUI(5000, "Fjerner hjulet")
                                        Citizen.Wait(5000)

                                        SetVehicleTyreBurst(_vehicle, part.key, true, 1000.0)

                                        TriggerEvent('srp_animation:EmoteCancel')
                                        FreezeEntityPosition(playerPed, false)
                                        hasTask = false
                                    end
                                end
                            end
                        end
                    end
                end

                if not hasFoundPart then
                    local vehicleCoords = GetEntityCoords(_vehicle)
                    local distance = #(playerCoords - vehicleCoords)

                    if distance <= 3.0 then
                        DrawText3D(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 'Tryk ~r~[E]~w~ for at fjerne bilen')

                        if IsControlJustReleased(0, Keys['E']) and (GetGameTimer() - Time) > 1000 then
                            Time = GetGameTimer()

                            hasTask = true
                            TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'medic')
                            FreezeEntityPosition(playerPed, true)

                            exports['progressBars']:startUI(5000, "Fjerner bilen")
                            Citizen.Wait(5000)

                            DeleteVehicle(_vehicle)
                            isVehicleScrapping = false

                            isSellingVehicle = false
                            DeliveryZone:destroy()

                            TriggerEvent('srp_animation:EmoteCancel')
                            FreezeEntityPosition(playerPed, false)

                            if DoesBlipExist(scrapBlip) then
                                RemoveBlip(scrapBlip)
                            end

                            if DoesBlipExist(sellingBlip) then
                                RemoveBlip(sellingBlip)
                            end

                            TriggerServerEvent('srp_illegaljobs:AddReward', jobName, "scrap")
                            hasTask = false
                        end
                    end
                end
            end

            if not DoesEntityExist(_vehicle) then
                isVehicleScrapping = false
                return
            end

            local distance = #(playerCoords - centerZone)
            if distance > DeliveryZone.boundingRadius then
                isVehicleScrapping = false
            end
        end
    end)
end
