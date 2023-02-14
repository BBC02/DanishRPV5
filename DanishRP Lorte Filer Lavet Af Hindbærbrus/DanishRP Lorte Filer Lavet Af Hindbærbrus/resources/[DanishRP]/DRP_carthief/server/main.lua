ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local cooldown = {}
local alldeliveries = {}

--Add all deliveries to the table
Citizen.CreateThread(function()
	local deliveryids = 1
	for k,v in pairs(Config.Delivery) do
		table.insert(alldeliveries, {
            id = deliveryids,
            posx = v.Pos.x,
            posy = v.Pos.y,
            posz = v.Pos.z,
            payment = v.Payment,
            car = v.Cars,
		})
		deliveryids = deliveryids + 1  
	end
end)

RegisterServerEvent('troll_carthief:pay')
AddEventHandler('troll_carthief:pay', function(token, payment)

	local _source = source

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end

	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier
	local playerCoords = GetEntityCoords(GetPlayerPed(_source))
	print(cooldown[identifier])
	if cooldown[identifier] == nil or cooldown[identifier] <= 0 then
		local xPlayer = ESX.GetPlayerFromId(_source)
		local money = alldeliveries[payment].payment
		xPlayer.addAccountMoney('black_money',tonumber(money))
		TriggerClientEvent('esx:showNotification', source, 'Du modtog ~g~$' .. money .. '~s~ sorte penge.')

		--Add cooldown
		cooldown[identifier] = Config.CooldownMinutes * 60000

		chance = math.random(1,3)
		-- Check if player has full inventory
		if chance > 1 then
			if xPlayer.canCarryItem("lockpick", chance) then
				xPlayer.addInventoryItem("lockpick", chance)
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Du modtog ' .. chance .. ' lockpick'})
			end
			sendToDiscord(16753920, "Afleveret en bil", xPlayer.getName() .. " (" .. identifier .. ") Afleveret en bil, på position " .. playerCoords .. " og modtog " .. chance .. " lockpicks og " .. money .. " sorte penge", "Lavet af troll", "biltyveri")
		elseif chance == 1 then
			if xPlayer.canCarryItem("hackerusb", 1) then
				xPlayer.addInventoryItem("hackerusb", 1)
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Du modtog 1 usb stik'})
			end
			sendToDiscord(16753920, "Afleveret en bil", xPlayer.getName() .. " (" .. identifier .. ") Afleveret en bil, på position " .. playerCoords .. " og modtog 1 hacker usb og " .. money .. " sorte penge", "Lavet af troll", "biltyveri")
		end
	else
		TriggerClientEvent('esx:showNotification', source, 'Du kan ikke aflevere en bil nu.')
	end
end)

RegisterServerEvent('troll_carthief:setcooldownabort')
AddEventHandler('troll_carthief:setcooldownabort', function(token)

	local _source = source

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end

	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier
	cooldown[identifier] = 5 * 60000
end)

RegisterServerEvent('troll_carthief:setcooldown')
AddEventHandler('troll_carthief:setcooldown', function(token)

	local _source = source

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end

	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier
	cooldown[identifier] = Config.CooldownMinutes * 60000
end)

ESX.RegisterServerCallback('troll_carthief:isActive',function(source, cb)
	local identifier = ESX.GetPlayerFromId(source).identifier
  	cb(cooldown[identifier])
end)

RegisterServerEvent('troll-carthief:sentmessage')
AddEventHandler("troll-carthief:sentmessage", function(message)
	local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
    TriggerEvent('gcPhone:_internalAddMessage', 666, xPlayer.variables.phoneNumber, message, 0, function (smsMess)
		TriggerClientEvent('gcPhone:receiveMessage', _source, smsMess)
	end)
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		activity = 0
		activitySource = 0
	end
end)

-- Cooldown manager in a citizen thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k,v in pairs(cooldown) do
			if v > 0 then
				cooldown[k] = v - 5000
			end
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
	
	if type == "biltyveri" then
		PerformHttpRequest('https://discord.com/api/webhooks/1042816294107480074/hRBFf7N480nV73AuZQo66cs1OKGeq0gjDlx3dL2IWiv3Tl7ypF0axuBLC-HU74kMSuoz', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end