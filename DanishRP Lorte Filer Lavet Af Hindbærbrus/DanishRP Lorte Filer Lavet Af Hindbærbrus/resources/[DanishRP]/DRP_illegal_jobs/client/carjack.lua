local jobName = "carjack"

local VehicleLocations = {
    vector4(214.03, -1459.23, 28.75, 50.0),
    vector4(68.70, -1434.05, 28.88, 320.0),
    vector4(-145.70, -1346.88, 29.27, 180.0),
    vector4(-174.90, -1445.14, 30.92, 50.0),
    vector4(-179.18, -1949.26, 27.18, 110.0),
    vector4(-236.58, -2098.60, 27.19, 30.0),
    vector4(-936.48, -1976.22, 12.78, 130.0),
    vector4(-608.62, -2300.05, 13.41, 140.0),
    vector4(-671.15, -764.29, 30.34, 0.0),
    vector4(-1219.31, -686.38, 25.48, 310.0),
    vector4(-1671.30, -236.89, 54.34, 250.0),
    vector4(-3036.87, 104.84, 11.16, 320.0),
}

local VehicleDeliverys = {
    vector3(-1283.86, -3418.89, 13.52),
    vector3(236.85, -3314.69, 5.37),
    vector3(1204.45, -3116.33, 5.12),
}

local VehicleTiers = {
    [1] = {
        'cogcabrio',
        'dominator2',
        'kamacho',
        'elegy',
        'granger',
    },
    [2] = {
        'baller3',
        'dominator3',
        'ninef',
        'ninef2',
        'schlagen',
    },
    [3] = {
        'windsor',
        'toros',
        'seven70',
    },
}

local animDict = "veh@handler@base"
local anim = "hotwire"

local hasTask = false
local hotwiring = false
local hasChangedColors = false
local PoliceAlerted = false
local TargetBlip = nil

local hasFoundCar = false
local hasStolenCar = false
local isVehicleSpawned = false
local TargetVehicle = nil
local TargetVehicleColors = {}
local TargetVehicleModel = ""
local TargetVehicleLabel = ""
local VehicleLocation = nil
local VehicleHeading = nil
local VehicleDeliveryLocation = nil

StartCarJackRobbery = function()
                    
    hasTask = true

    TargetVehicleTire = math.random(1, #VehicleTiers)
    local ModelNumber = math.random(1, #VehicleTiers[TargetVehicleTire])
    TargetVehicleModel = VehicleTiers[TargetVehicleTire][ModelNumber]
    TargetVehicleLabel = GetDisplayNameFromVehicleModel(TargetVehicleModel):lower()

    local LocationNumber = math.random(1, #VehicleLocations)
    VehicleLocation = vector3(VehicleLocations[LocationNumber].x, VehicleLocations[LocationNumber].y, VehicleLocations[LocationNumber].z)
    VehicleHeading = VehicleLocations[LocationNumber].w

    local DeliveryNumber = math.random(1, #VehicleDeliverys)
    VehicleDeliveryLocation = VehicleDeliverys[DeliveryNumber]

    CreateBlipRoute(VehicleLocation, 'Find Bilen', function(blip)
        TargetBlip = blip
    end)

    hasFoundCar = true

    while hasFoundCar do
        Citizen.Wait(2)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if not hasStolenCar then
            if VehicleLocation then
                DrawTxt("Følg GPSen og stjæl en ~r~" .. TargetVehicleLabel, 4, 1, 0.5, 0.92, 0.70,255,255,255,255)
                local distance = #(playerCoords - VehicleLocation)

                if distance <= Config.CarSpawnDistance then
                    if not isVehicleSpawned then
                        SpawnVehicle(TargetVehicleModel, VehicleLocation, VehicleHeading, function(vehicle)
                            SetVehicleNeedsToBeHotwired(vehicle, true)

                            local color = table.pack(GetVehicleColours(vehicle))
                            TargetVehicleColors["primary"] = color[1]
                            TargetVehicleColors["second"] = color[2]

                            TargetVehicle = vehicle
                            isVehicleSpawned = true
                        end)
                    else
                        if TargetVehicle then
                            if distance <= 10.0 then
                                local vehicle = GetVehiclePedIsIn(playerPed)
                                if vehicle == TargetVehicle then
                                    AlertCarPolice()
                                    
                                    RemoveBlip(TargetBlip)
                                    TargetBlip = nil

                                    SetVehicleAlarm(vehicle, true)
                                    SetVehicleAlarmTimeLeft(vehicle, 30 * 1000)

                                    hotWire(vehicle)
                                    hasStolenCar = true
                                end
                            end
                        end 
                    end
                end
            end
        else
            if VehicleDeliveryLocation then
                if IsPedInAnyVehicle(playerPed, false) then
                    if not hasChangedColors then
                        local currentVehicle = GetVehiclePedIsIn(playerPed)
                        if DoesEntityExist(TargetVehicle) then
                            if TargetVehicle == currentVehicle then
                                local color = table.pack(GetVehicleColours(currentVehicle))

                                local color1Text = "~r~Primær farve~s~"
                                if TargetVehicleColors["primary"] ~= color[1] then
                                    color1Text = "~g~Primær farve~s~"
                                end

                                local color2Text = "~r~Sekundær farve~s~"
                                if TargetVehicleColors["second"] ~= color[2] then
                                    color2Text = "~g~Sekundær farve~s~"
                                end

                                DrawTxt("Skift farve på bilen - " .. color1Text .. '/' .. color2Text, 4, 1, 0.5, 0.92, 0.70,255,255,255,255)

                                if TargetVehicleColors["primary"] ~= color[1] and TargetVehicleColors["second"] ~= color[2] then
                                    hasChangedColors = true
                                end
                            end
                        end
                    else
                        if TargetBlip == nil then
                            CreateBlipRoute(VehicleDeliveryLocation, 'Aflever Bilen', function(blip)
                                TargetBlip = blip
                            end)
                        end

                        DrawTxt("Aflevere bilen på lokationen", 4, 1, 0.5, 0.92, 0.70,255,255,255,255)

                        local distance = #(playerCoords - VehicleDeliveryLocation)
                        if distance <= 5.0 then
                            ESX.ShowHelpNotification('Tryk ~INPUT_CONTEXT~ for at aflevere bilen')
            
                            if IsControlJustReleased(0, Keys['E']) then
                                EndCarJack()
                            end
                        end
                    end
                end
            end
        end
    end
end

EndCarJack = function()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
    if currentVehicle == TargetVehicle then
        local color = table.pack(GetVehicleColours(currentVehicle))
        if TargetVehicleColors["primary"] ~= color[1] and TargetVehicleColors["second"] ~= color[2] then
            FreezeEntityPosition(currentVehicle, true)
            local deliveryTime = 10 * 1000
            exports['progressBars']:startUI(deliveryTime, "Aflevere Køretøj")
            Citizen.Wait(deliveryTime)

            PoliceAlerted = false
            
            TriggerServerEvent('carjack:jobReward')
            FreezeEntityPosition(currentVehicle, false)

            DeleteVehicle(TargetVehicle)
            endMission()
        else
            local colorType = ""
            if TargetVehicleColors["primary"] == color[1] then
                colorType = "primære"
            elseif TargetVehicleColors["second"] == color[2] then
                colorType = "sekundære"
            end

            exports['mythic_notify']:DoHudText('error', 'Husk at ændre den ' .. colorType .. ' farve.', 5000)
        end
    else
        exports['mythic_notify']:DoHudText('error', 'Du kan ikke levere et andet køretøj.', 5000)
    end
end

RegisterCommand("cancelmission", function()
    endMission()
end)

endMission = function()
    RemoveBlip(TargetBlip)

    hasTask = false
    hasFoundCar = false
    hasStolenCar = false
    hasChangedColors = false
    isVehicleSpawned = false
    TargetVehicle = nil
    TargetVehicleColors = {}
    TargetVehicleModel = ""
    TargetVehicleLabel = ""
    VehicleLocation = nil
    VehicleHeading = nil
    VehicleDeliveryLocation = nil
    TargetBlip = nil

    -- TriggerServerEvent('drp_illegaljobs:removeRobber', jobName)
end

disableEngine = function(vehicle)
    Citizen.CreateThread(function()
        while hotwiring do
            SetVehicleEngineOn(vehicle, false, true, false)
            if not hotwiring then
                break
            end
            Citizen.Wait(0)
        end
    end)
end

hotWire = function(vehicle)
    if IsVehicleNeedsToBeHotwired(vehicle) then
        local hotwireTime = 10000
        local playerPed = PlayerPedId()

        disableEngine(vehicle)
        hotwiring = true

        ClearPedTasks(playerPed)
        loadAnimDict(animDict)
        TaskPlayAnim(playerPed, animDict, anim, 3.0, 1.0, hotwireTime, flags, -1, 0, 0, 0)

        if hotwiring then
            exports['progressBars']:startUI(hotwireTime, "Kortslutter Køretøj")
            Citizen.Wait(hotwireTime + 500)
        end

        hotwiring = false
        StopAnimTask(playerPed, animDict, anim, 1.0)
        RemoveAnimDict(animDict)

        Citizen.Wait(1000)

        SetVehicleRadioEnabled(vehicle, false)
    end
end

AlertCarPolice = function()
    if not PoliceAlerted then
        PoliceAlerted = true

        local maxDistance = 20.0
        local foundNpc = CheckAwareNPC(maxDistance, true)
        if foundNpc ~= nil then
            Debug("Alerting Authorities cartheft")
            TriggerEvent('DRP_NPCNOTIFY:remoteMessage', 'cartheft', 'police', "Biltyveri - ", 0, GetEntityCoords(TargetVehicle))
        end
    end
end