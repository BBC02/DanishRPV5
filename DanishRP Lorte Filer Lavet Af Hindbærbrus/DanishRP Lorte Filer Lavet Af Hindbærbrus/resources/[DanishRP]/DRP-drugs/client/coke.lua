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

cokefarmer = false
cokegiveitems = false
cokeomdanner = false
cokeomdanitems = false

CreateThread(function()
  while true do
    local sleep = 1000

    local leafdistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 350.584625, 6473.973633, 29.835938, true)
    if leafdistance < 100 then
      sleep = 3
  DrawMarker(25, 9.2215, 6870.2095, 13.5246, - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if leafdistance < 3 and cokefarmer == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte farming")
   -- exports['id_helpnotify']:showUI('[E] for at starte farming')
  elseif cokefarmer == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe farming")
    --exports['id_helpnotify']:showUI('[E] for at stoppe farming')
  else
    TriggerEvent('cd_drawtextui:HideUI')
    --exports['id_helpnotify']:hideUI()
  end
  if leafdistance < 5 and IsControlJustReleased(0, 38) and cokefarmer == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    cokefarmer = true
    cokegiveitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()
    local dict, anim = 'amb@world_human_gardener_plant@male@base', 'base'

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Wait(50)
    end

    TaskPlayAnim(playerPed, 'amb@world_human_gardener_plant@male@base', 'base', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
elseif cokefarmer == true and leafdistance > 5 or cokefarmer == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    cokefarmer = false
    cokegiveitems = false
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
    local cokedistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 891.243958, -959.696716, 40.316528, true)
    if cokedistance < 100 then
      sleep = 3
  DrawMarker(25, 891.243958, -959.696716, 40.316528 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if cokedistance < 3 and cokeomdanner == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte omdanning")
  elseif cokeomdanner == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe omdanning")
  else
    TriggerEvent('cd_drawtextui:HideUI')
  end
  if cokedistance < 5 and IsControlJustReleased(0, 38) and cokeomdanner == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    cokeomdanner = true
    cokeomdanitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
elseif cokeomdanner == true and cokedistance > 5 or cokeomdanner == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    cokeomdanner = false
    cokeomdanitems = false
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
      if cokegiveitems == true then
      Wait(Config.FarmingTime)
      TriggerServerEvent('gris-drugs:givecokeitem', 'coca_leaf', Config.FarmModtag)
      end
  end
end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if cokefarmer then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--            cokefarmer = false
--            cokegiveitems = false
--       end
--   end
-- end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if cokeomdanner then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--            cokeomdanner = false
--            cokeomdanitems = false
--       end
--   end
-- end)

CreateThread(function()
  while true do
      Wait(500)
      if cokeomdanner then
      Wait(Config.OmdanTime)
      TriggerServerEvent('gris-drugs:omdanitem', 'coke', Config.OmdanModtag, Config.OmdanFjern, 'coca_leaf')
      end
    end
end)