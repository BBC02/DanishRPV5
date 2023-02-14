Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

SpawnVehicle = function(model, coords, heading, cb)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0);
    end

    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, true, true)
    while not DoesEntityExist(veh) do
        Wait(0);
    end

    SetEntityAsMissionEntity(veh, true, true)
    SetEntityHeading(veh, heading)
    SetVehicleOnGroundProperly(veh)

    while not NetworkHasControlOfEntity(veh) do
        NetworkRequestControlOfEntity(veh);
        Wait(0);
    end

    while not NetworkGetEntityIsNetworked(veh) do
        NetworkRegisterEntityAsNetworked(veh);
        Wait(0);
    end

    Wait(500)
    SetModelAsNoLongerNeeded(model)

    if cb then
        cb(veh)
    end
end

SpawnPed = function(hash, coords, heading, pedType, cb)
    local start = GetGameTimer()
    RequestModel(hash)
    while not HasModelLoaded(hash) and GetGameTimer() - start < 30000 do
        Wait(0);
    end

    if not HasModelLoaded(hash) then
        return
    end

    local ped = CreatePed(pedType, hash, coords.x, coords.y, coords.z, heading, true, true)

    start = GetGameTimer()
    while not DoesEntityExist(ped) and GetGameTimer() - start < 30000 do
        Wait(0);
    end

    if not DoesEntityExist(ped) then
        return
    end

    SetEntityAsMissionEntity(ped, true, true)
    SetModelAsNoLongerNeeded(hash)

    if cb then
        cb(ped)
    end
end

ClosestVehicle = function(radius)
    local PlayerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local vehicle
    local distance = 0

    if IsPedInAnyVehicle(PlayerPed, false) then
        vehicle = GetVehiclePedIsIn(PlayerPed, false)
    else
        vehicle, distance = ESX.Game.GetClosestVehicle(PlayerCoords)
    end

    if distance ~= -1 and distance <= (radius or 5.0) then
        return true, vehicle, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
    else
        return false, nil, nil
    end
end

DeleteVehicle = function(vehicle)
    if DoesEntityExist(vehicle) then
        ESX.Game.DeleteVehicle(vehicle)
    end
end

CreateBlipRoute = function(coords, text, cb)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipRoute(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)

    if cb then
        cb(blip)
    end

    return blip
end

CreateEntityBlipRoute = function(entity, text)
    local blip = AddBlipForEntity(entity)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)

    if cb then
        cb(blip)
    end
end

CreateBlipArea = function(coords, text, radius, cb)
    local blip = AddBlipForRadius(coords.x, coords.y, coords.z, radius)
    SetBlipColour(blip, 5)
    SetBlipAlpha(blip, 60)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)

    if cb then
        cb(blip)
    end

    return blip
end

DrawTxt = function(text, font, centre, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

DrawText3D = function(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 90)
    end
end

loadAnimDict = function(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces > 0 then
        local mult = 10 ^ numDecimalPlaces
        return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

ValidateJob = function(job)


    if ESX.PlayerData.job.name == job then
        return true
    end
    return false
end

HasValidJob = function()
    for i = 1, #Config.validJobs, 1 do
        if not ValidateJob(Config.validJobs[i]) then
            return true
        end
    end
    return false
end

HasValidGangJob = function()
    for i = 1, #Config.GangJobs, 1 do
        if ValidateJob(Config.GangJobs[i]) then
            return true
        end
    end
    return false
end

AlertAuthorities = function(type, text, maxDistance, number)
    if not type then return end
    if not text then return end
    if not maxDistance then return end
    if not exports.srp_tools:chance(number) then return end

    if isNight() then
        maxDistance = maxDistance * 0.50
    end

    local foundNpc = CheckAwareNPC(maxDistance, true)
    if foundNpc ~= nil then
        Debug("Alerting Authorities " .. type .. " - " .. text)
        TriggerEvent('srp_NPCNOTIFY:remoteMessage', type, 'police', text, foundNpc, 0)
    end
end

isNight = function()
    local hour = GetClockHours()
    if hour > 19 or hour < 5 then
        return true
    end
end

Underground = function()
    local playerCoords = GetEntityCoords(PlayerPedId())
    if playerCoords["z"] < -25 then
        return true
    end
    return false
end

Chance = function(number)
    math.randomseed(GetGameTimer() + math.random(1, 99999))
    local random = math.random(1, 100)

    Debug("Chance : " .. random .. " <= " .. number)

    if random <= number then
        return true
    else
        return false
    end
end

SmallChance = function(number)
    math.randomseed(GetGameTimer() + math.random(1, 99999))
    local random = math.random(1, 1000)

    Debug("Chance : " .. random .. " <= " .. number)

    if random <= number then
        return true
    else
        return false
    end
end

MinimumChance = function(number)
    math.randomseed(GetGameTimer() + math.random(1, 99999))
    local random = math.random(1, 10000)

    if random <= number then
        return true
    else
        return false
    end
end

CheckAwareNPC = function(maxDistance, extDist)
    local maxDistance = maxDistance
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local foundPed = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = #(playerCoords - pos)
        if extDist then
            if IsNpcValid(ped) and distance < maxDistance and (distanceFrom == nil or distance < distanceFrom) then
                distanceFrom = distance
                foundPed = ped
            end
        else
            if ped ~= playerped and distance < maxDistance and (distanceFrom == nil or distance < distanceFrom) then
                distanceFrom = distance
                foundPed = ped
            end
        end
        success, ped = FindNextPed(handle)
    until not success

    EndFindPed(handle)
    return foundPed
end

IsNpcValid = function(ped)
    local playerPed = PlayerPedId()

    if ped == nil then
        return false
    end

    if ped == playerPed then
        return false
    end

    if GetEntityHealth(ped) < GetEntityMaxHealth(ped) then
        return false
    end

    if not HasEntityClearLosToEntity(ped, playerPed, 17) then
        return false
    end

    if not DoesEntityExist(ped) then
        return false
    end

    if IsPedAPlayer(ped) then
        return false
    end

    if IsPedFatallyInjured(ped) then
        return false
    end

    if IsPedArmed(ped, 7) then
        return false
    end

    if IsPedInMeleeCombat(ped) then
        return false
    end

    if IsPedShooting(ped) then
        return false
    end

    if IsPedDucking(ped) then
        return false
    end

    if IsPedBeingJacked(ped) then
        return false
    end

    if IsPedSwimming(ped) then
        return false
    end

    if IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
        return false
    end

    local pedType = GetPedType(ped)
    if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
        return false
    end
    return true
end

ShowNotification = function(msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, true)
end

SetVehicleMaxMods = function(vehicle)
    local props = {
        modEngine = 2,
        modBrakes = 2,
        modTransmission = 2,
        modSuspension = 3,
        modTurbo = true
    }

    ESX.Game.SetVehicleProperties(vehicle, props)
end

DrawBusySpinner = function(text)
    SetLoadingPromptTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    ShowLoadingPrompt(3)
end

loadModel = function(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end

    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

ShowHelpNotification = function(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

StopBusySpinner = function()
    RemoveLoadingPrompt()
end

GetPlayerInSphere = function(camera, size)
    local cameraPosition = GetEntityCoords(camera)
    local forwardPosition = GetOffsetFromEntityInWorldCoords(camera, 0.0, -30.0, -5.55)

    if size == nil then
        size = 2.0
    end

    local rayHandle = StartShapeTestCapsule(cameraPosition.x, cameraPosition.y, cameraPosition.z, forwardPosition.x, forwardPosition.y, forwardPosition.z, size, 8, camera)
    local _, _, _, _, ped = GetShapeTestResult(rayHandle)
    return ped
end
