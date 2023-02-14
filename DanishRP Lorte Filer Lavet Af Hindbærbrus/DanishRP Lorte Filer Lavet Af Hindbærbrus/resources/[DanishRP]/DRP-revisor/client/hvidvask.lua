local isWashing = false
local isInMarker, showPromp = nil, true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'revisor' then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)

            if GetDistanceBetweenCoords(coords, Config.BossMenu, false) <= Config.DrawDistance and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'underboss') then
                DrawMarker(22, Config.BossMenu,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                1.0, 1.0, 1.0,
                Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], Config.MarkerColor[4],
                false, true, 2, false, nil, nil, false)

                if GetDistanceBetweenCoords(coords, Config.BossMenu, true) <= 1.2 then
                    isInMarker = 'BossMenu'
                    if showPromp then ESX.ShowHelpNotification(_U('bossmenu_promp')) end
                    if IsControlJustReleased(0, Keys['E']) then
                        showPromp = false
                        TriggerEvent('esx_society:openBossMenu', 'revisor', function(data, menu)
                            menu.close()
                            showPromp = true
                        end)
                    end
                elseif isInMarker == 'BossMenu' then
                    isInMarker = nil
                    showPromp = true
                    ESX.UI.Menu.CloseAll()
                end
            end

            if GetDistanceBetweenCoords(coords, Config.Hvidvask.Loc, false) <= Config.DrawDistance then
                DrawMarker(Config.Hvidvask.Marker.type, Config.Hvidvask.Loc,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                Config.Hvidvask.Marker.scale,
                Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], Config.MarkerColor[4],
                Config.Hvidvask.Marker.bobUpAndDown, Config.Hvidvask.Marker.faceCamera, 2, Config.Hvidvask.Marker.rotate, nil, nil, false)

                if GetDistanceBetweenCoords(coords, Config.Hvidvask.Loc, true) <= Config.Hvidvask.Marker.scale.x then
                    isInMarker = 'HvidvaskMenu'
                    if showPromp then ESX.ShowHelpNotification(_U('hvidvaskmenu_promp')) end
                    if IsControlJustReleased(0, Keys['E']) then
                        showPromp = false
                        openHvidvaskMenu()
                    end
                elseif isInMarker == 'HvidvaskMenu' then
                    isInMarker = nil
                    showPromp = true
                    ESX.UI.Menu.CloseAll()
                end
            end
        else
            Citizen.Wait(500)
        end
    end
end)

openHvidvaskMenu = function()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'hvidvask_amount', {
        title = _U('hvidvaskmenu_amount')
    }, function(data, menu)
        if tonumber(data.value) then
            menu.close()
            local amount = tonumber(data.value)
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'hvidvask_procent', {
                title = _U('hvidvaskmenu_procent')
            }, function(data2, menu2)
                if tonumber(data2.value) then
                    menu2.close()
                    local procent = tonumber(data2.value) / 100
                    startHvidvask(amount, procent)
                else
                    exports['id_notify']:notify({
                        message = _U('not_number'),
                        type = 'error'
                    })
                end
            end, function(data2, menu2)
                menu2.close()
                menu.close()
                showPromp = true
            end)
        else
            exports['id_notify']:notify({
                message = _U('not_number'),
                type = 'error'
            })
        end
    end, function(data, menu)
        menu.close()
        showPromp = true
    end)
end

startHvidvask = function(amount, procent)
    ESX.TriggerServerCallback('id_job_revisor:hvidvask:hasBlackMoney', function(hasMoney) 
        if hasMoney then
            local playerPed = PlayerPedId()
            FreezeEntityPosition(playerPed, true)
            local time = amount / Config.Hvidvask.TimeAmount * 60
            exports['id_notify']:notify({
                title = 'Hvidvaskning',
                message = _U('washing_starting', ESX.Math.GroupDigits(amount), math.floor(time / 60)),
                type = 'custom',
                icon = 'bi bi-cash-stack'
            })
            TriggerEvent('cBeyerV1:byPassAFK', true)
            exports['progressBars']:startUI(time * 1000, _U('washing'))
            Citizen.Wait(time * 1000)
            TriggerEvent('cBeyerV1:byPassAFK', false)
            FreezeEntityPosition(playerPed, false)
            TriggerServerEvent('id_job_revisor:hvidvask:giveWashedMoney', amount, procent, serverEventCode)
        else
            exports['id_notify']:notify({
                message = _U('not_enough_money', ESX.Math.GroupDigits(amount)),
                type = 'error'
            })
        end  
    end, amount)
end