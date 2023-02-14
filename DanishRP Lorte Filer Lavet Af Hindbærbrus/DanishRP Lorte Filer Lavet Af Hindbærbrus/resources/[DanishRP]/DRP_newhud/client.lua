ESX = nil
SRP = nil

enabled = true
local hasStarted = false
klar = false
local playerHealth
local playerArmor
local name
local playerCount
local isTalking = false
local isTalkingRadio = false
local crosshairToggle = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end

    while SRP == nil do
        TriggerEvent('srp:getSharedObject', function(obj) SRP = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    if GetResourceKvpInt('crosshair') then
        crosshairToggle = GetResourceKvpInt('crosshair') == 0
    end

    SetCrosshairToggleData()
end)

RegisterCommand('togglehud', function(source, args)
    enabled = not enabled

    SendNUIMessage({
        action = 'togglehud',
        show = enabled
    })

    DisplayRadar(enabled)
end, false)

RegisterCommand('togglex', function(source, args)
    SetCrosshairToggleData()
end, false)

SetCrosshairToggleData = function()
    crosshairToggle = not crosshairToggle

    local crosshairStatus = crosshairToggle and 1 or 0
    SetResourceKvpInt('crosshair', crosshairStatus)
end

AddEventHandler('srp_UI:sendNUIMessage', function(dataArray)
    SendNUIMessage(dataArray)
end)

RegisterNetEvent('ui:deathStatus')
AddEventHandler('ui:deathStatus', function(status)
    if not status then
        enabled = true
        DisplayRadar(enabled)
    end
end)

AddEventHandler('esx:onPlayerDeath', function()
    enabled = false
    DisplayRadar(enabled)

    SendNUIMessage({
        action = 'updateStatusHud',
        health = 0,
        armour = 0
    })
end)
AddEventHandler('esx:kashloaded', function()

    klar = true
end)
AddEventHandler('playerSpawned', function(spawn)
    enabled = true
    DisplayRadar(enabled)
    klar = true
end)

RegisterNetEvent('ui:respawnPlayer')
AddEventHandler('ui:respawnPlayer', function()
    enabled = true
    DisplayRadar(enabled)

    local player = PlayerPedId()
    local health = getHealth(player)
    local armor = GetPedArmour(player)

    SendNUIMessage({
        action = 'updateStatusHud',
        health = health,
        armour = armor
    })
end)

RegisterNetEvent('ui:setradio')
AddEventHandler('ui:setradio', function()
    SendNUIMessage({action = "joinRadio", value = true})
end)

RegisterNetEvent('ui:leaveradio')
AddEventHandler('ui:leaveradio', function()
    SendNUIMessage({action = "leaveRadio", value = true})
end)

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index)
    print(voiceRange, index)
    SendNUIMessage({action = "setProximity", value = index})
end)

AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)
    SendNUIMessage({action = "setTalking", value = isTalking})
end)

local isMicEnanbled = true
AddEventHandler('SaltyChat_MicEnabledChanged', function(isDisabled)
    isMicEnanbled = isDisabled
end)

Citizen.CreateThread(function()
	while true do
        if klar == true then
            --This is the Application ID (Replace this with you own)
            SetDiscordAppId(1067445927851331654)
    
            --Here you will have to put the image name.
            SetDiscordRichPresenceAsset('DanishRPlogo')
    
            SetDiscordRichPresenceAction(0, 'Hjemmeside', 'https://danishrp.dk/')
            SetDiscordRichPresenceAction(1, 'Join Discord', 'https://discord.com/invite/danishrp')
            SetDiscordRichPresenceAction(2, 'Forbind', 'fivem://connect/http://178.63.12.227/:30120')
    
            
            local maxPlayers = GetConvarInt('sv_maxclients', 128)
            ESX.TriggerServerCallback('getPlayers', function(playerCount)
                while not NetworkIsSessionActive() do
                    Citizen.Wait(0)
                    print("Waiting")
                end
                
                print(playerCount)
                ESX.TriggerServerCallback('getNames', function(name)
                    while not NetworkIsSessionActive() do
                        Citizen.Wait(0)
                        print("Waiting")
                    end
                    
                    print(name)
                    SetRichPresence(name .. " - ".. playerCount .. "/" .."128")
                end)
            end)
    
            Citizen.Wait(60000)
        else
            Citizen.Wait(7000)
        end
	end
end)

local isSoundDisabled = false
AddEventHandler('SaltyChat_SoundEnabledChanged', function(isDisabled)
    isSoundDisabled = isDisabled
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(150)
        if NetworkIsPlayerTalking(PlayerId()) then
            SendNUIMessage({action = "setTalking", value = true})
        
        else
            SendNUIMessage({action = "setTalking", value = false})
        end
    end
end)

-- AddEventHandler('SaltyChat_PluginStateChanged', function(PluginState)
--     local state = true
--     if PluginState == 2 or PluginState == 3 then
--         state = false
--     end

--     local micLabel = 'Mikrofon Status: <span style="color:green">Aktiv</span>'
--     if isMicEnanbled then
--         micLabel = 'Mikrofon Status: <span style="color:red">Deaktiv</span>'
--     end

--     local soundLabel = 'Lyd Status: <span style="color:green">Aktiv</span>'
--     if isSoundDisabled then
--         soundLabel = 'Lyd Status: <span style="color:red">Deaktiv</span>'
--     end

--     local stateLabel = 'Teamspeak Status: '
--     if PluginState == -1 then
--         stateLabel = stateLabel .. '<span style="color:red">Mangler Plugin</span>'
--     end

--     if PluginState == 0 then
--         stateLabel = stateLabel .. '<span style="color:#e03232">Ikke Connected</span>'
--     end

--     if PluginState == 1 then
--         stateLabel = stateLabel .. '<span style="color:#5db6e5">Connected</span>'
--     end

--     if PluginState == 2 then
--         stateLabel = stateLabel .. '<span style="color:green">In-Game</span>'
--     end

-- 	SendNUIMessage({
--         action = 'toggleWindow',
--         display = state,
--         micStatus = micLabel,
--         soundStatus = soundLabel,
--         label = stateLabel,
--     })
-- end)

local maxPedHealth = 200
getHealth = function(player)
    local maxHealth = GetEntityMaxHealth(player)
    local health = GetEntityHealth(player)

    if maxHealth < maxPedHealth then
        print("Changed Max Health from " .. maxHealth .. ' to ' .. maxPedHealth)
        SetEntityMaxHealth(player, maxPedHealth)
		SetEntityHealth(player, maxPedHealth)
    end

    health = health - 100

    if health > 100 then
        health = 100
    end

    return health
end

local crosshairActive = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local player = PlayerPedId()

        if crosshairToggle then
            if IsPlayerFreeAiming(PlayerId()) and IsPedArmed(player, 7) and not crosshairActive then
                crosshairActive = true
                SendNUIMessage({ action = 'enableCrosshair' })
            end

            if crosshairActive and not IsPlayerFreeAiming(PlayerId()) then
                crosshairActive = false
                SendNUIMessage({ action = 'disableCrosshair' })
            end
        end

        if enabled then
            local health = getHealth(player)
            local armor = GetPedArmour(player)

            if not playerHealth then
                playerHealth = health
            end
    
            if not playerArmor then
                playerArmor = armor
            end

            local healthDamaged = (playerHealth ~= health)
            local armorDamaged = (playerArmor ~= armor)

            if hasStarted then
                if armorDamaged or healthDamaged then
                    SendNUIMessage({
                        action = 'updateStatusHud',
                        health = health,
                        armour = armor
                    })
                end
            else
                SendNUIMessage({
                    action = 'updateStatusHud',
                    health = health,
                    armour = armor
                })
                hasStarted = true
            end

            playerHealth = health
            playerArmor = armor
        end
    end
end)
