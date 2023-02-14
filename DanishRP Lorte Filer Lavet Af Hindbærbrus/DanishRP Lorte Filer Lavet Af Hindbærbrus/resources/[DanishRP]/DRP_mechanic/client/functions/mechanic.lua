forceOpenVehicle = function(vehicle)
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)
    
    local frontVehicle = GetVehicleInFront()

    if vehicle ~= nil then
        frontVehicle = vehicle
    end
    
    if IsPedSittingInAnyVehicle(playerPed) then
        exports['mythic_notify']:DoHudText('error', 'Du kan ikke bruge funktionen når du befinder dig i et køretøj', 5000)
        return
    end
    
    if DoesEntityExist(frontVehicle) then
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 15000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Åbner køretøj",
            Animation = {
                scenario = "WORLD_HUMAN_WELDING",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(frontVehicle) then
                    clearTable(lastVehicle)
                    getVehicleData(frontVehicle)

                    SetVehicleDoorsLocked(frontVehicle, 1)
                    SetVehicleDoorsLockedForAllPlayers(frontVehicle, false)
                    ClearPedTasksImmediately(playerPed)
                        
                    TriggerEvent('vehicle:ForceOpen')
                end
            end
        })
    else
        exports['mythic_notify']:DoHudText('error', 'Der blev ikke fundet et køretøj i nærheden', 5000)
    end
end

fixVehicle = function(vehicle, door)
    local playerPed = GetPlayerPed(-1)
    
    local frontVehicle = GetVehicleInFront()

    if vehicle ~= nil then
        frontVehicle = vehicle
    end

    local engineHealth = GetVehicleEngineHealth(frontVehicle)
    local petrolTank = GetVehiclePetrolTankHealth(frontVehicle)
    local vehicleClass = GetVehicleClass(frontVehicle)

    if engineHealth >= 250.0 and (vehicleClass ~= 14 and vehicleClass ~= 15) then
        if not insideRepairZone then
            exports['mythic_notify']:DoHudText('inform', 'Køretøjet skal på værksted, nød reparation ikke nødvendigt', 5000)
            return
        end
    end
    
    if DoesEntityExist(frontVehicle) then

        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 30000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Reparere køretøjet",
            Animation = {
                scenario = "PROP_HUMAN_BUM_BIN",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onStart = function()
                if door ~= nil then
                    SetVehicleDoorOpen(frontVehicle, door, false)
                end
            end,
            onComplete = function()
                if networkControl(frontVehicle) then
                    clearTable(lastVehicle)
                    getVehicleData(frontVehicle)

                    if door ~= nil then
                        SetVehicleDoorShut(frontVehicle, door, false)
                        Wait(200)
                    end

                    if insideRepairZone then
                        SetVehicleFixed(frontVehicle)
                        SetVehicleEngineHealth(frontVehicle, 1000.0)
                        SetVehicleBodyHealth(frontVehicle, 1000.0)
                        SetVehiclePetrolTankHealth(frontVehicle, 1000.0)
                        
                        SetVehicleDeformationFixed(frontVehicle)
                    else
                        if vehicleClass == 15 or vehicleClass == 14 then
                            SetVehicleFixed(frontVehicle)
                            SetVehicleEngineHealth(frontVehicle, 1000.0)
                            SetVehicleBodyHealth(frontVehicle, 1000.0)
                            SetVehiclePetrolTankHealth(frontVehicle, 1000.0)
                            
                            SetVehicleDeformationFixed(frontVehicle)
                        else
                            SetVehicleFixed(frontVehicle)
                            SetVehicleEngineHealth(frontVehicle, 250.0)
                            --SetVehicleBodyHealth(frontVehicle, 1000.0)
                            SetVehiclePetrolTankHealth(frontVehicle, 1000.0)
                        end
                        
                        --SetVehicleDeformationFixed(frontVehicle)
                    end
                        
                    exports['mythic_notify']:DoHudText('success', 'Køretøjet blev repareret', 5000)
                end
            end
        })
    else
        exports['mythic_notify']:DoHudText('error', 'Der blev ikke fundet et køretøj i nærheden', 5000)
    end
end

cleanVehicle = function(vehicle)
    local playerPed = GetPlayerPed(-1)
    
    local frontVehicle = GetVehicleInFront()

    if vehicle ~= nil then
        frontVehicle = vehicle
    end
    
    if IsPedSittingInAnyVehicle(playerPed) then
        exports['mythic_notify']:DoHudText('error', 'Du kan ikke bruge funktionen når du befinder dig i et køretøj', 5000)
        return
    end
    
    if DoesEntityExist(frontVehicle) then        
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 10000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Rengør køretøjet",
            Animation = {
                scenario = "WORLD_HUMAN_MAID_CLEAN",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(frontVehicle) then
                    clearTable(lastVehicle)
                    getVehicleData(frontVehicle)

                    SetVehicleDirtLevel(frontVehicle, 0.0)
                        
                    exports['mythic_notify']:DoHudText('success', 'Køretøjet blev vasket', 5000)
                end
            end
        })
    else
        exports['mythic_notify']:DoHudText('error', 'Der blev ikke fundet et køretøj i nærheden', 5000)
    end
end

deleteVehicle = function(vehicle)
    local playerPed = GetPlayerPed(-1)
    
    if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 7500,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Sætter køretøjet i opbevaring",
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(vehicle) then
                    clearTable(lastVehicle)
                    getVehicleData(vehicle)

                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        ESX.Game.DeleteVehicle(vehicle)
                        exports['mythic_notify']:DoHudText('success', 'Køretøjet blev sendt i opbevaring', 5000)
                    else
                        exports['mythic_notify']:DoHudText('error', 'Du skal side på føresædet for at bruge denne funktion', 5000)
                    end
                end
            end
        })
    else
        local frontVehicle = GetVehicleInFront()

        if vehicle ~= nil then
            frontVehicle = vehicle
        end
        
        if DoesEntityExist(frontVehicle) then
            exports.rprogress:Custom({
                Type = 'linear',
                Duration = 7500,
                Width = 300,
                Height = 35,
                y = 0.75,
                Label = "Sætter køretøjet i opbevaring",
                Animation = {
                    scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
                },
                DisableControls = {
                    Player = true,
                    Vehicle = true
                },
                onComplete = function()
                    if networkControl(frontVehicle) then
                        clearTable(lastVehicle)
                        getVehicleData(frontVehicle)

                        ESX.Game.DeleteVehicle(frontVehicle)
                        exports['mythic_notify']:DoHudText('success', 'Køretøjet blev send i opbevaring', 5000)
                    end
                end
            })
        else
            exports['mythic_notify']:DoHudText('error', 'Der blev ikke fundet et køretøj i nærheden', 5000)
        end
    end
end

removeTint = function(vehicle)
    exports.rprogress:Custom({
        Type = 'linear',
        Duration = 10000,
        Width = 300,
        Height = 35,
        y = 0.75,
        Label = "Fjerner Solfilm",
        Animation = {
            scenario = "PROP_HUMAN_BUM_BIN",
        },
        DisableControls = {
            Player = true,
            Vehicle = true
        },
        onComplete = function()
            if networkControl(vehicle) then
                clearTable(lastVehicle)
                getVehicleData(vehicle)

                SetVehicleWindowTint(vehicle, 0)
                exports['mythic_notify']:DoHudText('success', 'Fjernet Solfilm', 5000)
            end
        end
    })
end

spawnObject = function(data)    
    local model = data.model
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local x, y, z = table.unpack(coords + forward * 1.0)
    
    ESX.Game.SpawnObject(model, {
        x = x,
        y = y,
        z = z
    }, function(obj)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
    end)
end

deleteObject = function(entity)
    if DoesEntityExist(entity) then
        ESX.Game.DeleteObject(entity)

        if DoesEntityExist(entity) then
            if networkControl(entity) then
                ESX.Game.DeleteObject(entity)
            end
        end
    end
end

deleteObjects = function()
    local trackedEntities = {
        `prop_roadcone02a`,
        `prop_toolchest_01`,
        `prop_mp_arrow_barrier_01`
    }

    local objects        = ESX.Game.GetObjects()
    local objectsInArea  = {}
    
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    for i=1, #objects, 1 do
        local objectsCoords = GetEntityCoords(objects[i])
        local distance      = GetDistanceBetweenCoords(objectsCoords, coords.x, coords.y, coords.z, true)

        if distance <= 20 then
            for j=1, #trackedEntities, 1 do
                local attempt = 0
                if GetEntityModel(objects[i]) == trackedEntities[j] then

                    while not NetworkHasControlOfEntity(objects[i]) and attempt < 100 and DoesEntityExist(objects[i]) do
                        Wait(100)
                        NetworkRequestControlOfEntity(objects[i])
                        attempt = attempt + 1
                    end
                    if DoesEntityExist(objects[i]) and NetworkHasControlOfEntity(objects[i]) then
                        ESX.Game.DeleteObject(objects[i])
                    end
                end
            end
        end
    end
end

billing = function(client)
    CreateInvoice(tostring(GetPlayerServerId(client)))
end
