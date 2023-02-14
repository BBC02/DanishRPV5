local isMax = false
local inOwnedZone = false
local currentZone = nil

ESX.RegisterServerCallback('sellDrugs:sold', function(src, cb, Max, OwnedZone, zone)
	if Max then
		isMax = true
	end
	if OwnedZone then
		inOwnedZone = true
	end
	currentZone = zone

	TriggerEvent('sellDrugs', src)
	cb('success')
end)

RegisterServerEvent('sellDrugs')
AddEventHandler('sellDrugs', function(isMax, inOwnedZone)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local weedqty = xPlayer.getInventoryItem('marijuana').count
	local methqty = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('heroin').count
	local svampeqty = xPlayer.getInventoryItem('svampe').count
	local x = 0
	local blackMoney = 0
	local drugType = nil
	local ped = GetPlayerPed(source)
	local playerCoords = GetEntityCoords(ped)
	
	if Config.SellCannabis and weedqty > 0 then
		if weedqty > 0 and Config.SellPooch then
			drugType = 'marijuana'
			if weedqty == 1 then
				x = 1
			elseif weedqty == 2 then
				x = math.random(1,2)
			elseif weedqty == 3 then
				x = math.random(1,3)
			elseif weedqty == 4 then
				x = math.random(2,4)
			elseif weedqty == 5 then
				x = math.random(3,5)
			elseif weedqty == 6 then
				x = math.random(4,6)
			elseif weedqty == 7 then
				x = math.random(5,7)
			elseif weedqty == 8 then
				x = math.random(6,8)
			elseif weedqty >= 9 then
				x = math.random(7,9)
			end
		end
	elseif Config.SellMeth and methqty > 0 then
		if methqty > 0 and Config.SellPooch then
			drugType = 'meth'
			if methqty == 1 then
				x = 1
			elseif methqty == 2 then
				x = math.random(1,2)
			elseif methqty == 3 then
				x = math.random(1,3)
			elseif methqty == 4 then
				x = math.random(2,4)
			elseif methqty == 5 then
				x = math.random(3,5)
			elseif methqty == 6 then
				x = math.random(4,6)
			elseif methqty == 7 then
				x = math.random(5,7)
			elseif methqty == 8 then
				x = math.random(6,8)
			elseif methqty >= 9 then
				x = math.random(7,9)
			end
		end
	elseif Config.SellCoke and cokeqty > 0 then
			if cokeqty > 0 and Config.SellPooch then
			drugType = 'coke'
			if cokeqty == 1 then
				x = 1
			elseif cokeqty == 2 then
				x = math.random(1,2)
			elseif cokeqty == 3 then
				x = math.random(1,3)
			elseif cokeqty == 4 then
				x = math.random(2,4)
			elseif cokeqty == 5 then
				x = math.random(3,5)
			elseif cokeqty == 6 then
				x = math.random(4,6)
			elseif cokeqty == 7 then
				x = math.random(5,7)
			elseif cokeqty == 8 then
				x = math.random(6,8)
			elseif cokeqty >= 9 then
				x = math.random(7,9)
			end
		end
	elseif Config.SellOpiu and opiuqty > 0 then
			if opiuqty > 0 and Config.SellPooch then
			drugType = 'heroin'
			if opiuqty == 1 then
				x = 1
			elseif opiuqty == 2 then
				x = math.random(1,2)
			elseif opiuqty == 3 then
				x = math.random(1,3)
			elseif opiuqty == 4 then
				x = math.random(2,4)
			elseif opiuqty >= 5 then
				x = math.random(3,5)
			elseif opiuqty >= 6 then
				x = math.random(4,6)
			elseif opiuqty >= 7 then
				x = math.random(5,7)
			elseif opiuqty >= 8 then
				x = math.random(6,8)
			elseif opiuqty >= 9 then
				x = math.random(7,9)
			end
		end
	elseif Config.SellSvampe and svampeqty > 0 then
		if svampeqty > 0 and Config.SellPooch then
		drugType = 'svampe'
		if svampeqty == 1 then
			x = 1
		elseif svampeqty == 2 then
			x = math.random(1,2)
		elseif svampeqty == 3 then
			x = math.random(1,3)
		elseif svampeqty == 4 then
			x = math.random(2,4)
		elseif svampeqty >= 5 then
			x = math.random(3,5)
		elseif svampeqty >= 6 then
			x = math.random(4,6)
		elseif svampeqty >= 7 then
			x = math.random(5,7)
		elseif svampeqty >= 8 then
			x = math.random(6,8)
		elseif svampeqty >= 9 then
			x = math.random(7,9)
		end
	end
	else
		TriggerClientEvent('nomoredrugs', _source)
		return
	end

	local bonus = 0
	local popularBonus = 0
	
	if drugType=='marijuana' then	--pooch
		if inOwnedZone then
			bonus = math.random(20, 30)
			if isMax then
				bonus = math.random(20, 30)
			end
		end
		blackMoney = Config.WeedPrice * x
	elseif drugType=='meth' then
		if inOwnedZone then
			bonus = math.random(20, 30)
			if isMax then
				bonus = math.random(20, 30)
			end
		end
		blackMoney = Config.MethPrice * x
	elseif drugType=='coke' then
		if inOwnedZone then
			bonus = math.random(20, 30)
			if isMax then
				bonus = math.random(20, 30)
			end
		end
		blackMoney = Config.CokePrice * x
	elseif drugType=='heroin' then
		if inOwnedZone then
			bonus = math.random(20, 30)
			if isMax then
				bonus = math.random(20, 30)
			end
		end
		blackMoney = Config.OpiuPrice * x
	elseif drugType=='svampe' then
		if inOwnedZone then
			bonus = math.random(20, 30)
			if isMax then
				bonus = math.random(20, 30)
			end
		end
		blackMoney = Config.SvampePrice * x
	end
	
	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, x)
	end
	
	xPlayer.addAccountMoney('black_money', blackMoney)
	xPlayer.addAccountMoney('black_money', bonus)
	xPlayer.addAccountMoney('black_money', popularBonus)
	TriggerClientEvent('esx:showNotification', source, "Du solgte ~b~" ..x.."~b~x~y~ "..drugType.."~s~ for ~r~"..blackMoney .. "~s~,- DKK")
	TriggerClientEvent('sold', source)
	--TriggerClientEvent('esx:giveAnimation', _source)
	bonus = 0
	popularBonus = 0
	--TriggerClientEvent('esx:showNotification', source, "Du solgte ~b~~b~x~y~ "..drugType.."~s~ for ~r~"..blackMoney.. "~s~,- DKK")
	sendToDiscord(16753920, "Sell drugs", "**Person: **".. xPlayer.getName() .. " \n **Solgte:** ".. x .. " ".. drugType .. " \n**Penge:** "..blackMoney.. " \n**Position:** ".. playerCoords, "Newtox")
end)


RegisterServerEvent('check')
AddEventHandler('check', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local weedqty = xPlayer.getInventoryItem('marijuana').count
	local methqty = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('heroin').count
	local svampeqty = xPlayer.getInventoryItem('svampe').count
	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.CopsRequiredToSell then
		if Config.SellCannabis then
			if Config.SellPooch and weedqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellMeth then
			if Config.SellPooch and  methqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellCoke then
			if Config.SellPooch and  cokeqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellSvampe then
			if Config.SellPooch and  svampeqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellOpiu then
			if Config.SellPooch and  opiuqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		TriggerClientEvent('nomoredrugs', _source)
	else
		TriggerClientEvent('showNotification', _source, _U('must_be') .. Config.CopsRequiredToSell .. _U('to_sell_drugs'), 'error')
	end
end)


RegisterServerEvent('drugsNotify')
AddEventHandler('drugsNotify', function()
	TriggerClientEvent("drugsEnable", source)
end)

RegisterServerEvent('drugsInProgress')
AddEventHandler('drugsInProgress', function(street1, street2, sex)
      TriggerClientEvent("outlawNotify", -1, "~r~En ~w~" ..sex.. "~r~ prøvede at sælge narkotika tæt på ~w~" ..street1.. "~r~ og på ~w~" ..street2)
end)

RegisterServerEvent('drugsInProgressS1')
AddEventHandler('drugsInProgressS1', function(street1, sex)
      TriggerClientEvent("outlawNotify", -1, "~r~En ~w~" ..sex.. "~r~ prøvede at sælge narkotika tæt på ~w~" ..street1)
end)

RegisterServerEvent('drugsInProgressPos')
AddEventHandler('drugsInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('drugsPlace', -1, gx, gy, gz)
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
	
	PerformHttpRequest('https://discord.com/api/webhooks/975708664461664266/kDAVDgP0keRmzrMmg2zpWC13rpipE_KFbsA27idC-RXMwpkLGbvG5bEAl6tVbQf_ko7L', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end 