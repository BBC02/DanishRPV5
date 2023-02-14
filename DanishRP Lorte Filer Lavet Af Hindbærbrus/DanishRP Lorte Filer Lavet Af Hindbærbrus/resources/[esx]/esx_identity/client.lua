--==================================================================================
--======               ESX_IDENTITY BY ARKSEYONET @Ark                        ======
--======    YOU CAN FIND ME ON MY DISCORD @Ark - https://discord.gg/cGHHxPX   ======
--======    IF YOU ALTER THIS VERSION OF THE SCRIPT, PLEASE GIVE ME CREDIT    ======
--======     Special Thanks To Alphakush and CMD.Telhada For Help Testing     ======
--==================================================================================

--===============================================
--==                 VARIABLES                 ==
--===============================================
local guiEnabled = false
local myIdentity = {}
local myIdentifiers = {}
local hasIdentity = false

--===============================================
--==                 VARIABLES                 ==
--===============================================
function EnableGui(enable, enable2)

    SetNuiFocus(enable, enable2)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
	
end


--===============================================
--==           Show Registration               ==
--===============================================
RegisterNetEvent("esx_identity:showRegisterIdentity")
AddEventHandler("esx_identity:showRegisterIdentity", function()

  EnableGui(true, true)

  Citizen.Wait(5000)
  TriggerEvent('esx_identity:showRegisterIdentityExtra')
end)


RegisterNetEvent("esx_identity:showRegisterIdentityExtra")
AddEventHandler("esx_identity:showRegisterIdentityExtra", function()

  EnableGui(true, true)
  
end)

--===============================================
--==           Identity Check                  ==
--===============================================
RegisterNetEvent("esx_identity:identityCheck")
AddEventHandler("esx_identity:identityCheck", function(identityCheck)

  hasIdentity = identityCheck
  
end)

--===============================================
--==           Save Identifiers                ==
--===============================================
RegisterNetEvent("esx_identity:saveID")
AddEventHandler("esx_identity:saveID", function(data)

  myIdentifiers = data
  
end)

--===============================================
--==              Close GUI                    ==
--===============================================
RegisterNUICallback('escape', function(data, cb)

  if hasIdentity == true then
  
    EnableGui(false, false)
	
  else
  
     TriggerEvent("chatMessage", "^1[IDENTITET]", {255, 255, 0}, "Du skal lave din første karakter for at spille!")
	 
  end
  
end)

--===============================================
--==           Register Callback               ==
--===============================================
RegisterNUICallback('register', function(data, cb)

  myIdentity = data
  
  if myIdentity.firstname ~= '' and myIdentity.lastname ~= '' and myIdentity.sex ~= '' and myIdentity.sex ~= nil and myIdentity.dateofbirth ~= '' and myIdentity.height ~= '' then
  
    TriggerServerEvent('esx_identity:setIdentity', data, myIdentifiers)

    EnableGui(false, false)
	
    Wait (500)
	
	local sexValue = 0
    if myIdentity.sex == "Kvinde" then
      sexValue = 1
    end
	
	  exports["cynatic_clothing"]:OpenClothingMenu()
    TriggerEvent('skinchanger:loadSkin', {sex = sexValue}, OpenSaveableMenu)
  else
  
    TriggerEvent("chatMessage", "^1[IDENTITET]", {255, 255, 0}, "Udfyld venligst alle felterne.")
	
  end
  
end)

--===============================================
--==                 THREADING                 ==
--===============================================
Citizen.CreateThread(function()

    while true do
	
        if guiEnabled then

          DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
          DisableControlAction(0, 2, guiEnabled) -- LookUpDown
          DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride			
          DisableControlAction(0, 142, true) -- MeleeAttackAlternate
          DisableControlAction(0, 30,  true) -- MoveLeftRight
          DisableControlAction(0, 31,  true) -- MoveUpDown
          DisableControlAction(0, 21,  true) -- disable sprint
          DisableControlAction(0, 24,  true) -- disable attack
          DisableControlAction(0, 25,  true) -- disable aim
          DisableControlAction(0, 47,  true) -- disable weapon
          DisableControlAction(0, 58,  true) -- disable weapon
          DisableControlAction(0, 263, true) -- disable melee
          DisableControlAction(0, 264, true) -- disable melee
          DisableControlAction(0, 257, true) -- disable melee
          DisableControlAction(0, 140, true) -- disable melee
          DisableControlAction(0, 141, true) -- disable melee
          DisableControlAction(0, 143, true) -- disable melee
          DisableControlAction(0, 75,  true) -- disable exit vehicle
          DisableControlAction(27, 75, true) -- disable exit vehicle

          if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
		  
            SendNUIMessage({
              type = "click"
            })
			
            end
			
        end
		
        Citizen.Wait(0)
		
    end
	
end)

function openRegistry()

  TriggerEvent('esx_identity:showRegisterIdentity')
  
end
