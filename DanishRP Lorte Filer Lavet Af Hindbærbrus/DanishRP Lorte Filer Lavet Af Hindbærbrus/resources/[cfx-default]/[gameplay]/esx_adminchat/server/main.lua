--[[

  Made with love by Cheleber, you can join my RP Server here: www.grandtheftlusitan.com
  You can add this lines do your esx_rpchat.

--]]

ESX 						   = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Group 

ESX.RegisterServerCallback('esx_chatforadmin:GetGroup', function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        Group = player.getGroup()
        if Group ~= nil then 
            cb(Group)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterCommand('a', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendMessageAdmin", -1, source,  xPlayer.getName(), table.concat(args, " "))
	end	
end, false)
  

RegisterNetEvent("fuckmylife")
AddEventHandler("fuckmylife", function(name, message)
    if Group ~= 'user' then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(141, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-bullhorn"></i> Admin Chat ({0}):<br> {1}</div>',
            args = { name, message }
        })
	end	
end)