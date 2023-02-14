local ESX = nil
local playtime = {}
local NewPlayers = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

lockdown = false
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 360 then
      lockdown = true
      Citizen.Wait(60000)
        kickPl()
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
  if eventData.secondsRemaining == 300 then
      kickPl()
      lockdown = true
  end
end)

function kickPl()
    local xPlayers = ESX.GetExtendedPlayers() -- Returns all xPlayers
    for _, xPlayer in pairs(xPlayers) do
        xPlayer.kick("Du er blevet kicket, pga serveren genstarter om 5 minutter. Du bliver kicket 5 minutter før, for at fjerne rollback - Join igen om 5 minutter")
   end
end

AddEventHandler("playerConnecting", function(name, reason, deferrals)
  if lockdown then
    deferrals.done("Serveren er under genstart, du kan joine igen om 5 minutter")
  end
end)