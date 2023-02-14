local jobName = "carscrap"
local Time = 0
local ScrapTime = 30
local hasTask = false

local Deliverys = {
    vector3(2341.97, 3051.95, 48.0),
}

local VehicleBlacklist = {8, 10, 11, 13, 14, 15, 16, 17, 18, 19, 21}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local letSleep = true
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if not hasTask then
            if IsPedInAnyVehicle(playerPed, false) then
                for i=1, #Deliverys, 1 do
                    local delivery = Deliverys[i]
                    local distance = #(playerCoords - delivery)

                    if distance <= 10.0 then
                        letSleep = false
                        DrawMarker(20, delivery.x, delivery.y, delivery.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 80, true, true, 2, false, false, false, false)

                        if distance <= 3.0 then
                            DrawText3D(delivery.x, delivery.y, delivery.z + 0.55, 'Tryk ~r~[H]~w~ for at Scrap Køretøjet')
                            if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                ScrapVehicle()
                            end
                        end
                    end
                end
            end
        end

        if hasTask then
            letSleep = false
            DisableControlAction(0, 75)
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

ScrapVehicle = function()
    if not isCop then
        ESX.TriggerServerCallback('savanha_carscrap:copCount', function(cops)
            if cops >= Config.CarJackRequiredCops then
                ESX.TriggerServerCallback('savanha_carscrap:getCooldown', function(cooldownCarScrap)
                    if cooldownCarScrap == nil then
                        local playerPed = PlayerPedId()

                        if IsPedInAnyVehicle(playerPed, false) then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                            local VehicleClass = GetVehicleClass(vehicle)
                            Debug("Vehicle Class : " .. VehicleClass)
                            
                            if not has_value(VehicleBlacklist, VehicleClass) then
                                local plate = GetVehicleNumberPlateText(vehicle)
                                local scanPlate = string.sub(plate, 1, 2)

                                if tonumber(scanPlate) then
                                    hasTask = true

                                    FreezeEntityPosition(vehicle, true)
                                    SetVehicleEngineOn(vehicle, false, true, true)

                                    TriggerServerEvent('savanha_carscrap:startJobSV')

                                    local timer = ScrapTime * 1000
                                    exports['progressBars']:startUI(timer, "Ødelægger Køretøj")
                                    Citizen.Wait(timer)

                                    local multiplier = CalculateMultiplier(VehicleClass)
                                    Debug("Multiplier : " .. multiplier)

                                    TriggerServerEvent('SavanhaCarscrap:AddReward', multiplier)

                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    DeleteVehicle(vehicle)

                                    FreezeEntityPosition(vehicle, false)

                                    hasTask = false
                                else
                                    exports['mythic_notify']:DoHudText('error', 'Du kan ikke Scrap dette Køretøj.', 5000)
                                end
                            else
                                exports['mythic_notify']:DoHudText('error', 'Denne køretøjstype kan ikke bruges her.', 5000)
                            end
                        else
                            exports['mythic_notify']:DoHudText('error', 'Du skal sidde i et køretøj', 5000)
                        end
                    else
                        exports['mythic_notify']:DoHudText('error', 'Tid tilbage: ' .. cooldownCarScrap .. " min.", 5000)
                    end
                end)
            else
                exports['mythic_notify']:DoHudText('error', 'Der er ikke nok Politi på arbejde.', 5000)
            end
        end)
    else
        exports['mythic_notify']:DoHudText('error', 'Politi kan ikke røve', 5000)
    end
end

CalculateMultiplier = function(Class)
    local multiplier = 1.0

    if Class == 1 then
        multiplier = 1.02
    elseif Class == 2 then
        multiplier = 1.05
    elseif Class == 5 then
        multiplier = 1.08
    elseif Class == 6 then
        multiplier = 1.10
    elseif Class == 7 then
        multiplier = 1.20
    end
    
    return multiplier
end