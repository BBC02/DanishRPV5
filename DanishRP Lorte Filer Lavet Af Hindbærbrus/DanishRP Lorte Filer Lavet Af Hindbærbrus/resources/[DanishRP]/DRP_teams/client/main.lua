ESX = nil

Races = {}
nuiRaces = {}

local hasInit = false
local isOpen = false
local isLoading = false
local Team = {}
local openTeams = {}
local Invites = {}

RegisterCommand('+teams', function()
    OpenTeamsMenu()
end, false)

RegisterKeyMapping('+teams', 'Open Teams Menu', 'keyboard', 'F10')

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()

    TriggerServerEvent("drp_teams:Init")

    while not hasInit and isTableEmpty(Races) do
        Wait(0);
    end

    for k,v in pairs(Races) do
        local race = {}
        race["id"] = v.id
        race["name"] = v.name
        race["isOpen"] = false
        race["isActive"] = v.isActive
        race["bestTimes"] = v.bestTimes
        race["membersReady"] = v.membersReady
        race["whitelistedJobs"] = v.whitelistedJobs

        table.insert(nuiRaces, race)
    end

    SendNUIMessage({
        init = true,
        source = GetPlayerServerId(PlayerId()),
        playerJob = ESX.PlayerData.job.name,
        Races = nuiRaces,
        MaxMembers = Config.MaxMembers,
        NameResource = {GetCurrentResourceName(), GetCurrentServerEndpoint()},
    })
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job

    Citizen.Wait(500)

    SendNUIMessage({
        refreshJob = true,
        playerJob = ESX.PlayerData.job.name,
    })
end)

RegisterNetEvent('drp_teams:Init')
AddEventHandler('drp_teams:Init', function(serverRaces)
    Races = serverRaces
    hasInit = true
end)

OpenTeamsMenu = function()
    local isTeamOpen = isOpen
    isOpen = not isOpen

    if isTeamOpen then
        SetNuiFocus(false)
        SendNUIMessage({close = true})
    end

    if not isTeamOpen then
        SetNuiFocus(true, true)

        SendNUIMessage({
            open = true,
            Team = Team,
            openTeams = openTeams,
            invites = Invites,
        })
    end
end

RegisterNetEvent('drp_teams:syncTeam')
AddEventHandler('drp_teams:syncTeam', function(serverTeam, uuid, type, target)
    Team = serverTeam

    while isLoading do
        Wait(0);
    end
    
    SendNUIMessage({
        refreshTeam = true,
        Team = Team,
    })

    TriggerServerEvent("drp_racing:teamAction", uuid, type, target)
end)

RegisterNetEvent('drp_teams:syncOpenTeams')
AddEventHandler('drp_teams:syncOpenTeams', function(serverOpenTeams)
    openTeams = serverOpenTeams

    SendNUIMessage({
        refreshHubs = true,
        OpenTeams = openTeams,
    })
end)

RegisterNetEvent('drp_teams:addInvites')
AddEventHandler('drp_teams:addInvites', function(serverInvites)
    table.insert(Invites, serverInvites)

    SendNUIMessage({
        refreshInvites = true,
        TeamInvites = Invites,
    })
end)

RegisterNetEvent('drp_teams:removeInvites')
AddEventHandler('drp_teams:removeInvites', function(key)
    table.remove(Invites, key)

    SendNUIMessage({
        refreshInvites = true,
        TeamInvites = Invites,
    })
end)

RegisterNetEvent('drp_teams:sendNotification')
AddEventHandler('drp_teams:sendNotification', function(type, title, text, duration)
    SendNUIMessage({
        ShowNotification = true,
        type = type,
        title = title,
        text = text,
        duration = duration,
    })
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
    isOpen = false

    cb('ok')
end)

RegisterNUICallback('CreateTeam', function(data, cb)
    local TeamName = data["team_name"]
    TriggerServerEvent("drp_teams:createTeam", TeamName)

    cb('ok')
end)

RegisterNUICallback('deleteTeam', function(data, cb)
    TriggerServerEvent("drp_teams:deleteTeam")

    cb('ok')
end)

RegisterNUICallback('leaveTeam', function(data, cb)
    TriggerServerEvent("drp_teams:leaveTeam")

    cb('ok')
end)

RegisterNUICallback('invitePlayer', function(data, cb)
    local Player = tonumber(data["player_id"])
    TriggerServerEvent("drp_teams:inviteTeamMember", Player)

    cb('ok')
end)

RegisterNUICallback('kickPlayer', function(data, cb)
    local Player = tonumber(data["player_id"])
    TriggerServerEvent("drp_teams:removeTeamMember", Player)

    cb('ok')
end)

RegisterNUICallback('transferOwnership', function(data, cb)
    local Player = tonumber(data["player_id"])
    TriggerServerEvent("drp_teams:transferOwnership", Player)

    cb('ok')
end)

RegisterNUICallback('changeName', function(data, cb)
    local TeamName = data["team_name"]
    TriggerServerEvent("drp_teams:changeName", TeamName)

    cb('ok')
end)

RegisterNUICallback('publicTeam', function(data, cb)
    TriggerServerEvent("drp_teams:toggleTeamPublic")

    cb('ok')
end)

RegisterNUICallback('jointeamHub', function(data, cb)
    local uuid = data["uuid"]
    TriggerServerEvent("drp_teams:jointeamHub", uuid)

    cb('ok')
end)

RegisterNUICallback('acceptInvite', function(data, cb)
    local uuid = data["uuid"]
    TriggerServerEvent("drp_teams:acceptTeamInvite", uuid)

    cb('ok')
end)

RegisterNUICallback('declineInvite', function(data, cb)
    local uuid = data["uuid"]
    TriggerServerEvent("drp_teams:declineTeamInvite", uuid)

    cb('ok')
end)

RegisterNUICallback('removeInvite', function(data, cb)
    local target = tonumber(data["player_id"])
    local uuid = data["uuid"]

    TriggerServerEvent("drp_teams:removeInvite", target, uuid)

    cb('ok')
end)

RegisterNUICallback('isLoading', function(data, cb)
    isLoading = data["isLoading"]

    cb('ok')
end)

round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

isTableEmpty = function(table)
    return next(table) == nil
end

tablelength = function(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

print_r = function(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end
    sub_print_r(t, "  ")
end
