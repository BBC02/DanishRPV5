local color = {r = 255, g = 255, b = 255, alpha = 255} -- Color of the text 
local font = 0 -- Font of the text
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec
local nbrDisplaying = 1

RegisterCommand('me', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('3dme:shareDisplay', text, 'me')
end)

-- RegisterCommand('do', function(source, args, raw)
--     local text = string.sub(raw, 4)
--     TriggerServerEvent('3dme:shareDisplay', text, 'do')
-- end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source, Type)
    local player = GetPlayerFromServerId(source)
    local offset = 0.25 + (nbrDisplaying*0.14)

    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Display(GetPlayerFromServerId(source), text, Type)
    end
end)

function Display(mePlayer, text, Type)
    local displaying = true
    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        -- print(nbrDisplaying)
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = GetDistanceBetweenCoords(coordsMe['x'], coordsMe['y'], coordsMe['z'], coords['x'], coords['y'], coords['z'], true)
            if dist < 30 then
                --DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
                local offset = 0.25 + (nbrDisplaying*0.14)
                local x, y, z = table.unpack(GetEntityCoords(ped))
				DrawText3Ds(coordsMe['x'],coordsMe['y'],coordsMe['z']+offset, text, Type, 3.0, 7)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

DrawText3Ds = function(x,y,z, text, Type)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)

        if Type == 'do' then
            SetTextColour(255, 184, 77, 255)
        else
            SetTextColour(255, 255, 255, 215)
        end

        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 90)
    end
end
