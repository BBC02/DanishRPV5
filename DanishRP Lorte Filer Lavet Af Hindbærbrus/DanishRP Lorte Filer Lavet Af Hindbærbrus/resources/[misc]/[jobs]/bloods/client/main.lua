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

--  function openBossMenu()

--    local elements = {
--    }

--    if PlayerData.job == 'denaro' and PlayerData.job.grade_name == 'boss' then
--      table.insert(elements, {label = 'Chef Mugligheder', value = 'boss_actions'})
--    end

--    ESX.UI.Menu.CloseAll()

--    ESX.UI.Menu.Open(
--      'default', GetCurrentResourceName(), 'denaro',
--      {
--        title    = _U('realtor'),
--        elements = elements
--      },
--      function(data, menu)
--        if data.current.value == 'boss_actions' then
--          TriggerEvent('esx_society:openBossMenu', 'denaro', function(data, menu)
--            menu.close()
--          end)
--        end

--      end,
--      function(data, menu)

--        menu.close()

--        CurrentAction     = 'denaro_menu'
--        CurrentActionMsg  = _U('press_to_access')
--        CurrentActionData = {}

--      end
--    )

--  end


Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
      if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then

        if CurrentAction == '123' then
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end


    end
		if IsControlJustReleased(0, 167) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'bloods' and ESX.PlayerData.job.grade_name == 'boss' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'bloods') then
      openbloods()
		end

  end
end)

function openbloods()
  ESX.UI.Menu.CloseAll()
  	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bloods', {
		title    = 'Bloods',
		align    = 'left',
		elements = {
      {label = 'Chef Handlinger', value = 'boss'},
	}}, function(data, menu)
    if data.current.value == 'boss' then 
      ESX.UI.Menu.CloseAll()
      TriggerEvent('esx_society:openBossMenu', 'bloods', function(data, menu)
				menu.close()
			end)
    elseif data.current.value == 'menu' then 
      ESX.UI.Menu.CloseAll()
      ExecuteCommand('zonemenu')
		end
	end, function(data, menu)
		menu.close()
	end)
end