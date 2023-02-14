local MovementActive = false

Savanha.Player.StartScreenEffect = function(name, out, duration)
    if duration < 0 then
        AnimpostfxPlay(name, 0, true)
    else
        AnimpostfxPlay(name, 0, true)
        
        Citizen.CreateThread(function()-- force stop the screen effect after duration+1 seconds
            Citizen.Wait(duration)
            if out then
                AnimpostfxPlay(out, 10, false)
                AnimpostfxStop(out)
                print('Out')
            end
            print('Clear Screen Effect')
            AnimpostfxStop(name)
        end)
    end
end

Savanha.Player.StopScreenEffect = function(name)
    AnimpostfxStop(name)
end

Savanha.Player.Movement = function(clipset, blur, drunk, fade, clear, timecycle, duration, overwright)
    if overwright then
        MovementActive = true
        if MovementActive then
            return
        end
    end
    
    local playerPed = PlayerPedId()
    local ped = GetPlayerPed(-1)
    
    print(IsPedInAnyVehicle(ped, false))
    
    RequestAnimSet(clipset)
    while not HasAnimSetLoaded(clipset) do
        Citizen.Wait(0)
    end
    
    if fade and not IsPedInAnyVehicle(ped, false) then
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
    end
    
    if clear and not IsPedInAnyVehicle(ped, false) then
        ClearPedTasksImmediately(playerPed)
    end
    
    if timecycle then
        SetTimecycleModifier(timecycle)
    else
        SetTimecycleModifier("spectator5")
    end
    
    if blur then
        SetPedMotionBlur(playerPed, true)
    end
    
    SetPedMovementClipset(playerPed, clipset, true)
    
    if drunk then
        SetPedIsDrunk(playerPed, true)
    end
    
    if fade and not IsPedInAnyVehicle(ped, false) then
        DoScreenFadeIn(1000)
    end
    
    if duration then
        Citizen.CreateThread(function()
            Citizen.Wait(duration)
            Savanha.Player.ClearMovement(fade)
        end)
    end
    
    RemoveAnimSet(clipset)
end

Savanha.Player.ClearMovement = function(fade)
    local playerPed = PlayerPedId()
    
    if fade then
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        DoScreenFadeIn(1000)
    end
    
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    
    if not IsPedInAnyVehicle(ped, false) then
        ResetPedMovementClipset(playerPed, 0)
    end
    
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
    MovementActive = false
end
