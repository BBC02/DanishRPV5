local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local isTalking = false
local isTalkingRadio = false
local data = {}

local open = false
local blindfoldopen = false

local GUI = {}
GUI.Time = 0
MiniMap = true
MoneyHud = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
	
    TriggerEvent('es:setMoneyDisplay', 0.0)
    ESX.UI.HUD.SetDisplay(0.0)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)

        SendNUIMessage({action = "setPlayerCount", count = GlobalState.PlayerCount})
	    SendNUIMessage({action = "setPlayerId", id = GetPlayerServerId(PlayerId())})
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	if open then
		open = false
		SendNUIMessage({
			action = "blindclose"
		})
		
		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['mask_1'] = 0, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    data = xPlayer
    local accounts = data.accounts
    for k, v in pairs(accounts) do
        local account = v
        if account.name == "bank" then
            SendNUIMessage({action = "setValue", key = "bankmoney", value = account.money})
        elseif account.name == "black_money" then
            SendNUIMessage({action = "setValue", key = "dirtymoney", value = account.money})
        end
    end
    
    if data.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({action = "setValue", key = "societymoney", value = money})
			SendNUIMessage({action = "boss", value = "yes"})
        end, data.job.name)
    else
		SendNUIMessage({action = "setValue", key = "societymoney", value = 0})
		SendNUIMessage({action = "boss", value = "no"})
    end
    
    -- Job
    local job = data.job
    SendNUIMessage({action = "setValue", key = "job", value = job.label .. " - " .. job.grade_label, icon = job.name})
    
    -- Money
    SendNUIMessage({action = "setValue", key = "money", value = data.money})

    Citizen.Wait(5000)
end)

RegisterNetEvent('srp:togglemap')
AddEventHandler('srp:togglemap', function(_type)
	if MiniMap then
		MiniMap = false
	else
		MiniMap = true
		DisplayRadar(true)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if not MiniMap then
            local playerPed = GetPlayerPed(-1)
            local inVehicle = IsPedInAnyVehicle(playerPed, false)
            if inVehicle then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        end
    end
end)

RegisterNetEvent('ui:toggle')
AddEventHandler('ui:toggle', function(show)
    SendNUIMessage({action = "toggle", show = show})
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == "bank" then
        SendNUIMessage({action = "setValue", key = "bankmoney", value = account.money})
    elseif account.name == "money" then
        SendNUIMessage({action = "setValue", key = "money", value = account.money})
    elseif account.name == "black_money" then
        SendNUIMessage({action = "setValue", key = "dirtymoney", value = account.money})
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	SendNUIMessage({action = "setValue", key = "job", value = job.label .. " - " .. job.grade_label, icon = job.name})
	
	data.job = job
    
    if data.job.grade_name == 'boss' then
        
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			SendNUIMessage({action = "setValue", key = "societymoney", value = money})
			SendNUIMessage({action = "boss", value = "yes"})
        end, data.job.name)
	else
		SendNUIMessage({action = "setValue", key = "societymoney", value = 0})
		SendNUIMessage({action = "boss", value = "no"})
    end
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
    SendNUIMessage({action = "setValue", key = "money", value = e})
end)

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if data.job ~= nil and data.job.grade_name == 'boss' and 'society_' .. data.job.name == society then
		SendNUIMessage({action = "setValue", key = "societymoney", value = money})
	end
end)

RegisterNetEvent('esx_customui:updateStatus')
AddEventHandler('esx_customui:updateStatus', function(status)
    SendNUIMessage({action = "updateStatus", status = status})
end)

RegisterNetEvent('esx_customui:updateWeight')
AddEventHandler('esx_customui:updateWeight', function(weight)
    weightprc = (weight / 8000) * 100
    SendNUIMessage({action = "updateWeight", weight = weightprc})
end)

-- Öppnar/stänger ögonbindel
RegisterNetEvent('jsfour-blindfold')
AddEventHandler('jsfour-blindfold', function( hasItem, src )
	if not open and hasItem then
		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['mask_1'] = 62, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end)
		--SetPedComponentVariation(GetPlayerPed(-1), 1, 123, 5, 1)
		--SetPedPropIndex( GetPlayerPed( -1 ), 0, 5, 0, false )
		open = true
		SendNUIMessage({
			action = "blindopen"
		})
		TriggerServerEvent('jsfour-blindfold:removeItem', src)
	elseif open then
		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['mask_1'] = 0, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end)
		--SetPedDefaultComponentVariation(GetPlayerPed(-1))
		--ClearPedProp(GetPlayerPed(-1), 0)
		open = false
		SendNUIMessage({
			action = "blindclose"
		})
		TriggerServerEvent('jsfour-blindfold:giveItem', src)
	else
		TriggerServerEvent('jsfour-blindfold:notis', src)
	end
end)

-- ID Card
RegisterNetEvent('srp-idcard:open')
AddEventHandler('srp-idcard:open', function(data, type, targetID)
    open = true
    SendNUIMessage({
        action = "open",
        array = data,
        type = type
    })
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
            SendNUIMessage({
                action = "close"
            })
            open = false
        end
    end
end)

-- Hide/Show HUD
local interface = true
local isPaused = false

function openInterface()
    if not MoneyHud then -- hidden
        TriggerEvent('ui:toggle', true)
        MoneyHud = true
    else
        TriggerEvent('ui:toggle', false)
        MoneyHud = false
    end
end

-- Key controls
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, Keys['.']) and (GetGameTimer() - GUI.Time) > 300 then
            openInterface()
        end
    end
end)
