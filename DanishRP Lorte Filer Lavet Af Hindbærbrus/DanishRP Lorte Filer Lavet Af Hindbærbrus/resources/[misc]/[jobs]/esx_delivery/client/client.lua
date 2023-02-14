local insideLocker = false
local insideSpawn = false
local isOnDuty = false
local inVeh = false
local workVehicle = nil
local isDelivering = false
local notified = false
local vehiclePayment = 0

local strings = {
    lockerAction = '[E] - Klædeskab',
    vehSpawnAction = '[E] - Køretøjer',
    vehSpawnReturn = '[E] - Aflever køretøjet',
    trunkAction = '[E] - Tag pakke',
    doorAction = '[E] - Aflever pakke'
}

Citizen.CreateThread(function()
	while securityToken == nil do
		Citizen.Wait(100)
	end
end)

PlayerData = {}
ESX = nil

-- PolyZones
local lockerZone = BoxZone:Create(
    vector3(Config.Zones.Locker.x,Config.Zones.Locker.y, Config.Zones.Locker.z),
    Config.Zones.Locker.length, Config.Zones.Locker.width, {
    name = 'luke_maildelivery:Locker',
    heading = 0,
    --debugPoly = true,
    minZ = Config.Zones.Locker.minZ,
    maxZ = Config.Zones.Locker.maxZ
})

local vehSpawnZone = BoxZone:Create(
    vector3(Config.Zones.VehSpawn.x,Config.Zones.VehSpawn.y, Config.Zones.VehSpawn.z),
    Config.Zones.VehSpawn.length, Config.Zones.VehSpawn.width, {
    name = 'luke_maildelivery:VehicleSpawn',
    heading = Config.Zones.VehSpawn.heading,
    --debugPoly = true,
    minZ = Config.Zones.VehSpawn.minZ,
    maxZ = Config.Zones.VehSpawn.maxZ
})

local depotZone = CircleZone:Create(
    vector3(Config.Zones.Depot.x, Config.Zones.Depot.y, Config.Zones.Depot.z),
    Config.Zones.Depot.rad, {
        name = 'luke_maildelivery:Depot',
        useZ = true,
        --debugPoly = true
    }
)

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(PlayerData)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if job ~= nil then
        if PlayerData == nil then
            PlayerData = ESX.GetPlayerData()
        end
    end

    PlayerData.job = job

    if PlayerData.job.name == 'mail' then
        hasJob = true
        LockerBlip()
    else
        hasJob = false
        RemoveBlip(lockerBlip)
        return
    end
end)

-- Job checking thread 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
        if ESX ~= nil then
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job ~= nil and PlayerData.job.name == 'mail' then
                LockerBlip()
                hasJob = true
                break
            else
                hasJob = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)

        insideDepot = depotZone:isPointInside(playerCoords)
        
        if isDelivering then
            insideDeliveryArea = deliveryArea:isPointInside(GetEntityCoords(workVehicle))
            if not notified and insideDeliveryArea then
                ESX.ShowHelpNotification("Du er tæt på adressen. Du kan nu gå om bagved og aflevere pakken.")
                notified = true
            end
        end
    end
end)

-- Checking if the player is inside various zones
Citizen.CreateThread(function()
    lockerZone:onPlayerInOut(function(isPointInside, point)
        insideLocker = isPointInside
        if insideLocker and hasJob then
            TriggerEvent('luke_textui:ShowUI', strings.lockerAction)
        else
            TriggerEvent('luke_textui:HideUI')
        end
    end)

    vehSpawnZone:onPlayerInOut(function(isPointInside, point)
        insideSpawn = isPointInside
        if insideSpawn then
            inVeh = IsPedInAnyVehicle(playerPed, false)
            if not inVeh and isOnDuty then
                TriggerEvent('luke_textui:ShowUI', strings.vehSpawnAction)
            else
                TriggerEvent('luke_textui:ShowUI', strings.vehSpawnReturn)
            end
        else
            TriggerEvent('luke_textui:HideUI')
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        if insideDepot and hasJob then
            wait = 5
            if isOnDuty then
                DrawMarker(2, Config.Zones.Locker.x, Config.Zones.Locker.y, Config.Zones.Locker.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 243, 239, 27, 100, false, false, 2, true)
                DrawMarker(2, Config.Zones.VehSpawn.x, Config.Zones.VehSpawn.y, Config.Zones.VehSpawn.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 243, 239, 27, 100, false, false, 2, true)
            else
                DrawMarker(2, Config.Zones.Locker.x, Config.Zones.Locker.y, Config.Zones.Locker.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 243, 239, 27, 100, false, false, 2, true)
            end

            if insideLocker or insideSpawn then
                if IsControlJustReleased(0, 51) then
                    if insideLocker then
                        TriggerEvent('luke_maildelivery:LockerMenu')
                    else
                        if not IsPedInAnyVehicle(playerPed, false) then
                            TriggerEvent('luke_maildelivery:VehicleMenu')
                        elseif GetVehiclePedIsIn(playerPed, false) == workVehicle then
                            DeleteWorkVehicle()
                        end
                    end
                end
            end
        else
            wait = 500
        end
        Citizen.Wait(wait)
    end
end)

RegisterNetEvent('luke_maildelivery:EndDeliveryHandle')
AddEventHandler('luke_maildelivery:EndDeliveryHandle', function(continue)
    if continue then
        StartDelivery(deliveryPoints)
    else
        SetBlipRoute(returnBlip, true)
    end
end)

RegisterNetEvent('luke_maildelivery:DutyHandle')
AddEventHandler('luke_maildelivery:DutyHandle', function(duty)
    if duty then
        isOnDuty = true
        GarageBlip()
        if Config.EnableWorkClothes then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                if skin.model == "mp_m_freemode_01" then

                    exports['fivem-appearance']:setPedComponents(PlayerPedId(), {Config.WorkClothes.skin_male.torso, Config.WorkClothes.skin_male.undershirt, Config.WorkClothes.skin_male.pants})
                    -- TriggerEvent('skinchanger:loadClothes', skin, Config.WorkClothes.skin_male)
                else
                    TriggerEvent('skinchanger:loadClothes', skin, Config.WorkClothes.skin_female)
                end
            end)
        end
    else
        isOnDuty = false
        RemoveBlip(returnBlip)
        RemoveBlip(garageBlip)
        if Config.EnableWorkClothes then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        end
    end
end)

RegisterNetEvent('luke_maildelivery:VehicleHandle')
AddEventHandler('luke_maildelivery:VehicleHandle', function(vehicle)
    if workVehicle == nil then
        RequestModel(Config.Vehicles[vehicle].name)
        while not HasModelLoaded(Config.Vehicles[vehicle].name) do
            Citizen.Wait(10)
        end
        workVehicle = CreateVehicle(Config.Vehicles[vehicle].name, Config.Zones.VehSpawn.x, Config.Zones.VehSpawn.y, Config.Zones.VehSpawn.z, Config.Zones.VehSpawn.vehHeading, true, false)
        SetModelAsNoLongerNeeded(Config.Vehicles[vehicle].name)
        TaskWarpPedIntoVehicle(playerPed, workVehicle, -1)
        SetVehicleLivery(workVehicle, 3)
        TriggerEvent('luke_textui:HideUI')

        TriggerEvent('luke_textui:ShowUI', strings.vehSpawnReturn)

        RemoveBlip(garageBlip)
        ReturnBlip()
        local plate = GetVehicleNumberPlateText(workVehicle)
        local name = GetLabelText(workVehicle)
        exports['t1ger_keys']:GiveTemporaryKeys(plate, "Postnord")
        deliveryPoints = Config.Vehicles[vehicle].delivery

        vehiclePayment = Config.Vehicles[vehicle].pay

        StartDelivery(deliveryPoints)

    else
        ESX.ShowNotification("Du har allerede et køretøj ud.")
    end
end)

RegisterNetEvent('luke_maildelivery:VehicleMenu')
AddEventHandler('luke_maildelivery:VehicleMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = 'Vælg Rute',
            txt = ''
        }
    })
    for k, v in ipairs(Config.Vehicles) do
        TriggerEvent('nh-context:sendMenu', {
            {
                id = k,
                header = v.label,
                txt = v.desc,
                params = {
                    event = 'luke_maildelivery:VehicleHandle',
                    args = k
                }
            }
        })
    end
end)

RegisterNetEvent('luke_maildelivery:LockerMenu')
AddEventHandler('luke_maildelivery:LockerMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = 'Arbejde',
            txt = ''
        },
        {
            id = 1,
            header = 'Gå på arbejde',
            txt = 'Start med at levere pakker',
            params = {
                event = 'luke_maildelivery:DutyHandle',
                args = true
            }
        },
        {
            id = 2,
            header = 'Gå af arbejde',
            txt = 'Færdig for idag?',
            params = {
                event = 'luke_maildelivery:DutyHandle',
                args = false
            }
        }
    })
end)

function StartDelivery(deliveries)
    isDelivering = true
    math.randomseed(GetGameTimer())
    local randomDelivery = deliveries[math.random(#deliveries)]

    ESX.ShowHelpNotification("Kør til adressen og aflever pakken.")
    
    deliveryArea = CircleZone:Create(
        vector3(randomDelivery.x, randomDelivery.y, randomDelivery.z),
        50.0, {
        name = 'luke_maildelivery:DeliveryArea',
        useZ = true,
        --debugPoly = true
    })

    deliveryZone = BoxZone:Create(
        vector3(randomDelivery.x, randomDelivery.y, randomDelivery.z),
        2.0, 2.0, {
        name = 'luke_maildelivery:DeliveryZone',
        minZ = randomDelivery.z-1,
        maxZ = randomDelivery.z + 3,
        --debugPoly = true
    })

    deliveryZone:onPlayerInOut(function(isPointInside, point)
        insideDelivery = isPointInside
        if insideDelivery then
            TriggerEvent('luke_textui:ShowUI', strings.doorAction)
        else
            TriggerEvent('luke_textui:HideUI')
        end
    end)

    DeliveryBlip(randomDelivery)

    while isDelivering == true do
        local wait
        if insideDeliveryArea then
            wait = 5
            DrawMarker(2, randomDelivery.x, randomDelivery.y, randomDelivery.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 243, 239, 27, 100, false, false, 2, true)
            if not zoneCreated and not IsPedInVehicle(playerPed, workVehicle, false) then
                zoneCreated = true
                FreezeEntityPosition(workVehicle, true)

                local plate = GetVehicleNumberPlateText(workVehicle)
                local vehicleDimensions = GetModelDimensions(GetEntityModel(workVehicle))*1.2
                local trunkCoords = GetEntityCoords(workVehicle) + (GetEntityForwardVector(workVehicle)*vehicleDimensions.y)

                vehicleBack = BoxZone:Create(trunkCoords, 2.0, 2.0, {name = 'luke_maildelivery:VehicleTrunk', debugPoly = false})

                vehicleBack:onPlayerInOut(function(isPointInside, point)
                    insideTrunk = isPointInside
                    if insideTrunk then
                        TriggerEvent('luke_textui:ShowUI',  strings.trunkAction)
                    else
                        TriggerEvent('luke_textui:HideUI')
                    end
                end)

            end
            if insideTrunk or insideDelivery then
                local doorOpened = false
                if not doorOpened and not hasBox then
                    doorOpened = true

                    SetVehicleDoorOpen(workVehicle, 3, false, false)
                    SetVehicleDoorOpen(workVehicle, 2, false, false)
                end
                if IsControlJustReleased(0, 51) then
                    if insideTrunk and not hasBox then
                        hasBox = true

                        RequestAnimDict("anim@heists@box_carry@")
                        while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 1.0, -1, 63, 1, false, false, false)
                        Citizen.Wait(500)

                        AttachBox()
                        
                        SetVehicleDoorShut(workVehicle, 3, false, false)
                        SetVehicleDoorShut(workVehicle, 2, false, false)
                    elseif insideDelivery and hasBox then
                        isDelivering = false
                        hasBox = false

                        DeleteEntity(boxModel)
                        ClearPedTasks(playerPed)
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.Wait(3500)
                        ClearPedTasks(playerPed)
                        FreezeEntityPosition(workVehicle, false)

                        vehicleBack:destroy()
                        deliveryArea:destroy()
                        deliveryZone:destroy()

                        insideDelivery = false

                        RemoveBlip(deliveryBlip)

                        TriggerEvent('luke_textui:HideUI')

                        EndDelivery(vehiclePayment)

                        zoneCreated = false
                        insideDeliveryArea = false
                        notified = false
                    end
                end
            end
        else
            wait = 500
        end
        Citizen.Wait(wait)
    end

end

function EndDelivery(payment)
    TriggerServerEvent('luke_maildelivery:Payment', payment, securityToken)

    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = 'Arbejde færdiggjort',
            txt = '',
        },
        {
            id = 1,
            header = 'Arbejde videre',
            txt = 'Få en ny levering',
            params = {
                event = 'luke_maildelivery:EndDeliveryHandle',
                args = true
            }
        },
        {
            id = 2,
            header = 'Kør tilbage til depotet',
            txt = 'Kør tilbage til depotet og bliv færdig for idag',
            params = {
                event = 'luke_maildelivery:EndDeliveryHandle',
                args = false
            }
        }
    })
end

function AttachBox()
    local box = GetHashKey('v_serv_abox_04')

    RequestModel(box)
  
    local bone = GetPedBoneIndex(playerPed, 28422)
  
    while not HasModelLoaded(box) do
      Citizen.Wait(0)
    end

    SetModelAsNoLongerNeeded(box)
  
    boxModel = CreateObject(box, 0, 0, 0, true, true, false)
    AttachEntityToEntity(boxModel, playerPed, bone, 0.0, 0.0, -0.2, 90.0, 270.0, 90.0, 0.0, false, false, false, true, 2, true)
end

function DeleteWorkVehicle()
    TaskLeaveVehicle(playerPed, workVehicle, 0)
    Citizen.Wait(2000)
    DeleteEntity(workVehicle)

    workVehicle = nil

    TriggerEvent('luke_textui:HideUI')

    RemoveBlip(returnBlip)
    GarageBlip()
end

function DeliveryBlip(coords)
    if DoesBlipExist(deliveryBlip) then
        return
    else
        deliveryBlip = AddBlipForCoord(coords.x, coords.y, coords.z)

        SetBlipScale(deliveryBlip, 1.0)
        SetBlipColour(deliveryBlip, 5)
        SetBlipDisplay(deliveryBlip, 2)
        SetBlipAsShortRange(deliveryBlip, false)
        SetBlipRoute(deliveryBlip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Postnord')
        EndTextCommandSetBlipName(deliveryBlip)
    end
end

function LockerBlip()
    if DoesBlipExist(lockerBlip) then
        return
    else
        lockerBlip = AddBlipForCoord(Config.Zones.Locker.x, Config.Zones.Locker.y, Config.Zones.Locker.z)

        SetBlipSprite(lockerBlip, 78)
        SetBlipScale(lockerBlip, 0.9)
        SetBlipColour(lockerBlip, 5)
        SetBlipDisplay(lockerBlip, 2)
        SetBlipAsShortRange(lockerBlip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Postnord klædeskab')
        EndTextCommandSetBlipName(lockerBlip)
    end
end

function GarageBlip()
    if DoesBlipExist(garageBlip) then
        return
    else
        garageBlip = AddBlipForCoord(Config.Zones.VehSpawn.x, Config.Zones.VehSpawn.y, Config.Zones.VehSpawn.z)

        SetBlipSprite(garageBlip, 67)
        SetBlipScale(garageBlip, 0.7)
        SetBlipColour(garageBlip, 5)
        SetBlipDisplay(garageBlip, 2)
        SetBlipAsShortRange(garageBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Postnord køretøjer')
        EndTextCommandSetBlipName(garageBlip)
    end
end

function ReturnBlip()
    if DoesBlipExist(returnBlip) then
        return
    else
        returnBlip = AddBlipForCoord(Config.Zones.VehSpawn.x, Config.Zones.VehSpawn.y, Config.Zones.VehSpawn.z)

        SetBlipSprite(returnBlip, 50)
        SetBlipScale(returnBlip, 0.7)
        SetBlipColour(returnBlip, 5)
        SetBlipDisplay(returnBlip, 2)
        SetBlipAsShortRange(returnBlip, true)
      
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Aflever postnord køretøj')
        EndTextCommandSetBlipName(returnBlip)
    end
end
