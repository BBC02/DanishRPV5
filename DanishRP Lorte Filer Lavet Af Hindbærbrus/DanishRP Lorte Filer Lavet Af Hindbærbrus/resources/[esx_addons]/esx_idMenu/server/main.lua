onlinePlayers = {}

RegisterServerEvent('tgiann-showid:add-id')
AddEventHandler('tgiann-showid:add-id', function()
    TriggerClientEvent("tgiann-showid:client:add-id", source, onlinePlayers)
    local topText = "" .. TGIANN.which
    local identifiers = GetPlayerIdentifiers(source)
    if TGIANN.which == "steam" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = v
                break
            end
        end
    elseif TGIANN.which == "steamv2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = string.sub(v, 7)
                break
            end
        end
    elseif TGIANN.which == "license" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = v
                break
            end
        end
    elseif TGIANN.which == "licensev2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = string.sub(v, 9)
                break
            end
        end
    elseif TGIANN.which == "name" then 
        topText = GetPlayerName(source)
    end
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("tgiann-showid:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)

function GetPlayers2()
    local players = {}
    for k, v in ipairs(GetPlayers()) do
        table.insert(players, v)
    end
    table.sort(
		players,
		function(a, b)
			if tonumber(a) ~= nil and tonumber(b) ~= nil then
				return tonumber(a) < tonumber(b)
			else
				return false
			end
		end
	)

    return players
end

RegisterServerEvent("esx_idMenu:showMenu")
AddEventHandler("esx_idMenu:showMenu", function(players)
	local elements = {}
	for k,v in pairs(GetPlayers2()) do
		local xPlayer = ESX.GetPlayerFromId(v)
		local steamanme = GetPlayerName(v)
		if xPlayer ~= nil then
			table.insert(elements, {label = "ID: ".. v, id = v, name = steamanme, identifier = xPlayer.getIdentifier()})
		end
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_idMenu:showMenu",source,elements)
	-- TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, xPlayer.getRPname(), " kigger på listen over byens borgere", { 255, 0, 0 })
end)