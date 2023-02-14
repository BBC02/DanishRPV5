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

svampefarmer = false
svampegiveitems = false

CreateThread(function()
  while true do
    local sleep = 1000
    local svampedistance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -1852.6571, 4514.9814, 20.9966, true)
    if svampedistance < 100 then
      sleep = 3
  DrawMarker(25, -1852.6571, 4514.9814, 21.9966 - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.5, 7.5, 7.5, 9, 105, 0, 50, false, true, 2, false, false, false, false)
  if svampedistance < 3 and svampefarmer == false then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at starte farming")
    --exports['id_helpnotify']:showUI('[E] for at starte farming')
  elseif svampefarmer == true then
    TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] for at stoppe farming")
    --exports['id_helpnotify']:showUI('[E] for at stoppe farming')
  else
    TriggerEvent('cd_drawtextui:HideUI')
    --exports['id_helpnotify']:hideUI()
  end
  if svampedistance < 5 and IsControlJustReleased(0, 38) and svampefarmer == false and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    svampefarmer = true
    svampegiveitems = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    local playerPed = PlayerPedId()
    local dict, anim = 'amb@world_human_gardener_plant@male@base', 'base'

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        Wait(50)
    end

    TaskPlayAnim(playerPed, 'amb@world_human_gardener_plant@male@base', 'base', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
elseif svampefarmer == true and svampedistance > 5 or svampefarmer == true and IsControlJustReleased(0,38) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    svampefarmer = false
    svampegiveitems = false
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
      if svampegiveitems then
      Wait(Config.FarmingTime)
      TriggerServerEvent('gris-drugs:givesvampeitem', 'svampe', Config.FarmModtag)
      end
  end
end)

-- CreateThread(function()
--   while true do
--       Wait(500)
--       if svampefarmer then
--         Wait(300000)
--            exports["id_notify"]:notify({
--              title = '',
--              message = 'For at fjerne AFK farming, skal du trykke E igen.',
--              type = 'error'
--          })
--          ClearPedTasksImmediately(GetPlayerPed(-1))
--          FreezeEntityPosition(GetPlayerPed(-1), false)
--           svampefarmer = false
--           svampegiveitems = false
--       end
--   end
-- end)