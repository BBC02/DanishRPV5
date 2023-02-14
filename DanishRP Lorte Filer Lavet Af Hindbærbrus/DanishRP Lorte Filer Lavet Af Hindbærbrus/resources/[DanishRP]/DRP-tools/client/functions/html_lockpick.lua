Savanha.MiniGame.LockPick = {}

local isLockpicking = false
local EventTrigger

Savanha.MiniGame.LockPick.Toggle = function(state, trigger)
    if state and not isLockpicking then
        EventTrigger = trigger
        isLockpicking = true

        SendNUIMessage({
            func = 'StartMinigame'
        })
        SetNuiFocus(true, true)
    elseif not state then
        EventTrigger = nil
        isLockpicking = false

        SendNUIMessage({
            func = 'Quit'
        })
        SetNuiFocus(false, false)
    end
end

RegisterNUICallback('Quit', function(data, cb)
    EventTrigger = nil
    isLockpicking = false
    SetNuiFocus(false, false)
    print('quit')
end)

RegisterNUICallback('Finished', function(data, cb)
    TriggerEvent(EventTrigger)
    TriggerServerEvent(EventTrigger)
    EventTrigger = nil
    isLockpicking = false
    SetNuiFocus(false, false)
    print('finished')
end)

AddEventHandler('onResourceStop', function(resource)
    if isLockpicking then
        Savanha.MiniGame.LockPick.Toggle(false, '')
    end
    EventTrigger = nil
    isLockpicking = false
end)

RegisterCommand('lockpickgame', function(source, args)
    Savanha.MiniGame.LockPick.Toggle(true, 'hello:world')
end, false)
