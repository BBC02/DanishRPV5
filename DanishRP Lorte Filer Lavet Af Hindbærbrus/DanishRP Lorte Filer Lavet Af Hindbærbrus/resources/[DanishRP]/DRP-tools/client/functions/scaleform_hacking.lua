ESX.MiniGame.Hacking = {}

local scaleform = nil
local ClickReturn
local lives = 5
local gamePassword
local hackingActive = false

ESX.MiniGame.Hacking.PasswordGen = function(length)
    local index, pw, rnd = 0, ""
    local chars = {
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        "abcdefghijklmnopqrstuvwxyz",
        "0123456789",
    }
    repeat
        index = index + 1
        rnd = math.random(chars[index]:len())
        if math.random(2) == 1 then
            pw = pw .. chars[index]:sub(rnd, rnd)
        else
            pw = chars[index]:sub(rnd, rnd) .. pw
        end
        index = index % #chars
    until pw:len() >= length
    return pw
end

ESX.MiniGame.Hacking.Run = function(attempt, trigger)
    lives = attempt
    hackingActive = true
    ESX.MiniGame.Hacking.DisableMovement()
    ESX.MiniGame.Hacking.GetPassword()
    ESX.MiniGame.Hacking.Draw()
    ESX.MiniGame.Hacking.Render(trigger)
end

ESX.MiniGame.Hacking.GetPassword = function()
    math.randomseed(GetGameTimer())
    gamePassword = ESX.MiniGame.Hacking.PasswordGen(8)
end

ESX.MiniGame.Hacking.Init = function(scaleform)
    local scaleform = RequestScaleformMovieInteractive(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    PushScaleformMovieFunction(scaleform, "SET_LABELS")--this allows us to label every item inside My Computer
    PushScaleformMovieFunctionParameterString("Lokalt Drev (C:)")
    PushScaleformMovieFunctionParameterString("Netværk")
    PushScaleformMovieFunctionParameterString("USB Enhed (J:)")
    PushScaleformMovieFunctionParameterString("HackConnect.exe")
    PushScaleformMovieFunctionParameterString("BruteForce.exe")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")--We can set the background of the scaleform, so far 0-6 works.
    PushScaleformMovieFunctionParameterInt(6)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")--We add My Computer application to the scaleform
    PushScaleformMovieFunctionParameterFloat(1.0)-- Position in the scaleform most left corner
    PushScaleformMovieFunctionParameterFloat(4.0)
    PushScaleformMovieFunctionParameterString("Min Computer")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")--We Power off app so we can exit the scaleform
    PushScaleformMovieFunctionParameterFloat(6.0)-- Position in the scaleform most right corner
    PushScaleformMovieFunctionParameterFloat(6.0)
    PushScaleformMovieFunctionParameterString("Sluk")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")--BruteForce.exe Column Speed, the higher the speed, harder it gets(kinda 255 seems to be max).
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(1)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(2)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(3)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(4)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(5)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(6)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
    PushScaleformMovieFunctionParameterInt(7)
    PushScaleformMovieFunctionParameterInt(255)
    PopScaleformMovieFunctionVoid()
    
    return scaleform
end

ESX.MiniGame.Hacking.Draw = function()
    Citizen.CreateThread(function()
        scaleform = ESX.MiniGame.Hacking.Init("HACKING_PC")
        while hackingActive do
            Citizen.Wait(0)
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")--We use this scaleform function to define what input is going to move the cursor
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()
            if IsDisabledControlJustPressed(0, 24) and lives ~= 0 then -- IF LEFT CLICK IS PRESSED WE SELECT SOMETHING IN THE SCALEFORM
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and lives ~= 0 then -- IF RIGHT CLICK IS PRESSED WE GO BACK.
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end
        end
    end)
end

ESX.MiniGame.Hacking.Render = function(trigger)
    local trigger = trigger
    Citizen.CreateThread(function()
        while hackingActive do
            Citizen.Wait(0)
            if HasScaleformMovieLoaded(scaleform) then
                FreezeEntityPosition(PlayerPedId(), true)--If the user is in scaleform we should freeze him to prevent movement.
                DisableControlAction(0, 24, true)--LEFT CLICK disabled while in scaleform
                DisableControlAction(0, 25, true)--RIGHT CLICK disabled while in scaleform
                if GetScaleformMovieFunctionReturnBool(ClickReturn) then -- old native?
                    ProgramID = GetScaleformMovieFunctionReturnInt(ClickReturn)
                    print("ProgramID: " .. ProgramID)-- Prints the ID of the Apps we click on inside the scaleform, very useful
                    
                    if ProgramID == 82 then --HACKCONNECT.EXE (ITS SCALEFORM FUNCTIONS DOESNT SEEM TO WORK SO WE KEEP IT DISABLED)
                        PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                    
                    elseif ProgramID == 83 then --BRUTEFORCE.EXE
                        
                        PushScaleformMovieFunction(scaleform, "RUN_PROGRAM")
                        PushScaleformMovieFunctionParameterFloat(83.0)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                        PushScaleformMovieFunctionParameterString(gamePassword)
                        PopScaleformMovieFunctionVoid()
                    
                    elseif ProgramID == 87 then --IF YOU CLICK THE WRONG LETTER IN BRUTEFORCE APP
                        lives = lives - 1

                        PushScaleformMovieFunction(scaleform, "RESET_ROULETTE")
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                        PushScaleformMovieFunctionParameterString(gamePassword)
                        PopScaleformMovieFunctionVoid()
                        
                        PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                        PushScaleformMovieFunction(scaleform, "SET_LIVES")
                        PushScaleformMovieFunctionParameterInt(lives)--We set how many lives our user has before he fails the bruteforce.
                        PushScaleformMovieFunctionParameterInt(5)
                        PopScaleformMovieFunctionVoid()
                    
                    elseif ProgramID == 92 then --IF YOU CLICK THE RIGHT LETTER IN BRUTEFORCE APP, you could add more lives here.
                        PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                    
                    elseif ProgramID == 86 then --IF YOU SUCCESSFULY GET ALL LETTERS RIGHT IN BRUTEFORCE APP
                        PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                        
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(true)
                        PushScaleformMovieFunctionParameterString("BRUTEFORCE SUCCESSFUL!")
                        PopScaleformMovieFunctionVoid()
                        
                        Wait(2800)--We wait 2.8 to let the bruteforce message sink in before we continue
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "OPEN_LOADING_PROGRESS")
                        PushScaleformMovieFunctionParameterBool(true)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_PROGRESS")
                        PushScaleformMovieFunctionParameterInt(35)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_TIME")
                        PushScaleformMovieFunctionParameterInt(35)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_MESSAGE")
                        PushScaleformMovieFunctionParameterString("Skriver data til buffer..")
                        PushScaleformMovieFunctionParameterFloat(2.0)
                        PopScaleformMovieFunctionVoid()
                        Wait(1500)
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_MESSAGE")
                        PushScaleformMovieFunctionParameterString("Afvikler skadelig kode..")
                        PushScaleformMovieFunctionParameterFloat(2.0)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_TIME")
                        PushScaleformMovieFunctionParameterInt(15)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "SET_LOADING_PROGRESS")
                        PushScaleformMovieFunctionParameterInt(75)
                        PopScaleformMovieFunctionVoid()
                        
                        Wait(1500)
                        PushScaleformMovieFunction(scaleform, "OPEN_LOADING_PROGRESS")
                        PushScaleformMovieFunctionParameterBool(false)
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "OPEN_ERROR_POPUP")
                        PushScaleformMovieFunctionParameterBool(true)
                        PushScaleformMovieFunctionParameterString("MEMORY LEAK DETECTED, DEVICE SHUTTING DOWN")
                        PopScaleformMovieFunctionVoid()
                        
                        Wait(3500)
                        SetScaleformMovieAsNoLongerNeeded(scaleform)--EXIT SCALEFORM
                        PopScaleformMovieFunctionVoid()
                        FreezeEntityPosition(PlayerPedId(), false)--unfreeze our character

                        TriggerEvent(trigger)
                        TriggerServerEvent(trigger)
                        hackingActive = false
                    
                    elseif ProgramID == 6 then
                        Wait(500)-- WE WAIT 0.5 SECONDS TO EXIT SCALEFORM, JUST TO SIMULATE A SHUTDOWN, OTHERWISE IT CLOSES INSTANTLY
                        SetScaleformMovieAsNoLongerNeeded(scaleform)--EXIT SCALEFORM
                        FreezeEntityPosition(PlayerPedId(), false)--unfreeze our character
                        DisableControlAction(0, 24, false)--LEFT CLICK enabled again
                        DisableControlAction(0, 25, false)--RIGHT CLICK enabled again
                        hackingActive = false
                    end
                    
                    if lives == 0 then
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(false)
                        PushScaleformMovieFunctionParameterString("BRUTEFORCE FAILED!")
                        PopScaleformMovieFunctionVoid()
                        
                        Wait(3500)--WE WAIT 3.5 seconds here aswell to let the bruteforce message sink in before exiting.
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        
                        PushScaleformMovieFunction(scaleform, "OPEN_ERROR_POPUP")
                        PushScaleformMovieFunctionParameterBool(true)
                        PushScaleformMovieFunctionParameterString("MEMORY LEAK DETECTED, DEVICE SHUTTING DOWN")
                        PopScaleformMovieFunctionVoid()
                        
                        Wait(2500)
                        SetScaleformMovieAsNoLongerNeeded(scaleform)
                        PopScaleformMovieFunctionVoid()
                        FreezeEntityPosition(PlayerPedId(), false)--unfreeze our character
                        DisableControlAction(0, 24, false)--LEFT CLICK enabled again
                        DisableControlAction(0, 25, false)--RIGHT CLICK enabled again
                        hackingActive = false
                    end
                end
            end
        end
    end)
end

ESX.MiniGame.Hacking.DisableMovement = function()
    Citizen.CreateThread(function()
        while hackingActive do
            Citizen.Wait(0)
            DisableControlAction(0, 1, true)-- Disable pan
            DisableControlAction(0, 2, true)-- Disable tilt
        end
    end)
end

RegisterCommand('hackgame', function(source, args)
    ESX.MiniGame.Hacking.Run(2, 'hello:world')
end, false)
