if Config.CreateHouses then
  RegisterCommand("createhouse", function(...)
    local plyPed = GetPlayerPed(-1)
    local plyJob = GetPlayerJobName()
    if not Config.CreationJobs[plyJob] then return; end
    local jobRank = GetPlayerJobRank()
    if Config.CreationJobs[plyJob].minRank then
      if not jobRank then
        return
      elseif Config.CreationJobs[plyJob].minRank > jobRank then
        return
      end
    end
    exports['mythic_notify']:PersistentHudText("start", PersistentHudTextID, 'inform', "Sæt Indgang - Tryk G for at placere - Tryk H for at annullere.", 5000)
    while not IsControlJustPressed(0,47) do Wait(0); end
    FreezeEntityPosition(GetPlayerPed(-1),true)
    StartUpdateSpinner("Sætter Indgang")
    Citizen.Wait(2500)
    RemoveLoadingPrompt()
    FreezeEntityPosition(GetPlayerPed(-1),false)
    while IsControlPressed(0,47) do Wait(0); end
    exports['mythic_notify']:PersistentHudText("end", PersistentHudTextID)

    local entryPos = GetEntityCoords(plyPed)
    local entryHead = GetEntityHeading(plyPed)
    local entryLocation = vector4(entryPos.x,entryPos.y,entryPos.z,entryHead)
    exports['mythic_notify']:PersistentHudText("start", PersistentHudTextID, 'inform', "Sæt garage - Tryk G for at placere - H for at anullere.", 5000)
    while not IsControlJustPressed(0,47) and not IsControlJustPressed(0,49) do Wait(0); end
    FreezeEntityPosition(GetPlayerPed(-1),true)
    StartUpdateSpinner("Sætter Garage")
    Citizen.Wait(3000)
    RemoveLoadingPrompt()
    FreezeEntityPosition(GetPlayerPed(-1),false)
    while IsControlPressed(0,47) or IsControlPressed(0,49) do Wait(0); end
    exports['mythic_notify']:PersistentHudText("end", PersistentHudTextID)

    local garageLocation = false
    if IsControlJustReleased(0,47) then
      local garagePos = GetEntityCoords(plyPed)
      local garageHead = GetEntityHeading(plyPed)
      garageLocation = vector4(garagePos.x,garagePos.y,garagePos.z,garageHead)
    end

    local salePrice = false
    ShowNotification("Indskriv Salgsprisen")
    exports["input"]:Open("Indskriv Salgsprisen",(Config.UsingESX and Config.UsingESXMenu and "ESX" or "Native"),function(data)
      local price = (tonumber(data) and tonumber(data) > 0 and tonumber(data) or 0)
      salePrice = math.max(1,price)
    end)
    while not salePrice do Wait(0); end

    ShowNotification("Select default house shell.")
    local homeShell = false
    if Config.UsingESX and Config.UsingESXMenu then
      local elements = {}
      for k,v in pairs(ShellModels) do
        table.insert(elements,{label = k})
      end
      ESX.UI.Menu.Open('default', GetCurrentResourceName(), "create_house_shell",{
          title    = "Ejendoms Shells Menu",
          align    = 'bottom-right',
          elements = elements,
        }, 
        function(submitData,submitMenu)
          homeShell = submitData.current.label
          submitMenu.close()
        end,
        function(data,menu)
          menu.close()
          FreezeEntityPosition(GetPlayerPed(-1),false)
        end
      )
    else
      local shell = CreateNativeUIMenu("Set Default Shell","")
      for key,price in pairs(ShellModels) do
        local _item = NativeUI.CreateItem(key,"")
        _item.Activated = function(...) 
          homeShell = key
          _Pool:CloseAllMenus()
        end
        shell:AddItem(_item)
      end    
      shell:RefreshIndex()
      shell:Visible(true)  
    end
    while not homeShell do Wait(0); end
    ShowNotification("Vælg et shell der er muligt at bruge.")
    local shells = {}
    if Config.UsingESX and Config.UsingESXMenu then
      local elements = {}
      for k,v in pairs(ShellModels) do
        table.insert(elements,{label = k})
      end
      table.insert(elements,{label = "Done"})
      ESX.UI.Menu.Open('default', GetCurrentResourceName(), "create_house_shell",{
          title    = "Ejendoms Shells Menu",
          align    = 'bottom-right',
          elements = elements,
        }, 
        function(submitData,submitMenu)
          if submitData.current.label == "Done" then
            ShowNotification("House creation complete.")
            TriggerServerEvent("Allhousing:CreateHouse",{Price = salePrice,Entry = entryLocation,Garage = garageLocation,Shell = homeShell,Shells = shells})
            submitMenu.close()
          else
            shells[submitData.current.label] = (not shells[submitData.current.label])
            ShowNotification(submitData.current.label..": "..(shells[submitData.current.label] == true and "~g~ENABLED~s~" or "~r~DISABLED~s~"))
          end
        end,
        function(data,menu)
          menu.close()
          FreezeEntityPosition(GetPlayerPed(-1),false)
        end
      )
    else
      local shell = CreateNativeUIMenu("Available Shells","")
      for k,v in pairs(ShellModels) do
        shells[k] = false
        local _item = NativeUI.CreateCheckboxItem(k,false,"")
        _item.CheckboxEvent = function(a,b,checked) 
          shells[k] = checked
        end
        shell:AddItem(_item)  
      end 
      local _item = NativeUI.CreateItem("Done","")
      _item.Activated = function(...) 
        exports['mythic_notify']:DoHudText('success', 'Hus oprettet', 5000)
        _Pool:CloseAllMenus()
        TriggerServerEvent("Allhousing:CreateHouse",{Price = salePrice,Entry = entryLocation,Garage = garageLocation,Shell = homeShell,Shells = shells})
      end
      shell:AddItem(_item)
      shell:RefreshIndex()
      shell:Visible(true)     
    end
  end)
end

RegisterNetEvent('savanha_housing:client:abortAction')
AddEventHandler('savanha_housing:client:abortAction', function()
    ESX.UI.Menu.CloseAll()

    RemoveLoadingPrompt()
    isUpdating = false
    isInMenu = false
end)