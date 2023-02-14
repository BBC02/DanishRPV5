ESX = nil
local menuOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		if GetDistanceBetweenCoords(coords, vector3(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z), true) < 1.5 then
			if Config.EnableOpeningHours then
				local ClockTime = GetClockHours()
				if Config.CloseHour < Config.OpenHour then
					if (ClockTime >= Config.OpenHour and ClockTime < 24) or (ClockTime <= Config.CloseHour -1 and ClockTime > 0) then
						if not menuOpen then
							if IsControlJustReleased(0, 38) then
								OpenShop()
							end
						else
								Citizen.Wait(500)
						end
					else
						Draw3DText(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z, "Shop Closed, opens at ~r~" .. Config.OpenHour ..":00")
					end
				else
					if ClockTime >= Config.OpenHour and ClockTime <= Config.CloseHour - 1 then
						if not menuOpen then
							if IsControlJustReleased(0, 38) then
								OpenShop()
							end
						else
								Citizen.Wait(500)
						end
					else
						Draw3DText(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z, "Shop Closed, opens at ~r~" .. Config.OpenHour ..":00")
					end
				end
			else
				if not menuOpen then
					Draw3DText(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z)
					if IsControlJustReleased(0, 38) then
						OpenShop()
					end
				else
						Citizen.Wait(500)
				end
			end
		else
			if menuOpen then
				menuOpen = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)
		end
	end
end)

function OpenShop()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.ShopItems[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, "DKK " .. ESX.Math.GroupDigits(price)),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = 1,
				min = 1,
				max = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Shop', {
		title    = "Shop",
		align    = Config.MenuAlign,
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('drp_Shop:sellItem', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

function CreateBlipCircle(coords, text, color, sprite)
	blip = AddBlipForCoord(coords)

	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
	CreateBlipCircle(vector3(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z), Config.ShopBlipText, Config.ShopBlipColor, Config.ShopBlipSprite)
end)

function Draw3DText(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


exports.qtarget:AddTargetModel({"a_m_m_eastsa_01"}, {
	options = {
		{
			event = "drp_shop:sellItem",
			icon = "fas fa-basket-shopping-simple",
			label = "Åben Pawn Shop",
			num = 3,
			action = function(entity)
				OpenShop(NetworkGetPlayerIndexFromPed(entity))
            end,
		},
	},
	distance = 4
})
