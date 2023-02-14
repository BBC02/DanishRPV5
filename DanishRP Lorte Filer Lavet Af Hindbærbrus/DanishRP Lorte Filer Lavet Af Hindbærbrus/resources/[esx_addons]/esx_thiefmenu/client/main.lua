local PlayerData, CurrentActionData, handcuffTimer, dragStatus = {}, {}, {}, {}
IsHandcuffed = false
dragStatus.isDragged = false
ESX = nil
blip = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HandcuffTimer           = {}
local DragStatus              = {}
DragStatus.IsDragged          = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}
local playerInService         = false
local strips 				  = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    Citizen.Wait(5000)
    PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('elf3dme:triggerDisplay')
AddEventHandler('elf3dme:triggerDisplay', function(text, source)
    Display(GetPlayerFromServerId(source), text)
end)

function Display(mePlayer, text)
    local displaying = true
    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        while displaying do
            Wait(0)
			local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
			local x, y, z = table.unpack(GetEntityCoords(ped))
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3Ds(coordsMe['x'], coordsMe['y'], coordsMe['z']+0.2, text)
            end
        end
    end)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(250,140,0,255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
	local playerPed = GetPlayerPed(-1)
		if IsControlJustReleased(0, 28) and not IsEntityDead(playerPed)  then
			OpenSearchActionsMenu()
        end
    end
end)

function OpenSearchActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'interakce', {
		css      = 'interakce',
		title    = 'Funktioner',
		align    = 'right',
		elements = {
			{label = ('Giv Strips af/på'), value = 'handcuff'},
            {label = ('Sæt i køretøj'), value = 'put_in_vehicle'},
            {label = ('Fjern fra køretøj'), value = 'out_the_vehicle'},
            {label = ('Tjek lommer'), value = 'body_search'},
            {label = ('Eskorter'), value = 'drag'},
	}}, function(data, menu)

		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if data.current.value == 'vest_off' then
			local playerPed = PlayerPedId()
			local playerArmour = GetPedArmour(playerPed)
			if playerArmour >= 1 then
				ExecuteCommand('removevest')
			end
		elseif closestPlayer ~= -1 and closestDistance <= 3.0 then
			local action = data.current.value

			if data.current.value == 'body_search' then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'mp_arresting', 'idle', 3) then
					TriggerServerEvent('esx_okradanie:message', GetPlayerServerId(closestPlayer), ('Du bliver visiteret.'))
					TriggerServerEvent('3dme:shareDisplay', "~y~Visitere person")
					OpenBodySearchMenu()
				else
					exports['mythic_notify']:SendAlert('error', 'Personen er ikke i strips!', 5000)
				end
			elseif data.current.value == 'handcuff' then
				--TriggerServerEvent('3dme:shareDisplay', "~y~Sætter strips på")
				TriggerServerEvent('esx_thiefmenu:handcuff', GetPlayerServerId(closestPlayer))
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'scissors', 0.2)
			elseif data.current.value == 'drag' then
				-- TriggerServerEvent('elf3dme:shareDisplay', "Eskotere nærmeste person")
				TriggerServerEvent('3dme:shareDisplay', "~y~Eskotere person")
				TriggerServerEvent('esx_thiefmenu:drag', GetPlayerServerId(closestPlayer))
			elseif data.current.value == 'put_in_vehicle' then
				TriggerServerEvent('3dme:shareDisplay', "~y~Putter person i køretøj")
				TriggerServerEvent('esx_thiefmenu:putInVehicle', GetPlayerServerId(closestPlayer))
			elseif data.current.value == 'out_the_vehicle' then
				TriggerServerEvent('3dme:shareDisplay', "~y~Tager person ud af køretøj")
				TriggerServerEvent('esx_thiefmenu:OutVehicle', GetPlayerServerId(closestPlayer))
			end
		else
			exports['mythic_notify']:SendAlert('error', 'Ingen personer i nærheden', 5000)
		end
	end, function(data, menu)
		menu.close()
		TriggerEvent("opencivillians")
	end)
end


RegisterNetEvent('esx_thiefmenu:handcuff')
AddEventHandler('esx_thiefmenu:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		DisplayRadar(false)

	else

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('esx_thiefmenu:putInVehicle')
AddEventHandler('esx_thiefmenu:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					if DoesEntityExist(vehicle) and IsEntityDead(playerPed) then
						SetPedIntoVehicle(playerPed, vehicle, freeSeat)
						dragStatus.isDragged = false
					else
						TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
						dragStatus.isDragged = false
					end
				end
			end
		end
	end
end)

--[[function OpenBodySearchMenu(player)
	TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(player), GetPlayerName(player))
end]]

function OpenBodySearchMenu()
	exports.ox_inventory:openNearbyInventory()
end

RegisterNetEvent('esx_okradanie:handcuff')
AddEventHandler('esx_okradanie:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)

	else
		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('esx_thiefmenu:OutVehicle')
AddEventHandler('esx_thiefmenu:OutVehicle', function()
	local playerPed = PlayerPedId()
	if isHandcuffed then
		if IsPedSittingInAnyVehicle(playerPed) then
			if IsEntityDead(playerPed) then
				ClearPedTasksImmediately(playerPed)
			else
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				TaskLeaveVehicle(playerPed, vehicle, 64)
			end
		end
	end
end)

RegisterNetEvent('esx_okradanie:unrestrain')
AddEventHandler('esx_okradanie:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

	end
end)

RegisterNetEvent('esx_thiefmenu:drag')
AddEventHandler('esx_thiefmenu:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
				--TriggerEvent('gris:eskorttrue')
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

CreateThread(function()
	while true do
			Wait(0)
		local playerPed = PlayerPedId()
		if isHandcuffed == true then
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 21, true) -- Melee Attack 1

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			DisableControlAction(0, 23, true) -- Disable enter vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Wait(500)
		end
	end
end)