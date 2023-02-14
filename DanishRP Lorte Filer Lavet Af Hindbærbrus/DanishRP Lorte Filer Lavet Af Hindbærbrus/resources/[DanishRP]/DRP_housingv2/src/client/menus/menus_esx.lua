ESXMenuHandler = function(d,t,st)
  if t == "Entry" then
    if st == "Owner" then
      MenuOpen = true
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXEntryOwnerMenu(d)
    elseif st == "Owned" then
      MenuOpen = true
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXEntryOwnedMenu(d)
    elseif st == "Empty" then
      MenuOpen = true
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXEntryEmptyMenu(d)
    end
  elseif t == "Garage" then
    if st == "Owner" then
      MenuOpen = true
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXGarageOwnerMenu(d)
    elseif st == "Owned" then
      MenuOpen = true
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXGarageOwnedMenu(d)
    end
  elseif t == "Exit" then
    if st == "Owner" then
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXExitOwnerMenu(d)
    elseif st == "Owned" then
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXExitOwnedMenu(d)
    elseif st == "Empty" then
      FreezeEntityPosition(GetPlayerPed(-1),true)
      ESXExitEmptyMenu(d)
    end
  elseif t == "Wardrobe" then
    if st == "Owner" or st == "Owned" then
      FreezeEntityPosition(GetPlayerPed(-1),false)
      ESXWardrobeMenu(d)
    end
  elseif t == "Inventory" then
    FreezeEntityPosition(GetPlayerPed(-1),false)
    Inventory(d)
    
  end
end

Inventory = function(d)
  local ox_inventory = exports.ox_inventory
  if ox_inventory:openInventory('stash', "Hus".. d.Id) == false then
    TriggerServerEvent('ox:loadStashes', d)
    ox_inventory:openInventory('stash', "Hus".. d.Id)
  end
end

ESXWardrobeMenu = function(d)
  exports.srp_clothing:OpenClothingMenu('', true)
end


ESXOpenInviteMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(d.Entry,10.0)
  local c = 0
  for _,player in pairs(players) do
    if player ~= PlayerId() then
      table.insert(elements,{label = GetPlayerName(player).." [ID:"..GetPlayerServerId(player).."]",value = GetPlayerServerId(player),name = GetPlayerName(player)})
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_invite_menu",{
      title    = "Invitere indenfor",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      submitMenu.close()
      InviteInside(d,submitData.current.value)
      ShowNotification("You invited "..submitData.current.name.." inside.")
    end,
    function(data, menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXOpenKeysMenu = function(d)
  local elements = {
    [1] = {label = "Giv Nøgler",value = "Give"},
    [2] = {label = "Fratag Nøgler",value = "Take"}
  }
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_keys_menu",{
      title    = "Hus nøgler",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if submitData.current.value == "Give" then
        ESXGiveKeysMenu(d)
      elseif submitData.current.value == "Take" then
        ESXTakeKeysMenu(d)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXGiveKeysMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(GetEntityCoords(GetPlayerPed(-1)),10.0)
  local c = 0
  for _,player in pairs(players) do
    if player ~= PlayerId() then
      table.insert(elements,{label = GetPlayerName(player).." [ID:"..player.."]",value = GetPlayerServerId(player)})
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_givekeys_menu",{
      title    = "Give Keys",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      GiveKeys(d,submitData.current.value)
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXTakeKeysMenu = function(d)
  local elements = {}
  local players = GetNearbyPlayers(d.Entry,10.0)
  local c = 0
  for _,player in pairs(d.HouseKeys) do
    table.insert(elements,{label = player.name,value = player})
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_takekeys_menu",{
      title    = "Take Keys",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      TakeKeys(d,submitData.current.value)
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXExitOwnerMenu = function(d)
  local elements = {}
  if Config.UseHouseInventory then
    if Config.AllowHouseSales then
      elements = {
        [1] = {label = "Invitere indenfor",value = "Invite"},
        [2] = {label = "Hus nøgler",value = "Keys"},
        [3] = {label = "Upgrade Shell",value = "Upgrade"},
        [4] = {label = "Sell House",value = "Sell"},
        [5] = {label = "Furni UI",value = "Furni"},
        [6] = {label = "Sæt Garderobe",value = "Wardrobe"},
        [7] = {label = "Sæt Inventar",value = "Inventory"},
        [8] = {label = (d.Unlocked and "Lock Door" or "Unlock Door"),value = (d.Unlocked and "Lock" or "Unlock")},
        [9] = {label = "Forlad huset",value = "Leave"},
      }
    else
      elements = {
        [1] = {label = "Bolig (ID: ".. d.Id ..")"},
        [2] = {label = "",value = ""},
        [3] = {label = "---- Bolig Menu ----",value = ""},
        [4] = {label = "Gå ud af huset",value = "Leave"},
        [5] = {label = "Inviter Indenfor",value = "Invite"},
        [6] = {label = "Sæt Klædeskab",value = "Wardrobe"},
        [7] = {label = "Sæt Inventar",value = "Inventory"},
        [8] = {label = (d.Unlocked and "Lås huset" or "Lås huset op"),value = (d.Unlocked and "Lock" or "Unlock")},
        --[3] = {label = "Upgrade Shell",value = "Upgrade"},
        [9] = {label = "",value = ""},
        [10] = {label = "Administrer Nøgler",value = "Keys"},
        [11] = {label = "Administrer Møbler",value = "Furni"},
      }
    end
  else
    if Config.AllowHouseSales then    
      elements = {
        [1] = {label = "Invitere indenfor",value = "Invite"},
        [2] = {label = "Hus nøgler",value = "Keys"},
        [3] = {label = "Upgrade Shell",value = "Upgrade"},
        [4] = {label = "Sell House",value = "Sell"},
        [5] = {label = "Furni UI",value = "Furni"},
        [6] = {label = "Sæt Garderobe",value = "Wardrobe"},
        [7] = {label = "Unlock Door",value = "Unlock"},
        [8] = {label = "Forlad huset",value = "Leave"},
      }
    else
      elements = {
        [1] = {label = "Invitere indenfor",value = "Invite"},
        [2] = {label = "Hus nøgler",value = "Keys"},
        [3] = {label = "Upgrade Shell",value = "Upgrade"},
        [4] = {label = "Furni UI",value = "Furni"},
        [5] = {label = "Sæt Garderobe",value = "Wardrobe"},
        [6] = {label = "Unlock Door",value = "Unlock"},
        [7] = {label = "Forlad huset",value = "Leave"},
      }
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_owner_menu",{
      title    = "Hus Menu",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if      (submitData.current.value == "Invite")    then
        ESXOpenInviteMenu(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Keys")      then
        ESXOpenKeysMenu(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      --elseif  (submitData.current.value == "Upgrade")   then        
        --ESXUpgradeMenu(d,true)
      elseif  (submitData.current.value == "Sell")      then
        SellHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Furni")     then
        FreezeEntityPosition(GetPlayerPed(-1),false)
        OpenFurniture(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Wardrobe")  then
        FreezeEntityPosition(GetPlayerPed(-1),false)
        SetWardrobe(d)
      elseif  (submitData.current.value == "Inventory") then
        FreezeEntityPosition(GetPlayerPed(-1),false)
        SetInventory(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Leave")     then
        LeaveHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Unlock")    then
        UnlockHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Lock")      then
        LockHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXExitOwnedMenu = function(d)
  local elements = {}
  local identifier = GetPlayerIdentifier()
  for k,v in pairs(d.HouseKeys) do
    if v.identifier == identifier then
      table.insert(elements,{label = "Bolig (ID: ".. d.Id ..")",value = ""})
      table.insert(elements,{label = "",value = ""})
      table.insert(elements,{label = "---- Bolig Menu ----",value = ""})
      table.insert(elements,{label = "Gå ud af huset",value = "Leave"})
      table.insert(elements,{label = "Inviter Indenfor",value = "Invite"})
      table.insert(elements,{label = "",value = ""})
      table.insert(elements,{label = "Administrer Møbler",value = "Furni"})
      break
    end
  end
  --table.insert(elements,{label = "Forlad huset",value = "Leave"})

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_owned_menu",{
      title    = "Ejendoms Menu",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if      (submitData.current.value == "Invite")    then
        ESXOpenInviteMenu(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Furni")     then
        OpenFurniture(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Lock")      then
        LockHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Unlock")    then
        UnlockHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      elseif  (submitData.current.value == "Leave")     then
        LeaveHouse(d)
        FreezeEntityPosition(GetPlayerPed(-1),false)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXExitEmptyMenu = function(d)
  local elements = {[1] = {label = "Gå ud af huset",value = "Leave"}}

  if d.Owned then
    local certifiedPolice = false
    local job = GetPlayerJobName()
    if Config.PoliceJobs[job] then
      if GetPlayerJobRank() >= Config.PoliceJobs[job].minRank then
        certifiedPolice = true
      end
    end

    if Config.PoliceCanRaid and certifiedPolice then
      if d.Unlocked then
        table.insert(elements,{label = "Lock House",value = "Lock"})
      else
        table.insert(elements,{label = "Unlock House",value = "Unlock"})
      end
    end
  end

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "exit_empty_menu",{
      title    = "Ejendoms Menu",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if submitData.current.value == "Leave" then
        LeaveHouse(d)
      elseif submitData.current.value == "Lock" then
        LockHouse(d)
      elseif submitData.current.value == "Unlock" then
        UnlockHouse(d)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXUpgradeMenu = function(d,owner)
  local elements = {}
  local c = 0
  local dataTable = {}
  local sortedTable = {}
  for k,v in pairs(d.Shells) do
    local price = ShellPrices[k]
    if price then
      dataTable[price.."_"..k] = {
        available = v,
        price = price,
        shell = k,
      }
      table.insert(sortedTable,price.."_"..k)
    end
  end
  table.sort(sortedTable)

  for key,price in pairs(sortedTable) do
    local data = dataTable[price]
    if data.available and d.Shell ~= data.shell then
      elements[#elements+1] = {label = data.shell.." [$"..data.price.."]", data = data}
      c = c + 1
    end    
  end

  if c == 0 then
    ShowNotification("No upgrades available")
    return
  end

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "owner_upgrade_menu",{
      title    = "Upgrade House",
      align    = 'left',
      elements = elements,
    }, 
    (owner and function(submitData,submitMenu)
      UpgradeHouse(d,submitData.current.data)
    end or nil),
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

DoOpenESXGarage = function(d)
  TriggerEvent('gris:garage')
  print('1')
  FreezeEntityPosition(GetPlayerPed(-1),false)
end

ESXGarageOwnerMenu = function(d)
  TriggerEvent('gris:garage')
  print('2')
  FreezeEntityPosition(GetPlayerPed(-1),false)
end

ESXGarageOwnedMenu = function(d)
  local plyPed = GetPlayerPed(-1)  

  local myId = GetPlayerIdentifier()
  for k,v in pairs(d.HouseKeys) do
    if v.identifier == myId then
      TriggerEvent('gris:garage')
      FreezeEntityPosition(GetPlayerPed(-1),false)
      return
    end
  end

  if not Config.GarageTheft then 
    FreezeEntityPosition(GetPlayerPed(-1),false)
    return
  end

  if Config.LockpickRequired then
    local hasItem = CheckForLockpick()
    if not hasItem then
      ShowNotification("You don't have a lockpick.")
      FreezeEntityPosition(GetPlayerPed(-1),false)
      return
    end
  end

  while not HasAnimDictLoaded("mini@safe_cracking") do RequestAnimDict("mini@safe_cracking"); Citizen.Wait(0); end
  TaskPlayAnim(plyPed, "mini@safe_cracking", "idle_base", 1.0, 1.0, -1, 1, 0, 0, 0, 0 ) 
  Wait(2000)

  if Config.UsingLockpickV1 then
    TriggerEvent("lockpicking:StartMinigame",4,function(didWin)
      if didWin then
        ClearPedTasksImmediately(plyPed)
        DoOpenESXGarage(d)
      else
        ClearPedTasksImmediately(plyPed)
        TriggerServerEvent("Allhousing:BreakLockpick")
      end
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end)
  elseif Config.UsingLockpickV2 then
    exports["lockpick"]:Lockpick(function(didWin)
      if didWin then
        ClearPedTasksImmediately(plyPed)
        DoOpenESXGarage(d)
        ShowNotification("You successfully cracked the lock.")
      else
        ClearPedTasksImmediately(plyPed)
        TriggerServerEvent("Allhousing:BreakLockpick")
        ShowNotification("You failed to crack the lock.")
      end
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end)
  else
    if Config.UsingProgressBars then
      exports["progressBars"]:startUI(Config.LockpickTime * 1000,"Lockpicking Door")
    end
    Wait(Config.LockpickTime * 1000)
    if math.random(100) < Config.LockpickFailChance then
      local plyPos = GetEntityCoords(GetPlayerPed(-1))
      local zoneName = GetNameOfZone(plyPos.x,plyPos.y,plyPos.z)
      if Config.LockpickBreakOnFail then
        TriggerServerEvent("Allhousing:BreakLockpick")
      end
      ShowNotification("You failed to crack the lock.")
      for k,v in pairs(Config.PoliceJobs) do
        TriggerServerEvent("Allhousing:NotifyJobs",k,"Someone is attempting to break into a garage at "..zoneName)
      end
      ClearPedTasksImmediately(plyPed)
    else
      ShowNotification("You successfully cracked the lock.")
      ClearPedTasksImmediately(plyPed)
      DoOpenESXGarage(d)
    end
    FreezeEntityPosition(GetPlayerPed(-1),false)
  end
end

ESXEntryOwnerMenu = function(d)
  local elements
  if Config.AllowHouseSales then
    elements = {
      [1] = {label = "Bolig (ID: ".. d.Id ..")"},
      [2] = {label = ""},
      [3] = {label = "---- Bolig Menu ----"},
      [4] = {label = "Gå ind i huset"},
      --[2] = {label = "Upgrade"},
      [5] = {label = (d.Unlocked and "Lock" or "Unlock")},
      --[4] = {label = "Sell"},
    }
  else
    elements = {
      [1] = {label = "Bolig (ID: ".. d.Id ..")"},
      [2] = {label = ""},
      [3] = {label = "---- Bolig Menu ----"},
      [4] = {label = "Gå ind i huset"},
      --[2] = {label = "Upgrade"},
      [5] = {label = (d.Unlocked and "Lås huset op" or "Lås huset")},
      [6] = {label = "Administrer Nøgler",value = "Keys"},
    }
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "entry_owner_menu",{
      title    = "Ejendoms Menu",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if (submitData.current.label == "Gå ind i huset") then
        EnterHouse(d)
      elseif (submitData.current.label == "Upgrade") then
        ESXUpgradeMenu(d,true)
      elseif (submitData.current.value == "Keys") then
        ESXOpenKeysMenu(d)
      elseif (submitData.current.label == "Sell") then  
        SellHouse(d)   
      elseif (submitData.current.label == "Lås huset") then
        LockHouse(d)
      elseif (submitData.current.label == "Lås huset op") then
        UnlockHouse(d)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end,
    function(...)
    end,
    function(...)
      MenuOpen = false
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXConfirmSaleMenu = function(d,floored)
  local elements = {
    [1] = {label = "Bekræft", value = "yes"},
    [2] = {label = "Anullere", value = "no"}
  }
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_verify_sell",{
      title    = "Huset er sat til salg for "..tostring(floored).. " DKK",
      align    = 'left',
      elements = elements,
    }, 
    function(data,menu)
      if (data.current.value == "yes") then
        ShowNotification("Sæger huset får "..tostring(floored).. " DKK")
        d.Owner = ""
        d.Owned = false

        if InsideHouse then LeaveHouse(d); end
        TriggerServerEvent("Allhousing:SellHouse",d,floored)
      end
      ESX.UI.Menu.CloseAll()
    end
  )
end

ESXEntryOwnedMenu = function(d)
  local hasKeys = false
  local identifier = GetPlayerIdentifier()
  for k,v in pairs(d.HouseKeys) do
    if v.identifier == identifier then
      hasKeys = true
      break
    end
  end

  local certifiedPolice = false
  local job = GetPlayerJobName()
  if Config.PoliceJobs[job] then
    if GetPlayerJobRank() >= Config.PoliceJobs[job].minRank then
      certifiedPolice = true
    end
  end

  local ele2 = {label = (Config.PoliceCanRaid and certifiedPolice and "Raid" or "Break In")}
  if hasKeys then ele2 = nil; end
  if not certifiedPolice and not Config.HouseTheft then ele2 = nil; end

  local elements = {
    --[1] = {label = (hasKeys and "Enter" or "Knock")},
    [1] = {label = "Bolig (ID: ".. d.Id ..")"},
      [2] = {label = ""},
      [3] = {label = "---- Bolig Menu ----"},
      [4] = {label = (hasKeys and "Gå ind i huset" or "Bank på døren")},
  }

  if ele2 then
    table.insert(elements,ele2)
  end

  if d.Unlocked and not hasKeys then
    table.insert(elements,{
      [1] = {label = "Bolig (ID: ".. d.Id ..")"},
      [2] = {label = ""},
      [3] = {label = "---- Bolig Menu ----"},
      [4] = {label = "Gå ind i huset"},
    })
  end

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "entry_owner_menu",{
      title    = "Ejendoms Menu",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if (submitData.current.label == "Gå ind i huset") then
        EnterHouse(d,(not hasKeys and true or false))
      --elseif (submitData.current.label == "Knock") then
        --KnockOnDoor(d)
      elseif (submitData.current.label == "Raid") then  
        RaidHouse(d)
      --elseif (submitData.current.label == "Break In") then
        --BreakInHouse(d)
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end,
    function(...)
    end,
    function(...)
      MenuOpen = false
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end

ESXEntryEmptyMenu = function(d)
  local elements = {
    [1] = {label = "Bolig (ID: ".. d.Id .. ")"},
    [2] = {label = ""},
    [3] = {label = "Køb ["..d.Price.." DKK]", value = "Buy"},
    --[4] = {label = "View", value = "View"},
    --[3] = {label = "Upgrades", value = "Upgrades"},
  }

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), "entry_empty_menu",{
      title    = "Empty House",
      align    = 'left',
      elements = elements,
    }, 
    function(submitData,submitMenu)
      if (submitData.current.value == "Buy") then
        BuyHouse(d)
      elseif (submitData.current.value == "View") then
        ViewHouse(d)
      elseif (submitData.current.value == "Upgrades") then  
        ESXUpgradeMenu(d,false)      
      end
    end,
    function(data,menu)
      menu.close()
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end,
    function(...)
    end,
    function(...)
      MenuOpen = false
      FreezeEntityPosition(GetPlayerPed(-1),false)
    end
  )
end