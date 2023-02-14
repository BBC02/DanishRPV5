ESX = nil
remoteObject = nil

isMechanic = false
isMarkerRegisterd = false
isBusy = false
insideRepairZone = false
isPedSpawned = false

spawnedFlatbed = nil
attachedVehicle = nil

lastVehicle = {}

peds = {}

PedLocation = vector4(2400.73,3124.38,47.2, 151.5)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()
    
    if not isPedSpawned then
        local coords = vector3(PedLocation.x, PedLocation.y, PedLocation.z)
        local ped = CreatePed(`s_m_y_xmech_01`, coords, PedLocation.w)

        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)

        isPedSpawned = true
        table.insert(peds, ped)
    end

    if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lsc' then
        isMechanic = true
        
        Init(ESX.PlayerData.job.name)
        return
    end
    
    isMechanic = false
end)

-- Create Blips
Citizen.CreateThread(function()
    for k, v in pairs(Config.MechanicLocations) do
        local blip = AddBlipForCoord(v.MecanoActions.Pos.x, v.MecanoActions.Pos.y, v.MecanoActions.Pos.z)
        SetBlipSprite(blip, 402)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 1.6)
        if v.Job == 'mecano' then
            SetBlipColour(blip, 3)
        else
            SetBlipColour(blip, 7)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job

    RemoveRegisteredPolyZones()
    
    if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lsc' then
        isMechanic = true
        
        Init(ESX.PlayerData.job.name)
        return
    end
    
    isMechanic = false
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        for i = 1, #peds, 1 do
            DeletePed(peds[i])
        end
	end
end)

Init = function(mechanic)
    RegisterMarkers()
    StartMecanoMenu()
    --StartFlatbedFlipDetection()
    RegisterPolyZone(mechanic)
    InitBilling()
end

StartMecanoMenu = function()
    Citizen.CreateThread(function()
        while isMechanic do
            Citizen.Wait(0)
            
            if IsControlJustReleased(0, 167) then
                GenerateMenu(Config.MecanoMenu)
            end
        end
    end)
end

-- StartFlatbedFlipDetection = function()
--     Citizen.CreateThread(function()
--         while isMehanic do
--             Wait(100)
--             if spawnedFlatbed ~= nil then
--                 if attachedVehicle ~= nil then
--                     if IsEntityUpsidedown(spawnedFlatbed) then
--                         if networkControl(spawnedFlatbed) then
--                             if networkControl(attachedVehicle) then
--                                 DetachEntity(attachedVehicle, false, false)
--                                 SetEntityCoords(attachedVehicle, towOffset.x, towOffset.y, towOffset.z, 1, 0, 0, 1)
--                                 PlaceObjectOnGroundProperly(attachedVehicle)
                                
--                                 attachedVehicle = nil
--                                 spawnedFlatbed = nil
--                             end
--                         end
--                     end
--                 end
--             else
--                 Wait(5000)
--             end
--         end
--     end)
-- end
