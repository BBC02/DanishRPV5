--[[

  ESX RP Chat

--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local perms = {}

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

-- AddEventHandler('chatMessage', function(source, name, message)
--     if string.sub(message, 1, string.len("/")) ~= "/" then
--         local name = getIdentity(source)
--       TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
--     end
--     CancelEvent()
-- end)

-- AddEventHandler('chatMessage', function(source, name, message)
--     if string.sub(message, 1, string.len("/")) == "/" and string.sub(message, 1, string.len("/ool")) == "/ool" then
--         local name = GetPlayerName(source)
--         local _message = message:gsub("/ool", "")
--         TriggerClientEvent('poke_rpchat:sendProximityMessageB', -1, source, '[OOL] '..name, _message, {128, 128, 128})
--     end
--     CancelEvent()
-- end)


--[[

  Made with love by Cheleber, you can join my RP Server here: www.grandtheftlusitan.com
  You can add this lines do your esx_rpchat.

--]]

ESX 						   = nil
local Group 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

RegisterCommand('report', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
	Group = xPlayer.getGroup()
	TriggerClientEvent("sendMessageAdmin2", -1, source,  playerName, table.concat(args, " "))
end, false)

RegisterCommand('giveooc', function(source, args, rawCommand)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(target)
    local identifier = tPlayer.getIdentifier()

    Group = xPlayer.getGroup()
	if Group ~= 'user' then
        perms[identifier] = true
    end
end)

RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local source = source
    local name = getIdentity(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if perms[identifier] == true then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(41, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-globe"></i> {0} - [ID: {2}]:<br> {1}</div>',
            args = { playerName, msg, source }
        })
        perms[identifier] = nil
    else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(41, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-info-circle"></i> Vision: <br> Du har ikke tilladelse til ooc - /report</div>',
            args = {}
        })
    end
end, false)

-- Citizen.CreateThread(function()
--     while true do
--         ExecuteCommand('ngnuigjuigjeuig')
--         Citizen.Wait(1200000)
--     end
-- end)

-- RegisterCommand('ngnuigjuigjeuig', function(source, args, rawCommand)
--     TriggerClientEvent('chat:addMessage', -1, {
--         template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgb(0,85,255); border-radius: 3px;"><i class="fab fa-discord"></i> Sponsorat: <br> Vision er sponsoreret af IDHosting.dk, mere information i #idhosting</div>',
--         args = { fal, msg }
--     })
-- end, false)

RegisterCommand('r', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
    local target = args[1]
    local smessage = ""
    for k,v in pairs(args) do
        if k > 1 then
            smessage = smessage .. v .." "
        end
    end
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendRelyMessage", target, source, target, playerName, smessage)
        TriggerClientEvent("sendRelyMessage", source, source, target, playerName, smessage)
	end	
end, false)

RegisterCommand('a', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = GetPlayerName(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendMessageAdmin", -1, source,  playerName, table.concat(args, " "))
	end	
end, false)

  

RegisterNetEvent("fuckmylife")
AddEventHandler("fuckmylife", function(name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
    if Group ~= 'user' then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(51, 0, 102); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-bullhorn"></i> Staff Chat - {0}:<br> {1}</div>',
            args = { name, message }
        })
	end	
end)

RegisterNetEvent("sendtoownplayer")
AddEventHandler("sendtoownplayer", function(name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
    if Group ~= 'user' then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(141, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-bullhorn"></i> Svar fra Staff - {0}:<br> {1}</div>',
            args = { name, message }
        })
	end	
end)


RegisterNetEvent("sendtoownplayer2")
AddEventHandler("sendtoownplayer2", function(name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
    TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(255, 128, 0); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-bullhorn"></i> Report - ID {0} ({1}):<br> {2}</div>',
            args = { source, name, message }
        })
end)

RegisterNetEvent("sendreplytoplayer")
AddEventHandler("sendreplytoplayer", function(target,name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
    TriggerClientEvent('chat:addMessage', target, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(141, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s><i class="fas fa-bullhorn""></i> Svar fra Staff ({0}):<br> {1}</div>',
        args = { name, message }
    })
end)


RegisterNetEvent("fuckmylife3")
AddEventHandler("fuckmylife3", function(id, name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
    if Group ~= 'user' then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(141, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-bullhorn"></i> Report - ID: {0} ({1}):<br> {2}</div>',
            args = { id, name, message }
        })
	end	
end)

RegisterNetEvent("fuckmylife2")
AddEventHandler("fuckmylife2", function(name, message, source2)
    TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(41, 41, 41, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-globe"></i> OOL - {0} - ID: {2}:<br> {1}</div>',
        args = { name, message, source2 }
    })
end)

  TriggerEvent('es:addCommand', 'me', function(source, args, user)
    local name = getIdentity(source)
    table.remove(args, 2)
    TriggerClientEvent('esx-qalle-chat:me', -1, source, name.firstname, table.concat(args, " "))
end)

--[[RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)]]

--  RegisterCommand('anontweet', function(source, args, rawCommand)
--     local playerName = GetPlayerName(source)
--     local msg = rawCommand:sub(11)
--     local name = getIdentity(source)
--     fal = name.firstname .. " " .. name.lastname
--     TriggerClientEvent('chat:addMessage', -1, {
--         template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @Ukendt:<br> {1}</div>',
--         args = { fal, msg }
--     })
-- end, false)

RegisterCommand('ool', function(source, args, user)
    local pname = GetPlayerName(source)
    TriggerClientEvent("poke_rpchat:sendProximityMessageB", -1, source, pname, table.concat(args, " "))
end)

RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    -- fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(214, 168, 0, 1); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-ad"></i> Reklame @{0}:<br> {1}<br></div>',
        args = { name,msg }
    })
end, false)

RegisterCommand('pa', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
        local msg = rawCommand:sub(4)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(36, 49, 70, 0.9); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-address-book"></i> Politiet @:<br> {0}<br></div>',
            args = { msg }
        })
    end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
        local msg = rawCommand:sub(4)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(73, 92, 175, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-address-book"></i> EMS @:<br> {0}<br></div>',
            args = { msg }
        })
    end
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = xPlayer.getName()
    local msg = rawCommand:sub(4)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(28, 160, 242, 0.8); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fab fa-twitter"></i> Twitter @{0}:<br> {1}</div>',
        args = { playerName, msg }
    })

end, false)


RegisterCommand('support', function(source, args, raw)
	local player = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local TargetPlayer = ESX.GetPlayerFromId(player)
    
    if xPlayer.getGroup() ~= 'user' then
        TriggerEvent("InteractSound_SV:PlayOnSource", player, "pager", 1)
        TargetPlayer.showNotification("~r~Du bedes komme i support.", true, true)
    end
end)

RegisterCommand('aaa', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getGroup() ~= 'user' then
        local playerName = GetPlayerName(source)
        local msg = rawCommand:sub(5)
        local name = getIdentity(source)

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(163, 36, 37, 0.9); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fas fa-globe"></i> Staff @ {0}:<br> {1}</div>',
            args = { playerName, msg }
        })
        -- TriggerClientEvent('chat:addMessage', -1, {
        --     template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(141, 41, 41, 0.8); border-radius: 3px;"><i class="fas fa-bullhorn"></i> STAFF: <br> {1}</div>',
        --     args = { fal, msg }
        -- })
    end
end, false)

RegisterServerEvent('gcPhone:twitter_postTweets')
AddEventHandler('gcPhone:twitter_postTweets', function(username, password, message)
  local _source = source
  local sourcePlayer = tonumber(_source)
  local srcIdentifier = ESX.GetPlayerFromId(_source).identifier
  fal = name.firstname .. " " .. name.lastname
  TwitterPostTweet(username, password, message, sourcePlayer, srcIdentifier)
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.5vw; margin: 0.05vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;" class="testing animated zoomIn delay-2s"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
    args = { username, message }
})
end)


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
