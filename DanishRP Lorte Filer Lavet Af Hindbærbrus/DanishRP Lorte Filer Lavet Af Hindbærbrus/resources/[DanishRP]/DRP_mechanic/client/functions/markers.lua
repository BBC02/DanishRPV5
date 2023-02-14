RegisterMarkers = function()
    if isMarkerRegisterd then
        return
    end
    
    Citizen.Wait(1000)
    for mekname, meklocation in pairs(Config.MechanicLocations) do
        if meklocation.MecanoActions then
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_action_' .. tostring(mekname),
                pos = meklocation.MecanoActions.Pos,
                scale = vector3(1.5, 1.5, 1.5),
                msg = 'Tryk <b>[E]</b> for at åbne omklædnings menuen',
                control = 'E',
                show3D = false,
                showHTML = true,
                type = 25,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = meklocation.Job,
                action = function()
                    functionHandler('cloakroom', meklocation.Name, '')
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end
        
        if meklocation.BossActions then
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_boss_' .. tostring(mekname),
                pos = meklocation.BossActions.Pos,
                scale = vector3(1.5, 1.5, 1.5),
                msg = 'Tryk <b>[E]</b> for at åbne chef menuen',
                control = 'E',
                show3D = false,
                showHTML = true,
                type = 25,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = meklocation.Job,
                jobGrade = meklocation.BossRank,
                action = function()
                    GenerateMenu(Config.BossMenu)
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end

        if meklocation.VehicleSpawner then
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_spawnvehicle_' .. tostring(mekname),
                pos = meklocation.VehicleSpawner.Pos,
                scale = vector3(1.5, 1.5, 1.5),
                msg = 'Tryk <b>[E]</b> for at åbne køretøjs menuen',
                control = 'E',
                show3D = false,
                showHTML = true,
                type = 25,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = meklocation.Job,
                action = function()
                    GenerateMenu(Config.Vehicles[meklocation.Name], {coords = Config.MechanicLocations[mekname].VehicleSpawnPoint.Pos, heading = Config.MechanicLocations[mekname].VehicleSpawnPoint.Heading, location = mekname})
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end

        if meklocation.VehicleDeleter then
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_deletevehicle_' .. tostring(mekname),
                pos = meklocation.VehicleDeleter.Pos,
                scale = vector3(5.0, 5.0, 5.0),
                msg = 'Tryk <b>[E]</b> for at fjerne køretøjet',
                control = 'E',
                show3D = true,
                showHTML = true,
                type = 25,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = meklocation.Job,
                action = function()
                    local vehicle = GetVehiclePedIsIn(PlayerPedId())

                    if networkControl(vehicle) then
                        if spawnedFlatbed == vehicle then
                            spawnedFlatbed = nil
                        end

                        ESX.Game.DeleteVehicle(vehicle)
                    end
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end
    end

    for _, mek in pairs(Config.Mechanics) do
        for k, v in pairs(Config.Impounds) do
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_impoundvehicle_' .. tostring(k) .. '_' .. mek,
                pos = v,
                scale = vector3(10.0, 10.0, 10.0),
                msg = 'Tryk <b>[E]</b> for at beslaglægge køretøjet',
                control = 'E',
                show3D = false,
                showHTML = true,
                type = 25,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = mek,
                drawDistance = 25.0,
                action = function()
                    if DoesEntityExist(attachedVehicle) then
                        exports.rprogress:Custom({
                            Type = 'linear',
                            Duration = 10000,
                            Width = 300,
                            Height = 35,
                            y = 0.75,
                            Label = "Sætter køretøjet i opbevaring",
                            DisableControls = {
                                Player = true,
                                Vehicle = true
                            },
                            onComplete = function()
                                if networkControl(attachedVehicle) then
                                    ESX.Game.DeleteVehicle(attachedVehicle)
        
                                    if not DoesEntityExist(attachedVehicle) then
                                        attachedVehicle = nil
                                    end
                                end
                            end
                        })
                    end
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end
    end

    for _, mek in pairs(Config.Mechanics) do
        for k, v in pairs(Config.Dealer) do
            TriggerEvent('gridsystem:registerMarker', {
                name = 'mecanic_dealer_' .. tostring(k) .. '_' .. mek,
                pos = v,
                scale = vector3(2.5, 2.5, 2.5),
                msg = 'Tryk <b>[E]</b> for at købe dele',
                control = 'E',
                show3D = false,
                showHTML = true,
                type = -1,
                color = {r = 255, g = 0, b = 0},
                forceExit = true,
                permission = mek,
                drawDistance = 25.0,
                action = function()
                    GenerateMenu(Config.MechanicOrder)
                end,
                onExit = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
            Wait(100)
        end
    end

    isMarkerRegisterd = true
end
