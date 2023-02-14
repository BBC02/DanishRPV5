ESX.MiniGame.SafeCracking = {}

local isCracking = false
local lockAmounts = 4
local currentSafeCorrectPosition = 0.0
local dialRotation = 0.0
local safeLocks = {}

ESX.MiniGame.SafeCracking.Toggle = function(status, locks, trigger)
    if status and not isCracking then
        isCracking = true
        lockAmounts = locks
        ESX.MiniGame.SafeCracking.Run(trigger)
    else
        isCracking = false

        ESX.MiniGame.SafeCracking.Reset()
    end
end

ESX.MiniGame.SafeCracking.Run = function(trigger)
    dialRotation = 0.0
    ESX.MiniGame.SafeCracking.Init()
    ESX.MiniGame.SafeCracking.HelpText()
    ESX.MiniGame.SafeCracking.Controlles(trigger)
end

ESX.MiniGame.SafeCracking.Reset = function()
    isCracking = false
    
    safeLocks = {}

    ReleaseAmbientAudioBank("SAFE_CRACK")
    SetStreamedTextureDictAsNoLongerNeeded("MPSafeCracking")
    RequestStreamedTextureDict("MPSafeCracking", true)
    
    if IsEntityPlayingAnim(PlayerPedId(), "mini@safe_cracking", "dial_turn_clock_normal", 3) then
        ClearPedTasks(PlayerPedId())
    end
end

ESX.MiniGame.SafeCracking.Init = function()
    currentSafeCorrectPosition = math.random(1, 350)
    
    while not HasStreamedTextureDictLoaded("MPSafeCracking") do
        Citizen.Wait(0)
        
        RequestStreamedTextureDict("MPSafeCracking", false)
    end
    
    RequestAmbientAudioBank("SAFE_CRACK", false)
    
    while not HasAnimDictLoaded("mini@safe_cracking") do
        Citizen.Wait(0)
        
        RequestAnimDict("mini@safe_cracking")
    end
    
    TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "dial_turn_clock_normal", 0.5, 1.0, -1, 11, 0.0, 0, 0, 0)
end

ESX.MiniGame.SafeCracking.HelpText = function()
    Citizen.CreateThread(function()
        while isCracking do
            Citizen.Wait(0)
            
            DrawSprite("MPSafeCracking", "Dial_BG", 0.5, 0.4, 0.2, 0.3, 0.0, 255, 255, 255, 255)
            DrawSprite("MPSafeCracking", "Dial", 0.5, 0.4, 0.2 * 0.5, 0.3 * 0.5, dialRotation, 255, 255, 255, 255)
            
            ESX.MiniGame.SafeCracking.DrawButtons({
                {
                    ["label"] = "Højre Hurtigt",
                    ["button"] = "~INPUT_CELLPHONE_RIGHT~"
                },
                {
                    ["label"] = "Højre Langsomt",
                    ["button"] = "~INPUT_CELLPHONE_DOWN~"
                },
                {
                    ["label"] = "Venstre Langsomt",
                    ["button"] = "~INPUT_CELLPHONE_UP~"
                },
                {
                    ["label"] = "Venstre Hurtigt",
                    ["button"] = "~INPUT_CELLPHONE_LEFT~"
                },
                {
                    ["label"] = "Prøv At Knække",
                    ["button"] = "~INPUT_JUMP~"
                },
                {
                    ["label"] = "Annuller",
                    ["button"] = "~INPUT_DETONATE~"
                }
            })
            
            if not IsEntityPlayingAnim(PlayerPedId(), "mini@safe_cracking", "dial_turn_clock_normal", 3) and isCracking then
                TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "dial_turn_clock_normal", 0.5, 1.0, -1, 11, 0.0, 0, 0, 0)
            end
            
            for i = 1, lockAmounts do
                local lockState = safeLocks[i] and "lock_open" or "lock_closed"
                
                DrawSprite("MPSafeCracking", lockState, 0.25 + (i / 10), 0.6, 0.2 * 0.2, 0.3 * 0.2, 0.0, 255, 255, 255, 255)
            end
        end
        
        RemoveAnimDict("mini@safe_cracking")
    end)
end

ESX.MiniGame.SafeCracking.Controlles = function(trigger)
    Citizen.CreateThread(function()
        while isCracking do
            DisableControlAction(0, 38, true)
            
            if IsControlJustPressed(0, 22) then
                if dialRotation == currentSafeCorrectPosition then
                    PlaySoundFrontend(0, "TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", 1)
                    
                    safeLocks[#safeLocks + 1] = true
                    
                    if #safeLocks == 1 then
                        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                        
                        --Send Message to police
                        --TriggerServerEvent("esx_phone:send", "police", "GPSيـوجد سـطو على بقالة تم رصد المكان عن طريق ال!", true, {["x"] = x, ["y"] = y, ["z"] = z})
                        print('Warning')
                    end
                    
                    if #safeLocks < lockAmounts then
                        currentSafeCorrectPosition = math.random(1, 350)
                    else
                        ESX.MiniGame.SafeCracking.Reset()
                        print('done')
                        
                        TriggerEvent(trigger)
                        TriggerServerEvent(trigger)
                    end
                else
                    print('Forkert kombination')
                end
            elseif IsControlJustPressed(0, 47) then
                ESX.MiniGame.SafeCracking.Reset()
            elseif IsControlJustPressed(0, 172) then
                ESX.MiniGame.SafeCracking.MoveSafeDial(true)
            elseif IsControlJustPressed(0, 173) then
                ESX.MiniGame.SafeCracking.MoveSafeDial(false)
            elseif IsControlPressed(0, 174) then
                ESX.MiniGame.SafeCracking.MoveSafeDial(true)
            elseif IsControlPressed(0, 175) then
                ESX.MiniGame.SafeCracking.MoveSafeDial(false)
            end
            
            Citizen.Wait(5)
        end
    end)
end

ESX.MiniGame.SafeCracking.Reset = function()
    isCracking = false
    
    safeLocks = {}
    
    ReleaseAmbientAudioBank("SAFE_CRACK")
    SetStreamedTextureDictAsNoLongerNeeded("MPSafeCracking")
    
    if IsEntityPlayingAnim(PlayerPedId(), "mini@safe_cracking", "dial_turn_clock_normal", 3) then
        ClearPedTasks(PlayerPedId())
    end
end

ESX.MiniGame.SafeCracking.MoveSafeDial = function(clockwise)
    if clockwise then
        dialRotation = dialRotation + 1
        
        if dialRotation == currentSafeCorrectPosition then
            PlaySoundFrontend(0, "TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", 1)
        else
            PlaySoundFrontend(0, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", 1)
        end
        
        if dialRotation >= 360 then
            dialRotation = 0.0
        end
    else
        dialRotation = dialRotation - 1
        
        if dialRotation == currentSafeCorrectPosition then
            PlaySoundFrontend(0, "TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", 1)
        else
            PlaySoundFrontend(0, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", 1)
        end
        
        if dialRotation <= 0 then
            dialRotation = 360.0
        end
    end
    
    Citizen.Wait(10)
end

ESX.MiniGame.SafeCracking.DrawButtons = function(buttonsToDraw)
    Citizen.CreateThread(function()
		local instructionScaleform = RequestScaleformMovie("instructional_buttons")
	
		while not HasScaleformMovieLoaded(instructionScaleform) do
			Wait(0)
		end
	
		PushScaleformMovieFunction(instructionScaleform, "CLEAR_ALL")
		PushScaleformMovieFunction(instructionScaleform, "TOGGLE_MOUSE_BUTTONS")
		PushScaleformMovieFunctionParameterBool(0)
		PopScaleformMovieFunctionVoid()
	
		for buttonIndex, buttonValues in ipairs(buttonsToDraw) do
			PushScaleformMovieFunction(instructionScaleform, "SET_DATA_SLOT")
			PushScaleformMovieFunctionParameterInt(buttonIndex - 1)
	
			PushScaleformMovieMethodParameterButtonName(buttonValues["button"])
			PushScaleformMovieFunctionParameterString(buttonValues["label"])
			PopScaleformMovieFunctionVoid()
		end
	
		PushScaleformMovieFunction(instructionScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
		PushScaleformMovieFunctionParameterInt(-1)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(instructionScaleform, 255, 255, 255, 255)
	
		-- SetScaleformMovieAsNoLongerNeeded(instructionScaleform)
	end)
end

RegisterCommand('safecrack', function(source, args)
    ESX.MiniGame.SafeCracking.Toggle(true, 2, 'ESX:HELLOWORLD')
end, false)
