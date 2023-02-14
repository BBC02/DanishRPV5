

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}


Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = ESX.GetPlayerData().job.name
        grade = ESX.GetPlayerData().job.grade
    end
)


RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(j)
        job = j.name
        grade = j.grade
        
    end
)
RegisterNetEvent('srp_jobs:openCompanyAdmin')
AddEventHandler('srp_jobs:openCompanyAdmin', function()
    openBossMenu(job, grade)
end)
function openBossMenu(j, l)
    ESX.TriggerServerCallback(
        "savannah:bm:getBossMenuData",
        function(grades, employees, fund, gradename)
            if Config.BossMenuU[gradename] ~= nil and job == j then
                SetNuiFocus(true, true)
                SendNUIMessage(
                    {
                        type = "openBoss",
                        job = {job = job, grade = grade},
                        employees = employees,
                        grades = grades,
                        fund = fund,
                        bossJob = j,
                        bossLabel = l,
                        perms = Config.BossMenuU[gradename]
                    }
                )
            else
                SendTextMessage(Config.Text["cant_access_bossmenu"])
            end
        end,
        j
    )
end


RegisterCommand("bossmenuen", function()
    openBossMenu(job)
    print(job .. " - " ..grade)
end)


Citizen.CreateThread(
    function()
        while #Config.BossMenuL > 0 do
            Citizen.Wait(0)
            local coords = GetEntityCoords(PlayerPedId())
            for _, v in ipairs(Config.BossMenuL) do
                local dist = #(coords - v.coords)

                if dist < 20 then
                    DrawMarker(
                        Config.MarkerSprite,
                        v.coords[1],
                        v.coords[2],
                        v.coords[3] - 0.95,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        Config.MarkerSize,
                        Config.MarkerSize,
                        1.0,
                        Config.MarkerColor[1],
                        Config.MarkerColor[2],
                        Config.MarkerColor[3],
                        100,
                        false,
                        true,
                        2,
                        true,
                        false,
                        false,
                        false
                    )
                end
                if dist < Config.MarkerSize then
                    DrawText3D(v.coords[1], v.coords[2], v.coords[3], Config.Text["bossmenu_hologram"])

                    if IsControlJustReleased(0, Keys["E"]) then
                        openMenu(v.job, v.label)
                    end
                end
            end
        end
    end
)


function openMenu(j, l)
    local elements = {
        {label = 'Administration', type = 'open'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'open', {
        title    = 'Virksomheds Menu',
        align    = 'left',
        elements = elements
    }, function(data, menu)
        if data.current.type == 'open' then
            openBossMenu(j, l)
            menu.close()
        end

    end, function(data, menu)
        menu.close()
    end)
end




RegisterNUICallback(
    "close",
    function(data)
        TriggerScreenblurFadeOut(1000)
        SetNuiFocus(false, false)
    end
)

RegisterNUICallback(
    "depositAccount",
    function(data)
        local job = data["job"]
        local amount = data["amount"]

        TriggerServerEvent("savannah:bm:deposit", job, amount)
    end
)

RegisterNUICallback(
    "withdrawAccount",
    function(data)
        local job = data["job"]
        local amount = data["amount"]

        TriggerServerEvent("savannah:bm:withdraw", job, amount)
    end
)

RegisterNUICallback(
    "hireEmployee",
    function(data)
        local id = data["id"]
        local job = data["job"]
        print(id)
        TriggerServerEvent("savannah:bm:hire", id, grade)
    end
    
)

RegisterNUICallback(
    "fireEmployee",
    function(data)
        local identifier = data["identifier"]
        local job = data["job"]

        TriggerServerEvent("savannah:bm:fire", identifier, job)
    end
)



RegisterNUICallback(
    "setrank",
    function(data)
        local identifier = data["identifier"]
        local job = data["job"]
        local rank = data["rank"]

        TriggerServerEvent("savannah:bm:setRank", identifier, job, rank)
    end
)

RegisterNUICallback(
    "removejob",
    function(data)
        TriggerServerEvent("savannah:bm:removeJob", data["job"], data["grade"])
    end
)

RegisterNUICallback(
    "addjob",
    function(data)
        TriggerServerEvent("savannah:bm:addJob", data["job"])
    end
)

RegisterNetEvent("savannah:bm:sendMessage")
AddEventHandler(
    "savannah:bm:sendMessage",
    function(msg)
        ESX.ShowNotification(msg)
        ExecuteCommand("bossmenuen")
    end
)



function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100

    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)

        SetTextDropshadow(1, 1, 1, 1, 255)

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

local menuIsShowed = false

function ShowJobListingMenu()
	menuIsShowed = true
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)
		local elements = {}

		for k,v in pairs(jobs) do
			table.insert(elements, {
				label = v.label,
				job   = k
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'joblisting', {
			title    = "Job center",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			TriggerServerEvent('esx_joblisting:setJob', data.current.job)
			ESX.ShowNotification("Tillykke med dit nye job!")
			menuIsShowed = false
			menu.close()
		end, function(data, menu)
			menuIsShowed = false
			menu.close()
		end)

	end)
end

AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Activate menu when player is inside marker, and draw markers
CreateThread(function()
	while true do
		local Sleep = 1500

		local coords = GetEntityCoords(PlayerPedId())
		isInMarker = false

		for i=1, #Config.Zones, 1 do
			local distance = #(coords - Config.Zones[i])

			if distance < Config.DrawDistance then
				Sleep = 0
				DrawMarker(Config.MarkerType, Config.Zones[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			else 
				if menuIsShowed then 
					ESX.UI.Menu.CloseAll()
					menuIsShowed = false
				end
			end

			if distance < (Config.ZoneSize.x / 2) then
				ESX.ShowHelpNotification("Tilgå jobcenter")
				if IsControlJustReleased(0, 38) and not menuIsShowed then
					ESX.UI.Menu.CloseAll()
					ShowJobListingMenu()
				end
			end
		end
	Wait(Sleep)
	end
end)
Config.DrawDistance = 10.0
Config.ZoneSize     = {x = 2.7, y = 2.7, z = 0.5}
Config.MarkerColor  = {r = 100, g = 200, b = 104}
Config.MarkerType   = 27

Config.Locale       = 'en'

Config.Zones = {
	vector3(-265.08, -964.1, 30.3)
}

Config.Blip = {
	Sprite = 407,
	Display = 4,
	Scale = 0.9,
	Colour = 27,
	ShortRange = true
}
-- Create blips
CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i])

		SetBlipSprite (blip, Config.Blip.Sprite)
		SetBlipDisplay(blip, Config.Blip.Display)
		SetBlipScale  (blip, Config.Blip.Scale)
		SetBlipColour (blip, Config.Blip.Colour)
		SetBlipAsShortRange(blip, Config.Blip.ShortRange)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Tilgå jobcenter")
		EndTextCommandSetBlipName(blip)
	end
end)
