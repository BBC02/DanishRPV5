ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function secondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds/3600));
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours..":"..mins..":"..secs
  end
end

RegisterServerEvent('esx_moneywash:washMoney')
AddEventHandler('esx_moneywash:washMoney', function(amount, zone, token)
	local xPlayer = ESX.GetPlayerFromId(source)
	local tax
	local timer
	local enableTimer = false
	local steam = GetPlayerName(source)
	for k, spot in pairs (Config.Zones) do
		if zone == k then
			tax = spot.TaxRate
			enableTimer = spot.enableTimer
			timer = spot.timer
		end
	end

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), source, token) then
		return false
	end
	amount = ESX.Math.Round(tonumber(amount))
	washedCash = amount * tax
	washedTotal = ESX.Math.Round(tonumber(washedCash))
	
	if enableTimer == true then
		--local timer = Config.timer
		local timeClock = ESX.Math.Round(timer / 1000)
	
		if amount > 0 and xPlayer.getAccount('black_money').money >= amount then
			xPlayer.removeAccountMoney('black_money', amount)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_washed_waiting') ..  secondsToClock(timeClock))

			Citizen.Wait(timer)
			sendToDiscord(16753920, "Moneywash", steam .. " Hvidvasket  " .. amount .. " og fik " .. washedTotal .." kr", "Lavet af PP")
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_received') .. ESX.Math.GroupDigits(washedTotal) .. _U('clean_money'))
			xPlayer.addMoney(washedTotal)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	else 
	
		if amount >= 100 and xPlayer.getAccount('black_money').money >= amount then
			xPlayer.removeAccountMoney('black_money', amount)
			sendToDiscord(16753920, "Moneywash", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ") Hvidvasket  " .. amount .. " og fik " .. washedTotal .." kr", "Lavet af PP")
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_washed') .. ESX.Math.GroupDigits(amount) .. _U('dirty_money') .. _U('you_have_received') .. ESX.Math.GroupDigits(washedTotal) .. _U('clean_money'))
			xPlayer.addMoney(washedTotal)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end
	
end)


function sendToDiscord(color, name, message, footer, type)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer.. " ".. os.date("%x %X %p"),
			  },
		  }
	  }
	
	PerformHttpRequest('https://discord.com/api/webhooks/970391108695785492/h5p2aPs6f_DfiK7RBggHb3OWHOOHG9SkAD562p6sjdTeR69jrCxMeyayCFQ7AhQuFjaL', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end