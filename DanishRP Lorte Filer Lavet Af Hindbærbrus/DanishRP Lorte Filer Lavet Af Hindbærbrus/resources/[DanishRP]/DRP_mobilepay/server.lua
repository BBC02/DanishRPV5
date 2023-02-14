ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("mobilepay", function(source, args, raw)
	local to = args[1]
	local amount = args[2]
	TriggerEvent('mobilepay:transfer', source, to, amount)
end, false)

local dusort = true

local dusort1 = true

function GetRealPlayerName(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
 
    if xPlayer then
        if dusort then
            if dusort1 then
                return xPlayer.getName()
            else
                return xPlayer.getName()
            end
        else
            return xPlayer.getName()
        end
    else
        return GetPlayerName(playerId)
    end
end
 
-- Get Character name
function GetCharacterName(source)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
      ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })
  
    if result[1] and result[1].firstname and result[1].lastname then
      if dusort then
        return result[1].firstname
      else
        return ('%s %s'):format(result[1].firstname, result[1].lastname)
      end
    else
      return GetPlayerName(source)
    end
  end

RegisterServerEvent('mobilepay:transfer')
AddEventHandler('mobilepay:transfer', function(source, to, amountt)
    local _source = source
    local name1 = GetRealPlayerName(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
	    local zPlayer = ESX.GetPlayerFromId(to)
 	    local name2 = GetRealPlayerName(to)
    local balance = 0
    if zPlayer == nil then
        TriggerClientEvent('esx:showNotification', source, "~r~Dette ID er ikke online!")
        else
        if zPlayer ~= nil then
            balance = xPlayer.getAccount('bank').money
            zbalance = zPlayer.getAccount('bank').money
            if tonumber(_source) == tonumber(to) then
                TriggerClientEvent('esx:showNotification', source, "~r~Du kan ikke sende penge til dig selv!")
            else
                if tonumber(amountt) <= 0 then 
                    TriggerClientEvent('esx:showNotification', source, "~r~Du skal sende over 1 krone!")
                    elseif balance < tonumber(amountt) or balance <= 0 then
                        TriggerClientEvent('esx:showNotification', source, "~r~Du har ikke nok penge!")
                    else
                        xPlayer.removeAccountMoney('bank', tonumber(amountt))
                        zPlayer.addAccountMoney('bank', tonumber(amountt))
                        TriggerClientEvent('esx:showNotification', source, "Du sendte ~g~" .. amountt ..'~g~,-~g~ DKK~w~ til ~g~' .. name2)
                        local name = GetPlayerName(xPlayer.source)
	                    PerformHttpRequest("https://discord.com/api/webhooks/1041093975349670008/kVeFqzwiW3Yugw4XXI6El9t_2lHeJEQegfjvGYy8q9QANlfux_YRxLTNus1lOXWutSgC", function(err, text, headers) end, 'POST', json.encode({username = name, content = name .. "  ( "..name1.. " ) sendte " .. amountt .. ",- til " ..to.. " ( ".. name2 .. " )"}), { ['Content-Type'] = 'application/json' })

                        TriggerClientEvent('esx:showNotification', to, "Du modtog ~g~" .. amountt .. '~g~,-~g~ DKK~w~ fra ~g~' .. name1)
                end
            end
        end
    end
end)

