Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

ValidateJob = function(job)
    while ESX.PlayerData.job == nil do
        Citizen.Wait(10)
    end

    if ESX.PlayerData.job.name == job then
        return true
    end
    return false
end

IsPlayerBoss = function(job)
    if ValidateJob(job) then
        if ESX.PlayerData.job.grade_name == "boss" then
            return true
        end
    end
    return false
end

local isWorking = false
local WhitewashAmount = 5000

local revisors = {
    {
        name = "revisor",
        number = "revisor",
        worklocation = vector3(-1556.09, -574.71, 108.83),
        bossLocation = vector3(-1571.0929, -575.0731, 108.5229), -- , 34.2745
        base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAA3QAAAN0BcFOiBwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAARoSURBVFiF7Zd/aFVlGMc/z3vPvfvldNPmnEbUyoUUQUVumJqDCaXYsrnb8ge2Zvnjj/4JzJxwJxJaUUQgDpoRFCZHmjpDxGg0HFjSHzENHa7wV/4cabft3uu955y3P+7uZXc7pzsHsX964IX3vO/zfL/f53nP+573iNaaiTQ1oeyAMe7INinFporTD1aSZ+/jw0tnxgMzvgq0yuvY/A4c4uL0dzlfeppND38+HigZ/Q6I4sKigGdE149zicU6AR8A385NIcEjtzbyxINfeMZeXBQnFHKGD42qwMm24G6tB6Lg0UoKu9Lkw00LJAr2YEnUremERPf3/7R7ZFiGgAPBoO/a5aL6qxeLrwC9ri1yd8Azw6hYXnG9t/xX+vr99cFgMEN8xkuoKqYucRymnfy+vH3FjtY6V5Jj8h7CVtc5iZ1iXeezblP7g7XfAC/PkfgS4Eiac7iTFr1uqLvs6+Y3Sl1JcviEnBxn9LgFUyJNbiHNK2tLBZYBiE5zZApob15fBrJ06NHvF2Otq4BVq0p44XlF2QxQCpSGskF4KwFbHp/tFhJIsFaDH0BgaXNdXdkoAY7QCPgQDgKI0q7ZYMtiJhfC4hpY2QAfObA1Dx7IgYTV6BaihaYh8oMafAEjkfZLChARkCYA7fNtBrq1pqJ924aFo+GkJt1VCgwZxmTNG+m9/ZXahUAF0A1sBtBamkRE0gIObNtQjVAO0lUf2t2nRfYmlWeuF1QboJ9zrQyAFZvOhercEemvS2av94bMw30CXUB5S/2y6rQAIUkkotsA8nyOCYQ1suLQ9saiNFh0ViVQ6CnAcYR8/2vp7JcvLwK9AggTwyRJ1pYhbMerL71dMm3SLjSJG/0D72jtJACmFResDPiNBdFofH9/ONqywzzcS2xNCE1LBumNc5kicgt/YEZnde38Zx69Lz+vJd8faEjY1ombA+F9AKKUf2bhlPcB//WBv7cYtq13XrsRNkieCZ+mcPr/HEx1GwzkCNCLpoZsZsWfAjBEP307Mthwm0GABSALALSj+eOvO0PFYKdC656soMrqgeAkoGoMAiYzWFOqHcmKq6FHgXRk8ev71ck/SySwiDF9vjUMssmY9dBZgb5/95UOBYFdgJdaS9CNpmnaiGQvfzrKftE0TVuLNAKWh1ePcSe2S4VMMx69y3w0rUAEQECDPiVKV4bMju6kWD12AXZ8DkD7iZ+7RUklok8Bqe9+BKTVJm++eeZMPOM+EAwGfY85sdnkWldDXx0Npycia8oQrrqSjdwFKSsofpKS47+kHpdUVU3OV9ZMdX/5edM07dS4y4XExWKrV6Ply3sSkFvUyozvNmaDHtuVzLmH9U+ZnVg8FjfPChz9+M0K29JTAebVxTuUosTN7+a5yx7IyunuLF4PYPi4tHbngeNubp7bStt8ICK1ACfbczwzOPub32tKQfgzgPzcnOtAmYfTxNr/AiZcgPfZ7rAH4Vg2gKJJBS63pkzzKZ/nb9vYDqL/0CZ8Cf4BrBmoU1KcpzcAAAAASUVORK5CYII='
    }
}

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'revisor',
		number     = 'revisor',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAA3QAAAN0BcFOiBwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAARoSURBVFiF7Zd/aFVlGMc/z3vPvfvldNPmnEbUyoUUQUVumJqDCaXYsrnb8ge2Zvnjj/4JzJxwJxJaUUQgDpoRFCZHmjpDxGg0HFjSHzENHa7wV/4cabft3uu955y3P+7uZXc7pzsHsX964IX3vO/zfL/f53nP+573iNaaiTQ1oeyAMe7INinFporTD1aSZ+/jw0tnxgMzvgq0yuvY/A4c4uL0dzlfeppND38+HigZ/Q6I4sKigGdE149zicU6AR8A385NIcEjtzbyxINfeMZeXBQnFHKGD42qwMm24G6tB6Lg0UoKu9Lkw00LJAr2YEnUremERPf3/7R7ZFiGgAPBoO/a5aL6qxeLrwC9ri1yd8Azw6hYXnG9t/xX+vr99cFgMEN8xkuoKqYucRymnfy+vH3FjtY6V5Jj8h7CVtc5iZ1iXeezblP7g7XfAC/PkfgS4Eiac7iTFr1uqLvs6+Y3Sl1JcviEnBxn9LgFUyJNbiHNK2tLBZYBiE5zZApob15fBrJ06NHvF2Otq4BVq0p44XlF2QxQCpSGskF4KwFbHp/tFhJIsFaDH0BgaXNdXdkoAY7QCPgQDgKI0q7ZYMtiJhfC4hpY2QAfObA1Dx7IgYTV6BaihaYh8oMafAEjkfZLChARkCYA7fNtBrq1pqJ924aFo+GkJt1VCgwZxmTNG+m9/ZXahUAF0A1sBtBamkRE0gIObNtQjVAO0lUf2t2nRfYmlWeuF1QboJ9zrQyAFZvOhercEemvS2av94bMw30CXUB5S/2y6rQAIUkkotsA8nyOCYQ1suLQ9saiNFh0ViVQ6CnAcYR8/2vp7JcvLwK9AggTwyRJ1pYhbMerL71dMm3SLjSJG/0D72jtJACmFResDPiNBdFofH9/ONqywzzcS2xNCE1LBumNc5kicgt/YEZnde38Zx69Lz+vJd8faEjY1ombA+F9AKKUf2bhlPcB//WBv7cYtq13XrsRNkieCZ+mcPr/HEx1GwzkCNCLpoZsZsWfAjBEP307Mthwm0GABSALALSj+eOvO0PFYKdC656soMrqgeAkoGoMAiYzWFOqHcmKq6FHgXRk8ev71ck/SySwiDF9vjUMssmY9dBZgb5/95UOBYFdgJdaS9CNpmnaiGQvfzrKftE0TVuLNAKWh1ePcSe2S4VMMx69y3w0rUAEQECDPiVKV4bMju6kWD12AXZ8DkD7iZ+7RUklok8Bqe9+BKTVJm++eeZMPOM+EAwGfY85sdnkWldDXx0Npycia8oQrrqSjdwFKSsofpKS47+kHpdUVU3OV9ZMdX/5edM07dS4y4XExWKrV6Ply3sSkFvUyozvNmaDHtuVzLmH9U+ZnVg8FjfPChz9+M0K29JTAebVxTuUosTN7+a5yx7IyunuLF4PYPi4tHbngeNubp7bStt8ICK1ACfbczwzOPub32tKQfgzgPzcnOtAmYfTxNr/AiZcgPfZ7rAH4Vg2gKJJBS63pkzzKZ/nb9vYDqL/0CZ8Cf4BrBmoU1KcpzcAAAAASUVORK5CYII='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-1575.5737, -568.6392, 108.5230)
  
    SetBlipSprite (blip, 467)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 1.1)
    SetBlipColour (blip, 59)
    SetBlipAsShortRange(blip, true)
  
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Revisor')
    EndTextCommandSetBlipName(blip)
  
  end)

Citizen.CreateThread(function()
    local society = 'revisor'
    while true do
        Wait(500)
        for k,v in pairs(revisors) do
            while IsPlayerBoss(v.number) do
                Citizen.Wait(2)
                local letSleep = true
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
        
                local WorkDistance = #(playerCoords - v.bossLocation)

                if WorkDistance < 2.0 then
                    letSleep = false

                    local x, y, z = table.unpack(v.bossLocation)
                    DrawText3D(x,y,z, 'Tryk ~r~[E]~w~ for at åbne ~g~Boss Menuen~s~')
                    if IsControlJustReleased(0, Keys['E']) then
                        TriggerEvent('esx_society:openBossMenu', society, function (data, menu)
                            menu.close()
                        end, {wash = false}) -- set custom options, e.g disable washing
                    end
                end
            end
        end
    end
end)

exports.qtarget:Player({
	options = {
		{
			icon = "fa-solid fa-file-lines",
			label = "Giv faktura",
			job = {['revisor'] = 0, ['lsc'] = 0, ['mecano'] = 0},
			action = function(entity)
				BillingSelectPlayer(NetworkGetPlayerIndexFromPed(entity))
			end
		}
	},
	distance = 3
})

BillingSelectPlayer = function(closestPlayer)
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "fine_amount",  {
        title = 'Bøde Størrelse'
    }, function(data, menu)
        local amount = tonumber(data.value)
            
        if amount == nil then
            exports['mythic_notify']:DoHudText('error', 'Ugyldigt antal.', 5000)
            return
        end

        if amount ~= nil then
            exports['mythic_notify']:DoHudText('success', "Bøden er nu blevet givet til: " .. GetPlayerServerId(closestPlayer), 5000)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'revisor' then
                TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(closestPlayer), "society_revisor", "Revisor Regning: " .. ESX.Math.GroupDigits(data.value) .. " DKK", tonumber(data.value))
            end
            elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsc' then
				TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(closestPlayer), "society_lsc", "LSC Faktura: " .. ESX.Math.GroupDigits(data.value) .. " DKK", tonumber(data.value))
			elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'mecano' then
				TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(closestPlayer), "society_mecano", "Auto Exotic Faktura: " .. ESX.Math.GroupDigits(data.value) .. " DKK", tonumber(data.value))
            end

            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(revisors) do
            while ValidateJob(v.number) do
                Citizen.Wait(2)
                local letSleep = true
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
            
                local WorkDistance = #(playerCoords - v.worklocation)

                if WorkDistance < 2.0 then
                    letSleep = false

                    local x, y, z = table.unpack(v.worklocation)
                    DrawText3D(x,y,z, 'Tryk ~r~[E]~w~ for at behandle de ~g~sorte penge~s~')
                    if IsControlJustReleased(0, Keys['E']) then
                        StartWhiteWash()
                    end
                end
            end
            if letSleep then
            Citizen.Wait(500)
            end
        end
    end
end)

StartWhiteWash = function()
    ESX.TriggerServerCallback('zrp_jobs:revisor:getBlackMoneyAmount', function(money)
        if money >= WhitewashAmount then
            isWorking = true

            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "whitewash_amount", {
                title = "Sæt Procent sats (5-30%)"
            }, function(data, menu)
                if tonumber(data.value) then
                    local procent = tonumber(data.value)
                    if procent >= 5 and procent <= 30 then
                        local tid = (money / 50000) * 5000
                        menu.close()

                        FreezeEntityPosition(PlayerPedId(), true)
                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true)
                       
                        local Estimeret = round((tid * 1.666666666666777777)/100000)
                        if Estimeret >= 1 then
                            exports['mythic_notify']:DoCustomHudText('success', 'Du er begyndt at hvidvaske ' .. ESX.Math.GroupDigits(money) .. ' DKK' .. ' Estimeret Tid: '.. Estimeret .. ' minutter', tid)
                            exports['progressBars']:startUI(tid, 'Hvidvasker pengene')

                            Citizen.Wait(tid)


                            TriggerServerEvent('zrp_jobs:revisor:startWhiteWash', procent)
                            TriggerServerEvent('addSocietymoney', 'society_revisor', round(procent*money/100))
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                        else
                            exports['mythic_notify']:DoCustomHudText('success', 'Du er begyndt at hvidvaske ' .. ESX.Math.GroupDigits(money) .. ' DKK' .. ' Estimeret Tid:'.. " 0 minutter", tid)
                            exports['progressBars']:startUI(tid, 'Hvidvasker pengene')

                            Citizen.Wait(tid)

                            TriggerServerEvent('zrp_jobs:revisor:startWhiteWash', procent)
                            TriggerServerEvent('addSocietymoney', 'society_revisor', round(procent*money/100))

                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                        end

                        else
                            isWorking = false
                            exports['mythic_notify']:DoHudText('error', 'Ugyldig Procentsats.', 5000)
                        end
                    else
                        isWorking = false
                        exports['mythic_notify']:DoHudText('error', 'Du skal indtaste et tal.', 5000)
                    end

                    menu.close()
                end, function(data, menu)
                    isWorking = false
                    menu.close()
                end)
            else
                exports['mythic_notify']:DoHudText('error', 'Du har ikke nok penge at hvidvaske.', 5000)
            end
        end)
    end

RegisterNetEvent('zrp_jobs:revisor:stopWash')
AddEventHandler('zrp_jobs:revisor:stopWash', function()
    TriggerEvent('esx_animation:EmoteCancel')

    exports['progressBars']:stopUI()
    isWorking = false
end)

DrawText3D = function(x,y,z, text)
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
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 90)
    end
end