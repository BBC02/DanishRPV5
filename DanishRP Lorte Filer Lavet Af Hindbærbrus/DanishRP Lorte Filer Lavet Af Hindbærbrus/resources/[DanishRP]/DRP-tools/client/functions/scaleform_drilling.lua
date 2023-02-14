ESX.MiniGame.Drilling = {}

local scaleform = nil
local drilling = false
local drilltemp = 0.0
local drillpos = 0.01
local drillspeed = 0.0
local holedepth = 0.1

ESX.MiniGame.Drilling.SetDrillPos = function(sf, pos)
    PushScaleformMovieFunction(sf, "SET_DRILL_POSITION")
    ScaleformMovieMethodAddParamFloat(pos)
    EndScaleformMovieMethod()
end

ESX.MiniGame.Drilling.SetDrillTemp = function(sf, temp)
    PushScaleformMovieFunction(sf, "SET_TEMPERATURE")
    ScaleformMovieMethodAddParamFloat(temp)
    EndScaleformMovieMethod()
end

ESX.MiniGame.Drilling.SetDrillDepth = function(sf, depth)
    PushScaleformMovieFunction(sf, "SET_HOLE_DEPTH")
    ScaleformMovieMethodAddParamFloat(depth)
    EndScaleformMovieMethod()
end

ESX.MiniGame.Drilling.SetDrillSpeed = function(sf, speed)
    PushScaleformMovieFunction(sf, "SET_SPEED")
    ScaleformMovieMethodAddParamFloat(speed)
    EndScaleformMovieMethod()
end

ESX.MiniGame.Drilling.ToggleDrilling = function(state, trigger)
    drilling = state
    drillpos = 0.1
    drilltemp = 0.0
    drillspeed = 0.0
    holedepth = 0.1
    
    if state and trigger ~= nil then
        ESX.MiniGame.Drilling.DisableMovement()
        ESX.MiniGame.Drilling.DrawDrilling(trigger)
        ESX.MiniGame.Drilling.KeyControleDrilling(trigger)
    else
        drilling = false
    end
end

ESX.MiniGame.Drilling.DrawDrilling = function(trigger)
    Citizen.CreateThread(function()
        local overlap = false
        while drilling do
            Citizen.Wait(0)
            if not drilling and scaleform ~= nil then
                SetScaleformMovieAsNoLongerNeeded(scaleform)
                scaleform = nil
            end
            if drilling then
                if scaleform == nil then
                    scaleform = RequestScaleformMovie("DRILLING")
                    while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(10) end
                end
                ESX.MiniGame.Drilling.SetDrillPos(scaleform, drillpos)
                ESX.MiniGame.Drilling.SetDrillTemp(scaleform, drilltemp)
                ESX.MiniGame.Drilling.SetDrillDepth(scaleform, holedepth)
                ESX.MiniGame.Drilling.SetDrillSpeed(scaleform, drillspeed)
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 200, 0)
                if holedepth >= 0.9 then
                    ESX.MiniGame.Drilling.ToggleDrilling(false)
                    ClearPedTasks(GetPlayerPed(-1))
                    TriggerEvent(trigger)
                    TriggerServerEvent(trigger)
                end
            end
        end
    end)
end


ESX.MiniGame.Drilling.KeyControleDrilling = function(trigger)
    Citizen.CreateThread(function()
        while drilling do
            Citizen.Wait(0)
            if IsDisabledControlPressed(0, 172) then
                if drilltemp < 1.0 then
                    while IsDisabledControlPressed(0, 172) and drilltemp < 1.0 do
                        if drillspeed < 0.7 then
                            drillspeed = drillspeed + (math.random(1, 5) / 100)
                        end
                        if holedepth - drillpos >= 0 then
                            drillpos = drillpos + ((math.random(1, 5) / 1000) + (drillspeed / 10))
                        else
                            local randomDepth = math.random(1, 5) / 1000
                            holedepth = holedepth + randomDepth
                            drillpos = drillpos + randomDepth
                            drilltemp = drilltemp + 0.02
                            playSound = true
                        end
                        if holedepth >= 0.9 then
                            ESX.MiniGame.Drilling.ToggleDrilling(false)
                            TriggerEvent(trigger)
                            TriggerServerEvent(trigger)
                            break
                        end
                        Wait(100)
                    end
                    if drilltemp >= 1.0 then
                        for i = 1, 100 do
                            if drillspeed > 0 then
                                drillspeed = drillspeed - 0.01
                            end
                            if drilltemp > 0 then
                                drilltemp = drilltemp - 0.01
                            end
                            if drillpos > 0 then
                                drillpos = drillpos - 0.01
                            end
                            if drilltemp <= 0.2 then
                                break
                            end
                            Wait(250)
                        end
                    end
                else
                    for i = 1, 100 do
                        if drillspeed > 0 then
                            drillspeed = drillspeed - 0.01
                        end
                        if drilltemp > 0 then
                            drilltemp = drilltemp - 0.01
                        end
                        if drillpos > 0 then
                            drillpos = drillpos - 0.005
                        end
                        if drilltemp <= 0.2 then
                            break
                        end
                        Wait(250)
                    end
                end
            elseif IsDisabledControlPressed(0, 173) then
                drillpos = drillpos - 0.015
                drilltemp = drilltemp - 0.015
                drillspeed = drillspeed - 0.015
                Wait(50)
            else
                if drillspeed > 0.0 then
                    drillspeed = drillspeed - 0.01
                    Wait(50)
                end
                if drilltemp > 0.0 then
                    drilltemp = drilltemp - 0.01
                    Wait(50)
                end
            end
        end
    end)
end

ESX.MiniGame.Drilling.DisableMovement = function()
    Citizen.CreateThread(function()
        while drilling do
            Citizen.Wait(0)
            DisableControlAction(0, 1, true)-- Disable pan
            DisableControlAction(0, 2, true)-- Disable tilt
        end
    end)
end

RegisterCommand('drillgame', function(source, args)
    ESX.MiniGame.Drilling.ToggleDrilling(true, 'ESX:HELLOWORLD')
end, false)
