ESX = nil

MyPed = nil
MyCoords = vector3(0,0,0)
CurrentZone = nil

local CurrentChunk = nil
local CurrentChunks = {}
local MarkersToCheck = {}
RegisteredMarkers = {}
MarkerWithJob = {}
TempMarkerWithJob = {}
CurrentJob = nil
PauseMarker = false

LetSleep = true
local abs = math.abs

CreateThread(function ()
    while not ESX do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(10)
    end

    while not ESX.IsPlayerLoaded() do
        Wait(10)
    end

    CurrentJob = ESX.GetPlayerData().job
    RegisterTempMarkers()
end)

CreateThread(function ()
    while true do
        MyPed = PlayerPedId()
        MyCoords = GetEntityCoords(MyPed)
        Wait(200)
    end
end)

CreateThread(function()
    while true do
        local chunk = GetCurrentChunk(MyCoords)
        if chunk ~= CurrentChunk then
            CurrentChunks = GetNearbyChunks(MyCoords)
        end
        MarkersToCheck = {}
        for i = 1, #CurrentChunks do
            if RegisteredMarkers[CurrentChunks[i]] then
                for _, zone in pairs(RegisteredMarkers[CurrentChunks[i]]) do
                    table.insert(MarkersToCheck, zone)
                end
            end
        end
        Wait(1000)
    end
end)

CreateThread(function ()
    while true do
        local isInMarker, _currentZone = false, nil
        LetSleep = true
        for i = 1, #MarkersToCheck do
            local zone = MarkersToCheck[i]
            local distance = #(MyCoords - zone.pos)
            if distance < zone.drawDistance then
                LetSleep = false
                if not PauseMarker then
                    if zone.show3D then
                        DrawText3D(zone.pos.x, zone.pos.y, zone.pos.z, zone.msg)
                    else
                        if zone.type ~= -1 then
                            DrawMarker(zone.type, zone.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, zone.scale.x, zone.scale.y, zone.scale.z, zone.color.r, zone.color.g, zone.color.b, 100, false, true, 2, false, nil, nil, false)
                        end
                    end
                end
                
                if #(MyCoords.xy - zone.pos.xy) < #(zone.scale.xy/2) and abs(MyCoords.z - zone.pos.z) < zone.scaleZ then
                    isInMarker, _currentZone = true, zone
                end
            end
        end

		if isInMarker and not HasAlreadyEnteredMarker then
            CurrentZone = _currentZone
			HasAlreadyEnteredMarker = true
            PauseMarker = true
			TriggerEvent("gridsystem:hasEnteredMarker", _currentZone)
            TriggerEvent("cd_drawtextui:ShowUI", _currentZone.msg)
		end
		if HasAlreadyEnteredMarker and ( not isInMarker or _currentZone ~= CurrentZone) then
			HasAlreadyEnteredMarker = false
            PauseMarker = false
			TriggerEvent("gridsystem:hasExitedMarker")
            TriggerEvent("cd_drawtextui:HideUI")
		end
        Wait(2)
		if LetSleep then
			Citizen.Wait(700)
		end
    end
end)

CreateThread(function ()
    while true do
        if CurrentZone then
            local _zone = CurrentZone
            if _zone and not _zone.mustExit then
                if not _zone.show3D and not _zone.showHTML then
                    DisplayHelpTextThisFrame(_zone.name, false)
                end

                if IsControlJustReleased(0, _zone.control) then 
                    if _zone.action then
                        local status, err = pcall(_zone.action)
                        if not status then
                            LogError(string.format("Error executing action for marker %s. Error: %s", _zone.name, err))
                        end
                    end

                    if _zone.forceExit then
                        TriggerEvent("cd_drawtextui:HideUI")
                        PauseMarker = false
                    end
                end
            end
        end
        Wait(0)
        if LetSleep then
            Wait(700)
        end
    end
end)

function print_r ( t ) 
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    sub_print_r(t,"  ")
end