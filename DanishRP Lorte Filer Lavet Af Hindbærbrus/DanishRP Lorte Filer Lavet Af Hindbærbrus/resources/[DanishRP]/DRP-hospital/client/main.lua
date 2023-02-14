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
--   local hash = GetHashKey("s_m_m_doctor_01")

--   while not HasModelLoaded(hash) do
--     RequestModel(hash)
--     Citizen.Wait(0)
--   end

--   flemming = CreatePed("PED_TYPE_CIVMALE", "s_m_m_doctor_01", 308.3547, -595.5411, 42.2840, 69.5407, 275.0, false, false)
--   SetBlockingOfNonTemporaryEvents(flemming, true)
--   SetPedDiesWhenInjured(flemming, false)
--   SetPedCanPlayAmbientAnims(flemming, true)
--   SetPedCanRagdollFromPlayerImpact(flemming, false)
--   SetEntityInvincible(flemming, true)
--   FreezeEntityPosition(flemming, true)
--   SetModelAsNoLongerNeeded(hash)
-- end)

-- Citizen.CreateThread(function()
--   local hash = GetHashKey("s_m_m_doctor_01")

--   while not HasModelLoaded(hash) do
--     RequestModel(hash)
--     Citizen.Wait(0)
--   end

--   flemming = CreatePed("PED_TYPE_CIVMALE", "s_m_m_doctor_01", 308.3547, -595.5411, 42.2840, 69.5407, 275.0, false, false)
--   SetBlockingOfNonTemporaryEvents(flemming, true)
--   SetPedDiesWhenInjured(flemming, false)
--   SetPedCanPlayAmbientAnims(flemming, true)
--   SetPedCanRagdollFromPlayerImpact(flemming, false)
--   SetEntityInvincible(flemming, true)
--   FreezeEntityPosition(flemming, true)
--   SetModelAsNoLongerNeeded(hash)
-- end)

exports.qtarget:AddTargetModel({-730659924}, {
	options = {
		  {
			    event = "grisen-hospital:interact",
			    icon = "fas fa-star-of-life",
			    label = "Bliv tilset af lægen",
			    num = 1
		  },
	},
	distance = 3
})

CreateThread(function()
	while true do
		Wait(3)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 306.6821, -594.9312, 43.2841, true)
		if distance < 20 and IsPedDeadOrDying(PlayerPedId(), true) then
			DrawMarker(22, 306.6821, -594.9312, 43.2841 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 6, 165, 81, 50, false, true, 2, false, false, false, false)
			if distance < 1 then
				TriggerEvent('cd_drawtextui:ShowUI', 'show', '[E] for at tjek ind')
			elseif distance > 1 then
				TriggerEvent('cd_drawtextui:HideUI')
			end
			if distance < 1 and IsControlJustReleased(0, 38) then
				TriggerEvent('grisen-hospital:interact2')
			end
		end
	end
end)

RegisterNetEvent('grisen-hospital:interact', function()
	local player = PlayerPedId()
	FreezeEntityPosition(player, true)
    exports['progressBars']:startUI(5000, 'Indskriver sig på skadestuen')
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
	Wait(5000)
	FreezeEntityPosition(player, false)
	ClearPedTasksImmediately(player)
	SetEntityCoords(player, 319.3072, -581.0294, 43.2140)
	SetEntityHeading(player, 160.4148)
	FreezeEntityPosition(player, true)
	LoadAnimSet('missfbi1')
	TaskPlayAnim(player, 'missfbi1', 'cpr_pumpchest_idle', 8.0, -8.0, -1, 1, 0, false, false, false)
	exports['progressBars']:startUI(15000, "Du bliver tilset")
	exports['mythic_notify']:DoHudText('inform', 'Lægen tilser dig')
	Wait(15000)
	FreezeEntityPosition(player, false)
	ClearPedTasksImmediately(player)
	exports["id_notify"]:notify({
		title = 'Flemming Hospitals Mand',
		message = 'Du er blevet helbredt',
		type = 'success'
	})
	SetEntityCoords(player, 318.4291, -580.7827, 43.2841)
	SetEntityHeading(player, 68.3014)
	SetEntityHealth(PlayerPedId(), 200)
end)

RegisterNetEvent('grisen-hospital:interact2', function()
	local player = PlayerPedId()
	FreezeEntityPosition(player, true)
	exports['progressBars']:startUI(5000, "Skriver dig ind på listen")
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
	Wait(5000)
	FreezeEntityPosition(player, false)
	ClearPedTasksImmediately(player)
	SetEntityCoords(player, 319.3072, -581.0294, 43.2140)
	SetEntityHeading(player, 160.4148)
	FreezeEntityPosition(player, true)
	LoadAnimSet('missfbi1')
	TaskPlayAnim(player, 'missfbi1', 'cpr_pumpchest_idle', 8.0, -8.0, -1, 1, 0, false, false, false)
	exports['progressBars']:startUI(15000, "Du bliver tilset")
	exports['mythic_notify']:DoHudText('inform', 'Lægen tilser dig')
	Wait(15000)
	FreezeEntityPosition(player, false)
	ClearPedTasksImmediately(player)
	exports["id_notify"]:notify({
		title = 'Flemming Hospitals Mand',
		message = 'Du er blevet helbredt',
		type = 'success'
	})
	SetEntityCoords(player, 318.4291, -580.7827, 43.2841)
	SetEntityHeading(player, 68.3014)
	TriggerEvent('esx_ambulancejob:revive')
	SetEntityHealth(PlayerPedId(), 200)
end)

function LoadAnimSet(AnimDict)
	if not HasAnimDictLoaded(AnimDict) then
		RequestAnimDict(AnimDict)

		while not HasAnimDictLoaded(AnimDict) do
			Citizen.Wait(1)
		end
	end
end