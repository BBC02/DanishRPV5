RegisterServerEvent('reviveServer')
AddEventHandler('reviveServer', function(closestID)
	TriggerClientEvent('reviveClient', closestID)
end)

--RegisterServerEvent('reviveEMSCall')
--AddEventHandler('reviveEMSCall', function(playerPed, street)
--    TriggerClientEvent('chatMessage', -1, '', {255, 255, 255}, '^8[CADOJRP]^2 ' .. GetPlayerName(source) .. '^0 has been reported incapacitated and needing CPR at ' .. street)
--end)

-- RegisterServerEvent('reviveEMSCall')
-- AddEventHandler('reviveEMSCall', function(playerPed, message, x, y)
-- 	TriggerClientEvent('paramedicEMSPageClient', -1, x, y)
-- 	--TriggerClientEvent('paramedicPageAll', -1, playerPed, GetPlayerName(source))
--     TriggerClientEvent('chatMessage', -1, '', {255, 255, 255}, '^8[CADOJRP]^2 ' .. GetPlayerName(source) .. '^0 has been reported incapacitated and needing CPR near ' .. message)
-- end)


-- RegisterServerEvent('createEMSBlipServer')
-- AddEventHandler('createEMSBlipServer', function(x, y, z)
-- 	TriggerClientEvent('createEMSBlip', -1, x, y, z, GetPlayerName(source))
-- end)

-- RegisterServerEvent('messageveryonexd')
-- AddEventHandler('messageveryonexd', function()
--     local Source = source
--     TriggerClientEvent('chatMessage', -1, '', {255, 255, 255}, '^8[CADOJRP]^7 ' .. GetPlayerName(Source) .. ' just used the admin revive command')
-- end)



ESX.RegisterServerCallback("esx-cpr:Checkjob", function(source, cb, plate)
	local job = 0
  
	local xPlayers = ESX.GetExtendedPlayers('job', "ambulance") -- Returns xPlayers with the police job
	for _, xPlayer in pairs(xPlayers) do
	  job = job + 1
	 end
	 cb(job)
end)

RegisterCommand("457hftbuxur5ur5jt", function(source, args, rawCommand)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(target)
    if tPlayer == nil then
        return
    end
    local identifier = tPlayer.getIdentifier()

    Group = xPlayer.getGroup()
	if Group ~= 'user' then

        TriggerClientEvent('laursenersmuk', target)

    end

end, false)