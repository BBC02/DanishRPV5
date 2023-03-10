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
PlayerData = {}

local jailTime = 0

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("esx-qalle-jail:client:prisonWorkReward", function(src)
	jailTime = jailTime - 5
	TriggerServerEvent("esx-qalle-jail:updateJailTime", jailTime)
	if jailTime <= 0 then
		jailTime = 0
		TriggerServerEvent("esx-qalle-jail:updateJailTime", jailTime)
		UnJail()
	end
end)

RegisterNetEvent("esx:playerLoaded", function(newData)
	PlayerData = newData

	Wait(25000)

	ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailTime", function(inJail, newJailTime)
		if inJail then
			jailTime = newJailTime

			JailLogin()
		end
	end)
end)

CreateThread(function()
	local blip = AddBlipForCoord(Config.JailBlip.x, Config.JailBlip.y, Config.JailBlip.z)
	SetBlipSprite (blip, 188)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.9)
	SetBlipColour (blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('F??ngsel')
	EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("esx:setJob", function(response)
	PlayerData["job"] = response
end)

RegisterNetEvent("esx-qalle-jail:client:openJailMenu", function()
	OpenJailMenu()
end)

RegisterNetEvent("esx2-qalle-jail:jailPlayer", function(newJailTime)
	jailTime = newJailTime

	Cutscene()
end)

RegisterNetEvent("esx-qalle-jail:unJailPlayer", function()
	jailTime = 0

	UnJail()
end)

function JailLogin()
	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

	ESX.ShowNotification("Sidste gang du loggede ud var du i f??ngsel, derfor er du her igen!")

	InJail()
end

function UnJail()
	InJail()

	-- ESX.Game.Teleport(PlayerPedId(), Config.Teleports["Boiling Broke"])
	ESX.Game.Teleport(PlayerPedId(), {x = 1846.49609375, y = 2585.6311035156, z = 45.672630310059, heading = 275.25})

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	TriggerEvent('esx_policejob:unrestrain') -- Fjerner dine h??ndjern, n??r du bliver l??sladt
	ESX.ShowNotification("Du er blevet l??sladt!")
end


function InJail()
	--Jail Timer--
	CreateThread(function()
		while jailTime > 0 do
			jailTime = jailTime - 1
			ESX.ShowNotification("Du har " .. jailTime .. " minutter tilbage i f??ngsel!")
			TriggerServerEvent("esx-qalle-jail:updateJailTime", jailTime)

			if jailTime <= 0 then
				UnJail()
				TriggerServerEvent("esx-qalle-jail:updateJailTime", 0)
			elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1664.74, 2604.82, 45.56, true) >= 1000 then
				ESX.ShowNotification("Du er nu stukket af")
				jailTime = 0 
				TriggerServerEvent("esx-qalle-jail:updateJailTime", 0)
			end

			Wait(60000)
		end
	end)

	--Jail Timer--
	--Prison Work--
	CreateThread(function()
		while jailTime > 0 do
			local sleepThread = 500
			local Packages = Config.PrisonWork["Packages"]
			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)

			for posId, v in pairs(Packages) do
				local DistanceCheck = GetDistanceBetweenCoords(PedCoords, v["x"], v["y"], v["z"], true)
				if DistanceCheck <= 10.0 then
					sleepThread = 3
					local PackageText = "Pak"

					if not v["state"] then
						PackageText = "Allerede pakket"
					end

					ESX.Game.Utils.DrawText3D(v, "[E] " .. PackageText, 0.4)

					if DistanceCheck <= 1.5 then
						if IsControlJustPressed(0, 38) then
							if v["state"] then
								PackPackage(posId)
							else
								ESX.ShowNotification("En person har allerede pakket denne pakke!")
							end
						end
					end
				end
			end

			Wait(sleepThread)
		end
	end)
	--Prison Work--
end

function PackPackage(packageId)
	local Package = Config.PrisonWork["Packages"][packageId]

	LoadModel("prop_cs_cardbox_01")

	local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), Package["x"], Package["y"], Package["z"], true)

	PlaceObjectOnGroundProperly(PackageObject)
	Wait(100)
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)

	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do
		Wait(1)

		local TimeToTake = 60000 * 1.20 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then
			DeleteEntity(PackageObject)

			ESX.ShowNotification("Afbrudt!")

			Packaging = false
		end

		if PackPercent >= 100 then
			Packaging = false
			DeliverPackage(PackageObject)
			Package["state"] = true
		else
			ESX.Game.Utils.DrawText3D(Package, "Pakker... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end
	end
end

function DeliverPackage(packageId)
	if DoesEntityExist(packageId) then
		AttachEntityToEntity(packageId, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		ClearPedTasks(PlayerPedId())
	else
		return
	end

	local Packaging = true
	LoadAnim("anim@heists@box_carry@")
	while Packaging do

		Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
			TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if not IsEntityAttachedToEntity(packageId, PlayerPedId()) then
			Packaging = false
			DeleteEntity(packageId)
		else
			local DeliverPosition = Config.PrisonWork["DeliverPackage"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = GetDistanceBetweenCoords(PedPosition, DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"], true)

			ESX.Game.Utils.DrawText3D(DeliverPosition, "[E] Aflever Pakke", 0.4)

			if DistanceCheck <= 2.0 then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(packageId)
					ClearPedTasksImmediately(PlayerPedId())
					Packaging = false
					TriggerServerEvent("esx-qalle-jail:server:prisonWorkReward")
				end
			end
		end
	end
end

function OpenJailMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'jail_prison_menu',
		{
			title    = "F??ngsels Menu",
			align    = 'top-left',
			elements = {
				{ label = "Smid n??rmeste person i f??ngsel", value = "jail_closest_player" },
				{ label = "L??slad person", value = "unjail_player" }
			}
		}, 
	function(data, menu)

		local action = data.current.value
		if action == "jail_closest_player" then
			menu.close()
			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
				{
					title = "F??ngsels tid (minutter)"
				},
			function(data2, menu2)

				local jailTime = tonumber(data2.value)
				if jailTime == nil then
					ESX.ShowNotification("Tiden skal v??re i minutter!")
				else
					menu2.close()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification("Ingen spillere i n??rheden!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
								title = "F??ngsels Grund"
							},
						function(data3, menu3)

							local reason = data3.value

							if reason == nil then
								ESX.ShowNotification("Du skal skrive noget her!")
							else
								menu3.close()
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification("Ingen spillere i n??rheden!")
								else
                                    TriggerServerEvent("esx2-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason)
                                end
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "unjail_player" then

			local elements = {}
			ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(playerArray)

				if #playerArray == 0 then
					ESX.ShowNotification("F??ngslet er tomt!")
					return
				end
				print(playerArray.status)
				for i = 1, #playerArray, 1 do
					table.insert(elements, {label = "Person: " .. playerArray[i].name .. " | F??ngsels tid: " .. playerArray[i].jailTime .. " minutter" .. " | Status ".. playerArray[i].status, value = playerArray[i].identifier })
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'jail_unjail_menu',
					{
						title = "L??slad Person",
						align = "top-left",
						elements = elements
					},
				function(data2, menu2)

					local action = data2.current.value
					TriggerServerEvent("esx-qalle-jail:unJailPlayer", action)
					menu2.close()
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		end

	end, function(data, menu)
		menu.close()
	end)	
end

