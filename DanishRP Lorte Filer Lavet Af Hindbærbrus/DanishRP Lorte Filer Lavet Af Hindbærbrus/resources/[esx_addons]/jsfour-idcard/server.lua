local ESX = nil
-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local show       = false

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						elseif type == 'personal' then
							show = true
						end
					end
				else
					show = true
				end

				if show then
					local array = {
						user = user,
						licenses = licenses
					}
					TriggerClientEvent('jsfour-idcard:open', _source, array, type)
				else
					TriggerClientEvent('esx:showNotification', _source, "Du har ikke denne type licens")
				end
			end)
		end
	end)
end)

RegisterServerEvent('jsfour-idcard:showvisitkort')
AddEventHandler('jsfour-idcard:showvisitkort', function(ID, targetID)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	exports.oxmysql:single('SELECT * FROM visitkort WHERE identifier = ?', {identifier}, function(result)
		if result then
			local array = {
				user = {
					firstname = "hej",
					sex = "attack helicopter"
				},
				licenses = nil,
				link = result.link
			}
			TriggerClientEvent('jsfour-idcard:open', _source, array, "personal")
		end
	end)

end)

RegisterServerEvent('jsfour-idcard:editvisitkort')
AddEventHandler('jsfour-idcard:editvisitkort', function(link)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.getIdentifier()

	exports.oxmysql:insert('INSERT INTO visitkort (identifier, link) VALUES (:identifier, :link) ON DUPLICATE KEY UPDATE link = :link', {
		['identifier'] = identifier,
		['link'] = link
	})
	
end)
