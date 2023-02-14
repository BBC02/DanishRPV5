local jobName = "truckRobbery"

local truckSelect, Time = 0, 0
local activeRobbery, isSpecialTruck, hasLockpicked, hasTruckSpawned, hasTask = false, false, false, false, false
local TargetBlip, TargetBlipArea = nil, nil

local data = {
    ["truck"] = 0,
    ["location"] = vector3(0.0, 0.0, 0.0),
    ["index"] = 0,
    ["driver"] = 0,
    ["passenger"] = 0,
}

local truckSpawns = {
    vector4(660.43, -2673.00, 6.15, 90.0),
    vector4(417.01, -2088.14, 29.98, 230.0),
    vector4(-748.40, -2535.79, 13.94, 60.0),
    vector4(-1263.76, -1367.57, 4.26, 200.0),
}

StartTruckRobbery = function()
    local locationindex = math.random(1, #truckSpawns)
    local location = truckSpawns[locationindex]

    local index = math.random(1, #Config.JobConfig[jobName])
    local job = Config.JobConfig[jobName][index]
    data["index"] = index

    RunTruckRobbery(location, job)

end
    
RunTruckRobbery = function(location, job)
    data["location"] = location
    data["job"] = job

    CreateBlipRoute(location, 'Find køretøjet', function(blip)
        TargetBlip = blip
    end)

    activeRobbery = true

    CreateThread(function()
        while activeRobbery do
            Citizen.Wait(2)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local coords = vector3(data["location"].x, data["location"].y, data["location"].z)

            if not hasTask then
                if not hasTruckSpawned then
                    local distance = #(playerCoords - coords)
                    DrawTxt("Følg GPSen og stjæl ~r~køretøjet", 4, 1, 0.5, 0.92, 0.70,255,255,255,255)

                    if distance <= 300.0 then
                        SwitchBlipToArea(coords)

                        if distance <= Config.CarSpawnDistance then
                            local model = data["job"].model
                            local heading = data["location"].w

                            SpawnVehicle(model, coords, heading, function(vehicle)
                                local hash = GetHashKey(job.pedType)
                                RequestModel(hash)
                                while not HasModelLoaded(hash) do 
                                    Wait(0); 
                                end

                                local TruckDriver = CreatePedInsideVehicle(vehicle, 4, hash, -1, true, true)
                                local TruckPassenger = CreatePedInsideVehicle(vehicle, 4, hash, 0, true, true)

                                SetPedFleeAttributes(TruckDriver, 0, 0)
                                SetPedFleeAttributes(TruckPassenger, 0, 0)
                                SetPedCombatAttributes(TruckDriver, 46, 1)
                                SetPedCombatAttributes(TruckPassenger, 46, 1)
                                SetPedCombatAbility(TruckDriver, 100)
                                SetPedCombatAbility(TruckPassenger, 100)
                                SetPedCombatMovement(TruckDriver, 2)
                                SetPedCombatMovement(TruckPassenger, 2)
                                SetPedCombatRange(TruckDriver, 2)
                                SetPedCombatRange(TruckPassenger, 2)
                                SetPedKeepTask(TruckDriver, true)
                                SetPedKeepTask(TruckPassenger, true)

                                if job.weapon ~= nil then
                                    GiveWeaponToPed(TruckDriver, GetHashKey(job.weapon), 250, false, true)
                                    GiveWeaponToPed(TruckPassenger, GetHashKey(job.weapon), 250, false, true)
                                end

                                TaskVehicleDriveWander(TruckDriver, vehicle, 60.0, 128)

                                data["truck"] = vehicle
                                data["driver"] = TruckDriver
                                data["passenger"] = TruckPassenger

                                SetModelAsNoLongerNeeded(job.pedType)
                                hasTruckSpawned = true
                            end)
                        end
                    end
                end

                if hasTruckSpawned then
                    local truck = data["truck"]
                    local TruckLocation = GetEntityCoords(truck)

                    local distance = #(playerCoords - TruckLocation)
                    if TargetBlipArea ~= nil then
                        if distance <= 40.0 then
                            RemoveBlip(TargetBlipArea)
                            TargetBlipArea = nil
        
                            CreateEntityBlipRoute(data["truck"], "Røv køretøjet", function(blip)
                                TargetBlip = blip
                            end)
                        end
                    end

                    if TargetBlipArea == nil then
                        if distance <= 20.0 then
                            letSleep = false
        
                            if not IsPedInAnyVehicle(playerPed) then
                                local d1,d2 = GetModelDimensions(GetEntityModel(truck))
                                local pos = GetOffsetFromEntityInWorldCoords(truck, 0.0, d1.y-0.2, 0.0)
                                local trunkDistance = #(playerCoords - vector3(pos.x, pos.y, pos.z))
                                
                                if trunkDistance <= 2.0 then
                                    if hasLockpicked then
                                        DrawText3D(pos.x, pos.y, pos.z, 'Tryk ~r~[H]~w~ for at tømme køretøjet')

                                        if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                            Time = GetGameTimer()
                                            hasTask = true

                                            local animDict = 'anim@heists@ornate_bank@grab_cash_heels'
                                            RequestAnimDict(animDict)
                                            while not HasAnimDictLoaded(animDict) do
                                                Citizen.Wait(50)
                                            end
                                            
                                            local prop = GetHashKey('prop_cs_heist_bag_02')
                                            local moneyBag = CreateObject(prop, playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)
                                            AttachEntityToEntity(moneyBag, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
                                            TaskPlayAnim(PlayerPedId(), animDict, "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
                                            FreezeEntityPosition(playerPed, true)

                                            SetModelAsNoLongerNeeded(prop)
                                            RemoveAnimDict(animDict)
                                            
                                            local time = 60 * 1000
                                            exports['progressBars']:startUI(time, 'Tømmer køretøjet')
                                            Citizen.Wait(time)

                                            EndTruckRobbery()
                                            
                                            FreezeEntityPosition(playerPed, false)
                                            ClearPedTasksImmediately(playerPed)

                                            DeleteEntity(moneyBag)

                                            local vehicleBlip = GetBlipFromEntity(truck)
                                            if DoesBlipExist(vehicleBlip) then
                                                RemoveBlip(vehicleBlip)
                                                TargetBlip = nil
                                            end
                                        end
                                    end

                                    if not hasLockpicked then
                                        DrawText3D(pos.x, pos.y, pos.z, 'Tryk ~r~[H]~w~ for at lockpick køretøjet')
            
                                        if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                            Time = GetGameTimer()

                                            ESX.TriggerServerCallback("savanhalastbil:lockpick", function(hasItem)
                                                if hasItem then
                                                    hasTask = true

                                                    local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                                                    RequestAnimDict(animDict)
                                                    while not HasAnimDictLoaded(animDict) do
                                                        RequestAnimDict(animDict)
                                                        Citizen.Wait(10)
                                                    end

                                                    TaskPlayAnim(playerPed, animDict, "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 1, 0, 0, 0)
                                                    FreezeEntityPosition(playerPed, true)

                                                    RemoveAnimDict(animDict)

                                                    TriggerEvent("lockpicking:StartMinigame", 2, function(didWin)
                                                        if didWin then
                                                            hasLockpicked = true
                                                            exports['mythic_notify']:DoHudText('success', 'Låsen er gået op!', 5000)

                                                            SetVehicleDoorOpen(truck, 2, 0, 0)
                                                            SetVehicleDoorOpen(truck, 3, 0, 0)
                                                        else
                                                            exports['mythic_notify']:DoHudText('error', 'Du ødelagde din lockpick!.', 5000)
                                                        end

                                                        FreezeEntityPosition(playerPed, false)
                                                        ClearPedTasksImmediately(playerPed)
                                                        hasTask = false
                                                    end)
                                                else
                                                    exports['mythic_notify']:DoHudText("error", "Du har ikke en lockpick på dig.")
                                                end
                                            end, "lockpick")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

SwitchBlipToArea = function(location)
    if TargetBlipArea == nil then
        CreateBlipArea(location, 'Find køretøjet', 150.0, function(blip)
            RemoveBlip(TargetBlip)
            TargetBlipArea = blip
        end)
    end
end

EndTruckRobbery = function()
    if activeRobbery then
        TriggerServerEvent('SavanhaLastbil:AddReward')

        DeletePed(data["driver"])
        DeletePed(data["passenger"])

        activeRobbery, isSpecialTruck, hasLockpicked, hasTruckSpawned, hasTask = false, false, false, false, false
        TargetBlip, TargetBlipArea = nil, nil

    end
end