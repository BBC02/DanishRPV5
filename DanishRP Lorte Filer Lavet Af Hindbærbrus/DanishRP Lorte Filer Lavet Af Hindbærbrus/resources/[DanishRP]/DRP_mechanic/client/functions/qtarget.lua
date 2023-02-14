exports.ox_target:addGlobalVehicle({
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lf', 'hub_lf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 0, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 0)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lf', 'hub_lf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 0, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 0)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_lf', 'hub_lf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 0, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 0)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rf', 'hub_rf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 1, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 1)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rf', 'hub_rf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 1, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 1)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_rf', 'hub_rf'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 1, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 1)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lm1', 'hub_lm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 2, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 2)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lm1', 'hub_lm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 2, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 2)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_lm1', 'hub_lm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 2, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 2)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rm1', 'hub_rm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 3, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 3)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rm1', 'hub_rm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 3, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 3)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_rm1', 'hub_rm1'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 3, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 3)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lr', 'hub_lr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 4, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 4)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_lr', 'hub_lr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 4, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 4)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_lr', 'hub_lr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 4, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 4)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rr', 'hub_rr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            if isMechanic then
                return false
            end
            
            return IsVehicleTyreBurst(entity, 5, false)
        end,
        onSelect = function(data)
            fixWheel(data.entity, 5)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Skift Dækket',
        required_item = "tire",
        bones = {'wheel_rr', 'hub_rr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            return IsVehicleTyreBurst(entity, 5, false)
        end,
        onSelect = function(data)
            fixWheelMechanic(data.entity, 5)
        end
    },
    {
        name = 'ox_target:tireActions',
        icon = 'fa-solid fa-tire',
        label = 'Punkter Dæk',
        required_item = "tire",
        bones = {'wheel_rr', 'hub_rr'},
        distance = 1.2,
        canInteract = function(entity, distance, coords, name)
            local ped = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon == -1716189206 or currentWeapon == -1834847097 or currentWeapon == -538741184 then
                if not IsVehicleTyreBurst(entity, 5, false) then
                    return true
                end
            end
            
            return false
        end,
        onSelect = function(data)
            slashTire(data.entity, 5)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-car-wash",
        label = "Vask Køretøjet",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'bumper_f', 'bumper_r', 'bodyshell', 'door_dside_f', 'seat_pside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r', 'bonnet', 'boot'},
        distance = 1.5,
        onSelect = function(data)
            cleanVehicle(data.entity)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-trash-list",
        label = "Fjern køretøjet",
        groups = {['mechanic'] = 0, ['lsc'] = 0, ['police'] = 0},
        bones = {'bumper_f', 'bumper_r', 'bodyshell', 'door_dside_f', 'seat_pside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r', 'bonnet', 'boot'},
        distance = 1.5,
        onSelect = function(data)
            deleteVehicle(data.entity)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-engine",
        label = "Reparer Motor",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'bumper_f', 'bumper_r', 'bodyshell', 'door_dside_f', 'seat_pside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r', 'bonnet', 'boot'},
        distance = 1.5,
        canInteract = function(entity, distance, coords, name)
            local vehicleClass = GetVehicleClass(entity)
            if vehicleClass == 14 or vehicleClass == 15 then
                return true
            end
            
            return insideRepairZone
        end,
        onSelect = function(data)
            fixVehicle(data.entity, 4)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-engine",
        label = "Nød Reparer Motor",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'bumper_f', 'bumper_r', 'bodyshell', 'door_dside_f', 'seat_pside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r', 'bonnet', 'boot'},
        distance = 1.5,
        canInteract = function(entity, distance, coords, name)
            local vehicleClass = GetVehicleClass(entity)
            if vehicleClass == 14 or vehicleClass == 15 then
                return false
            end
            if not insideRepairZone then
                return true
            end
            
            return false
        end,
        onSelect = function(data)
            fixVehicle(data.entity, 5)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-truck-flatbed",
        label = "Sæt på flatbed",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'bumper_f', 'bumper_r', 'bodyshell'},
        distance = 1.5,
        canInteract = function(entity, distance, coords, name)
            if spawnedFlatbed ~= nil and attachedVehicle == nil and spawnedFlatbed ~= entity then
                return true
            end
            
            return false
        end,
        onSelect = function(data)
            attatchDetachFlatbed(data.entity)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-unlock",
        label = "Tving døre åbne",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'door_dside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r'},
        distance = 1.5,
        onSelect = function(data)
            forceOpenVehicle(data.entity)
        end
    },
    {
        name = 'ox_target:mechanicOptions',
        icon = "fa-solid fa-window",
        label = "Fjern solfilm",
        groups = {['mechanic'] = 0, ['lsc'] = 0},
        bones = {'door_dside_f', 'seat_pside_f', 'seat_dside_r', 'seat_pside_r'},
        distance = 1.5,
        onSelect = function(data)
            removeTint(data.entity)
        end
    }
})

exports.qtarget:AddTargetModel(Config.Entities, {
    options = {
        {
            icon = "fa-solid fa-bullseye",
            label = "Fjern objekt",
            job = {['mechanic'] = 0, ['lsc'] = 0},
            action = function(entity)
                deleteObject(entity)
            end
        }
    },
    distance = 2
})

exports.qtarget:Player({
    options = {
        {
            icon = "fa-solid fa-file-lines",
            label = "Giv faktura",
            job = {['lsc'] = 0, ['mechanic'] = 0},
            action = function(entity)
                CreateInvoice(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
            end
        }
    },
    distance = 2
})

ValidateVehicleLock = function(entity)
    if Entity(entity).state.isLocked then
        return true
    end
    
    local isLocked = false
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(entity))
    if IsVehicleNPCVehicle(plate) then
        if not Entity(entity).state.isLockpicked then
            return true
        end
    end
    
    return isLocked
end

IsVehicleNPCVehicle = function(plate)
    local firstTwoChars = string.sub(plate, 1, 2)
    if tonumber(firstTwoChars) then
        return true
    end
    
    return false
end
