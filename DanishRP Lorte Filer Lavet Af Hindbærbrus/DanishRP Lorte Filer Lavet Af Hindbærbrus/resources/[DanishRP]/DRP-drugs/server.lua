ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('gris-drugs:giveheroitem')
AddEventHandler('gris-drugs:giveheroitem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    sendToDiscord2(16753920, "Grisen (Giv herion item)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count, "")

    if xPlayer.canCarryItem(item, count) then
    xPlayer.addInventoryItem(item, count)
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere!', style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
end
end)

RegisterNetEvent('gris-drugs:givecannaitem')
AddEventHandler('gris-drugs:givecannaitem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    sendToDiscord3(16753920, "Grisen (Giv cannabis item)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count, "")

    if xPlayer.canCarryItem(item, count) then
    xPlayer.addInventoryItem(item, count)
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere!', style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
end
end)

RegisterNetEvent('gris-drugs:givemethitem')
AddEventHandler('gris-drugs:givemethitem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    sendToDiscord6(16753920, "Grisen (Giv meth item)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count, "")

    if xPlayer.canCarryItem(item, count) then
    xPlayer.addInventoryItem(item, count)
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere!', style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
end
end)

RegisterNetEvent('gris-drugs:givesvampeitem')
AddEventHandler('gris-drugs:givesvampeitem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    sendToDiscord5(16753920, "Grisen (Giv svampe item)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count, "")

    if xPlayer.canCarryItem(item, count) then
    xPlayer.addInventoryItem(item, count)
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere!', style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
end
end)

RegisterNetEvent('gris-drugs:givecokeitem')
AddEventHandler('gris-drugs:givecokeitem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    sendToDiscord(16753920, "Grisen (Giv coke item)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count, "")


    if xPlayer.canCarryItem(item, count) then
    xPlayer.addInventoryItem(item, count)
    else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere!', style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
end
end)

RegisterNetEvent('gris-drugs:omdanitem')
AddEventHandler('gris-drugs:omdanitem', function(item, count, remove, itemRemove)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemtoremove = xPlayer.getInventoryItem(itemRemove)

    sendToDiscord4(16753920, "Grisen (omdanner)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " fik ".. item .. ' antal ' .. count .. ' mistede '.. remove .. itemRemove, "")

    if itemtoremove then
    if xPlayer.canCarryItem(item, count) and itemtoremove.count >= Config.OmdanFjern then
    xPlayer.addInventoryItem(item, count)
    xPlayer.removeInventoryItem(itemRemove, remove)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bære mere, ellers har du ikke mere: ' .. itemRemove, style = { ['background-color'] = '#ff0000', ['color'] = '#ffffff' } })
        end
    end
end)

function sendToDiscord(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord5(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord6(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord2(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord3(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord4(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1061066042786447470/praMndF_8yVpSrhGS91NwCdzTPBqdBNokWy9geQwxYyFkJJRZF4rPTkNAX74FTWlNbBT', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end