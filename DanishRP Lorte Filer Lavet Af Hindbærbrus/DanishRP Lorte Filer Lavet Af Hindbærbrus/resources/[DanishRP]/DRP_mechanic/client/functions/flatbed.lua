attatchDetachFlatbed = function(vehicle)
    if spawnedFlatbed ~= nil then
        if attachedVehicle == nil then
            local frontVehicle = GetVehicleInFront()
            
            if IsPedAPlayer(GetPedInVehicleSeat(frontVehicle, -1)) then
                return
            end
            
            if vehicle ~= nil then
                frontVehicle = vehicle
            end

            if frontVehicle ~= spawnedFlatbed then
                attatchToFlatbed(frontVehicle)
            end
        else
            local playerPed = PlayerPedId()

            if not IsPedAPlayer(GetPedInVehicleSeat(attachedVehicle, -1)) then
                if GetPedInVehicleSeat(spawnedFlatbed, -1) == playerPed then
                    detachFromFlatbed()
                else
                    exports['mythic_notify']:DoHudText('error', 'Sæt dig på føresædet af flatbeden for at tage køretøjet af', 5000)
                end
            end
        end
    else
        exports['mythic_notify']:DoHudText('error', 'Der er ingen flatbed registreret til dig', 5000)
    end
end

attatchToFlatbed = function(vehicle)
    local flatbedCoords = GetEntityCoords(spawnedFlatbed)
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = GetDistanceBetweenCoords(vehicleCoords, flatbedCoords.x, flatbedCoords.y, flatbedCoords.z, true)

    local towOffset = GetOffsetFromEntityInWorldCoords(spawnedFlatbed, 0.0, -2.2, 0.4)
    local towRot = GetEntityRotation(spawnedFlatbed, 1)
    
    local vehicleHeightMin, vehicleHeightMax = GetModelDimensions(GetEntityModel(vehicle))
    
    if distance <= 15 then
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 10000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Sætter køretøjet på flatbed",
            Animation = {
                scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(spawnedFlatbed) then
                    networkControl(vehicle)
                end
                
                AttachEntityToEntity(vehicle, spawnedFlatbed, GetEntityBoneIndexByName(spawnedFlatbed, "scoop"), 0.0, -2.0, vehicleHeightMin.z + 1.5, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                attachedVehicle = vehicle
            end
        })
    else
        exports['mythic_notify']:DoHudText('error', 'Flatbeden er for langt væk', 5000)
    end
end

detachFromFlatbed = function()
    local towOffset = GetOffsetFromEntityInWorldCoords(spawnedFlatbed, 0.0, -14.5, 0.0)

    exports.rprogress:Custom({
        Type = 'linear',
        Duration = 10000,
        Width = 300,
        Height = 35,
        y = 0.75,
        Label = "Tager køretøj af flatbed",
        DisableControls = {
            Player = true,
            Vehicle = true
        },
        onComplete = function()
            if networkControl(spawnedFlatbed) then
                if networkControl(attachedVehicle) then
                    DetachEntity(attachedVehicle, false, false)
                    SetEntityCoords(attachedVehicle, towOffset.x, towOffset.y, towOffset.z, 1, 0, 0, 1)
                    PlaceObjectOnGroundProperly(attachedVehicle)
                    
                    attachedVehicle = nil
                end
            end
        end
    })
end

impoundVehicle = function()
    if networkControl(vehicle) then
        ESX.Game.DeleteVehicle(vehicle)
        
        if not DoesEntityExist(attachedVehicle) then
            attachedVehicle = nil
        end
    end
end
