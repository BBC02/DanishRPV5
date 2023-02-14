local Keys = {
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

local GUI                     = {}
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

ESX                           = nil
GUI.Time                      = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'realestateagent',
		number     = 'realestate',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAA3QAAAN0BcFOiBwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAARoSURBVFiF7Zd/aFVlGMc/z3vPvfvldNPmnEbUyoUUQUVumJqDCaXYsrnb8ge2Zvnjj/4JzJxwJxJaUUQgDpoRFCZHmjpDxGg0HFjSHzENHa7wV/4cabft3uu955y3P+7uZXc7pzsHsX964IX3vO/zfL/f53nP+573iNaaiTQ1oeyAMe7INinFporTD1aSZ+/jw0tnxgMzvgq0yuvY/A4c4uL0dzlfeppND38+HigZ/Q6I4sKigGdE149zicU6AR8A385NIcEjtzbyxINfeMZeXBQnFHKGD42qwMm24G6tB6Lg0UoKu9Lkw00LJAr2YEnUremERPf3/7R7ZFiGgAPBoO/a5aL6qxeLrwC9ri1yd8Azw6hYXnG9t/xX+vr99cFgMEN8xkuoKqYucRymnfy+vH3FjtY6V5Jj8h7CVtc5iZ1iXeezblP7g7XfAC/PkfgS4Eiac7iTFr1uqLvs6+Y3Sl1JcviEnBxn9LgFUyJNbiHNK2tLBZYBiE5zZApob15fBrJ06NHvF2Otq4BVq0p44XlF2QxQCpSGskF4KwFbHp/tFhJIsFaDH0BgaXNdXdkoAY7QCPgQDgKI0q7ZYMtiJhfC4hpY2QAfObA1Dx7IgYTV6BaihaYh8oMafAEjkfZLChARkCYA7fNtBrq1pqJ924aFo+GkJt1VCgwZxmTNG+m9/ZXahUAF0A1sBtBamkRE0gIObNtQjVAO0lUf2t2nRfYmlWeuF1QboJ9zrQyAFZvOhercEemvS2av94bMw30CXUB5S/2y6rQAIUkkotsA8nyOCYQ1suLQ9saiNFh0ViVQ6CnAcYR8/2vp7JcvLwK9AggTwyRJ1pYhbMerL71dMm3SLjSJG/0D72jtJACmFResDPiNBdFofH9/ONqywzzcS2xNCE1LBumNc5kicgt/YEZnde38Zx69Lz+vJd8faEjY1ombA+F9AKKUf2bhlPcB//WBv7cYtq13XrsRNkieCZ+mcPr/HEx1GwzkCNCLpoZsZsWfAjBEP307Mthwm0GABSALALSj+eOvO0PFYKdC656soMrqgeAkoGoMAiYzWFOqHcmKq6FHgXRk8ev71ck/SySwiDF9vjUMssmY9dBZgb5/95UOBYFdgJdaS9CNpmnaiGQvfzrKftE0TVuLNAKWh1ePcSe2S4VMMx69y3w0rUAEQECDPiVKV4bMju6kWD12AXZ8DkD7iZ+7RUklok8Bqe9+BKTVJm++eeZMPOM+EAwGfY85sdnkWldDXx0Npycia8oQrrqSjdwFKSsofpKS47+kHpdUVU3OV9ZMdX/5edM07dS4y4XExWKrV6Ply3sSkFvUyozvNmaDHtuVzLmH9U+ZnVg8FjfPChz9+M0K29JTAebVxTuUosTN7+a5yx7IyunuLF4PYPi4tHbngeNubp7bStt8ICK1ACfbczwzOPub32tKQfgzgPzcnOtAmYfTxNr/AiZcgPfZ7rAH4Vg2gKJJBS63pkzzKZ/nb9vYDqL/0CZ8Cf4BrBmoU1KcpzcAAAAASUVORK5CYII='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

function OpenRealestateAgentMenu()

  local elements = {
  }

  if PlayerData.job == 'realestateagent' and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = 'Chef Mugligheder', value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'realestateagent',
    {
      title    = _U('realtor'),
      elements = elements
    },
    function(data, menu)
      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data, menu)
          menu.close()
        end)
      end

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'realestateagent_menu'
      --CurrentActionMsg  = _U('press_to_access')
      CurrentActionData = {}

    end
  )

end

function OpenPropertyMenu()

  TriggerEvent('esx_property:getProperties', function(properties)

    local elements = {
      head = {_U('property'), 'Actions'},
      rows = {}
    }

    for i=1, #properties, 1 do
      table.insert(elements.rows, {
        data = properties[i],
        cols = {
          properties[i].label,
          _U('property_actions')
        }
      })
    end

    ESX.UI.Menu.Open(
      'list', GetCurrentResourceName(), 'properties',
      elements,
      function(data, menu)

        if data.value == 'sell' then

          menu.close()

          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'sell_property_amount',
            {
              title = _U('amount')
            },
            function(data2, menu2)

              local amount = tonumber(data2.value)

              if amount == nil then
                ESX.ShowNotification(_U('invalid_amount'))
              else
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestPlayer == -1 or closestDistance > 3.0 then
                  ESX.ShowNotification(_U('no_play_near'))
                else
                  TriggerServerEvent('esx_realestateagentjob:sell', GetPlayerServerId(closestPlayer), data.data.name, amount)
                  menu2.close()
                end

                OpenPropertyMenu()

              end

            end,
            function(data2, menu2)
              menu2.close()
            end
          )

        end

        if data.value == 'rent' then

          menu.close()

          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'rent_property_amount',
            {
              title = _U('amount')
            },
            function(data2, menu2)

              local amount = tonumber(data2.value)

              if amount == nil then
                ESX.ShowNotification(_U('invalid_amount'))
              else
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                if closestPlayer == -1 or closestDistance > 3.0 then
                  ESX.ShowNotification(_U('no_play_near'))
                else
                  TriggerServerEvent('esx_realestateagentjob:rent', GetPlayerServerId(closestPlayer), data.data.name, amount)
                  menu2.close()
                end

                OpenPropertyMenu()

              end

            end,
            function(data2, menu2)
              menu2.close()
            end
          )

        end

        if data.value == 'gps' then

          TriggerEvent('esx_property:getProperty', data.data.name, function(property)

            if property.isSingle then
              SetNewWaypoint(property.entering.x,  property.entering.y)
            else
              TriggerEvent('esx_property:getGateway', property, function(gateway)
                SetNewWaypoint(gateway.entering.x,  gateway.entering.y)
              end)
            end

          end)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenCustomersMenu()

  ESX.TriggerServerCallback('esx_realestateagentjob:getCustomers', function(customers)

    local elements = {
      head = {'Client', _U('property'), 'Type', 'Actions'},
      rows = {}
    }

    for i=1, #customers, 1 do
      table.insert(elements.rows, {
        data = customers[i],
        cols = {
          customers[i].name,
          customers[i].propertyName,
          (customers[i].propertyRented and _U('rent') or _U('sell')),
          _U('contract')
        }
      })
    end

    ESX.UI.Menu.Open(
      'list', GetCurrentResourceName(), 'customers',
      elements,
      function(data, menu)

        if data.value == 'revoke' then
          TriggerServerEvent('esx_realestateagentjob:revoke', data.data.propertyName, data.data.propertyOwner)
          OpenCustomersMenu()
        end

        if data.value == 'gps' then

          TriggerEvent('esx_property:getProperty', data.data.propertyName, function(property)

            if property.isSingle then
              SetNewWaypoint(property.entering.x,  property.entering.y)
            else
              TriggerEvent('esx_property:getGateway', property, function(gateway)
                SetNewWaypoint(gateway.entering.x,  gateway.entering.y)
              end)
            end

          end)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

  PlayerData = xPlayer

  if PlayerData.job.name == 'realestateagent' then
    Config.Zones.OfficeActions.Type = 27
  else
    Config.Zones.OfficeActions.Type = -1
  end

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)

  PlayerData.job = job

  if PlayerData.job.name == 'realestateagent' then
    Config.Zones.OfficeActions.Type = 1
  else
    Config.Zones.OfficeActions.Type = -1
  end

end)

-- AddEventHandler('esx_realestateagentjob:hasEnteredMarker', function(zone)

--   if zone == 'OfficeEnter' then
--     local playerPed = GetPlayerPed(-1)
--     SetEntityCoords(playerPed,  Config.Zones.OfficeInside.Pos.x,  Config.Zones.OfficeInside.Pos.y,  Config.Zones.OfficeInside.Pos.z)
--   end

--   if zone == 'OfficeExit' then
--     local playerPed = GetPlayerPed(-1)
--     SetEntityCoords(playerPed,  Config.Zones.OfficeOutside.Pos.x,  Config.Zones.OfficeOutside.Pos.y,  Config.Zones.OfficeOutside.Pos.z)
--   end

--   if zone == 'OfficeActions' and PlayerData.job ~= nil and PlayerData.job.name == 'realestateagent' then
--     CurrentAction     = 'realestateagent_menu'
--     CurrentActionMsg  = _U('press_to_access')
--     CurrentActionData = {}
--   end

-- end)

AddEventHandler('esx_realestateagentjob:hasExitedMarker', function(zone)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

-- Create Blips
Citizen.CreateThread(function()

  local blip = AddBlipForCoord(-69.2615, -802.5549, 44.2273)

  SetBlipSprite (blip, 374)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.9)
  SetBlipColour (blip, 32)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('M&D Ejendomsmægler')
  EndTextCommandSetBlipName(blip)

end)

-- Display markers
-- Citizen.CreateThread(function()
--   while true do

--     Wait(0)

--     local coords = GetEntityCoords(GetPlayerPed(-1))

--     for k,v in pairs(Config.Zones) do
--       if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
--         DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
--       end
--     end

--   end
-- end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do

    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_realestateagentjob:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_realestateagentjob:hasExitedMarker', LastZone)
    end

  end
end)

exports['qtarget']:AddBoxZone("md", vector3(-126.44, -641.84, 168.82), 5, 1, {
  name="M&D Ejendomsmægler",
  heading=0,
  minZ=165.82,
  maxZ=171.82
  }, {
    options = {
      {
        event = "grisen:openmdmenu",
        icon = "fas fa-folder",
        label = "Åben ejendomsmægler chef muligheder",
        job = "realestateagent",
      },
    },
distance = 2.0
})

RegisterNetEvent('grisen:openmdmenu', function()
  if ESX.PlayerData.job and ESX.PlayerData.job.name == 'realestateagent' and ESX.PlayerData.job.grade_name == 'boss' then
    TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data, menu)
      menu.close()
    end)
    else
      ESX.ShowNotification('Du har ikke adgang til dette!')
  end
end)

-- Key controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
      if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then

        if CurrentAction == 'realestateagent_menu' then
          OpenRealestateAgentMenu()
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end


    end
		if IsControlJustReleased(0, 167) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'realestateagent' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'realestate_actions2') then
      OpenMobileRealestateAgentMenu()
		end

  end
end)

function OpenMobileRealestateAgentMenu()
  ESX.UI.Menu.CloseAll()
  	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'realestate_actions2', {
		title    = 'Ejendomsmægler',
		align    = 'left',
		elements = {
			--{label = 'Slå huset op', value = 'houselookup'},
      {label = 'Lav hus/lager', value = 'makenew'},  
	}}, function(data, menu)
		if data.current.value == 'houselookup' then 
			LookupHouseOwner()
    end
    if data.current.value == 'makenew' then 
      ESX.UI.Menu.CloseAll()
			ExecuteCommand("housing:createHouse")
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- Load IPLS
Citizen.CreateThread(function()
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl('ex_dt1_02_office_02c')
end)

function LookupHouseOwner()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_house', {
		title = ('Indtast hus id'),
	}, function(data, menu)
		local length = string.len(data.value)
		if not data.value or length < 2 or length > 28 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_policejob:getOwnerInformation', function(data)
				menu.close()
				-- local elements = {
				-- 	{label = _U('name', data.name)},
				-- 	{label = _U('phone', data.phone)},
        --   {label = "-Salg's Info-"},
        --   {label = _U('price', data.price)},
				-- 	-- {label = _U('job', ('%s - %s'):format(data.job, data.grade))}
				-- }
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
          title    = 'Ejendomsmælger',
          align    = 'top-left',
          elements = {
            {label = _U('name', data.name)},
            {label = _U('phone', data.phone)},
            {label = "-Salg's Info-"},
            {label = _U('price', data.price)},
            {label = "Sæt gps til huset", value = 'gps'},
        }}, function(data2, menu2)
            if data2.current.value == 'gps' then
              SetNewWaypoint(data.gpsx, data.gpsy)
            end
          end, function(data2, menu2)
            menu2.close()
        end)
				-- ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				-- 	title    = ('Ejer'),
				-- 	align    = 'top-left',
				-- 	elements = elements
				-- }, nil, function(data2, menu2)
				-- 	menu2.close()
				-- end)
			end, data.value)
		end
	end, function(data, menu)
		menu.close()
              menu2.close()
	end)
end