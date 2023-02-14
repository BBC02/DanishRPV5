local setupRace = {}
local isSettingUp = false

local startObjects = {}
local raceObjects = {}

local startModel = "prop_beachflag_le"
local tyreModel = "prop_offroad_tyres02"

local isRacing = false
local showCD = false

local activeRaceID = 0
local checkPoints = {}
local checkPointID = 0

local previousLap = 1

local racingBlips = {}
local previewBlips = {}

StartTeamRace = function(raceID, maxPositions, maxLaps)
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(playerPed, false) then
        return
    end

    for i=1, #racingBlips, 1 do
        RemoveBlip(racingBlips[i])
    end

    for i=1, #previewBlips, 1 do
        RemoveBlip(previewBlips[i])
    end

    activeRaceID = raceID
    local race = GetRaceByID(activeRaceID)
    local leftCoords = vector3(race["start"]["left"].x, race["start"]["left"].y, race["start"]["left"].z)
    local midCoords = vector3(race["start"]["middle"].x, race["start"]["middle"].y, race["start"]["middle"].z)
    local rightCoords = vector3(race["start"]["right"].x, race["start"]["right"].y, race["start"]["right"].z)

    SpawnLocalObject(startModel, leftCoords, (race["start"]["heading"] - 225.0), function(obj)
        FreezeEntityPosition(obj, true)
        table.insert(startObjects, obj)
    end)

    SpawnLocalObject(startModel, rightCoords, (race["start"]["heading"] - 45.0), function(obj)
        FreezeEntityPosition(obj, true)
        table.insert(startObjects, obj)
    end)

    CreateBlipRoute(309, 4, midCoords, 0, true, function(blip)
        table.insert(racingBlips, blip)
    end)

    SetupCheckspoint(race)

    SendNUIMessage({
        showRaceStats = true,
    })

    Citizen.Wait(500)

    previousLap = 1

    SendNUIMessage({
        SyncRaceStats = true,
        position = maxPositions,
        maxPosition = maxPositions,
        lap = 1,
        maxLap = maxLaps,
        checkpoint = 1,
        maxCheckpoints = GetMaxCheckPoints(activeRaceID),
    })

    Citizen.CreateThread(function()
        while not isRacing do
            Wait(0);
        end

        SendNUIMessage({
            startRacing = isRacing,
            activeRaceID = activeRaceID,
        })

        StartDensityModifier()

        while isRacing do
            playerPed = PlayerPedId()

            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local driver = GetPedInVehicleSeat(vehicle, -1)

                if driver == playerPed then
                    if checkPointID ~= nil and checkPointID ~= 0 then
                        local locations = checkPoints[activeRaceID]["locations"]
                        local vehicleCoords = GetEntityCoords(vehicle)

                        for id, checkPoint in pairs(locations) do
                            if not checkPoint.isStart then
                                local distance = #(vehicleCoords - checkPoint.pos)

                                if distance <= 200.0 then
                                    local cc = math.abs(checkPointID - id)
                                    if cc <= 5 then
                                        if isTableEmpty(checkPoint.objects) then
                                            SpawnLocalObject(tyreModel, checkPoint.left, checkPoint.heading, function(obj)
                                                table.insert(checkPoint.objects, obj)
                                                table.insert(raceObjects, obj)
                                            end)
            
                                            SpawnLocalObject(tyreModel, checkPoint.right, checkPoint.heading, function(obj)
                                                table.insert(checkPoint.objects, obj)
                                                table.insert(raceObjects, obj)
                                            end)
                                        end
                                    end
                                end

                                if distance > 200.0 then
                                    if not isTableEmpty(checkPoint.objects) then
                                        for i = 1, #checkPoint.objects, 1 do
                                            DeleteEntity(checkPoint.objects[i])
                                        end

                                        checkPoint.objects = {}
                                    end
                                end
                            end
                        end
                    end
                end
            end

            Citizen.Wait(500)
        end
    end)
end

local trafficDensity = 0.1
local pedDensity = 0.1

StartDensityModifier = function()
    Citizen.CreateThread(function()
        while isRacing do
            SetVehicleDensityMultiplierThisFrame(trafficDensity)
            SetPedDensityMultiplierThisFrame(pedDensity)
            SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
            SetParkedVehicleDensityMultiplierThisFrame(trafficDensity)
            SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity)
            
            Citizen.Wait(0)
        end
    end)
end

RegisterNetEvent('drp_racing:startRace')
AddEventHandler('drp_racing:startRace', function(raceID, maxPositions, maxLaps)
    StartTeamRace(raceID, maxPositions, maxLaps)
end)

RegisterNetEvent('drp_racing:syncRace')
AddEventHandler('drp_racing:syncRace', function(raceID, points, lap, maxLaps)
    local isNewLap = previousLap < lap
    checkPointID = points

    if not isNewLap then
        Debug("syncRace - IsNewLap: false Points: " .. points .. " Lap: " .. lap)

        SendNUIMessage({
            SyncRaceStats = true,
            checkpoint = points,
            lap = lap,
        })
    end

    if isNewLap then
        Debug("syncRace - IsNewLap: true Points: " .. points .. " Lap: " .. lap)

        SendNUIMessage({
            newLap = true,
            checkpoint = points,
            lap = lap,
        })

        previousLap = lap
    end

    HandleBlips(raceID, points, lap, maxLaps, isNewLap)
end)

RegisterNetEvent('drp_racing:syncPosition')
AddEventHandler('drp_racing:syncPosition', function(racePosition)
    SendNUIMessage({
        SyncRaceStats = true,
        position = racePosition,
    })
end)

RegisterNetEvent('drp_racing:raceStarted')
AddEventHandler('drp_racing:raceStarted', function(raceID)
    local race = GetNuiRaceByID(raceID)
    if race == nil then
        return
    end
    
    race["isActive"] = true

    SendNUIMessage({
        refreshRaces = true,
        Races = nuiRaces,
    })
end)

RegisterNetEvent('drp_racing:toggleReady')
AddEventHandler('drp_racing:toggleReady', function(raceID, membersReady)
    local race = GetNuiRaceByID(raceID)
    if race == nil then
        return
    end

    race["membersReady"] = membersReady

    SendNUIMessage({
        refreshRaces = true,
        Races = nuiRaces,
    })
end)

RegisterNetEvent('drp_racing:raceStopped')
AddEventHandler('drp_racing:raceStopped', function(raceID, bestTimes)
    local race = GetNuiRaceByID(raceID)
    if race == nil then
        return
    end
    
    race["isActive"] = false
    race["bestTimes"] = bestTimes
    race["membersReady"] = {}

    SendNUIMessage({
        refreshRaces = true,
        Races = nuiRaces,
    })
end)

RegisterNetEvent('drp_racing:stopRace')
AddEventHandler('drp_racing:stopRace', function(raceID)
    StopRace(raceID, false)
end)

RegisterNetEvent('drp_racing:forceStopRace')
AddEventHandler('drp_racing:forceStopRace', function(raceID)
    StopRace(raceID, true)

    Citizen.Wait(10000)

    SendNUIMessage({
        hideRaceStats = true
    })
end)

RegisterNetEvent('drp_racing:exitRace')
AddEventHandler('drp_racing:exitRace', function(raceID)
    StopRace(raceID, true)

    Citizen.Wait(10000)

    SendNUIMessage({
        hideRaceStats = true
    })
end)

RegisterNetEvent('drp_teams:sendCountdown')
AddEventHandler('drp_teams:sendCountdown', function(time)
    showCD = true
    showCountdown(time)

    while showCD do
        Wait(0);
    end

    isRacing = true
end)

RegisterNetEvent('drp_racing:racesetup')
AddEventHandler('drp_racing:racesetup', function()
    RaceSetupFunction()
end)

RegisterNetEvent('drp_racing:raceCreate')
AddEventHandler('drp_racing:raceCreate', function(newRace)
    table.insert(Races, newRace)

    local nuiRaces = {}
    for k,v in pairs(Races) do
        nuiRaces[k] = {}
        nuiRaces[k]["id"] = v.id
        nuiRaces[k]["name"] = v.name
        nuiRaces[k]["isOpen"] = false
        nuiRaces[k]["isActive"] = v.isActive
        nuiRaces[k]["bestTimes"] = v.bestTimes
        nuiRaces[k]["membersReady"] = v.membersReady
        nuiRaces[k]["whitelistedJobs"] = v.whitelistedJobs
    end

    SendNUIMessage({
        refreshRaces = true,
        Races = nuiRaces,
    })
end)

RegisterNUICallback('setGPS', function(data, cb)
    local raceID = tonumber(data["raceID"])
    local race = GetRaceByID(raceID)

    local startPos = race["start"]
    SetNewWaypoint(startPos["middle"].x, startPos["middle"].y)

    cb('ok')
end)

RegisterNUICallback('previewRace', function(data, cb)
    local raceID = tonumber(data["raceID"])
    local race = GetRaceByID(raceID)

    for i=1, #previewBlips, 1 do
        RemoveBlip(previewBlips[i])
    end

    for k,v in pairs(race.locations) do
        local middleLocation = vector3(v.middle.x, v.middle.y, v.middle.z)

        CreateBlip(0, 0, middleLocation, k, function(blip)
            table.insert(previewBlips, blip)
        end)
    end

    local middleStartLocation = vector3(race["start"]["middle"].x, race["start"]["middle"].y, race["start"]["middle"].z)
    CreateBlip(309, 4, middleStartLocation, 0, function(blip)
        table.insert(previewBlips, blip)
    end)

    exports['mythic_notify']:SendAlert('inform', 'Preview er aktiv de næste 60 sekunder!', 10000)
    Citizen.Wait(60000)

    for i=1, #previewBlips, 1 do
        RemoveBlip(previewBlips[i])
    end

    cb('ok')
end)

RegisterNUICallback('startRace', function(data, cb)
    if tonumber(data.laps) then
        local number = tonumber(data.laps)
        data.laps = number

        if data.laps <= 0 then
            exports['mythic_notify']:SendAlert('error', 'Antal omgange skal være højere end 0!', 10000)
            return
        end

        if data.laps > Config.MaxLaps then
            exports['mythic_notify']:SendAlert('error', 'Der må maks være ' .. Config.MaxLaps .. ' antal omgange.', 10000)
            return
        end

        TriggerServerEvent("drp_racing:startRacing", data)
    end

    if not tonumber(data.laps) then
        SendNUIMessage({
            ShowNotification = true,
            type = "error",
            title = "FEJL",
            text = "Antal omgange skal være et tal!",
        })
    end

    cb('ok')
end)

RegisterNUICallback('toggleReady', function(data, cb)
    TriggerServerEvent("drp_racing:toggleReady", data)

    cb('ok')
end)

RegisterNUICallback('toggleRaceOpen', function(data, cb)
    local race = GetNuiRaceByID(data["raceID"])
    if race == nil then
        return
    end
    
    race["isOpen"] = not race["isOpen"]

    SendNUIMessage({
        refreshRaces = true,
        Races = nuiRaces,
    })

    cb('ok')
end)

RegisterNUICallback('timeStatus', function(data, cb)
    local type = data["type"]
    local minutes = data["minutes"]
    local seconds = data["seconds"]
    local milliseconds = data["milliseconds"]

    local outputString = minutes .. ' min. ' .. seconds .. ' sec. ' .. milliseconds .. ' ms.'
    if type == "slower" then
        exports['mythic_notify']:SendAlert('error', '+ ' .. outputString, 10000)
    end

    if type == "faster" then
        exports['mythic_notify']:SendAlert('success', '- ' .. outputString, 10000)
    end

    cb('ok')
end)

RegisterNUICallback('newTimeLap', function(data, cb)
    local time = data["time"]

    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local veh = GetVehiclePedIsIn(playerPed, false)
        local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))

        Debug("New Time Lap in " .. activeRaceID .. " Time: " .. time .. " Vehicle: " .. vehicleName)

        TriggerServerEvent("drp_racing:newTimelap", activeRaceID, time, vehicleName)
    end

    cb('ok')
end)

RegisterNUICallback('exitRace', function(data, cb)
    TriggerServerEvent("drp_teams:exitRacing", activeRaceID)

    cb('ok')
end)

GetRaceByID = function(id)
    for k, race in pairs(Races) do
        if race.id == id then
            return race
        end
    end

    return nil
end

GetNuiRaceByID = function(id)
    for k, race in pairs(nuiRaces) do
        if race.id == id then
            return race
        end
    end

    return nil
end

CalculateMaxDistance = function(coords1, coords2)
    return #(coords1 - coords2) / 2
end

GetMaxCheckPoints = function(raceID)
    return #checkPoints[raceID]["locations"]
end

StopRace = function(raceID, forceStop)
    SendNUIMessage({
        stopRacing = true,
        forceStop = forceStop
    })

    isRacing = false
    
    checkPoints = {}
    checkPointID = 0

    for i=1, #racingBlips, 1 do
        RemoveBlip(racingBlips[i])
    end

    for i = 1, #startObjects, 1 do
        DeleteEntity(startObjects[i])
    end
    
    for i = 1, #raceObjects, 1 do
        DeleteEntity(raceObjects[i])
    end

    startObjects = {}
    raceObjects = {}
    racingBlips = {}

    TriggerServerEvent("drp_racing:stopRacing", raceID, forceStop)
end

HandleBlips = function(raceID, points, laps, maxLaps, isNewLap)
    if checkPoints[raceID] == nil then
        return
    end

    local locations = checkPoints[raceID]["locations"]
    if locations == nil then
        return
    end

    for i=1, #racingBlips, 1 do
        RemoveBlip(racingBlips[i])
    end

    if isNewLap then
        for k,v in pairs(locations) do
            v.hasBlip = false
        end
    end

    local count = 0
    for k,v in pairs(locations) do
        if not v.hasBlip and count < 3 then
            count = count + 1

            local raceBlip = 0
            if #locations == k then
                raceBlip = 309
            end
            
            local hasRoute = count ~= 3
            CreateBlipRoute(raceBlip, 0, v.pos, k, hasRoute, function(blip)
                if count == 1 then
                    SetBlipAsShortRange(blip, false)
                    v.hasBlip = true
                end

                if count > 1 then
                    local checkPointSize = #locations
                    if laps < maxLaps then
                        if (checkPointSize - 1) == points then
                            locations[1]["hasBlip"] = false
                        end

                        if checkPointSize == points then
                            locations[2]["hasBlip"] = false
                        end
                    end
                end

                table.insert(racingBlips, blip)
            end)
        end
    end
end

SetupCheckspoint = function(race)
    if checkPoints[race.id] == nil then
        checkPoints[race.id] = {}
    end

    if checkPoints[race.id]["locations"] == nil then
        checkPoints[race.id]["locations"] = {}
    end

    for k,v in pairs(race.locations) do
        local leftLocation = vector3(v.left.x, v.left.y, v.left.z)
        local middleLocation = vector3(v.middle.x, v.middle.y, v.middle.z)
        local rightLocation = vector3(v.right.x, v.right.y, v.right.z)
        local locationHeading = v["heading"]

        table.insert(checkPoints[race.id]["locations"], {
            left = leftLocation,
            right = rightLocation,
            pos = middleLocation,
            heading = locationHeading,
            isReached = false,
            hasBlip = false,
            isStart = false,
            objects = {},
        })
    end

    local leftCoords = vector3(race["start"]["left"].x, race["start"]["left"].y, race["start"]["left"].z)
    local midCoords = vector3(race["start"]["middle"].x, race["start"]["middle"].y, race["start"]["middle"].z)
    local rightCoords = vector3(race["start"]["right"].x, race["start"]["right"].y, race["start"]["right"].z)
    local coordsHeading = race["start"]["heading"]

    table.insert(checkPoints[race.id]["locations"], {
        left = leftCoords,
        right = rightCoords,
        pos = midCoords,
        heading = coordsHeading,
        isReached = false,
        hasBlip = false,
        isStart = true,
        objects = {},
    })
end

CreateBlipRoute = function(sprite, color, coords, number, hasRoute, cb)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    if color == 0 then color = 50 end

    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    if hasRoute then
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, color)
    end

    if sprite ~= 0 then
        SetBlipSprite(blip, sprite)
    end

    if number ~= 0 then
        ShowNumberOnBlip(blip, number)
    end

    if cb then
        cb(blip)
    end
end

CreateBlip = function(sprite, color, coords, number, cb)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    if color == 0 then color = 50 end

    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    if sprite ~= 0 then
        SetBlipSprite(blip, sprite)
    end

    if number ~= 0 then
        ShowNumberOnBlip(blip, number)
    end

    if cb then
        cb(blip)
    end
end

showCountdown = function(maxNumber)
    local nr = maxNumber
    local scale = 0
    
    Citizen.CreateThread(function()
        function drawCountdown(string1, r, g, b)
            local scaleform = RequestScaleformMovie("COUNTDOWN")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            BeginScaleformMovieMethod(scaleform, "SET_MESSAGE")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(r)
            PushScaleformMovieMethodParameterInt(g)
            PushScaleformMovieMethodParameterInt(b)
            PushScaleformMovieMethodParameterBool(true)
            EndScaleformMovieMethod()

            BeginScaleformMovieMethod(scaleform, "FADE_MP")
            PushScaleformMovieMethodParameterString(string1)
            PushScaleformMovieMethodParameterInt(r)
            PushScaleformMovieMethodParameterInt(g)
            PushScaleformMovieMethodParameterInt(b)
            EndScaleformMovieMethod()

            return scaleform
        end

        local _r, _g, _b = 255, 0, 0
        scale = drawCountdown(nr, _r, _g, _b)

        while showCD do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(scale, 255, 255, 255, 100)
        end
    end)

    Citizen.CreateThread(function()
        while showCD do
            Citizen.Wait(1000)

            if nr >= 0 then
                nr = nr - 1

                if nr <= 0 then
                    local _r, _g, _b = 0, 255, 0
                    scale = drawCountdown("GO", _r, _g, _b)

                    Citizen.Wait(1000)
                    showCD = false
                end

                if nr > 0 then
                    local _r, _g, _b = 255, 0, 0
                    scale = drawCountdown(nr, _r, _g, _b)
                end
            end
        end
    end)
end

subTitle = function(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time or 3000, 1)
end

SpawnLocalObject = function(model, coords, heading, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
        local start = GetGameTimer()

        RequestModel(model)
        while not HasModelLoaded(model) and GetGameTimer() - start < 30000 do 
            Wait(0); 
        end

        if not HasModelLoaded(model) then
            print('No Model')
            return
        end

		local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
        SetEntityHeading(obj, heading)

		SetModelAsNoLongerNeeded(model)

		if cb then
			cb(obj)
		end
	end)
end

RaceSetupFunction = function()
    isSettingUp = true

    Citizen.CreateThread(function()
        subTitle("Positioning Started")

        while isSettingUp do
            Citizen.Wait(0)

            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local heading = GetEntityHeading(playerPed)

            if IsControlJustReleased(0, 29) then
                if not isTableEmpty(setupRace) then
                    SaveRaceCoords(coords, heading)
                end

                if isTableEmpty(setupRace) then
                    SaveRaceCoords(coords, heading)
                end
            end

            if IsControlJustReleased(0, 311) then
                SaveManuelRaceCoords("left", coords, heading)
            end

            if IsControlJustReleased(0, 182) then
                SaveManuelRaceCoords("right", coords, heading)
            end

            if IsControlJustReleased(0, 176) then
                exports["input"]:Open("Navnet på løbet", ("ESX"), function(data)
                    if data then
                        subTitle("Saved Database")
                        TriggerServerEvent("drp_racing:saveCoords", data, setupRace)

                        for i=1, #racingBlips, 1 do
                            RemoveBlip(racingBlips[i])
                        end

                        setupRace = {}
                        isSettingUp = false
                    else
                        subTitle("Du skal indtaste en værdi")
                    end
                end)
            end

            if IsControlJustReleased(0, 177) then
                subTitle("Du har annulleret Race Creation")

                for i=1, #racingBlips, 1 do
                    RemoveBlip(racingBlips[i])
                end

                setupRace = {}
                isSettingUp = false
            end
        end
    end)
end

local rightCoords = 0
local leftCoords = 0
SaveManuelRaceCoords = function(side, coords, heading)
    if side == "right" then
        rightCoords = coords
        subTitle("Right Position Set")
    end

    if side == "left" then
        leftCoords = coords
        subTitle("Left Position Set")
    end

    if rightCoords ~= 0 and leftCoords ~= 0 then
        local type = "start"
        if not isTableEmpty(setupRace) then
            type = "locations"
        end

        if setupRace[type] == nil then
            setupRace[type] = {}
        end

        local rightGround, rightGroundZ = GetGroundZFor_3dCoord(rightCoords.x, rightCoords.y, rightCoords.z, 0)
        if rightGround then
            rightCoords = vector3(rightCoords.x, rightCoords.y, rightGroundZ)
        end

        local leftGround, leftGroundZ = GetGroundZFor_3dCoord(leftCoords.x, leftCoords.y, leftCoords.z, 0)
        if leftGround then
            leftCoords = vector3(leftCoords.x, leftCoords.y, leftGroundZ)
        end

        local newposx = (rightCoords.x - leftCoords.x) / 2
        local newposy = (rightCoords.y - leftCoords.y) / 2
        local middlePosition = vector3(rightCoords.x - newposx, rightCoords.y - newposy, rightCoords.z)

        if type == "start" then
            setupRace[type]["right"] = rightCoords
            setupRace[type]["middle"] = middlePosition
            setupRace[type]["left"] = leftCoords
            setupRace[type]["heading"] = heading

            CreateBlip(309, 4, middlePosition, 0, function(blip)
                table.insert(racingBlips, blip)
            end)
        else
            table.insert(setupRace[type], {
                ["right"] = rightCoords,
                ["middle"] = middlePosition,
                ["left"] = leftCoords,
                ["heading"] = heading
            })

            CreateBlip(0, 4, middlePosition, #setupRace[type], function(blip)
                table.insert(racingBlips, blip)
            end)
        end

        rightCoords = 0
        leftCoords = 0

        subTitle("Saved")
    end
end

SaveRaceCoords = function(coords, heading)
    local hasRightRoad, rightPosition = GetPointOnRoadSide(coords.x, coords.y, coords.z, 0)
    local hasLeftRoad, leftPosition = GetPointOnRoadSide(coords.x, coords.y, coords.z, 1)

    if hasRightRoad and hasLeftRoad then
        local type = "start"
        if not isTableEmpty(setupRace) then
            type = "locations"
        end

        if setupRace[type] == nil then
            setupRace[type] = {}
        end

        local rightGround, rightGroundZ = GetGroundZFor_3dCoord(rightPosition.x, rightPosition.y, rightPosition.z, 0)
        if rightGround then
            rightPosition = vector3(rightPosition.x, rightPosition.y, rightGroundZ)
        end

        local leftGround, leftGroundZ = GetGroundZFor_3dCoord(leftPosition.x, leftPosition.y, leftPosition.z, 0)
        if leftGround then
            leftPosition = vector3(leftPosition.x, leftPosition.y, leftGroundZ)
        end
        
        local newposx = (rightPosition.x - leftPosition.x) / 2
        local newposy = (rightPosition.y - leftPosition.y) / 2
        local middlePosition = vector3(rightPosition.x - newposx, rightPosition.y - newposy, rightPosition.z)

        if type == "start" then
            setupRace[type]["right"] = rightPosition
            setupRace[type]["middle"] = middlePosition
            setupRace[type]["left"] = leftPosition
            setupRace[type]["heading"] = heading

            CreateBlip(309, 4, middlePosition, 0, function(blip)
                table.insert(racingBlips, blip)
            end)
        else
            table.insert(setupRace[type], {
                ["right"] = rightPosition,
                ["middle"] = middlePosition,
                ["left"] = leftPosition,
                ["heading"] = heading
            })

            CreateBlip(0, 4, middlePosition, #setupRace[type], function(blip)
                table.insert(racingBlips, blip)
            end)
        end

        subTitle("Saved")
    else
        subTitle("Can't find left and right")
    end
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        for i = 1, #startObjects, 1 do
            DeleteEntity(startObjects[i])
        end

        for i = 1, #raceObjects, 1 do
            DeleteEntity(raceObjects[i])
        end
	end
end)
