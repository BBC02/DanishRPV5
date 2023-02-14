Init = function()
  local startTime = GetGameTimer()
  GetFramework()
  PlayerData = GetPlayerData()
  Wait(1000)

  StartData = Callback("Allhousing:GetHouseData")
  Houses = StartData.Houses
  KashIdentifier = StartData.Identifier
  RefreshBlips()
  Update()
end

Update = function()
  while true do
    local do_render = false
    if not InsideHouse then
      do_render = RenderExterior()
    else
      do_render = RenderInterior()
    end
    local wait_time = 0
    if not do_render and Config.WaitToRender then
      wait_time = Config.WaitToRenderTime
    end
    Wait(wait_time)
  end
end

local spasmTimer = 100
local markerColors = {
  [1] = {r = 255, g = 54, b = 54, a = 155},
  [2] = {r = 255, g = 54, b = 54, a = 155},
  [3] = {r = 255, g = 54, b = 54, a = 155},
  [4] = {r = 255, g = 54, b = 54, a = 155},
  [5] = {r = 255, g = 255, b = 0, a = 155},
  [6] = {r = 255, g = 54, b = 54, a = 155},
  [7] = {r = 255, g = 54, b = 54, a = 155},
}
local textColors = {
  [1] = "~r~",
  [2] = "~r~",
  [3] = "~b~",
  [4] = "~o~",
  [5] = "~p~",
  [6] = "~y~",
  [7] = "~w~",
}

local markerSelection = 1
local selectedMarker = markerColors[markerSelection]
local selectedColors = textColors[markerSelection]

local int_closest,int_dist,int_pos,last_pos
RenderInterior = function()  
  local res = false
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)
  local now = GetGameTimer()
  if not LastIntCheck or not last_pos or now - LastIntCheck > 1000 or Vdist(last_pos,plyPos) > 2.0 then
    LastIntCheck = now
    int_dist = false
    last_pos = plyPos
    local exitDist = Vdist(plyPos,InsideHouse.Entry.xyz - ShellOffsets[InsideHouse.Shell]["exit"].xyz + Config.SpawnOffset)
    local wardrobeDist = (InsideHouse.Wardrobe and InsideHouse.Owned and not InsideHouse.Visiting and Vdist(plyPos,InsideHouse.Entry.xyz - InsideHouse.Wardrobe + Config.SpawnOffset) or false)
    local inventoryDist = (InsideHouse.InventoryLocation and InsideHouse.Owned and not InsideHouse.Visiting and Vdist(plyPos,InsideHouse.Entry.xyz - InsideHouse.InventoryLocation + Config.SpawnOffset) or false)
    if wardrobeDist and wardrobeDist < exitDist then
      int_closest = "Wardrobe"
      int_pos = InsideHouse.Wardrobe
      int_dist = wardrobeDist
    else
      int_closest = "Exit"
      int_pos = ShellOffsets[InsideHouse.Shell].exit
      int_dist = exitDist
    end

    if inventoryDist and inventoryDist < int_dist then
      int_closest = "Inventory"
      int_pos = InsideHouse.InventoryLocation
      int_dist = inventoryDist
    end
  end

  if Config.UseMarkers and int_dist < Config.MarkerDistance then
    if Config.CrazyColors then
      local now = GetGameTimer()
      if not lastChange or now - lastChange > spasmTimer then
        lastChange = now
        math.randomseed(math.floor(GetGameTimer() * math.pi * math.random(999999,99999999)))
        markerSelection = markerSelection + math.random(4)
        if markerSelection > #markerColors then markerSelection = 1; end
        selectedMarker = markerColors[markerSelection]
        selectedColors = textColors[markerSelection]
      end
    end
    res = true
    if sleep == nil then
    --DrawMarker(20,InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z-1.5 + Config.SpawnOffset.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 1.0,1.0,1.0, selectedMarker.r,selectedMarker.g,selectedMarker.b,selectedMarker.a, false,true,2)
      DrawMarker(20,InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z + Config.SpawnOffset.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 1.0,1.0,1.0, selectedMarker.r,selectedMarker.g,selectedMarker.b,selectedMarker.a, false,true,2)
    end
  end

  if int_closest == "Exit" and int_dist < Config.TextDistance3D then
    if int_dist < Config.InteractDistance then
      DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, "Tryk ~r~[E]~w~ for at tilgå hus menuen")
      sleep = true
    else
      sleep = nil
      --DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, int_closest)
    end
    res = true
  end

  if int_closest == "Inventory" and int_dist < Config.TextDistance3D then
    if int_dist < Config.InteractDistance then
      DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, "Tryk ~r~[E]~w~ for at tilgå hus inventaret")
      sleep = true
    else
      sleep = nil
      --DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, int_closest)
    end
    res = true
  end

  if int_closest == "Wardrobe" and int_dist < Config.TextDistance3D then
    if int_dist < Config.InteractDistance then
      DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, "Tryk ~r~[E]~w~ for at tilgå klædeskabet")
      sleep = true
    else
      sleep = nil
      --DrawText3D(InsideHouse.Entry.x - int_pos.x + Config.SpawnOffset.x,InsideHouse.Entry.y - int_pos.y + Config.SpawnOffset.y,InsideHouse.Entry.z - int_pos.z+0.1 + Config.SpawnOffset.z, int_closest)
    end
    res = true
  end

  if Config.UseHelpText and int_dist < Config.InteractDistance then
    ShowHelpNotification("~INPUT_PICKUP~ "..int_closest)
    res = true
  end

  if int_dist < Config.InteractDistance and IsControlJustPressed(0,38) then
    OpenMenu(InsideHouse,int_closest,((InsideHouse.Visiting and "Empty") or (InsideHouse.Owner and InsideHouse.Owner == GetPlayerIdentifier() and "Owner") or (InsideHouse.Owned and "Owned") or "Empty"))
    res = true
  end
  return res
end

local ext_dist,ext_key,ext_house
RenderExterior = function()
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)

  local now = GetGameTimer()
  if not LastExtCheck or not last_pos or now - LastExtCheck > 5000 or Vdist(last_pos,plyPos) > 2.0 then
    last_pos = plyPos
    LastExtCheck = now
    ext_dist = false
    for _,thisHouse in pairs(Houses) do
      local closestDist,closestKey
      local entryDist = Vdist(plyPos,thisHouse.Entry.xyz)
      local garageDist = (thisHouse.Garage and Vdist(plyPos,thisHouse.Garage.xyz) or false)

      if not garageDist or entryDist < garageDist then
        closestDist = entryDist
        closestKey = "Entry"
      else
        closestDist = garageDist
        closestKey = "Garage"
      end

      if not ext_dist or closestDist < ext_dist then
        ext_dist = closestDist
        ext_key = closestKey
        ext_house = thisHouse
      end
    end
  end



  if ext_dist and ext_dist < 100.0 then
    if Config.UseMarkers and ext_dist < Config.MarkerDistance then
      if Config.CrazyColors then
        local now = GetGameTimer()
        if not lastChange or now - lastChange > spasmTimer then
          lastChange = now
          math.randomseed(math.floor(GetGameTimer() * math.pi * math.random(999999,99999999)))
          markerSelection = markerSelection + math.random(4)
          if markerSelection > #markerColors then markerSelection = 1; end
          selectedMarker = markerColors[markerSelection]
          selectedColors = textColors[markerSelection]
          local letsleep = true
        end
      end
      if ext_key == "Entry" and sleep == nil then
        local playerPed = PlayerPedId()
        DrawMarker(20,ext_house.Entry.x,ext_house.Entry.y,ext_house.Entry.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 1.0,1.0,1.0, selectedMarker.r,selectedMarker.g,selectedMarker.b,selectedMarker.a, false,true,2)
      elseif ext_key == "Garage" and sleep == nil then
        local playerPed = PlayerPedId()
        --DrawMarker(36, ext_house.Entry.x ,ext_house.Entry.y ,ext_house.Entry.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, selectedMarker.r,selectedMarker.g,selectedMarker.b,selectedMarker.a, 100, false, true, 2, false, false, false, false)
        DrawMarker(36,ext_house.Garage.x,ext_house.Garage.y,ext_house.Garage.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 1.0,1.0,1.0, selectedMarker.r,selectedMarker.g,selectedMarker.b,selectedMarker.a, false,true,2)
      end
      res = true
    end

    if Config.Use3DText and ext_dist < Config.TextDistance3D then
      if ext_key == "Entry" then
        local playerPed = PlayerPedId()
        if ext_dist < Config.InteractDistance then
          DrawText3D(ext_house.Entry.x,ext_house.Entry.y,ext_house.Entry.z+0.1, "Tryk ~r~[E]~w~ for at tilgå hus menuen")
          sleep = true
        else
          sleep = nil
          --DrawText3D(ext_house.Entry.x,ext_house.Entry.y,ext_house.Entry.z+0.1, "House Entry")
        end
      elseif ext_key == "Garage" then
        local playerPed = PlayerPedId()
        if ext_dist < Config.InteractDistance and not IsPedInAnyVehicle(playerPed, false) then
          DrawText3D(ext_house.Garage.x,ext_house.Garage.y,ext_house.Garage.z+0.1, "Tryk ~r~[E]~w~ for at tilgå garagen")
          sleep = true
        elseif ext_dist < Config.InteractDistance and IsPedInAnyVehicle(playerPed, false) then
          sleep = true           
          DrawText3D(ext_house.Garage.x,ext_house.Garage.y,ext_house.Garage.z+0.1, "Tryk ~r~[E]~w~ for at parkeret dit køretøj")
      else
        sleep = nil
      end
    end
  end
    res = true

    if Config.UseHelpText and ext_dist < Config.HelpTextDistance then
      if ext_key == "Entry"and not BeingInvited then
        ShowHelpNotification("~INPUT_PICKUP~ House Entry")
      elseif ext_key == "Garage" then
        ShowHelpNotification("~INPUT_PICKUP~ House Garage")
      end
      res = true
    end

    if ext_dist < Config.InteractDistance then
      res = true
      if IsControlJustPressed(0,38) then
        if IsPedInAnyVehicle(GetPlayerPed(-1)) then
          if ext_house.Owned and ext_house.Owner == GetPlayerIdentifier() then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
            local props = GetVehicleProperties(veh)
            local ownerInfo = Callback("Allhousing:GetVehicleOwner",props.plate)
            local canStore = false
            if ownerInfo.owned and ownerInfo.owner then
              canStore = true
            elseif ownerInfo.owned and Config.StoreStolenPlayerVehicles then
              canStore = true
            else
              canStore = false
            end

            if canStore then
              exports['grisen-garage']:StoreOwnedCarsMenu()
              TriggerServerEvent("Allhousing:VehicleStored",ext_house.Id,props.plate,props)
              ShowNotification("Dit køretøj blev parkeret")
            else
              ShowNotification("Du kan ikke parkeret dette køretøj!")
            end
          else
            for k,v in pairs(ext_house.HouseKeys) do
              if v.identifier == GetPlayerIdentifier() then
                local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
                local props = GetVehicleProperties(veh)
                local ownerInfo = Callback("Allhousing:GetVehicleOwner",props.plate)
                local canStore = false
                if ownerInfo.owned and ownerInfo.owner then
                  canStore = true
                elseif ownerInfo.owned and Config.StoreStolenPlayerVehicles then
                  canStore = true
                else
                  canStore = false
                end

                if canStore then
                  exports['grisen-garage']:StoreOwnedCarsMenu()
                  --TriggerServerEvent("Allhousing:VehicleStored",ext_house.Id,props.plate,props)
                  ShowNotification("Dit køretøj blev parkeret")
                else
                  ShowNotification("Du kan ikke parkeret dette køretøj!")
                end
                return
              end
            end
            ShowNotification("Du ejer ikke dette hus")
          end
        else
          if ext_house.Owned and (ext_house.Owner == GetPlayerIdentifier()) then
            OpenMenu(ext_house,ext_key,"Owner")
          elseif ext_house.Owned then
            OpenMenu(ext_house,ext_key,"Owned")
          else
            OpenMenu(ext_house,ext_key,"Empty")
          end
        end
      end
    end
  end
  return res
end

RefreshInterior = function()
  if InsideHouse then
    for k,v in pairs(Houses) do
      if v.Entry == InsideHouse.Entry then
        InsideHouse.HouseKeys = v.HouseKeys
      end
    end
  end
end

Sync = function(data)
  local _key
  for k,house in pairs(Houses) do
    if house.Blip then
      RemoveBlip(house.Blip)
      house.Blip = false
      if InsideHouse and InsideHouse.Id == house.Id then
        _key = k
      end
    end
  end
  
  Houses = data
  RefreshBlips()
  if _key then
    InsideHouse = Houses[_key]
  end
end

SyncHouse = function(sync_house)
  local house = Houses[sync_house.Id]
  if not house then
    Houses[sync_house.Id] = sync_house
    house = Houses[sync_house.Id]
  end
  if house.Blip then
    RemoveBlip(house.Blip)
    house.Blip = false
  end
  if house.Id == sync_house.Id then
    if house.Blip then
      RemoveBlip(house.Blip)
    end

    Houses[sync_house.Id] = sync_house

    if InsideHouse and InsideHouse.Id == sync_house.Id then
      sync_house.Extras = InsideHouse.Extras
      sync_house.Object = InsideHouse.Object
      sync_house.Visiting = InsideHouse.Visiting  
      InsideHouse = Houses[sync_house.Id]
    end

    if Config.UseBlips then
      local identifier = GetPlayerIdentifier()
      local color,sprite,text
      if Houses[sync_house.Id].Owned and Houses[sync_house.Id].Owner and (Houses[sync_house.Id].Owner == identifier) then
        text = "Dine Huse"
        color,sprite = GetBlipData("owner",Houses[sync_house.Id].Entry)
      -- elseif Houses[sync_house.Id].Owned then
      --   text = "Huse du har nøgler til"
      --   color,sprite = GetBlipData("haskeys",Houses[sync_house.Id].Entry)
      else
        text = "Dødsbo"
        color,sprite = GetBlipData("empty",Houses[sync_house.Id].Entry)
      end
      if color and sprite then
        Houses[sync_house.Id].Blip = CreateBlip(Houses[sync_house.Id].Entry,sprite,color,text)
      end
    end
  end
  LastExtCheck = 0
end

Invited = function(house)
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)
  if Vdist(plyPos,house.Entry.xyz) < 5.0 then
    ShowNotification("You've been invited inside. Press G to accept.")
    BeingInvited = true
    while Vdist(GetEntityCoords(plyPed),house.Entry.xyz) < 10.0 do
      if Config.UseHelpText then
        ShowHelpNotification("~INPUT_DETONATE~ Accept Invite")
      end
      if IsControlJustPressed(0,47) then
        ViewHouse(house)
        BeingInvited = false
        return
      end
      Wait(0)
    end
    BeingInvited = false
    ShowNotification("Du bevægede dig for lang væk.")
  else    
    ShowNotification("Du bevægede dig for lang væk.")
  end
end

KnockAtDoor = function(entry)
  if InsideHouse and InsideHouse.Entry == entry and InsideHouse.Owner and InsideHouse.Owner == GetPlayerIdentifier() then
    ShowNotification("Nogen banker på din dør.")
  end
end

Boot = function(id,enter)
  if InsideHouse and InsideHouse.Id == id and not LeavingHouse then
    local _id = InsideHouse.Id
    LeaveHouse()
    if enter then
      for k,v in pairs(Houses) do
        if v.Id == _id then
          EnterHouse(v)
          return
        end
      end
    end
  end
end

RegisterNetEvent("Allhousing:Sync")
AddEventHandler("Allhousing:Sync", Sync)

RegisterNetEvent("Allhousing:SyncHouse")
AddEventHandler("Allhousing:SyncHouse", SyncHouse)

RegisterNetEvent("Allhousing:Boot")
AddEventHandler("Allhousing:Boot", Boot)

RegisterNetEvent("Allhousing:Invited")
AddEventHandler("Allhousing:Invited", Invited)

RegisterNetEvent("Allhousing:KnockAtDoor")
AddEventHandler("Allhousing:KnockAtDoor", KnockAtDoor)

AddEventHandler("Allhousing:Relog", function(...)
  StartData = Callback("Allhousing:GetHouseData")
  Houses = StartData.Houses
  KashIdentifier = StartData.Identifier
  RefreshBlips()
end)

Citizen.CreateThread(Init)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)



AddEventHandler('zrp_housing:openInventory', function(inventory, houseId)
end)