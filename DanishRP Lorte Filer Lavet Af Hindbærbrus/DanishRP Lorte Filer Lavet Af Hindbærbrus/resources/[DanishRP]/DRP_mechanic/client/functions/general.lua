functionHandler = function(command, data, meta)
    if isBusy then
        return
    end
    
    if command == 'cloakroom' then
        Cloakroom(data)
    end
    
    if command == 'vehicle' then
        spawnVehicle(data, meta)
    end
    
    if command == 'attach_detach_flatbed' then
        attatchDetachFlatbed()
    end
    
    if command == 'force_open_vehicle' then
        forceOpenVehicle()
    end
    
    if command == 'fix_vehicle' then
        fixVehicle()
    end
    
    if command == 'clean_vehicle' then
        cleanVehicle()
    end
    
    if command == 'delete_vehicle' then
        deleteVehicle()
    end
    
    if command == 'spawn_object' then
        spawnObject(data)
    end
    
    if command == 'delete_props_zone' then
        deleteObjects()
    end
    
    if command == 'billing' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        BillingSelectPlayer(GetPlayerFromServerId(closestPlayer))
    end
    
    if command == 'call_list' then
        TriggerServerEvent("omik_callist:openCallist")
    end
    
    if command == 'boss' then
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsc' then
            TriggerEvent('esx_society:openBossMenu', 'lsc', function(data, menu)
                menu.close()
            end)
        elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
            TriggerEvent('esx_society:openBossMenu', 'mecano', function(data, menu)
                menu.close()
            end)
        end
    end
end

setUniform = function(job, playerPed)
    TriggerEvent("skinchanger:getSkin", function(skin)
        if skin.sex == 0 then
            if job ~= nil then
                TriggerEvent("skinchanger:loadClothes", skin, job)
            else
                ESX.ShowNotification(_U("no_outfit"))
            end
        end
        
        if skin.sex ~= 0 then
            if job ~= nil then
                TriggerEvent("skinchanger:loadClothes", skin, job)
            else
                ESX.ShowNotification(_U("no_outfit"))
            end
        end
    end)
end

spawnVehicle = function(data, meta)
    coords = meta.coords
    heading = meta.heading
    
    if data.model == 'flatbed' then
        coords = Config.MechanicLocations[meta.location].FlatBed.SpawnPoint
        heading = Config.MechanicLocations[meta.location].FlatBed.Heading
    end
    
    ESX.Game.SpawnVehicle(data.model, coords, heading, function(vehicle)
        local playerPed = PlayerPedId()
        
        if data.vehicleProperies then
            ESX.Game.SetVehicleProperties(vehicle, json.decode(data.vehicleProperies))
        end
                
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        
        if data.primaryColor and data.secondaryColor and not data.vehicleProperies then
            SetVehicleColours(vehicle, data.primaryColor, data.secondaryColor)
        end
        
        if data.livery and not data.vehicleProperies then
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 48, data.livery, false)
            SetVehicleLivery(vehicle, data.livery)
        end
        
        if data.model == 'flatbed' then
            spawnedFlatbed = vehicle
        end
        
        exports["LegacyFuel"]:SetFuel(vehicle, 100)
        local plate = GetVehicleNumberPlateText(vehicle)
        exports['t1ger_keys']:GiveTemporaryKeys(plate, "")
    end)
end