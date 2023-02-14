CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

marifarmer = false
marigiveitems = false
mariomdanner = false
mariomdanitems = false

CreateThread(function()
  while true do
    local sleep = 1000

    local cannadistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1057.2572, -3197.2690, -39.1345, true)
    if cannadistance < 100 then
      sleep = 3
  DrawMarker(25, 1057.2572, -3197.2690, -38.1345 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if cannadistance < 3 and marifarmer == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte farming")
    --exports['id_helpnotify']:showUI('[E] for at starte farming')
  elseif marifarmer == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe farming")
    --exports['id_helpnotify']:showUI('[E] for at stoppe farming')
  else
    TriggerEvent('cd_drawtextui:HideUI')
    --exports['id_helpnotify']:hideUI()
  end
  if cannadistance < 5 and IsControlJustReleased(0, 38) and marifarmer == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    marifarmer = true
    marigiveitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()
    local dict, anim = 'amb@world_human_gardener_plant@male@base', 'base'

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Wait(50)
    end

    TaskPlayAnim(playerPed, 'amb@world_human_gardener_plant@male@base', 'base', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
elseif marifarmer == true and cannadistance > 5 or marifarmer == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    marifarmer = false
    marigiveitems = false
    exports["id_notify"]:notify({
      title = '',
      message = 'Du har nu stoppet farmingen',
      type = 'error'
  })
    FreezeEntityPosition(GetPlayerPed(-1), false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end
  end
  Wait(sleep)
    end
end)

CreateThread(function()
  while true do
    local sleep = 1000

    local maridistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1039.2408, -3205.3809, -38.1665, true)
    if maridistance < 100 then
      sleep = 3
  DrawMarker(25, 1039.2408, -3205.3809, -37.1665 - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if maridistance < 3 and mariomdanner == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte omdanning")
  elseif mariomdanner == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe omdanning")
  else
    TriggerEvent('cd_drawtextui:HideUI')
  end
  if maridistance < 5 and IsControlJustReleased(0, 38) and mariomdanner == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    mariomdanner = true
    mariomdanitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
elseif mariomdanner == true and maridistance > 5 or mariomdanner == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    mariomdanner = false
    mariomdanitems = false
    exports["id_notify"]:notify({
      title = '',
      message = 'Du har nu stoppet omdanningen',
      type = 'error'
  })
    FreezeEntityPosition(GetPlayerPed(-1), false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end
  end
  Wait(sleep)
    end
end)

RegisterNetEvent('pladsnotify')
AddEventHandler('pladsnotify', function()
  exports["id_notify"]:notify({
    title = '',
    message = 'Du kan ikke bære mere!',
    type = 'error'
})
end)

RegisterNetEvent('omdanpladsnotify')
AddEventHandler('omdanpladsnotify', function()
  exports["id_notify"]:notify({
    title = '',
    message = 'Du kan ikke bære mere, ellers har du ikke mere at omdanne!',
    type = 'error'
})
end)

CreateThread(function()
  while true do
      Wait(500)
      if marigiveitems then
      Wait(Config.FarmingTime)
      TriggerServerEvent('gris-drugs:givecannaitem', 'cannabis', Config.FarmModtag)
      end
  end
end)

CreateThread(function()
  while true do
      Wait(500)
      if mariomdanner then
      Wait(Config.OmdanTime)
      TriggerServerEvent('gris-drugs:omdanitem', 'marijuana', Config.OmdanModtag, Config.OmdanFjern, 'cannabis')
      end
    end
end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if marifarmer then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           marifarmer = false
--           marigiveitems = false
--       end
--   end
-- end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if mariomdanner then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           mariomdanner = false
--           mariomdanitems = false
--       end
--   end
-- end)