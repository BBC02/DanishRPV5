local Keys = {
	["ESC"] = 322, 		["F1"] = 288, 		["F2"] = 289, 		["F3"] = 170, 		["F5"] = 166, 
	["F6"] = 167, 		["F7"] = 168, 		["F8"] = 169, 		["F9"] = 56, 		["F10"] = 57,
	["~"] = 243, 		["1"] = 157, 		["2"] = 158, 		["3"] = 160, 		["4"] = 164, 
	["5"] = 165,		["6"] = 159, 		["7"] = 161, 		["8"] = 162, 		["9"] = 163, 
	["-"] = 84, 		["="] = 83, 		["TAB"] = 37,		["Q"] = 44, 		["W"] = 32, 
	["E"] = 38, 		["R"] = 45, 		["T"] = 245, 		["Y"] = 246, 		["U"] = 303, 
	["P"] = 199, 		["["] = 39, 		["]"] = 40, 		["ENTER"] = 18, 	["CAPS"] = 137, 
	["A"] = 34, 		["S"] = 8, 			["D"] = 9, 			["F"] = 23, 		["G"] = 47, 
	["H"] = 74, 		["K"] = 311, 		["L"] = 182, 		["LEFTSHIFT"] = 21, ["Z"] = 20, 
	["X"] = 73, 		["C"] = 26, 		["V"] = 0, 			["B"] = 29,			["N"] = 249, 
	["M"] = 244, 		[","] = 82, 		["."] = 81, 		["LEFTCTRL"] = 36, 	["LEFTALT"] = 19,
	["SPACE"] = 22,		["RIGHTCTRL"] = 70, ["HOME"] = 213, 	["PAGEUP"] = 10, 	["PAGEDOWN"] = 11,
	["DELETE"] = 178, 	["LEFT"] = 174,		["RIGHT"] = 175, 	["TOP"] = 27, 		["DOWN"] = 173, 
	["NENTER"] = 201, 	["N4"] = 108, 		["N5"] = 60, 		["N6"] = 107,		["BACKSPACE"] = 177,
	["N+"] = 96, 		["N-"] = 97, 		["N7"] = 117, 		["N8"] = 61, 		["N9"] = 118
}

local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}

local holdingup = false
local hackholdingup = false
local secondsRemaining = 0
local store = ""
local currentStore = ''

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_holdup:toofarlocal')
AddEventHandler('esx_holdup:toofarlocal', function(robb)
	holdingup = false
	hackholdingup = false
    ESX.ShowNotification(_U('robbery_cancelled'))
    
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdup:toofarlocalhack')
AddEventHandler('esx_holdup:toofarlocalhack', function(robb)
	holdingup = false
	hackholdingup = false
    ESX.ShowNotification(_U('robbery_cancelled'))
    
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdup:startHacking')
AddEventHandler('esx_holdup:startHacking', function(robb)
	hackholdingup = true
	TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", 7, 90, disableSecurity)
    
    store = robb
	secondsRemaining = 90
end)

function disableSecurity(success, timeremaining)
	if success then
		print('Success med '..timeremaining..' sekunder tilbage .')
		TriggerEvent('mhacking:hide')
		TriggerEvent('esx_holdup:hackcomplete')
	else
		hackholdingup = false
		ESX.ShowNotification(_U('hack_failed'))
		TriggerEvent('mhacking:hide')
        secondsRemaining = 0	
        
        CurrentAction = nil
	end
end


RegisterNetEvent('esx_holdup:hackcomplete')
AddEventHandler('esx_holdup:hackcomplete', function()
	hackholdingup = false
    ESX.ShowNotification(_U('hack_complete'))

    Config.Stores[store].isOpen = true
    TriggerServerEvent('esx_holdup:notifyHack', store)

	store = ""

	secondsRemaining = 0
	CurrentAction = nil
end)

RegisterNetEvent('esx_holdup:startRob')
AddEventHandler('esx_holdup:startRob', function(robb)
	holdingup = true
	store = robb
	secondsRemaining = Config.RobTimerInMinutes * 60
	TriggerEvent('esx_blowtorch:startblowtorch')
end)

RegisterNetEvent('esx_holdup:robberycomplete')
AddEventHandler('esx_holdup:robberycomplete', function(robb)
	holdingup = false
    ESX.ShowNotification(_U('robbery_complete'))

    Config.Stores[store].isOpen = false
    Config.Stores[store].isRobbed = true
    
    store = ""
    
	TriggerEvent('esx_blowtorch:finishclear')
	TriggerEvent('esx_blowtorch:stopblowtorching')
    TriggerEvent('esx_blowtorch:clearweld', GetEntityCoords(GetPlayerPed(-1)))
    
    secondsRemaining = 0
    
	CurrentAction = nil
end)

RegisterNetEvent('esx_holdup:notifyRobbery')
AddEventHandler('esx_holdup:notifyRobbery', function(robber)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(robber)))
	ESX.ShowAdvancedNotification(_U('title_notify'), _U('subject_notify'), _U('msg_notify'), mugshotStr, 1)
    UnregisterPedheadshot(mugshot)
end)

local notifyChance = math.random(1, 1000)

RegisterNetEvent('esx_holdup:notifyEnd')
AddEventHandler('esx_holdup:notifyEnd', function(robber)
	
    if notifyChance == 1 then
        ESX.TriggerServerCallback('esx_holdup:getPhoneNumber', function(number)
            local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(robber)))
            ESX.ShowAdvancedNotification(_U('end_title_notify'), _U('end_subject_notify'), _U('end_msg_notify') .. number, mugshotStr, 1)
            UnregisterPedheadshot(mugshot)
        end, robber)
    end
end)

RegisterNetEvent('esx_holdup:notifyNumber')
AddEventHandler('esx_holdup:notifyNumber', function(store, robber, coords)

    if notifyChance == 1 then
        ESX.TriggerServerCallback('esx_holdup:getPhoneNumber', function(number)
            TriggerEvent('esx_holdup:alertphone', _U('end_alert') .. number, coords, true)
        end, robber)
    end
end)

RegisterNetEvent('esx_holdup:alertphone')
AddEventHandler('esx_holdup:alertphone', function(text, coords)
	TriggerServerEvent('esx_addons_gcphone:startCall', 'police', text, coords, true)
end)

AddEventHandler('esx_holdup:hasEnteredMarker', function(zone)
    if zone == '24/7' then
        if Config.Stores[currentStore].isOpen then
            CurrentAction = 'robbery_empty'
            CurrentActionMsg = _U('open_robbery')
            CurrentActionData = {}
        else
            CurrentAction = 'robbery_start'
            CurrentActionMsg = _U('start_robbery')
            CurrentActionData = {}
        end
    end
end)

AddEventHandler('esx_holdup:hasExitedMarker', function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
        local isInMarker, letSleep, currentZone = false, true
        local error = true

        for k,v in pairs(Config.Stores) do
            local pos = vector3(v.Pos.x, v.Pos.y, v.Pos.z)
            local distance = #(playerCoords - pos)

            if distance < Config.DrawDistance and v.Type ~= -1 then
                letSleep = false
    
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
            end
    
            if distance < v.Size.x then
                isInMarker, currentZone, currentSt = true, v.nameofstore, k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
            LastZone = currentZone
            currentStore = currentSt
			TriggerEvent('esx_holdup:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_holdup:hasExitedMarker', LastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then
                
                if CurrentAction == 'robbery_start' then
                    TriggerServerEvent('esx_holdup:rob', currentStore)
                end

                if CurrentAction == 'robbery_empty' then
                    TriggerServerEvent('esx_holdup:rob', currentStore)
                end

                CurrentAction = nil
            end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
		if hackholdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
	end
end)

RegisterNetEvent('esx_holdup:killblip')
AddEventHandler('esx_holdup:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setblip')
AddEventHandler('esx_holdup:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
	AddTextEntry('MYBLIP', 'Butiksrøveri ')
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName('me')
	EndTextCommandSetBlipName(blipRobbery)
end)

function displayJailTimer(time)
    local hours = string.format('%02.f', math.floor(time / 60))
    local mins = string.format('%02.f', math.floor(time - hours * 60))
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
    SetTextEntry('STRING')
    AddTextComponentString(_U('robbery_of', hours, mins))
    DrawText(0.5, 0.8)
end

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		if holdingup then
			
			displayJailTimer(secondsRemaining)

			--drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
			DisplayHelpText(_U('press_to_cancel'))

			local pos2 = Config.Stores[store].Pos

			if IsControlJustReleased(1, 51) then
				TriggerServerEvent('esx_holdup:toofar', store)
				TriggerEvent('esx_blowtorch:stopblowtorching')
			end

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
				TriggerServerEvent('esx_holdup:toofar', store)
			end
		end

		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
