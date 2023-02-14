local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false
blip = false

local lit_1 = {
    {anim = "savecouch@",lib = "t_sleep_loop_couch",name = Config.Language.anim.lie_back, x = 0, y = 0.2, z = 1.1, r = 180.0},
	{anim = "amb@prop_human_seat_chair_food@male@base",lib = "base",name = Config.Language.anim.sit_right, x = 0.0, y = -0.2, z =0.55, r = -90.0},
	{anim = "amb@prop_human_seat_chair_food@male@base",lib = "base",name = Config.Language.anim.sit_left, x = 0.0, y = -0.2, z =0.55, r = 90.0},
	{anim = "amb@world_human_stupor@male_looking_left@base",lib = "base",name = Config.Language.anim.pls, x = 0.0, y = 0.3, z = 1.5, r = 180.0},
}

local lit = {
	{lit = "trump-stretcher", distance_stop = 2.4, name = lit_1, title = Config.Language.lit_1}
}

local SectionAnimation			= 'mp_arrest_paired'	-- SectionAnimation
local AnimationCop 			= 'cop_p2_back_left'	-- Animation / Cop
local AnimationCrook			= 'crook_p2_back_left'	-- Animation / Criminal
prop_amb = false
veh_detect = 0

-- CreateThread(function()
-- 	prop_exist = 0
-- 	while true do
-- 		for _,g in pairs(Config.Hash) do
-- 			local closestObject = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), 7.0, GetHashKey(g.hash), 18)
-- 			if closestObject ~= 0 then
-- 				veh_detect = closestObject
-- 				veh_detection = g.detection
-- 				prop_depth = g.depth
-- 				prop_height = g.height
-- 			end
-- 		end
-- 		if prop_amb == false then
-- 			if GetVehiclePedIsIn(GetPlayerPed(-1)) == 0 then
-- 				if DoesEntityExist(veh_detect) then
-- 					local coords = GetEntityCoords(veh_detect) + GetEntityForwardVector(veh_detect) * - veh_detection
-- 					local coords_spawn = GetEntityCoords(veh_detect) + GetEntityForwardVector(veh_detect) * - (veh_detection + 4.0)
-- 					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), coords.x , coords.y, coords.z, true) <= 1.0 then
-- 						if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3)then
-- 							-- hintToDisplay(Config.Language.out_vehicle_bed)
-- 							for _,m in pairs(lit) do
-- 								local prop = GetClosestObjectOfType(GetEntityCoords(GetPlayerPed(-1)), 9.0, GetHashKey(m.lit))
-- 								if prop ~= 0 then 
-- 									prop_exist = prop
-- 								end
-- 							end
-- 							if IsEntityAttachedToEntity(prop, GetPlayerPed(-1)) ~= 0 or prop ~= 0 then
-- 								if IsControlJustPressed(0, Config.Press.out_vehicle_bed) then
-- 									while not HasModelLoaded("trump-stretcher") do
-- 										RequestModel("trump-stretcher")
-- 										Wait(1)
-- 									end
-- 									local object = CreateVehicle(GetHashKey("trump-stretcher"), coords_spawn, true, true)
-- 									SetVehicleExtra(object, 1, 0)
-- 									SetVehicleExtra(object, 2, 1)
-- 									SetVehicleExtra(object, 12, 1)
-- 									SetVehicleExtra(object, 11, 0)
-- 									SetEntityHeading(GetPlayerPed(-1), GetEntityHeading(GetPlayerPed(-1)) - 180.0)
-- 									SetVehicleEngineOn(object, 1, 1, 1)
-- 									prendre(object, vehicle)
-- 								end
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 	Wait(0)
-- 	end
-- end)

RegisterNetEvent('esx_cuffanimation:arrested')
AddEventHandler('esx_cuffanimation:arrested', function(target, closestObject)
		local pedCoords = GetEntityCoords(GetPlayerPed(-1))
		for _,i in pairs(lit) do
			local closestObject = GetClosestVehicle(pedCoords, 3.0, GetHashKey("trump-stretcher"), 70)
		local playerPed = GetPlayerPed(-1)
		local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
		if not IsEntityAttached(playerPed) then
			RequestAnimDict("savecouch@")
			test = closestObject
			while not HasAnimDictLoaded("savecouch@") do
				Wait(10)
			end
	
			AttachEntityToEntity(GetPlayerPed(-1), closestObject, GetPlayerPed(-1), 0.0, 0.2, 1.1, 0.0, 0.0, 180.0, 0.0, false, false, false, false, 2, true)
			TaskPlayAnim(GetPlayerPed(-1), "savecouch@", "t_sleep_loop_couch", 8.0, 8.0, -1, 1, 0, false, false, false)
	
			-- Citizen.Wait(950)
			-- DetachEntity(GetPlayerPed(-1), true, false)
	
			arrested = false
		else
			DetachEntity(playerPed, true, true)
		end
	end
end)

RegisterNetEvent('esx_cuffanimation:arrested2')
AddEventHandler('esx_cuffanimation:arrested2', function(target, closestObject)
		local pedCoords = GetEntityCoords(GetPlayerPed(-1))
		for _,i in pairs(lit) do
			local closestObject = GetClosestVehicle(pedCoords, 3.0, GetHashKey("trump-stretcher"), 70)
		local playerPed = GetPlayerPed(-1)
		local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
		if not IsEntityAttached(playerPed) then
			SetVehicleDoorOpen(closestObject, 4, false)
			RequestAnimDict("amb@world_human_stupor@male_looking_left@base")
			test = closestObject
			while not HasAnimDictLoaded("amb@world_human_stupor@male_looking_left@base") do
				Wait(10)
			end
	
			AttachEntityToEntity(GetPlayerPed(-1), closestObject, GetPlayerPed(-1), 0.0, 0.3, 1.5, 0.0, 0.0, 180.0, 0.0, false, false, false, false, 2, true)
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_stupor@male_looking_left@base", "base", 8.0, 8.0, -1, 1, 0, false, false, false)
	
			-- Citizen.Wait(950)
			-- DetachEntity(GetPlayerPed(-1), true, false)
	
			arrested = false
		else
			DetachEntity(playerPed, true, true)
		end
	end
end)

function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}

	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = {
			{label = _U('ems_menu'), value = 'citizen_interaction'},
			{label = _U('ems_interactions'), value = 'interactions'},
			{label = 'Slå gps til/fra', value = 'blip'},
	}}, function(data, menu)
		if data.current.value == 'blip' then
			if blip == true then
				exports['mythic_notify']:DoHudText('error', 'Du har slået gps\'en fra')
				ESX.TriggerServerCallback("getrpname2",function(name)
					TriggerServerEvent("TurnBlipOff", name, 1)
				end,GetPlayerServerId(id))
				blip = false
			else
				exports['mythic_notify']:DoHudText('success', 'Du har slået gps\'en til')
				ESX.TriggerServerCallback("getrpname2",function(name)
					TriggerServerEvent("TurnBlipOn", name, 1)
				end,GetPlayerServerId(id))
				blip = true
			end
		elseif data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('ems_menu_title'),
				align    = 'top-left',
				elements = {
					{label = _U('ems_menu_revive'), value = 'revive'},
					{label = _U('ems_menu_small'), value = 'small'},
					{label = _U('ems_menu_big'), value = 'big'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'},
					{label = _U('ems_menu_search'), value = 'search'}
			}}, function(data, menu)
				if isBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if data.current.value == 'search' then
					TriggerServerEvent('esx_ambulancejob:svsearch')
				elseif closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
					if data.current.value == 'revive' then
						revivePlayer(closestPlayer)
					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')

					elseif data.current.value == 'big' then

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')

					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end

		if data.current.value == 'interactions' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'interactions', {
				title    = _U('ems_menu_title'),
				align    = 'top-left',
				elements = {
					{label = 'Tjek personens puls', value = 'puls'},
					{label = 'Tjek personens skader', value = 'skader'},
					{label = 'Hjælp personen op og stå', value = 'op'},
					{label = 'Stop blødninger', value = 'stop_bleeding'},
					{label = 'Brug CT-scanner', value = 'scanning'},
					{label = 'Giv smertestillende', value = 'smertestillende'},
			}}, function(data, menu)
				if isBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if data.current.value == 'smertestillende' then
						local pedCoords = GetEntityCoords(GetPlayerPed(-1))
						for _,i in pairs(lit) do
							TriggerServerEvent('3dme:shareDisplay', "~y~Giver personen smertestillende")
							if IsVehicleExtraTurnedOn(closestObject, 11) == false then
								SetVehicleExtra(closestObject, 11, 0)
								SetVehicleExtra(closestObject, 12, 1)
							else
								SetVehicleExtra(closestObject, 11, 1)
								SetVehicleExtra(closestObject, 12, 0)
							end
						end

					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')

					elseif data.current.value == 'scanning' then
						local pedCoords = GetEntityCoords(GetPlayerPed(-1))
						for _,i in pairs(lit) do
							TriggerServerEvent('3dme:shareDisplay', "~y~Bruger scanner")
							if IsVehicleExtraTurnedOn(closestObject, 11) == false then
								SetVehicleExtra(closestObject, 11, 0)
								SetVehicleExtra(closestObject, 12, 1)
							else
								SetVehicleExtra(closestObject, 11, 1)
								SetVehicleExtra(closestObject, 12, 0)
							end
						end

					elseif data.current.value == 'stop_bleeding' then
						local pedCoords = GetEntityCoords(GetPlayerPed(-1))
						for _,i in pairs(lit) do
							TriggerServerEvent('3dme:shareDisplay', "~y~Holder på blødninger")
							if IsVehicleExtraTurnedOn(closestObject, 11) == false then
								SetVehicleExtra(closestObject, 11, 0)
								SetVehicleExtra(closestObject, 12, 1)
							else
								SetVehicleExtra(closestObject, 11, 1)
								SetVehicleExtra(closestObject, 12, 0)
							end
						end

					elseif data.current.value == 'op' then
						local pedCoords = GetEntityCoords(GetPlayerPed(-1))
						for _,i in pairs(lit) do
							TriggerServerEvent('3dme:shareDisplay', "~y~Hjælper personen op og stå")
							if IsVehicleExtraTurnedOn(closestObject, 11) == false then
								SetVehicleExtra(closestObject, 11, 0)
								SetVehicleExtra(closestObject, 12, 1)
							else
								SetVehicleExtra(closestObject, 11, 1)
								SetVehicleExtra(closestObject, 12, 0)
							end
						end
						
					elseif data.current.value == 'skader' then
						local pedCoords = GetEntityCoords(GetPlayerPed(-1))
						for _,i in pairs(lit) do
							TriggerServerEvent('3dme:shareDisplay', "~y~Tjekker Skader")
							if IsVehicleExtraTurnedOn(closestObject, 11) == false then
								SetVehicleExtra(closestObject, 11, 0)
								SetVehicleExtra(closestObject, 12, 1)
							else
								SetVehicleExtra(closestObject, 11, 1)
								SetVehicleExtra(closestObject, 12, 0)
							end
						end

					elseif data.current.value == 'puls' then
						TriggerServerEvent('3dme:shareDisplay', "~y~Tjekker puls")
		end
			end, function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
CreateThread(function()
	while true do
		Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for hospitalNum,hospital in pairs(Config.Hospitals) do
				-- Ambulance Actions
				
				for k,v in ipairs(hospital.AmbulanceActions) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
						end
					end
				end

				-- Pharmacies
				for k,v in ipairs(hospital.Pharmacies) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
						end
					end
				end
				for i=1, #hospital.Vehicles, 1 do
					-- local distance = #(playerCoords - hospital.Vehicles[i].Spawner)

					-- if distance < Config.DrawDistance then
					-- 	-- DrawMarker(Config.MarkerType.Vehicles, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
					-- 	letSleep = false

					-- 	if distance < Config.Marker.x then
					-- 		isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
					-- 	end
					-- end
					for j=1, #hospital.Vehicles[i].Deleters, 1 do
						local distance2 = #(playerCoords - hospital.Vehicles[i].Deleters[j].coords)

						if distance2 < Config.DrawDistance then
							DrawMarker(25, hospital.Vehicles[i].Deleters[j].coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, Config.Marker.r, Config.Marker.g, Config.Marker.b, 100, false, false, 2, false, false, false, false)
							letSleep = false

							if distance2 < Config.Marker.x then
								isInMarker, currentStation, currentPart, currentPartNum = true, k, 'del_veh', i
							end
						end
					end
				end

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
						end
					end
				end


				-- Helicopter Spawners
				for k,v in ipairs(hospital.Helicopters) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
						end
					end
				end
			end

			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Wait(500)
			end
		else
			Wait(500)
		end
	end
end)


AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	elseif part == 'Pharmacy' then
		CurrentAction = part
		CurrentActionMsg = _U('open_pharmacy')
		CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'del_veh' then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)
		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('del_veh')
			CurrentActionData = {vehicle = vehicle}
		end
	elseif part == 'Helicopters' then
		CurrentAction = part
		CurrentActionMsg = _U('helicopter_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
CreateThread(function()
	local sleep = 1000
	while true do
		Wait(sleep)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			sleep = 3

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				elseif CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'Helicopters' then
					OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				end

				CurrentAction = nil
			end

		elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and not isDead then
			if IsControlJustReleased(0, 167) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Wait(1000)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local vehicle, distance = ESX.Game.GetClosestVehicle()

	if vehicle and distance < 5 then
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
			else
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

function OpenCloakroomMenu()
	ESX.UI.Menu.CloseAll()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Omklædning",
            txt = "",
            params = {
                event = "pp:emscloth"
            }
        },
        {
            id = 2,
            header = "Civil Tøj",
            txt = "",
            params = {
                event = "pp:streetclothes",
                args = {
                        
                        
                }
            }
        },
        {
            id = 3,
            header = "Gem tøj",
            txt = "",
            params = {
                event = "pp:saveclothingoutfit",
                args = {
                        
                        
                }
            }
        },
            
    })
end

RegisterNetEvent("pp:emscloth")
AddEventHandler("pp:emscloth", function()
    for k,v in pairs(Config.outfits) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == v.job then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                if skin.model == v.model then
                    local outfit = {}
                    table.insert(outfit, {
                        id = k,
                        header = v.label,
                        txt = '',
                        params = {
                            event = 'pp:outfitspolice',
                            args = {
								label = v.label,
								mask = v.mask,
                                torso = v.torso,
                                undershirt = v.undershirt,
                                arms = v.arms,
                                pants = v.pants,
                                shoes = v.shoes,
                                bag = v.bag,
                                accesories = v.accesories,
                                kevlar = v.kevlar,
                                badge = v.badge,
                                hat = v.hat,
								glass = v.glass,
								ear = v.ear
                            }
                        }
                    })
                    TriggerEvent('nh-context:sendMenu', outfit)
                end
            end)        
        end     
    end     
end)

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'top-left',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
			{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100}
	}}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.item, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)


function prendre(propObject, hash)
	NetworkRequestControlOfEntity(propObject)

	LoadAnim("anim@heists@box_carry@")

	AttachEntityToEntity(propObject, GetPlayerPed(-1), GetPlayerPed(-1), -0.05, 1.3, -0.345 , 180.0, 180.0, 180.0, 0.0, false, false, true, false, 2, true)
		---
	while IsEntityAttachedToEntity(propObject, GetPlayerPed(-1)) do

		Citizen.Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if IsPedDeadOrDying(GetPlayerPed(-1)) then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetVehicleExtra(propObject, 1, 1)
			SetVehicleExtra(propObject, 2, 0)
			DetachEntity(propObject, true, true)
		end

		
	end
end

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end

function in_ambulance(propObject, amb, depth, height)
	veh_detect = 0
	NetworkRequestControlOfEntity(amb)
	AttachEntityToEntity(propObject, amb, 0.0, -0.0, depth, height, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 2, true)
end


