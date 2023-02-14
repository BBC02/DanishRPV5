local PawnShopPedModel = "ig_taostranslator"
local isPawnShopPedSpawned = false

local BlackPawnShopPedModel = "mp_m_waremech_01"
local isBlackPawnShopPedSpawned = false
local BlackPawnShopNPC = vector4(122.52, -3181.19, 5.95, 225.5)

local hasList = false
local vent = true
local CarGenVehicles = {}

local isSelling = false

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(0)
	end

	while SRP == nil do
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	for i = 1, #Config.CarGeneratorSpawn, 1 do
		local car = Config.CarGeneratorSpawn[i]
		local model = GetHashKey(car)
		local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(model))

		CarGenVehicles[i] = {
			["model"] = GetDisplayNameFromVehicleModel(model),
			["modelName"] = car,
			["display"] = vehicleName
		}
	end

	if not isPawnShopPedSpawned then
		local coords = vector3(Config.PawnShopNPC.x, Config.PawnShopNPC.y, Config.PawnShopNPC.z - 1.0)
		local ped = SRP.Game.CreatePed(PawnShopPedModel, coords, Config.PawnShopNPC.w)

		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blip, 500)
		SetBlipColour(blip, 2)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Pantelåner")
		EndTextCommandSetBlipName(blip)

		SetEntityInvincible(ped, true)
		FreezeEntityPosition(ped, true)

		exports.ox_target:addBoxZone({
			coords = coords,
			size = vec3(0.8, 0.8, 4),
			rotation = Config.PawnShopNPC.w,
			debug = false,
			options = {
				{
					name = "PawnShopNPC",
					icon = "fas fa-watch",
					label = "Sælg Til Pantelåneren",
					distance = 2.5,
					canInteract = function()
						return not hasTask
					end,
					onSelect = function(data)
						OpenPawnSellShop(data.entity)
					end
				},

			}
		})

		isPawnShopPedSpawned = true
		table.insert(peds, ped)
	end

	if not isBlackPawnShopPedSpawned then
		local coords = vector3(BlackPawnShopNPC.x, BlackPawnShopNPC.y, BlackPawnShopNPC.z - 1.0)
		local ped = SRP.Game.CreatePed(BlackPawnShopPedModel, coords, BlackPawnShopNPC.w)

		SetEntityInvincible(ped, true)
		FreezeEntityPosition(ped, true)

		exports.ox_target:addBoxZone({
			coords = coords,
			size = vec3(0.8, 0.8, 4),
			rotation = BlackPawnShopNPC.w,
			debug = false,
			options = {
				{
					name = "BlackPawnShopNPC",
					icon = "fas fa-car",
					label = "Få tilsendt bil liste",
					distance = 2.5,
					canInteract = function()
						return not hasTask
					end,
					onSelect = function(data)
						DrawBusySpinner("Afventer listen på bilerne")
						TriggerServerEvent("srp_illegaljobs:SendVehiclePool", CarGenVehicles)
					end
				},
				{
					name = "BlackPawnShopNPC",
					icon = "fas fa-car",
					label = "Forny bil liste",
					distance = 2.5,
					canInteract = function()
						return not hasTask and hasList
					end,
					onSelect = function(data)
						DrawBusySpinner("Afventer listen på bilerne")
						TriggerServerEvent("srp_illegaljobs:RefreshVehiclePool", CarGenVehicles)
					end
				},
				{
					name = "BlackPawnShopNPC",
					icon = "fa-solid fa-dollar-sign",
					label = "Aflevere bilen",
					distance = 2.5,
					canInteract = function()
						local playerPed = PlayerPedId()
						local lastVehicle = GetVehiclePedIsIn(playerPed, true)
						if not DoesEntityExist(lastVehicle) then
							return false
						end

						local vehPlate = ESX.Math.Trim(GetVehicleNumberPlateText(lastVehicle))
						return not hasTask and (IsVehicleNPCVehicle(vehPlate) or Config.Debug)
					end,
					onSelect = function(data)
						local playerPed = PlayerPedId()
						local lastVehicle = GetVehiclePedIsIn(playerPed, true)

						local model = GetEntityModel(lastVehicle)
						local vehicleModel = GetDisplayNameFromVehicleModel(model)

						local netID = NetworkGetNetworkIdFromEntity(lastVehicle)
						TriggerServerEvent("srp_illegaljobs:CollectVehiclePool", vehicleModel, netID)
					end
				},
			}
		})

		isBlackPawnShopPedSpawned = true
		table.insert(peds, ped)
	end

	exports.qtarget:Vehicle({
		options = {
			{
				icon = "fa-solid fa-clipboard-list",
				label = "Tjek om køretøjet er på listen",
				action = function(entity)
					local model = GetEntityModel(entity)
					local vehicleModel = GetDisplayNameFromVehicleModel(model)

					TriggerServerEvent("srp_illegaljobs:CheckVehicle", vehicleModel)
				end,
				canInteract = function(entity)
					local vehplate = ESX.Math.Trim(GetVehicleNumberPlateText(entity))
					return hasList and (IsVehicleNPCVehicle(vehplate) or Config.Debug)
				end,
			},
		},
		distance = 2.0
	})

	collectgarbage()
end)

RegisterNetEvent('srp_illegaljobs:retrieveList')
AddEventHandler('srp_illegaljobs:retrieveList', function()
	StopBusySpinner()

	hasList = true
	ESX.ShowNotification("Aflevere en eller flere af bilerne og få en præmie per bil.")
end)

RegisterNetEvent('srp_illegaljobs:startSelling')
AddEventHandler('srp_illegaljobs:startSelling', function(label)
	SellingItems(label)
end)

RegisterNetEvent('srp_illegaljobs:stopSelling')
AddEventHandler('srp_illegaljobs:stopSelling', function()
	isSelling = false
	StopBusySpinner()
end)

SellingItems = function(label)
	local sellingLabel = ("Sælger %s..."):format(label)
	DrawBusySpinner(sellingLabel)

	isSelling = true
	Citizen.CreateThread(function()
		while isSelling do
			Wait(0)

			ESX.ShowHelpNotification("Tryk ~INPUT_VEH_HEADLIGHT~ for at stoppe med sælge " .. label)
			if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
				TriggerServerEvent("srp_illegaljobs:StopSellItem")
			end
		end
	end)
end

IsVehicleNPCVehicle = function(plate)
	local firstTwoChars = string.sub(plate, 1, 2)
	if tonumber(firstTwoChars) then
		return true
	end

	return false
end
local vent = true
OpenPawnSellShop = function(entity)
	
	print(vent)
	if vent == true then
		vent = false
		exports['progressBars']:startUI(500, "Tilgår pawnshop...")
		Citizen.Wait(500)
		
		local elements = {}

		for k, v in pairs(Config.PawnSellShop) do

			table.insert(elements, { label = ('%s - <span style="color: lightgreen;">%s,- DKK Per Stk.</span>'):format(v.label, GroupDigits(v.price)), value = v.price, name = v.item, key = k })
		end

		PlayPedAmbientSpeechWithVoiceNative(entity, "SHOP_GREET", "mp_m_shopkeep_01_chinese_mini_01", "SPEECH_PARAMS_FORCE", 1)

		local playerPed = PlayerPedId()
		FreezeEntityPosition(playerPed, true)

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawn_shop', {
			title = 'Pantelåner Butik',
			align = 'left',
			elements = elements
		}, function(data, menu)
			menu.close()
			FreezeEntityPosition(playerPed, false)
			exports['progressBars']:startUI(750, "Sælger hittegods...")
			Citizen.Wait(750)
			TriggerServerEvent("srp_illegaljobs:SellItem", data.current.name, data.current.value)

			Citizen.Wait(6250)
			exports['mythic_notify']:DoHudText('success', 'Du kan nu sælge igen.')
			vent = true
			collectgarbage()

		end, function(data, menu)
			menu.close()
			vent = true
			collectgarbage()
			FreezeEntityPosition(playerPed, false)
		end)
	else
		exports['mythic_notify']:DoHudText('inform', 'Vent venligst.')
	end
end

OpenPawnBuyShop = function(entity)
	exports['mythic_notify']:DoHudText('inform', 'Kan ikke købe.')

end


