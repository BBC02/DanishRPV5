local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('esx_holdup:toofar')
AddEventHandler('esx_holdup:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Config.Stores[robb].nameofstore)
			TriggerClientEvent('esx_holdup:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdup:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Config.Stores[robb].nameofstore)
	end
end)

ESX.RegisterServerCallback("esx_holdup:getPhoneNumber", function(robber, cb)
    local xPlayer = ESX.GetPlayerFromId(robber)
    MySQL.Async.fetchAll('SELECT phone_number FROM `users` WHERE `identifier` = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        if result[1].phone_number ~= nil then
            local number = result[1].phone_number
              cb(number)
          end

     end)
end)

RegisterServerEvent('esx_holdup:rob')
AddEventHandler('esx_holdup:rob', function(robb)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if Config.Stores[robb] then

		local store = Config.Stores[robb]

		if store.isRobbed then

			TriggerClientEvent('esx:showNotification', source, _U('is_robbed'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end


		if store.isRobbed == false then

			if(cops >= 0)then

				rob = true
				for i=1, #xPlayers, 1 do
 					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 					if xPlayer.job.name == 'police' then
							--TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
							TriggerClientEvent('esx_holdup:setblip', xPlayers[i], Config.Stores[robb].Pos)
							local robber = source
							TriggerClientEvent('esx_holdup:notifyRobbery', source)
					end
				end

				TriggerClientEvent('esx:showNotification', source, _U('hack_complete'))
				--TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				--TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
				--TriggerClientEvent('esx_holdup::currentlyrobbing', source, robb)
				
				-- ADD Ashdeuzo 
				TriggerClientEvent('esx_holdup:startRob', source, robb, secondsRemaining)
				
				
				Config.Stores[robb].isRobbed = true
				robbers[source] = robb
				local savedSource = source
				SetTimeout(300000, function()

					if(robbers[savedSource])then

						rob = false
						TriggerClientEvent('esx_holdup:robberycomplete', savedSource, job)
						if(xPlayer)then

							xPlayer.addAccountMoney('black_money', store.reward)
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
 								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 								if xPlayer.job.name == 'police' then
										--TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. store.nameofstore)
										TriggerClientEvent('esx_holdup:killblip', xPlayers[i])
										--TriggerClientEvent('esx_holdup:notifyEnd', savedSource)
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', source, _U('min_two_police'))
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)
