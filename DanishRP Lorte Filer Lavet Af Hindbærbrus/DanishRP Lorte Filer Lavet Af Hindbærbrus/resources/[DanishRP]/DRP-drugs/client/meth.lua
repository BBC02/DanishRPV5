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

methfarmer = false
methgiveitems = false
methomdanner = false
methomdanitems = false

CreateThread(function()
  while true do
    local sleep = 1000

    local mfarmdistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1337.6057, 4310.3604, 38.0530, true)
    if mfarmdistance < 100 then
      sleep = 3
  DrawMarker(25, 1337.6057, 4310.3604, 39.0530, - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if mfarmdistance < 3 and methfarmer == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte farming")
    --exports['id_helpnotify']:showUI('[E] for at starte farming')
  elseif methfarmer == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe farming")
    --exports['id_helpnotify']:showUI('[E] for at stoppe farming')
  else
    TriggerEvent('cd_drawtextui:HideUI')
    --exports['id_helpnotify']:hideUI()
  end
  if mfarmdistance < 5 and IsControlJustReleased(0, 38) and methfarmer == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    methfarmer = true
    methgiveitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()
    local dict, anim = 'amb@world_human_gardener_plant@male@base', 'base'

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Wait(50)
    end

    TaskPlayAnim(playerPed, 'amb@world_human_gardener_plant@male@base', 'base', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
elseif methfarmer == true and mfarmdistance > 5 or methfarmer == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    methfarmer = false
    methgiveitems = false
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

    local momdandistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2329.7312, 2571.3215, 46.6784, true)
    if momdandistance < 100 then
      sleep = 3
  DrawMarker(25, 2329.7312, 2571.3215, 47.6784 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if momdandistance < 3 and methomdanner == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte omdanning")
  elseif methomdanner == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe omdanning")
  else
    TriggerEvent('cd_drawtextui:HideUI')
  end
  if momdandistance < 5 and IsControlJustReleased(0, 38) and methomdanner == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    methomdanner = true
    methomdanitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
elseif methomdanner == true and momdandistance > 5 or methomdanner == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    methomdanner = false
    methomdanitems = false
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
      if methgiveitems then
      Wait(Config.FarmingTime)
      TriggerServerEvent('gris-drugs:givemethitem', 'meth_raw', Config.FarmModtag)
      end
  end
end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if methfarmer then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           methfarmer = false
--           methgiveitems = false
--       end
--   end
-- end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if methomdanner then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           methomdanner = false
--            methomdanitems = false
--       end
--   end
-- end)

CreateThread(function()
  while true do
      Wait(500)
      if methomdanner then
      Wait(Config.OmdanTime)
      TriggerServerEvent('gris-drugs:omdanitem', 'meth', Config.OmdanModtag, Config.OmdanFjern, 'meth_raw')
      end
    end
end)