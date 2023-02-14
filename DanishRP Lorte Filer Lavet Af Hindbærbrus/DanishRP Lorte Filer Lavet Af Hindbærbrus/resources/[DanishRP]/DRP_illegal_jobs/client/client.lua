gtruckplayer = nil
coords = {}
hejhejhejneger = true

Citizen.CreateThread(function()
    while true do
        player = PlayerPedId()
        coords = GetEntityCoords(player)
        Citizen.Wait(500)
    end
end)

local PedLocation = vector4(-1126.34, 2694.63, 17.80, 96.5)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if hejhejhejneger then
            local sleep = true
            for k,v in pairs(Config.JobSpot) do
                local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.pos[1], v.pos[2], v.pos[3], false)
                if distance < 10.0 then
                    sleep = false
                    if distance < 4.0 then
                        DrawText3Ds(v.pos[1], v.pos[2], v.pos[3], Lang['job_draw_text'])
                        if IsControlJustPressed(0, Config.KeyToStartJob) then
                            OpenNPCMenu()
                        end
                    end
                end
            end
            if sleep then Citizen.Wait(1000) end
        end
    end
end)

OpenNPCMenu = function()
    local playerPed = GetPlayerPed(-1)
    FreezeEntityPosition(playerPed, true)
    hejhejhejneger = false

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
        title    = 'Vælg et Job',
        align    = 'top-left',
        elements = {
            {label = 'Pengetransporter Røveri', value = 'stockadeRobbery'},
            {label = 'Biltyveri', value = 'carjack'},
            {label = 'Lastbil Røveri', value = 'lastbil'},
        }
    }, function (data, menu)
        local action = data.current.value
        if action == 'carjack' then
            StartCarJackRobbery()
        elseif action == 'stockadeRobbery' then
            StartStockadeRobbery()
        elseif action == 'lastbil' then
            StartTruckRobbery()
        end
        
        hasTask = false
        menu.close()
        ESX.UI.Menu.CloseAll()
        FreezeEntityPosition(playerPed, false)
        hejhejhejneger = true
    end, function (data, menu)
        hasTask = false
        menu.close()
        ESX.UI.Menu.CloseAll()
        FreezeEntityPosition(playerPed, false)
        hejhejhejneger = true
    end)
end

AddEventHandler('esx:onPlayerDeath', function(data)
    StopTheJob = true
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for i = 1, #peds, 1 do
            DeletePed(peds[i])
        end
    end
end)

RegisterNetEvent('drp_illegaljobs:addVest')
AddEventHandler('drp_illegaljobs:addVest', function()
    local time = 1200
    local dict = "clothingtie"

    inAnimation = true
    PlayToggleEmote(dict, "try_tie_negative_a", time)

    exports['progressBars']:startUI(time, 'Tager vest på')
    Citizen.Wait(time)
end)

RegisterNetEvent('drp_illegaljobs:removeVest')
AddEventHandler('drp_illegaljobs:removeVest', function()
    local time = 1200
    local dict = "clothingtie"

    inAnimation = true
    PlayToggleEmote(dict, "try_tie_negative_a", time)

    exports['progressBars']:startUI(time, 'Fjerner vest')
    Citizen.Wait(time)
end)