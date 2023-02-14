CurrentWeather = 'CLEAR'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false
local doSync = true



Citizen.CreateThread(function()
    while true do
        if doSync then
            if lastWeather ~= CurrentWeather then
                lastWeather = CurrentWeather
                SetWeatherTypeOverTime(CurrentWeather, 15.0)
                Citizen.Wait(15000)
            end
            Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
            SetBlackout(blackout)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist(lastWeather)
            SetWeatherTypeNow(lastWeather)
            SetWeatherTypeNowPersist(lastWeather)
            if lastWeather == 'XMAS' then
                SetForceVehicleTrails(true)
                SetForcePedFootstepsTracks(true)
            else
                SetForceVehicleTrails(false)
                SetForcePedFootstepsTracks(false)
            end
        else
            Citizen.Wait(100)
        end
    end
end)

-- CreateThread(function()
    
--     local showHelp = true
--     local loaded = false
    
--     while true do
--         Wait(5) -- prevent crashing
--         if IsNextWeatherType('XMAS') then
--             if not loaded then
--                 RequestScriptAudioBank("ICE_FOOTSTEPS", false)
--                 RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
--                 RequestNamedPtfxAsset("core_snow")
--                 while not HasNamedPtfxAssetLoaded("core_snow") do
--                     Wait(150)
--                 end
--                 UseParticleFxAssetNextCall("core_snow")
--                 loaded = true
--             end
--             RequestAnimDict('anim@mp_snowball') -- pre-load the animation
--             if IsControlJustReleased(0, 47) and not IsPedInAnyVehicle(GetPlayerPed(-1), true) and not IsPlayerFreeAiming(PlayerId()) and not IsPedSwimming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedRunning(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and GetInteriorFromEntity(PlayerPedId()) == 0 and not IsPedShooting(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInCover(PlayerPedId(), 0) then -- check if the snowball should be picked up
--                 TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 1, 0, 0, 0) -- pickup the snowball
--                 Wait(1950) -- wait 1.95 seconds to prevent spam clicking and getting a lot of snowballs without waiting for animatin to finish.
--                 GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_SNOWBALL'), 2, false, true) -- get 2 snowballs each time.
--             end
--             if not IsPedInAnyVehicle(GetPlayerPed(-1), true) --[[and not IsPlayerFreeAiming(PlayerId())]] then
--                 if showHelp then
--                     showHelpNotification()
--                 end
--                 showHelp = false
--             else
--                 showHelp = true
--             end
--         else
--             -- disable frozen water effect
--             loaded = false
--             RemoveNamedPtfxAsset("core_snow")
--             ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
--             ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
--             SetForceVehicleTrails(false)
--             SetForcePedFootstepsTracks(false)
--         end
--         if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_SNOWBALL') then
--             SetPlayerWeaponDamageModifier(PlayerId(), 0.0)
--         end
--     end
-- end)

-- function showHelpNotification()
--     BeginTextCommandDisplayHelp("STRING")
--     AddTextComponentSubstringPlayerName("Press ~INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE~ while on foot, to pickup 2 snowballs!")
--     EndTextCommandDisplayHelp(0, 0, 1, -1)
-- end

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        Citizen.Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            newBaseTime = newBaseTime + 0.25
            timer = GetGameTimer()
        end
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime            
        end
        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24)
        minute = math.floor((baseTime+timeOffset)%60)

        if doSync then
            NetworkOverrideClockTime(hour, minute, 0)
        end
    end
end)

RegisterNetEvent('vSync:updateTime')
AddEventHandler('vSync:updateTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

RegisterNetEvent('vSync:updateWeather')
AddEventHandler('vSync:updateWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('vSync:requestSync')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/weather', 'Change the weather.', {{ name="weatherType", help="Available types: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween"}})
    TriggerEvent('chat:addSuggestion', '/time', 'Change the time.', {{ name="hours", help="A number between 0 - 23"}, { name="minutes", help="A number between 0 - 59"}})
    TriggerEvent('chat:addSuggestion', '/freezetime', 'Freeze / unfreeze time.')
    TriggerEvent('chat:addSuggestion', '/freezeweather', 'Enable/disable dynamic weather changes.')
    TriggerEvent('chat:addSuggestion', '/morning', 'Set the time to 09:00')
    TriggerEvent('chat:addSuggestion', '/noon', 'Set the time to 12:00')
    TriggerEvent('chat:addSuggestion', '/evening', 'Set the time to 18:00')
    TriggerEvent('chat:addSuggestion', '/night', 'Set the time to 23:00')
    TriggerEvent('chat:addSuggestion', '/blackout', 'Toggle blackout mode.')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end



RegisterNetEvent('vSync:notify')
AddEventHandler('vSync:notify', function(message, blink)
    ShowNotification(message, blink)
end)

RegisterNetEvent('vSync:toggle')
AddEventHandler('vSync:toggle', function(enable)
    if enable == nil then 
        enable = not doSync
    end
    doSync = enable
end)
