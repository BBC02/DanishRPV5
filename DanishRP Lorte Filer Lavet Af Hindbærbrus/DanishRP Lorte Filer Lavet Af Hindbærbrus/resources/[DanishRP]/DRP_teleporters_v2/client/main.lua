ESX = nil

local teleportID = nil
local teleportSubID = nil
local instanceID = nil
local CharId = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()

    RegisterTeleporters()
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Teleport = function(data, id, subId)
    if data then
        local playerPed = PlayerPedId()
        
        local target = playerPed
        local tCoords = data.TeleportPoint.coords
        local coords = vector3(tCoords.x, tCoords.y, tCoords.z)
        
        if IsPedInAnyVehicle(playerPed, true) then
            if not data.AllowVehicle then
                exports['mythic_notify']:SendAlert('error', 'Denne TP kan ikke bruges med et køretøj.', 5000)
                return
            end
            
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                if not ESX.Game.IsSpawnPointClear(tCoords, 5.0) then
                    exports['mythic_notify']:SendAlert('error', 'Der står et køretøj i vejen.', 5000)
                    return
                end
            end
            
            target = vehicle
        end
        
        if Config.Pads[id][1]['Bucket'] and subId == 1 then
            GridMarker(id, 2)
            SetResourceKvpInt(CharId, id)
        end

        if subId == 2 then
            DeleteResourceKvp(CharId)
            TriggerEvent('gridsystem:unregisterMarker', 'tpexit')
            IPLRemoveOfficeSign()

            if Config.Targets[id] then
                RemoveBoxZone(Config.Targets[id]['name'])
            end
        end

        if instanceID then
            TriggerServerEvent('exit:instance', instanceID)
            instanceID = nil
        end

        if data.Bucket and instanceID == nil then
            TriggerServerEvent('enter:instance', data.Bucket)
            instanceID = data.Bucket
        end

        if Config.Design[id] then
            IPLDesign(Config.Pads[id][1]['Name'], Config.Design[id])
            IPLSetOfficeSign(Config.Pads[id][1]['Name'], Config.Design[id])
        end

        if Config.Targets[id] and subId ~= 2 then
            RegisterBoxZone(Config.Targets[id])
        end
        
        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
            Wait(0)
        end
        
        if target ~= playerPed then
            SetPedCoordsKeepVehicle(playerPed, coords.x, coords.y, coords.z)
            SetEntityHeading(target, Config.Pads[id][subId]['TeleportPoint']['h'])
        end
        
        if target == playerPed then
            ESX.Game.Teleport(playerPed, coords, function()
                SetEntityHeading(playerPed, Config.Pads[id][subId]['TeleportPoint']['h'])
            end)
        end
        
        DoScreenFadeIn(800)
        teleportID = nil
        teleportSubID = nil
    else
        exports['mythic_notify']:SendAlert('error', 'Der opstod en fejl.', 5000)
    end
end


RegisterTeleporters = function()
    CreateThread(function()
        for key, value in pairs(Config.Pads) do
            for k, v in ipairs(Config.Pads[key]) do
                if Config.Pads[key][1]['Bucket'] and k == 2 then
                    break
                end
                GridMarker(key, k)
            end
            
            Wait(50)
        end

        Wait(500)

        local kvpTP = GetResourceKvpInt(CharId)
        if kvpTP ~= 0 then
            GridMarker(kvpTP, 2)
            TriggerServerEvent('enter:instance', Config.Pads[kvpTP][1]['Bucket'])

            if Config.Design[kvpTP] then
                IPLDesign(Config.Pads[kvpTP][1]['Name'], Config.Design[kvpTP])
                IPLSetOfficeSign(Config.Pads[kvpTP][1]['Name'], Config.Design[kvpTP])
            end

            if Config.Targets[kvpTP] then
                RegisterBoxZone(Config.Targets[kvpTP])
            end

            instanceID = Config.Pads[kvpTP][1]['Bucket']
        end
    end)
end

GridMarker = function(key, k)
    if Config.Pads[key][1]['Bucket'] and k == 2 then
        tpName = 'tpexit'
    else
        tpName = 'teleporter_' .. key .. '_' .. k
    end

    TriggerEvent('gridsystem:registerMarker', {
        name = tpName,
        pos = vector3(Config.Pads[key][k]['Position']['x'], Config.Pads[key][k]['Position']['y'], Config.Pads[key][k]['Position']['z']),
        scale = vector3(Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z),
        msg = Config.Pads[key][k]['Text'],
        control = 'E',
        type = -1,
        drawDistance = 7.0,
        show3D = true,
        inVehicle = false,
        forceExit = true,
        showHTML = true,
        color = {r = Config.PointMarker.r, g = Config.PointMarker.g, b = Config.PointMarker.b},
        action = function()
            if Config.Pads[key][k]['SteamID'] and Config.Pads[key][k]['Lock'] then
                if Config.Pads[key][k]['SteamID'][ESX.PlayerData.identifier] then
                    TeleportMenu(key, k)
                    return
                end
            end
            
            if Config.Pads[key][k]['authorizedJobs'] then
                if Config.Pads[key][k]['authorizedJobs'][ESX.PlayerData.job.name] and Config.Pads[key][k]['Lock'] then
                    TeleportMenu(key, k)
                    return
                end
            end

            if Config.Pads[key][k]['keyItem'] then
                TeleportMenu(key, k)
                return
            end
            
            if GlobalState[key .. '-tpin'] then
                exports['mythic_notify']:SendAlert('error', 'Indgangen/Udgangen er låst.', 5000)
                return
            end
            
            if Config.Pads[key][k]['KeyLock'] then
                teleportID = key
                teleportSubID = k
                TriggerEvent('drp_keypad:EnterPassword', Config.Pads[key][k]['KeyLock'], 'drp:teleport')
                return
            end
            
            Teleport(Config.Pads[key][k], key, k)
        end,
        onExit = function()
            exports["nh-context"]:CancelMenu()
        end
    })
end

RegisterNetEvent('drp:teleport', function()
    Teleport(Config.Pads[teleportID][teleportSubID], teleportID, teleportSubID)
end)

ItemCheck = function(id, subId)
    local inventory = ESX.GetPlayerData().inventory
    print(Config.Pads[id][subId]['keyItem'])
    for i=1, #inventory, 1 do
        if inventory[i].name == Config.Pads[id][subId]['keyItem'] then
            if inventory[i].count >= 1 then
                return true
            end
        end
    end
end

function print_r(t)
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

-- Citizen.CreateThread(function()
--     -- Getting the object to interact with
--     FinanceOffice2 = exports['bob74_ipl']:GetFinanceOffice2Object()

--     -- Set the office theme to "contrast"
--     FinanceOffice2.Style.Set(FinanceOffice2.Style.Theme.cool)

--     -- Enable chairs in the office
--     FinanceOffice2.Chairs.Set(FinanceOffice2.Chairs.on)

--     -- Enable booze bottles
--     -- FinanceOffice2.Booze.Clear

--     -- Enable maximum cash
--     --FinanceOffice2.Swag.Enable(FinanceOffice2.Swag.Cash)

--     -- Enable all paintings + Refresh
--     FinanceOffice2.Swag.Enable(FinanceOffice2.Painting, true)
-- end)

-- Citizen.CreateThread(function()
--     FinanceOrganization = exports['bob74_ipl']:GetFinanceOrganizationObject()

--     -- Setting the name parameters
--     FinanceOrganization.Name.Set("DIN ADVOKAT\nHOLM & CO", FinanceOrganization['Name']['Style']['normal'], FinanceOrganization.Name.Colors.black, FinanceOrganization['Name']['Style']['normal'])

--     -- Enabling the name to be able to see it
--     FinanceOrganization.Office.Enable(true)
-- end)
