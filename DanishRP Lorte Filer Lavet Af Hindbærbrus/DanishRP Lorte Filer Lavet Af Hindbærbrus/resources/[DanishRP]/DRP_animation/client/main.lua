AnimationDuration = -1
ChosenAnimation = ""
ChosenDict = ""
IsInAnimation = false
MovementType = 0
PlayerHasProp = false
PlayerProps = {}
PlayerParticles = {}
SecondPropEmote = false
PtfxNotif = false
PtfxPrompt = false
PtfxWait = 500
PtfxNoProp = false
hasHandup = false
isSurrendered = false
isCancelDisabled = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

exports("toggleDisableCancel", function(value)
    if not value then
        isCancelDisabled = not isCancelDisabled
    end

    if value then
        isCancelDisabled = value
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        if IsControlPressed(0, 48) then
            if not LocalPlayer.state.animation then
                EmoteCancel()
            end
        end

        if IsPedShooting(ped) then
            EmoteCancel()
        end

        if PtfxPrompt then
            if not PtfxNotif then
                SimpleNotify(PtfxInfo)
                PtfxNotif = true
            end

            if IsControlPressed(0, 47) then
                PtfxStart()
                Wait(PtfxWait)
                PtfxStop()
            end
        end
    end
end)

Citizen.CreateThread( function()
	while true do
        Citizen.Wait(5)
        
		if (IsControlJustPressed(0, 73)) then
			local ped = PlayerPedId()
            if not LocalPlayer.state.animation then
                if (DoesEntityExist(ped) and not LocalPlayer.state.isDead and not IsPedInAnyVehicle(ped)) then
                    if hasHandup then
                        EmoteCancel()
                        hasHandup = false

                       -- LocalPlayer.state:set('invBusy', false, false)
                    else
                        EmoteHandler('Emotes', "handsup_x")
                        hasHandup = true

                      --  LocalPlayer.state:set('invBusy', true, false)
                    end
                end
            end
        end
	end
end)

RegisterNetEvent("srp_animation:OnEmotePlay")
AddEventHandler("srp_animation:OnEmotePlay", function(Type, Name)
    if isSurrendered and Name == 'surrender' then
        EmoteCancel()
    else
        EmoteHandler(Type, Name)
    end
end)

RegisterNetEvent("srp_animation:EmoteCancel")
AddEventHandler("srp_animation:EmoteCancel", function()
    EmoteCancel()
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/e', 'Vælg en Emote', {{ name="emotename", help = " - Vælg en vilkårlig Emote."}})
    TriggerEvent('chat:addSuggestion', '/emote', 'Vælg en Emote', {{ name="emotename", help = " - Vælg en vilkårlig Emote."}})
    TriggerEvent('chat:addSuggestion', '/walk', 'Vælg en Gangart.', {{ name="gangart", help = " - Vælg en vilkårlig Gangart"}})
    TriggerEvent('chat:addSuggestion', '/expression', 'Vælg et Humør.', {{ name="expression", help = " - Vælg et vilkårlig Humør"}})
end)

RegisterCommand('e', function(source, args, raw) 
    CommandHandler(source, args, raw, 'Emotes') 
end)

RegisterCommand('emote', function(source, args, raw) 
    CommandHandler(source, args, raw, 'Emotes') 
end)

RegisterCommand('walk', function(source, args, raw) 
    CommandHandler(source, args, raw, 'Walks') 
end)

RegisterCommand('expression', function(source, args, raw) 
    CommandHandler(source, args, raw, 'Expressions') 
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DestroyAllProps()

        ClearPedTasksImmediately(GetPlayerPed(-1))
        ResetPedMovementClipset(PlayerPedId())
    end
end)
