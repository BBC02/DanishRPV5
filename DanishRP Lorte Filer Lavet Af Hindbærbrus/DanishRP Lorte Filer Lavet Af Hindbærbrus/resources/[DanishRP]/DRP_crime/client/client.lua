blocked = false
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

function bunkerind()
local coords = vector3(892.3420, -3245.9307, -98.2661)
StartPlayerTeleport(PlayerId(), coords.x, coords.y, coords.z, 95.5469, true, true, true)

while IsPlayerTeleportActive() do
  Citizen.Wait(0)
end
end

function bunkerud()
  local coords = vector3(-3027.3354, 3334.6689, 10.0352)
  StartPlayerTeleport(PlayerId(), coords.x, coords.y, coords.z, 290.6665, true, true, true)
  
  while IsPlayerTeleportActive() do
    Citizen.Wait(0)
  end
end

CreateThread(function()
  while true do
    Wait(0)

    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -3027.3354, 3334.6689, 10.0352, true)
    --if ESX.PlayerData.job.name == "gambino" then
      --DrawMarker(21, -3027.3354, 3334.6689, 10.0352 + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 1.0, 0, 255, 255, 255, false, true, 2, nil, nil, false)
      if distance < 7.5 and ESX.PlayerData.job.name == 'gambino' then
        DrawText3Ds(-3027.3354, 3334.6689, 10.5352, '[~r~E~w~] for at tilgå ~b~bunkeren')
      if IsControlPressed(0, 38) then
        bunkerind()
      end
    end
  end
end)

CreateThread(function()
  while true do
    Wait(0)


    local distance2 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 892.3420, -3245.9307, -98.2661, true)
    --if ESX.PlayerData.job.name == "gambino" then
      --DrawMarker(21, -3027.3354, 3334.6689, 10.0352 + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 1.0, 0, 255, 255, 255, false, true, 2, nil, nil, false)
      if distance2 < 5.5 and ESX.PlayerData.job.name == 'gambino' then
        DrawText3Ds(892.3420, -3245.9307, -98.2661, '[~r~E~w~] for at forlade ~b~bunkeren')
      if IsControlPressed(0, 38) then
        bunkerud()
      end
    end
  end
end)

-- local blips = {
-- {title="Gambino Bunker", colour=1, id=175, x = -3027.3354, y = 3334.6689, z = 10.0352}
-- }

-- Citizen.CreateThread(function()

--   if ESX.IsPlayerLoaded() then
--   if ESX.PlayerData.job.name == "gambino" then
--   for _, info in pairs(blips) do
--     info.blip = AddBlipForCoord(info.x, info.y, info.z)
--     SetBlipSprite(info.blip, info.id)
--     SetBlipDisplay(info.blip, 4)
--     SetBlipScale(info.blip, 1.0)
--     SetBlipColour(info.blip, info.colour)
--     SetBlipAsShortRange(info.blip, true)
--     BeginTextCommandSetBlipName("STRING")
--     AddTextComponentString(info.title)
--     EndTextCommandSetBlipName(info.blip)
--       end
--     end
--   end
-- end)

function DrawText3Ds(x, y, z, text)
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
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('gris-gambino:craft', function()
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'crafting', {
      title    = 'Crafting',
      align    = 'bottom-right',
      elements = Config.Crafting
    }, function(data, menu)
      if data.current.item == nil then
        local player = PlayerPedId()
        ESX.UI.Menu.CloseAll()
        blocked = true
        exports['progressBars']:startUI(Config.CraftingTid, Config.ProgressBesked1)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
        FreezeEntityPosition(player, false)
        Citizen.Wait(Config.CraftingTid)
        exports['progressBars']:startUI(Config.SamlerTid, Config.ProgressBesked2)
        Citizen.Wait(Config.SamlerTid)
        exports['progressBars']:startUI(Config.PakkeTid, Config.ProgressBesked3)
        Citizen.Wait(Config.PakkeTid)
        Citizen.Wait(200)
        --exports['mythic_notify']:DoHudText('success', Config.DoneBesked)
        exports["id_notify"]:notify({
          title = 'VÅBENHANDLER',
          message = Config.DoneBesked,
          type = 'success'
      })
        ClearPedTasksImmediately(player)
        TriggerServerEvent('gris-gambino:buyWeapon', data.current.weapon)
        blocked = false
      elseif data.current.item ~= nil then
        local player = PlayerPedId()
        ESX.UI.Menu.CloseAll()
        blocked = true
        exports['progressBars']:startUI(Config.CraftingTid, Config.ProgressBesked1)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
        FreezeEntityPosition(player, false)
        Citizen.Wait(Config.CraftingTid)
        exports['progressBars']:startUI(Config.SamlerTid, Config.ProgressBesked2)
        Citizen.Wait(Config.SamlerTid)
        exports['progressBars']:startUI(Config.PakkeTid, Config.ProgressBesked3)
        Citizen.Wait(Config.PakkeTid)
        Citizen.Wait(200)
        --exports['mythic_notify']:DoHudText('success', Config.DoneBesked)
        exports["id_notify"]:notify({
          title = 'VÅBENHANDLER',
          message = Config.DoneBesked,
          type = 'success'
      })
        ClearPedTasksImmediately(player)
        TriggerServerEvent('gris-gambino:buyItem', data.current.item)
        blocked = false
      end
      end, function(data, menu)
        menu.close()
    end)
  end)

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        if blocked == true then
          DisableControlAction(1, 19, true)
          DisableControlAction(1, 137, true)
          DisableControlAction(1, 245, true)
          DisableControlAction(1, 38, true)
          DisableControlAction(1, 20, true)
          DisableControlAction(1, 217, true)
          DisableControlAction(1, 171, true)
          DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
          DisablePlayerFiring(ped, true) -- Disable weapon firing
        end
    end
  end)



RegisterNetEvent('gris-gambino:caropen', function()
    ESX.UI.Menu.CloseAll()
    local elements = {}
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage',
    {
      title		= "Gambino Garage",
      align		= 'bottom-right',
      elements	= Config.GarageBiler
    }, function(data, menu)
         if not IsModelInCdimage(data.current.model) then return end
         RequestModel(data.current.model)
         while not HasModelLoaded(data.current.model) do
           Citizen.Wait(10)
         end
        local MyPed = PlayerPedId()
         local Vehicle = CreateVehicle(data.current.model, 875.3979, -3245.7517, -98.2866, 269.8077, true, false)
         TaskWarpPedIntoVehicle(MyPed, Vehicle, -1)
         SetModelAsNoLongerNeeded(data.current.model)
         ESX.UI.Menu.CloseAll()
           TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
           local playerPed = PlayerPedId()
           local random = math.random(563, 76478)
           local vehicle2 = GetVehiclePedIsIn(playerPed)
           SetVehicleNumberPlateText(Vehicle, "" .. random)
           local carplate = GetVehicleNumberPlateText(Vehicle)
           exports['t1ger_keys']:GiveTemporaryKeys(carplate, "")
           exports["LegacyFuel"]:SetFuel(vehicle, 100)
          end, function(data, menu)
            menu.close()
          end)
      end)

 Citizen.CreateThread(function()
         local hash = GetHashKey("s_m_m_dockwork_01")
   
         while not HasModelLoaded(hash) do
           RequestModel(hash)
           Citizen.Wait(0)
         end
   
         garagemand = CreatePed("PED_TYPE_CIVMALE", "s_m_m_dockwork_01", 890.1057, -3236.4458, -99.2778, 162.4887, 275.0, false, false)
         SetBlockingOfNonTemporaryEvents(garagemand, true)
         SetPedDiesWhenInjured(garagemand, false)
         SetPedCanPlayAmbientAnims(garagemand, true)
         SetPedCanRagdollFromPlayerImpact(garagemand, false)
         SetEntityInvincible(garagemand, true)
         FreezeEntityPosition(garagemand, true)
         SetModelAsNoLongerNeeded(hash)
 end)

Citizen.CreateThread(function()
  while true do
    Wait(0)

  local distance3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 882.7318, -3240.3049, -98.3611, true)
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if distance3 < 5.0 and IsPedInVehicle(PlayerPedId(), veh, true) then
  DrawText3Ds(882.7318, -3240.3049, -98.3611, '[~r~E~w~] for at parkere ~r~køretøjet')
  if IsControlPressed(0, 38) then
    TriggerEvent('gris-gambino:parker')
  end
  end
  end
end)

--function parkerkoretoj()
RegisterNetEvent('gris-gambino:parker', function()
  --TriggerEvent("esx:deleteVehicle")
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  -- local distance3 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 890.0072, -3238.0535, -98.7108, true)
  -- if distance3 < 5.0 then
  -- DrawText3Ds(890.0072, -3238.0535, -98.7108, '[~r~E~w~] for at parkere ~b~køretøjet')
  -- end

  DeleteVehicle(veh)
  --exports['mythic_notify']:DoHudText('success', 'Du har parkeret dit køretøj')
  -- exports["id_notify"]:notify({
  --   title = 'VÅBENHANDLER',
  --   message = 'Du har parkeret dit køretøj',
  --   type = 'success'
  -- })
end)