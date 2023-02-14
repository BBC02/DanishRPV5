OpenMenu = function(...)
  if Config.UsingESX then
    if Config.UsingESXMenu then
      menuType = "ESX"
    elseif Config.UsingNativeUI then
      menuType = "NativeUI"
    end
  elseif Config.UsingNativeUI then
    menuType = "NativeUI"
  end

  if menuType == "NativeUI" then
    NativeUIHandler(...)
  elseif menuType == "ESX" then
    ESXMenuHandler(...)
  end
end

UnlockHouse = function(house)
  if InsideHouse then
    InsideHouse.Unlocked = true 
  else
    house.Unlocked = true
  end
  TriggerServerEvent("Allhousing:UnlockDoor",house)
  ShowNotification("House unlocked.")
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

LockHouse = function(house)
  if InsideHouse then
    InsideHouse.Unlocked = false 
  else
    house.Unlocked = false
  end
  TriggerServerEvent("Allhousing:LockDoor",house)
  ShowNotification("House locked.")
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

GetVehiclesAtHouse = function(house)
  local data = Callback("Allhousing:GetVehicles",house)
  return data
end

GetVehicleLabel = function(model)
  return (GetLabelText(GetDisplayNameFromVehicleModel(model)))
end

SpawnVehicle = function(pos,model,props)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  RequestModel(model)
  while not HasModelLoaded(model) do Wait(0); end

  local veh = CreateVehicle(model,pos.x,pos.y,pos.z,true,true)
  while not DoesEntityExist(veh) do Wait(0); end

  SetEntityAsMissionEntity(veh,true,true)
  SetEntityHeading(veh,pos.w)
  SetVehicleOnGroundProperly(veh)
    
  while not NetworkHasControlOfEntity(veh) do NetworkRequestControlOfEntity(veh); Wait(0); end
  while not NetworkGetEntityIsNetworked(veh) do NetworkRegisterEntityAsNetworked(veh); Wait(0); end

  local netId = NetworkGetNetworkIdFromEntity(veh)
  TriggerServerEvent('VehicleSecurity:VehicleSpawned',netId,props.plate)
  Wait(500)
  
  SetVehicleProperties(veh, props)
  SetVehRadioStation(veh, "OFF")
  SetVehicleEngineOn(veh,true)
  TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)

  SetModelAsNoLongerNeeded(model)
end

local ox_inventory = exports.ox_inventory

OpenInventory = function(d)
  TriggerServerEvent('ox:loadStashes', d.Id)
  exports.ox_inventory:openInventory('stash', d.Id..'lager')

  exports['mythic_notify']:DoHudText('success', 'Åbner inventar - Hus '..d.Id, 5000)
  print(GetPlayerIdentifier(_source))
end

SetWardrobe = function(d)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  ShowNotification("Press [G] when in position to set the wardrobe location.")
  while true do
    if IsControlJustPressed(0,58) then
      local pos = d.Entry.xyz - GetEntityCoords(GetPlayerPed(-1))
      InsideHouse.Wardrobe = pos + Config.SpawnOffset
      TriggerServerEvent("Allhousing:SetWardrobe",d,InsideHouse.Wardrobe)
      ShowNotification("Wardrobe position set.")
      return
    end
    Wait(0)
  end
end

SetInventory = function(d)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  ShowNotification("Press [G] when in position to set the inventory location.")
  while true do
    if IsControlJustPressed(0,58) then
      local pos = d.Entry.xyz - GetEntityCoords(GetPlayerPed(-1))
      InsideHouse.InventoryLocation = pos + Config.SpawnOffset
      TriggerServerEvent("Allhousing:SetInventory",d,InsideHouse.InventoryLocation)
      --exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight)
      ShowNotification("Inventory position set.")
      return
    end
    Wait(0)
  end
end

SetOutfit = function(index,label)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  if Config.UsingESX then
    local clothes = Callback("Allhousing:GetOutfit",index)
    TriggerEvent('skinchanger:getSkin', function(skin)
      TriggerEvent('skinchanger:loadClothes', skin, clothes)
      TriggerEvent('esx_skin:setLastSkin', skin)

      TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
      end)
    end)
  else
    -- NON-ESX USERS FILL IN HERE.
  end
end

OpenFurniture = function(d)
  ShowNotification("Press [F] to open and close the furniture UI.")
  TriggerEvent("Allhousing:OpenFurni")    

  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

GiveKeys = function(d,serverId)
  TriggerServerEvent("Allhousing:GiveKeys",d,serverId)
  ShowNotification("Giving keys to player.")
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

TakeKeys = function(d,data)
  TriggerServerEvent("Allhousing:TakeKeys",d,data)
  ShowNotification("Taking keys from player.")

  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

InviteInside = function(d,serverId)
  TriggerServerEvent("Allhousing:InviteInside",d,serverId)
end

BuyHouse = function(d)
  local price = d.Price
  if CanPlayerAfford(price) then
    ShowNotification("You brought the house for $"..d.Price)
    d.Owner = GetPlayerIdentifier()
    d.Owned = true

    if Config.UsingNativeUI and _Pool then
      _Pool:CloseAllMenus()
    elseif Config.UsingESX and Config.UsingESXMenu then      
      ESX.UI.Menu.CloseAll()
    end

    TriggerServerEvent("Allhousing:PurchaseHouse",d)
  else
    ShowNotification("You can't afford this house")
  end
  FreezeEntityPosition(GetPlayerPed(-1),false)
end

RaidHouse = function(d)
  EnterHouse(d,not Config.InventoryRaiding)
end

KnockOnDoor = function(d)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  GoToDoor(d.Entry)
  FaceCoordinate(d.Entry)
  TriggerServerEvent("Allhousing:KnockOnDoor",d.Entry)
  local plyPed = GetPlayerPed(-1)
  while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do RequestAnimDict("timetable@jimmy@doorknock@"); Wait(0); end
  TaskPlayAnim(plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 8.0, -1, 4, 0, 0, 0, 0 )     
  Wait(0)

  while IsEntityPlayingAnim(plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 3) do Citizen.Wait(0); end 

  RemoveAnimDict("timetable@jimmy@door@knock@")
end

BreakInHouse = function(d)  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  GoToDoor(d.Entry)
  FaceCoordinate(d.Entry)

  if Config.LockpickRequired then
    local hasItem = CheckForLockpick()
    if not hasItem then
      ShowNotification("You don't have a lockpick.")
      return
    end
  end

  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(GetPlayerPed(-1))
  local zoneName = GetNameOfZone(plyPos.x,plyPos.y,plyPos.z)
  while not HasAnimDictLoaded("mini@safe_cracking") do RequestAnimDict("mini@safe_cracking"); Citizen.Wait(0); end
  TaskPlayAnim(plyPed, "mini@safe_cracking", "idle_base", 1.0, 1.0, -1, 1, 0, 0, 0, 0 ) 
  Wait(2000)
  if Config.UsingLockpickV1 then
    TriggerEvent("lockpicking:StartMinigame",4,function(didWin)
      if didWin then
        EnterHouse(d,true)
      else
        ClearPedTasksImmediately(plyPed)
        if Config.LockpickBreakOnFail then
          TriggerServerEvent("Allhousing:BreakLockpick")
        end
        ShowNotification("You failed to crack the lock.")
        FreezeEntityPosition(plyPed,false)
        for k,v in pairs(Config.PoliceJobs) do
          TriggerServerEvent("Allhousing:NotifyJobs",k,"Someone is attempting to rob a house at "..zoneName,d.Entry)
          if Config.UsingInteractSound then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20.0, 'security-alarm', 1.0)
          end
        end
      end
    end)
  elseif Config.UsingLockpickV2 then
    exports["lockpick"]:Lockpick(function(didWin)
      if didWin then
        EnterHouse(d,true)
        ShowNotification("You successfully cracked the lock.")
      else
        ClearPedTasksImmediately(plyPed)
        if Config.LockpickBreakOnFail then
          TriggerServerEvent("Allhousing:BreakLockpick")
        end
        ShowNotification("You failed to crack the lock.")
        FreezeEntityPosition(plyPed,false)
        for k,v in pairs(Config.PoliceJobs) do
          TriggerServerEvent("Allhousing:NotifyJobs",k,"Someone is attempting to rob a house at "..zoneName,d.Entry)
          if Config.UsingInteractSound then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20.0, 'security-alarm', 1.0)
          end
        end
      end
    end)
  else
    if Config.UsingProgressBars then
      exports["progressBars"]:startUI(Config.LockpickTime * 1000,"Lockpicking Door")
    end
    Wait(Config.LockpickTime * 1000)
    if math.random(100) < Config.LockpickFailChance then
      if Config.LockpickBreakOnFail then
        TriggerServerEvent("Allhousing:BreakLockpick")
      end
      for k,v in pairs(Config.PoliceJobs) do
        TriggerServerEvent("Allhousing:NotifyJobs",k,"Someone is attempting to rob a house at "..zoneName,d.Entry)
        if Config.UsingInteractSound then
          TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20.0, 'security-alarm', 1.0)
        end
      end
      ClearPedTasksImmediately(plyPed)
      ShowNotification("You failed to crack the lock.")
      FreezeEntityPosition(plyPed,false)
    else
      EnterHouse(d,true)
    end
  end
  RemoveAnimDict("mini@safe_cracking")
end

LeaveHouse = function(d)
  LeavingHouse = true
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  DoScreenFadeOut(500)
  TriggerEvent("Allhousing:Leave")
  Wait(1000)

  local plyPed = GetPlayerPed(-1)

  SetEntityCoordsNoOffset(plyPed, InsideHouse.Entry.x,InsideHouse.Entry.y,InsideHouse.Entry.z)
  SetEntityHeading(plyPed, InsideHouse.Entry.w - 180.0)

  Wait(500)
  DoScreenFadeIn(500)

  SetEntityAsMissionEntity(InsideHouse.Object,true,true)
  DeleteObject(InsideHouse.Object)
  DeleteEntity(InsideHouse.Object)

  if InsideHouse and InsideHouse.Extras then
    for k,v in pairs(InsideHouse.Extras) do
      SetEntityAsMissionEntity(v,true,true)
      DeleteObject(v)
    end
  end

  InsideHouse = false
  SetWeatherAndTime(true)
  LeavingHouse = false
end

SpawnHouse = function(d)
  local model = ShellModels[d.Shell]
  local hash  = GetHashKey(model)

  local start = GetGameTimer()
  while not HasModelLoaded(hash) and GetGameTimer() - start < 10000 do RequestModel(hash); Wait(0); end
  if not HasModelLoaded(hash) then
    ShowNotification(string.format("Invalid house shell: %s, please report to your server owner.",model))
    return false,false
  end

  local shell = CreateObject(hash, d.Entry.x + Config.SpawnOffset.x,d.Entry.y + Config.SpawnOffset.y,d.Entry.z - 30.0 + Config.SpawnOffset.z,false,false)
  FreezeEntityPosition(shell,true)
  while not DoesEntityExist(shell) do Wait(0); end

  SetEntityAsMissionEntity(shell,true,true)
  SetModelAsNoLongerNeeded(hash)

  local extras = {}
  if ShellExtras[d.Shell] then
    for objHash,data in pairs(ShellExtras[d.Shell]) do
      RequestModel(objHash)
      while not HasModelLoaded(objHash) do Wait(0); end

      local pos = d.Entry.xyz + data.offset + Config.SpawnOffset
      local rot = data.rotation
      local obj = CreateObject(objHash, pos.x,pos.y,pos.z - 30.0, false,false)
      FreezeEntityPosition(obj,true)
      while not DoesEntityExist(obj) do Wait(0); end
      if rot then
        SetEntityRotation(obj,rot.x,rot.y,rot.z,2)
      end
      SetEntityAsMissionEntity(obj,true,true)
      SetModelAsNoLongerNeeded(objHash)
      table.insert(extras,obj)
    end
  end

  local pos = vector3(d.Entry.x,d.Entry.y,d.Entry.z)
  for k,v in pairs(d.Furniture) do
    local objHash = GetHashKey(v.model)
    RequestModel(objHash)
    while not HasModelLoaded(objHash) do Wait(0); end

    local obj = CreateObject(objHash, pos.x + v.pos.x, pos.y + v.pos.y, pos.z + v.pos.z, false,false,false)
    FreezeEntityPosition(obj, true)
    SetEntityCoordsNoOffset(obj, pos.x + v.pos.x, pos.y + v.pos.y, pos.z + v.pos.z)
    SetEntityRotation(obj, v.rot.x, v.rot.y, v.rot.z, 2)

    SetModelAsNoLongerNeeded(objHash)

    table.insert(extras,obj)
  end

  return shell,extras
end

TeleportInside = function(d,v)  
  local exitOffset = vector4(ShellOffsets[d.Shell]["exit"].x - Config.SpawnOffset.x,ShellOffsets[d.Shell]["exit"].y - Config.SpawnOffset.y,ShellOffsets[d.Shell]["exit"].z - Config.SpawnOffset.z,ShellOffsets[d.Shell]["exit"].w)
  if type(exitOffset) ~= "vector4" or exitOffset.w == nil then
    ShowNotification("Offset is messed up for house: "..d.Id..", please report to your server owner.")
    return
  end

  local plyPed = GetPlayerPed(-1)
  FreezeEntityPosition(plyPed,true)

  DoScreenFadeOut(1000)
  while not IsScreenFadedOut() do Wait(0); end  

  ClearPedTasksImmediately(plyPed)

  local shell,extras = SpawnHouse(d)
  if shell and extras then
    SetEntityCoordsNoOffset(plyPed, d.Entry.x - exitOffset.x,d.Entry.y - exitOffset.y,d.Entry.z - exitOffset.z)
    SetEntityHeading(plyPed, exitOffset.w)

    local start_time = GetGameTimer()
    while (not HasCollisionLoadedAroundEntity(plyPed) and GetGameTimer() - start_time < 2000) do Wait(0); end
    FreezeEntityPosition(plyPed,false)

    DoScreenFadeIn(500)

    InsideHouse = d
    InsideHouse.Extras = extras
    InsideHouse.Object = shell
    InsideHouse.Visiting = v  
  else
    FreezeEntityPosition(plyPed,false)
    DoScreenFadeIn(500)
  end
end

ViewHouse = function(d)
  EnterHouse(d,true)
  
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

EnterHouse = function(d,visiting)
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then    
    ESX.UI.Menu.CloseAll()
  end

  TriggerEvent("Allhousing:Enter",d)
  TeleportInside(d,visiting)
  SetWeatherAndTime(false)
end

UpgradeHouse = function(d,data)
  if CanPlayerAfford(ShellPrices[data.shell]) then
    TriggerServerEvent("Allhousing:UpgradeHouse",d,data.shell)
    ShowNotification("Upgrade house to: "..tostring(data.shell))
    d.Shell = data.shell
    if InsideHouse then
      local _visiting = InsideHouse.Visiting
      LeaveHouse(d)
      EnterHouse(d,_visiting)
    end
  else
    ShowNotification("You can't afford this upgrade")
  end

  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end
end

SellHouse = function(d)
  if Config.UsingNativeUI and _Pool then
    _Pool:CloseAllMenus()
  elseif Config.UsingESX and Config.UsingESXMenu then
    ESX.UI.Menu.CloseAll()
  end

  exports["input"]:Open("Set Sale Price",(Config.UsingESX and Config.UsingESXMenu and "ESX" or "Native"), function(data)
    local price = (tonumber(data) and tonumber(data) > 0 and tonumber(data) or 0)
    local floored = math.max(1,math.floor(tonumber(price)))

    Wait(100)

    if Config.UsingESX and Config.UsingESXMenu then
      ESXConfirmSaleMenu(d,floored)
    elseif Config.UsingNativeUI then
      NativeConfirmSaleMenu(d,floored)
    end
  end)
end

MenuThread = function()
  while true do      
    if _Pool and _Pool:IsAnyMenuOpen() then
      _Pool:ControlDisablingEnabled(false)
      _Pool:MouseControlsEnabled(false)
      _Pool:ProcessMenus()
    end
    Wait(0)
  end
end

Citizen.CreateThread(MenuThread)