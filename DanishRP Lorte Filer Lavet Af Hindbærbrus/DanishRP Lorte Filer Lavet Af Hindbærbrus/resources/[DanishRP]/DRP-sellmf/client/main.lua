Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Citizen.CreateThread(function()
-- 	 	local hash = GetHashKey("s_m_m_bouncer_01")
	  
-- 	 	while not HasModelLoaded(hash) do
-- 	 	  RequestModel(hash)
-- 	 	  Citizen.Wait(0)
-- 	 	end
	  
-- 	 	abdishu = CreatePed(4, 0x9FD4292D, -464.8510, -2275.9097, 7.5158, 97.1190, 275.0, false, false)
-- 	 	SetBlockingOfNonTemporaryEvents(abdishu, true)
-- 	 	SetPedDiesWhenInjured(abdishu, false)
-- 	 	SetPedCanPlayAmbientAnims(abdishu, true)
-- 	 	SetPedCanRagdollFromPlayerImpact(abdishu, false)
-- 	 	SetEntityInvincible(abdishu, true)
-- 	 	FreezeEntityPosition(abdishu, true)
-- 	 	SetModelAsNoLongerNeeded(hash)
-- end)

exports.qtarget:AddTargetModel({-1613485779}, {
		options = {
			  {
					event = "gris:opensell",
					icon = "fas fa-user",
					label = "Sælg ting",
					num = 1
			  },
		},
	distance = 3
})

RegisterNetEvent('gris:opensell')
AddEventHandler('gris:opensell', function()
	local elements = {
		{label = 'Lockpick - DKK: 7500', value = 'lockpick'},
		{label = 'Drill - DKK: 6500', value = 'drill'},
		{label = 'Hammer Wire Cutter - DKK: 6500', value = 'hammerwirecutter'},
		--{label = 'Hacker Device - DKK: 8500', value = 'hackerdevice'},
		--{label = 'ID Kort - DKK: 7500', value = 'accesscard'},
		{label = 'Thermite - DKK: 7500', value = 'thermite'},
		--{label = 'Foldekniv - DKK: 1000', value = 'switchblade'},
		--{label = 'Knojern - DKK: 750', value = 'knuckle'},
		{label = 'Skudsikkervest (50%) - DKK: 20000', value = 'vest50'},
		{label = 'Skudsikkervest (25%) - DKK: 10000', value = 'vest25'},
		{label = 'Rolex - DKK: 20000', value = 'rolex'},
		{label = 'Guldkæde - DKK: 12000', value = 'guldkaede'},
		{label = 'Gucci - DKK: 18000', value = 'gucci'},
		{label = 'Diamant - DKK: 16000', value = 'diamant'},
		{label = 'Guldring - DKK: 10000', value = 'guldring'}
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'abdishu', {
		title = "Michael Jødahl - Sælg Items",
		align = "right",
		elements = elements
	}, function(data, menu)
		if data.current.value == 'lockpick' then
			TriggerServerEvent('gris:itemhandler', 10000, 'lockpick')
		elseif data.current.value == 'drill' then
			TriggerServerEvent('gris:itemhandler', 8500, 'drill')
		elseif data.current.value == 'hammerwirecutter' then
			TriggerServerEvent('gris:itemhandler', 8500, 'hammerwirecutter')
		elseif data.current.value == 'hackerdevice' then
			TriggerServerEvent('gris:itemhandler', 8500, 'hackerDevice')
		elseif data.current.value == 'accesscard' then
			TriggerServerEvent('gris:itemhandler', 7500, 'accesscard')
		elseif data.current.value == 'thermite' then
			TriggerServerEvent('gris:itemhandler', 12500, 'thermite')
		elseif data.current.value == 'switchblade' then
			TriggerServerEvent('gris:itemhandler', 1000, 'weapon_switchblade')
		elseif data.current.value == 'knuckle' then
			TriggerServerEvent('gris:itemhandler', 750, 'weapon_knuckle')
		elseif data.current.value == 'vest50' then
			TriggerServerEvent('gris:itemhandler', 75000, 'skudsikkervest50')
		elseif data.current.value == 'vest25' then
			TriggerServerEvent('gris:itemhandler', 50000, 'skudsikkervest25')
		elseif data.current.value == 'rolex' then
			TriggerServerEvent('gris:itemhandler', 40000, 'rolex')
		elseif data.current.value == 'guldkaede' then
			TriggerServerEvent('gris:itemhandler', 28500, 'guldkaede')
		elseif data.current.value == 'gucci' then
			TriggerServerEvent('gris:itemhandler', 40000, 'gucci')
		elseif data.current.value == 'diamant' then
			TriggerServerEvent('gris:itemhandler', 40000, 'diamant')
		elseif data.current.value == 'guldring' then
			TriggerServerEvent('gris:itemhandler', 40000, 'guldring')
		end
	end, function(data, menu)
		menu.close()
	end)
end)