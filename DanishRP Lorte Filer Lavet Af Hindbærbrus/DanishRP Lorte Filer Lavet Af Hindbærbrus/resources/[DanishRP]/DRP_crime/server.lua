ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gris-gambino:buyItem')
AddEventHandler('gris-gambino:buyItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.addInventoryItem(item, 1)
        sendToDiscord(16753920, "Grisen (Gambino / BuyItem)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " Købte ".. item, "ø er en kvinde")
end)

RegisterServerEvent('gris-gambino:buyWeapon')
AddEventHandler('gris-gambino:buyWeapon', function(weapon)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.addInventoryItem(weapon, 1)
        sendToDiscord(16753920, "Grisen (Gambino / BuyWeapon)", 'ID: ' .. source .. ' '.. xPlayer.getName() .. " Købte ".. weapon, "ø er en kvinde")
end)

ESX.RegisterUsableItem('pistolkasse', function(playerId)
     local xPlayer = ESX.GetPlayerFromId(playerId)
     xPlayer.removeInventoryItem('pistolkasse', 1)
     xPlayer.addInventoryItem('weapon_pistol')
end)

 ESX.RegisterUsableItem('snskasse', function(playerId)
     local xPlayer = ESX.GetPlayerFromId(playerId)
     xPlayer.removeInventoryItem('snskasse', 1)
     xPlayer.addInventoryItem('weapon_snspistol')
 end)

 ESX.RegisterUsableItem('vintagekasse', function(playerId)
     local xPlayer = ESX.GetPlayerFromId(playerId)
     xPlayer.removeInventoryItem('vintagekasse', 1)
     xPlayer.addInventoryItem('weapon_vintagepistol')
 end)

 ESX.RegisterUsableItem('deaglekasse', function(playerId)
     local xPlayer = ESX.GetPlayerFromId(playerId)
     xPlayer.removeInventoryItem('deaglekasse', 1)
     xPlayer.addInventoryItem('weapon_pistol50')
 end)

 ESX.RegisterUsableItem('revolverkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('revolverkasse', 1)
    xPlayer.addInventoryItem('weapon_revolver')
end)

ESX.RegisterUsableItem('teckasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('teckasse', 1)
    xPlayer.addInventoryItem('weapon_machinepistol')
end)

ESX.RegisterUsableItem('uzikasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('uzikasse', 1)
    xPlayer.addInventoryItem('weapon_microsmg')
end)

ESX.RegisterUsableItem('scorpionkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('scorpionkasse', 1)
    xPlayer.addInventoryItem('weapon_minismg')
end)

ESX.RegisterUsableItem('gusenbergkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('gusenbergkasse', 1)
    xPlayer.addInventoryItem('weapon_gusenberg')
end)

ESX.RegisterUsableItem('akkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('akkasse', 1)
    xPlayer.addInventoryItem('weapon_assaultrifle')
end)

ESX.RegisterUsableItem('pumpkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('pumpkasse', 1)
    xPlayer.addInventoryItem('weapon_pumpshotgun')
end)

ESX.RegisterUsableItem('dbkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('dbkasse', 1)
    xPlayer.addInventoryItem('weapon_dbshotgun')
end)

ESX.RegisterUsableItem('sawedoffkasse', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('sawedoffkasse', 1)
    xPlayer.addInventoryItem('weapon_sawnoffshotgun')
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1042455945323761804/3KIylz908h6WcxpngOPkIm9CDvEWbyP2ksqeQJbJ3n-geJLYwemRQxS3NGALC57mmTrI', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end