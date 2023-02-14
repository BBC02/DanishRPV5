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

herofarmer = false
herogiveitems = false
heroomdanner = false
heroomdanitems = false

CreateThread(function()
  while true do
    local sleep = 1000

    local poppydistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -287.6872, 2211.4839, 130.1671, true)
    if poppydistance < 100 then
      sleep = 3
  DrawMarker(25, -287.6872, 2211.4839, 131.1671 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if poppydistance < 3 and herofarmer == false then
    TriggerEvent('cd_drawtextui:ShowUI','show', "[E] for at starte farming")
  elseif herofarmer == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe farming")
  else
    TriggerEvent('cd_drawtextui:HideUI')
  end
  if poppydistance < 5 and IsControlJustReleased(0, 38) and herofarmer == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    herofarmer = true
    herogiveitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()
    local dict, anim = 'amb@world_human_gardener_plant@male@base', 'base'

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Wait(50)
    end

    TaskPlayAnim(playerPed, 'amb@world_human_gardener_plant@male@base', 'base', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
elseif herofarmer == true and poppydistance > 5 or herofarmer == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    herofarmer = false
    herogiveitems = false
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

    local herodistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 28.3607, 3665.4734, 40.4406, true)
    if herodistance < 100 then
      sleep = 3
  DrawMarker(25, 28.3607, 3665.4734, 41.4406 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if herodistance < 3 and heroomdanner == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte omdanning")
  elseif heroomdanner == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe omdanning")
  else
    TriggerEvent('cd_drawtextui:HideUI')
  end
  if herodistance < 5 and IsControlJustReleased(0, 38) and heroomdanner == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    heroomdanner = true
    heroomdanitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
elseif heroomdanner == true and herodistance > 5 or heroomdanner == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    heroomdanner = false
    heroomdanitems = false
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
      if herogiveitems then
      Wait(Config.FarmingTime)
      TriggerServerEvent('gris-drugs:giveheroitem', 'poppyresin', Config.FarmModtag)
      end
  end
end)

CreateThread(function()
  while true do
      Wait(500)
      if heroomdanner then
      Wait(Config.OmdanTime)
    TriggerServerEvent('gris-drugs:omdanitem', 'heroin', Config.OmdanModtag, Config.OmdanFjern, 'poppyresin')
      end
    end
end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if herofarmer then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           herofarmer = false
--           herogiveitems = false
--       end
--   end
-- end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if heroomdanner then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           heroomdanner = false
--           heroomdanitems = false
--       end
--   end
-- end)