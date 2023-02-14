-- https://modit.store


function print_table(node)
  local cache, stack, output = {},{},{}
  local depth = 1
  local output_str = "{\n"

  while true do
      local size = 0
      for k,v in pairs(node) do
          size = size + 1
      end

      local cur_index = 1
      for k,v in pairs(node) do
          if (cache[node] == nil) or (cur_index >= cache[node]) then

              if (string.find(output_str,"}",output_str:len())) then
                  output_str = output_str .. ",\n"
              elseif not (string.find(output_str,"\n",output_str:len())) then
                  output_str = output_str .. "\n"
              end

              -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
              table.insert(output,output_str)
              output_str = ""

              local key
              if (type(k) == "number" or type(k) == "boolean") then
                  key = "["..tostring(k).."]"
              else
                  key = "['"..tostring(k).."']"
              end

              if (type(v) == "number" or type(v) == "boolean") then
                  output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
              elseif (type(v) == "table") then
                  output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                  table.insert(stack,node)
                  table.insert(stack,v)
                  cache[node] = cur_index+1
                  break
              else
                  output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
              end

              if (cur_index == size) then
                  output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
              else
                  output_str = output_str .. ","
              end
          else
              -- close the table
              if (cur_index == size) then
                  output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
              end
          end

          cur_index = cur_index + 1
      end

      if (size == 0) then
          output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
      end

      if (#stack > 0) then
          node = stack[#stack]
          stack[#stack] = nil
          depth = cache[node] == nil and depth + 1 or depth - 1
      else
          break
      end
  end

  -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
  table.insert(output,output_str)
  output_str = table.concat(output)

  print(output_str)
  
end

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Allhousing:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local black_money = xPlayer.getAccount('black_money').money
	local money = xPlayer.getMoney()
	local items      = xPlayer.inventory
	local weapons = xPlayer.getLoadout()
	cb({
		money = money,
		black_money = black_money,
		items      = items,
		weapons      = weapons
	})
end) 


GetOutfits = function(source)
  local xPlayer  = ESX.GetPlayerFromId(source)
  local ret,labels = false
  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
    local count  = store.count('dressing')
    local _labels = {}
    for i=1, count, 1 do
      local entry = store.get('dressing', i)
      table.insert(_labels, entry.label)
    end
    labels = _labels
    ret = true
  end)
  while not ret do Wait(0); end
  return labels
end

GetOutfit = function(source,num)
  local xPlayer  = ESX.GetPlayerFromId(source)
  local ret,skin = false
  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
    local outfit = store.get('dressing', num)
    skin = outfit.skin
    ret = true
  end)
  while not ret do Wait(0); end
  return skin
end

RemoveOutfit = function(label)
  local xPlayer = ESX.GetPlayerFromId(source)
  TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
    local dressing = store.get('dressing') or {}
    table.remove(dressing, label)
    store.set('dressing', dressing)
  end)
end

GetVehicles = function(source,house)
  local vehs = {}
  local retData = SqlFetch("SELECT * FROM owned_vehicles WHERE storedhouse=@storedhouse",{['@storedhouse'] = house.Id})
  if retData and type(retData) == "table" then
    for k,v in pairs(retData) do
      table.insert(vehs,{
        plate = v.plate,
        vehicle = json.decode(v.vehicle),
      })
    end
    ret = true
  end
  while not ret do Wait(0); end
  return vehs
end

SqlFetch = function(ssm,sjd)
  local res,ret
  MySQL.Async.fetchAll(ssm,sjd,function(sqldata)
    ret = sqldata
    res = true
  end)
  while not res do Wait(0); end
  return ret
end

SqlExecute = function(ssm,sjd)
  local res,ret
  MySQL.Async.execute(ssm,sjd,function(sqldata)
    ret = sqldata
    res = true
  end)
  while not res do Wait(0); end
  return ret
end

VehicleSpawned = function(plate)
  MySQL.Async.execute("UPDATE owned_vehicles SET `stored`=false,`storedhouse`=@storedhouse WHERE `plate`=@plate",{['@storedhouse'] = 0,['@plate'] = plate})
end

VehicleStored = function(id,plate,props)
  MySQL.Async.execute("UPDATE owned_vehicles SET `stored`=false,`storedhouse`=@storedhouse,`vehicle`=@vehicle WHERE `plate`=@plate",{['@storedhouse'] = id,['@plate'] = plate,['@vehicle'] = json.encode(props)})
end

GetInventory = function(source,cb,house)
  local v = Houses[house.Id]
  cb({cash = v.Inventory.Cash, blackMoney = v.Inventory.DirtyMoney, items = v.Inventory.Items, weapons = v.Inventory.Weapons })
end

function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end


PurchaseHouse = function(house)
  local _source = source
  local v = Houses[house.Id]
  local entry = house.Entry
  if not v.Owned then
    local afford
    if GetPlayerCash(_source) >= v.Price then
      afford = true
      TakePlayerCash(_source,v.Price)
    elseif GetPlayerBank(_source) >= v.Price then
      afford = true
      TakePlayerBank(_source,v.Price)
    end
    if afford then
      local lastOwner = ""
      if v.Owner and v.Owner:len() >= 1 then
        lastOwner = v.Owner
        local targetPlayer = GetPlayerByIdentifier(v.Owner)
        local salePrice = math.floor(v.Price / 1)
        if salePrice > 0 then
          if targetPlayer then
            local targetSource = GetPlayerSource(targetPlayer)
            --AddPlayerBank(targetSource,salePrice)
            --AddSocietyMoney(societyAccount,salePrice)
            TriggerEvent('addSocietymoney', 'society_realestateagent', salePrice)
            NotifyPlayer(targetSource,"Your house was purchased for $"..v.Price..(v.Price ~= salePrice and ", you earnt $"..salePrice.." from the sale." or "."))
            local manden = GetCharacterName(_source)
            societymoney = TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
              print(account.money)
              moneyss = account.money
            end)
            sendToDiscord(16753920, "Ejendomsmægler", v.OwnerName .. ' solgte ' .. v.Shell .. ' til ' .. manden .. ' for '.. comma_value(salePrice) .. 'kr' .. ' | ' .. "Ejendomsmægler Konto: " .. comma_value(moneyss) .. 'kr', "Ø er en kvinde")
          else
            AddOfflineBank(v.Owner,salePrice)
          end

          if v.ResaleJob and v.ResaleJob:len() > 1 then
            local societyAmount = (Config.CreationJobs[v.ResaleJob].society and math.floor(v.Price * ((100 - v.ResalePercent) / 100)))
            local societyAccount = Config.CreationJobs[v.ResaleJob].account
            if societyAmount and societyAccount then
              AddSocietyMoney(societyAccount,societyAmount)
            end
          end
        end
      end

      v.Owner = GetPlayerIdentifier(_source)
      v.OwnerName = GetCharacterName(_source)
      v.ResaleJob = ""
      v.Owned = true
      if tonumber(Config.Version) > 1.2 then
        TriggerClientEvent("Allhousing:SyncHouse",-1,v)
      else
        TriggerClientEvent("Allhousing:Sync",-1,Houses)
      end
      SqlExecute("UPDATE allhousing SET owner=@owner,ownername=@ownername,resalejob=@resalejob,owned=1,housekeys=@housekeys WHERE id=@id",{['@owner'] = GetPlayerIdentifier(_source),['@ownername'] = v.OwnerName, ['@housekeys'] = json.encode({}),['@resalejob'] = "",['@id'] = v.Id})
    end
  end
end

RegisterNetEvent('ox:loadStashes', function(d)
  local ox_inventory = exports.ox_inventory
  print(d.InventoryLocation)
  ox_inventory:RegisterStash("Hus".. d.Id, d.Id, 50, 500000, true, false, d.InventoryLocation)
end)

GetVehicleOwner = function(source,plate)
  local res,ret
  MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE plate=@plate",{['@plate'] = plate},function(retData)
    ret = {}
    if retData and type(retData) == "table" and retData[1] then
      local xPlayer  = ESX.GetPlayerFromId(source)
      if retData[1].owner == xPlayer.getIdentifier() then
        ret.owner = true
        ret.owned = true
      else
        ret.owner = false
        ret.owned = true
      end
    else
      ret.owner = false
      ret.owned = false
    end
    res = true
  end)
  while not res do Wait(0); end
  return ret
end

if Config.UsingDiscInventory then
  Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
      name = 'allhousing',
      label = 'Storage',
      slots = (Config.DiscInventorySlots or 20)
    })
  end)
end

if Config.ControlCharacters then
  KashChosen = function(charId)
    KashCharacters[source] = charId
  end

  GetHouseData = function(source,entry)
    while not ModReady do Wait(0); end
    local identifier = GetPlayerIdentifier(source,true)
    if Config.UsingKashacters then
      while not KashCharacters[source] do Wait(0); end
      local st,fn = identifier:find(":")
      KashCache[source] = KashCharacters[source]..":"..identifier:sub((fn or 0)+1,identifier:len())
      identifier = KashCache[source]
    end
    if not entry then return {Houses = Houses, Identifier = identifier}; end
    for k,v in pairs(Houses) do
      if v.Entry.x == entry.x and v.Entry.y == entry.y and v.Entry.z == entry.z then
        return v
      end
    end
    return false
  end

  RegisterCallback("Allhousing:GetHouseData", GetHouseData)
  RegisterNetEvent("kashactersS:CharacterChosen")
  AddEventHandler("kashactersS:CharacterChosen", KashChosen)
end

RegisterCallback("Allhousing:GetVehicleOwner",GetVehicleOwner)
RegisterCallback("Allhousing:GetHouseData", GetHouseData)
RegisterCallback("Allhousing:GetOutfits", GetOutfits)
RegisterCallback("Allhousing:GetOutfit", GetOutfit)
RegisterCallback("Allhousing:GetVehicles", GetVehicles)

RegisterNetEvent("Allhousing:PurchaseHouse")
AddEventHandler("Allhousing:PurchaseHouse", PurchaseHouse)

RegisterNetEvent("Allhousing:VehicleSpawned")
AddEventHandler("Allhousing:VehicleSpawned", VehicleSpawned)

RegisterNetEvent("Allhousing:VehicleStored")
AddEventHandler("Allhousing:VehicleStored", VehicleStored)

RegisterNetEvent("Allhousing:RemoveOutfit")
AddEventHandler("Allhousing:RemoveOutfit", RemoveOutfit)

KashCache = {}

KashCharacters = {}

HouseKey = 1



error = function(...) end



SqlCheck = function()

  Houses = (Houses or {})

  if not Config.Version or tonumber(Config.Version) < 1.2 then

    print("Critical update needed. Please update and restart your server before trying to use this mod.")

    error_out = true

    return

  end



  local found_allhousing = false

  local has_column = SqlFetch("SELECT * FROM information_schema.COLUMNS",{})

  if has_column and type(has_column) == "table" then

    for k,v in pairs(has_column) do

      if v.TABLE_NAME == ((Config and Config.AllhousingTable) or "allhousing") then

        found_allhousing = true

      end

    end

  end



  if not found_allhousing then

    print("Failed sql startup")

    return

  end

  

  local addToDb = {}

  local curInDb = SqlFetch('SELECT * FROM '..((Config and Config.AllhousingTable) or "allhousing"),{})



  if curInDb and type(curInDb) == "table" then

    for k,v in pairs(curInDb) do

      if not v.ownername then

        print("Critical update needed. Please update and restart your server before trying to use this mod.")

        error_out = true

        return

      end



      if v.id and v.id >= HouseKey then

        HouseKey = v.id+1

      end

    end

  end



  local newHouses = {}

  if Houses and type(Houses) == "table" then

    for k1,v1 in pairs(Houses) do

      local foundMatch = false

      for k2,v2 in pairs(curInDb) do

        local entry = json.decode(v2.entry)

        if (math.floor(tonumber(v1.Entry.x)) == math.floor(tonumber(entry.x)) and math.floor(tonumber(v1.Entry.y)) == math.floor(tonumber(entry.y)) and math.floor(tonumber(v1.Entry.z)) == math.floor(tonumber(entry.z))) then

          foundMatch = k2

          break

        end

      end

      if not foundMatch then

        newHouses[HouseKey] =  (Houses[HouseKey] or {})

        newHouses[HouseKey].Id = HouseKey

        newHouses[HouseKey].Owner = ""

        newHouses[HouseKey].OwnerName = ""

        newHouses[HouseKey].Owned = false

        newHouses[HouseKey].Price = v1.Price

        newHouses[HouseKey].ResalePercent = 0

        newHouses[HouseKey].ResaleJob = ''

        newHouses[HouseKey].Entry = v1.Entry

        newHouses[HouseKey].Garage = (v1.Garage or false)

        newHouses[HouseKey].Furniture = {}

        newHouses[HouseKey].Shell = v1.Shell

        newHouses[HouseKey].Shells = v1.Shells

        newHouses[HouseKey].HouseKeys = {}

        newHouses[HouseKey].Wardrobe = false

        newHouses[HouseKey].Inventory = {Cash = 0,DirtyMoney = 0, Items = {}, Weapons = {}}

        newHouses[HouseKey].InventoryLocation = false



        table.insert(addToDb,Houses[HouseKey])

        HouseKey = HouseKey + 1

      else

        newHouses[curInDb[foundMatch].id] =  (Houses[curInDb[foundMatch].id] or {})

        newHouses[curInDb[foundMatch].id].Id = (curInDb[foundMatch].id)

        newHouses[curInDb[foundMatch].id].Owner = (curInDb[foundMatch].owner)

        newHouses[curInDb[foundMatch].id].OwnerName = (curInDb[foundMatch].ownername)

        newHouses[curInDb[foundMatch].id].Owned = (curInDb[foundMatch].owned >= 1 and true or false)

        newHouses[curInDb[foundMatch].id].Price = curInDb[foundMatch].price

        newHouses[curInDb[foundMatch].id].ResalePercent = curInDb[foundMatch].resalepercent

        newHouses[curInDb[foundMatch].id].ResaleJob = curInDb[foundMatch].resalejob

        newHouses[curInDb[foundMatch].id].Entry = table.tovec(json.decode(curInDb[foundMatch].entry))

        newHouses[curInDb[foundMatch].id].Garage = (curInDb[foundMatch].garage:len() > 5 and table.tovec(json.decode(curInDb[foundMatch].garage)) or false)

        newHouses[curInDb[foundMatch].id].Furniture = json.decode(curInDb[foundMatch].furniture)

        newHouses[curInDb[foundMatch].id].Shell = curInDb[foundMatch].shell

        newHouses[curInDb[foundMatch].id].Shells = json.decode(curInDb[foundMatch].shells)

        newHouses[curInDb[foundMatch].id].HouseKeys = json.decode(curInDb[foundMatch].housekeys)

        newHouses[curInDb[foundMatch].id].Wardrobe = (curInDb[foundMatch].wardrobe:len() > 5 and table.tovec(json.decode(curInDb[foundMatch].wardrobe)) or false)

        newHouses[curInDb[foundMatch].id].Inventory = (curInDb[foundMatch].inventory:len() > 5 and json.decode(curInDb[foundMatch].inventory) or false)

        newHouses[curInDb[foundMatch].id].InventoryLocation = (curInDb[foundMatch].inventorylocation:len() > 5 and table.tovec(json.decode(curInDb[foundMatch].inventorylocation)) or false)

      end

    end

  end

  if curInDb and type(curInDb) == "table" then

    for k1,v1 in pairs(curInDb) do

      local foundMatch = false

      local entry = json.decode(v1.entry)

      for k2,v2 in pairs(newHouses) do

        if (math.floor(tonumber(v2.Entry.x)) == math.floor(tonumber(entry.x)) and math.floor(tonumber(v2.Entry.y)) == math.floor(tonumber(entry.y)) and math.floor(tonumber(v2.Entry.z)) == math.floor(tonumber(entry.z))) then

          foundMatch = k2

          break

        end

      end

      if not foundMatch then

        newHouses[v1.id] = {

          Id = v1.id,

          Owner = v1.owner,

          OwnerName = v1.ownername,

          Owned = (v1.owned >= 1 and true or false),

          Price = v1.price,

          ResalePercent = v1.resalepercent,

          ResaleJob = v1.resalejob,

          Entry = table.tovec(json.decode(v1.entry)),

          Garage = (v1.garage:len() > 5 and table.tovec(json.decode(v1.garage)) or false),

          Furniture = json.decode(v1.furniture),

          Shell = v1.shell,

          Shells = json.decode(v1.shells),

          HouseKeys = json.decode(v1.housekeys),

          Wardrobe = (v1.wardrobe:len() > 5 and table.tovec(json.decode(v1.wardrobe)) or false),

          Inventory = (v1.inventory:len() > 5 and json.decode(v1.inventory) or false),

          InventoryLocation = (v1.inventorylocation:len() > 5 and table.tovec(json.decode(v1.inventorylocation)) or false)

        }

      end

    end

  end



  if addToDb and type(addToDb) == "table" then

    for k,v in pairs(addToDb) do

      SqlExecute("INSERT INTO "..(Config.AllhousingTable or "allhousing").." SET id=@id,owner=@owner,ownername=@ownername,owned=@owned,entry=@entry,garage=@garage,furniture=@furniture,price=@price,resalepercent=@resalepercent,resalejob=@resalejob,shell=@shell,shells=@shells,housekeys=@housekeys,wardrobe=@wardrobe,inventory=@inventory,inventorylocation=@inventorylocation",{

        ['@id'] = v.Id,

        ['@owner'] = "",

        ['@ownername'] = "",

        ['@owned'] = 0,

        ['@entry'] = json.encode(table.fromvec(v.Entry)),

        ['@garage'] = json.encode((v.Garage and table.fromvec(v.Garage) or {})),

        ['@furniture'] = json.encode({}),

        ['@price'] = v.Price,

        ['@resalepercent'] = 0,

        ['@resalejob'] = "",

        ['@shell'] = v.Shell,

        ['@shells'] = json.encode(v.Shells),

        ['@housekeys'] = json.encode({}),

        ['@wardrobe'] = json.encode((v.Wardrobe and table.fromvec(v.Garage) or {})),

        ['@inventory'] = json.encode({Cash = 0,DirtyMoney = 0, Items = {}, Weapons = {}}),

        ['@inventorylocation'] = json.encode({}),

      })

    end



    if (#addToDb > 0) then

      if (not error_out) then

        _print("[Init]","Added "..#addToDb.." houses to the database.")

      end

    end

  end

  Houses = newHouses

  SqlReady = true

end



Init = function()

  if not error_out then

    _print("[Init]","Started.")

  else

    return

  end

  GetFramework()



  if not error_out then

    _print("[Init]","Got Framework.")

  else

    return

  end



  while not SqlReady do Wait(0); end

  _print("[Init]","Sql Ready.")

  ModReady = true



  _print("[Init]","Startup Successful.")

  local update_version = "1.7"

  if not Config.Version or Config.Version ~= update_version then

    _print("[UPDATE]","Version mismatch (Current: "..(Config and Config.Version and tostring(Config.Version) or "UNKNOWN")..string.format(" || Updated: %s)",update_version))

    _print("[UPDATE]","Update not critical. This mod will continue to run fine.")

  end

end



InviteInside = function(house,id) 

  TriggerClientEvent("Allhousing:Invited",id,house)

end



KnockOnDoor = function(entry)

  TriggerClientEvent("Allhousing:KnockAtDoor",-1,entry)

end



BreakLockpick = function()

  TakePlayerItem(source,Config.LockpickItem)

end



if not Config.ControlCharacters then

  KashChosen = function(charId)

    KashCharacters[source] = charId

  end



  GetHouseData = function(source,entry)

    while not ModReady do Wait(0); end

    local identifier = GetPlayerIdentifier(source,true)

    if Config.UsingKashacters then

      while not KashCharacters[source] do Wait(0); end

      local st,fn = identifier:find(":")

      KashCache[source] = KashCharacters[source]..":"..identifier:sub((fn or 0)+1,identifier:len())

      identifier = KashCache[source]

    end

    if not entry then return {Houses = Houses, Identifier = identifier}; end

    if Houses and type(Houses) == "table" then

      for k,v in pairs(Houses) do

        if v.Entry.x == entry.x and v.Entry.y == entry.y and v.Entry.z == entry.z then

          return v

        end

      end

    end

    return false

  end



  RegisterCallback("Allhousing:GetHouseData", GetHouseData)

  RegisterNetEvent("kashactersS:CharacterChosen")

  AddEventHandler("kashactersS:CharacterChosen", KashChosen)

end



SellHouse = function(house,price)

  local _source = source

  local v = Houses[house.Id]

  local entry = house.Entry

  if v.Entry.x == entry.x and v.Entry.y == entry.y and v.Entry.z == entry.z then

    if v.Owned and v.Owner == GetPlayerIdentifier(_source) then

      if Config.RemoveFurniture then

        if Config.RefundFurniture and Config.RefundPercent then

          TriggerEvent("Allhousing.Furni:GetPrices", function(prices)

            local addVal,count = 0,0

            if v and v.Furniture and type(v.Furniture) == "table" then

              for k,v in pairs(v.Furniture) do

                local price = prices[v.model]

                addVal = addVal + price

                count = count + 1

              end

              if count and count > 0 then

                _print("[Sale]","Added $"..addVal.." to ".._source.." ("..GetPlayerIdentifier(_source).."/"..GetPlayerName(_source)..") to refund "..(count and count > 1 and count.." pieces" or tostring(count).." piece").." of furniture.")

                AddPlayerBank(_source,math.ceil(addVal*(Config.RefundPercent / 100)))

              end

            end

          end)

        end

        v.Furniture = {}

      end          

      local furniTab = {}

      if v and v.Furniture and type(v.Furniture) == "table" then

        for k,v in pairs(v.Furniture) do

          table.insert(furniTab,{

            pos = {x = v.pos.x, y = v.pos.y, z = v.pos.z},

            rot = {x = v.rot.x, y = v.rot.y, z = v.rot.z},

            model = v.model

          })

        end

      end

      v.Owned = false

      v.Price = price

      v.ResalePercent = 100

      v.ResaleJob = ""

      if tonumber(Config.Version) > 1.2 then

        TriggerClientEvent("Allhousing:SyncHouse",-1,v)

      else

        TriggerClientEvent("Allhousing:Sync",-1,Houses)

      end

      TriggerClientEvent("Allhousing:Boot",-1,house.Id)

      SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET owned=0,price=@price,resalepercent=100,resalejob=@resalejob,furniture=@furniture WHERE id=@id",{['@furniture'] = json.encode(furniTab),['@resalejob'] = "",['@price'] = price,['@id'] = v.Id})

      return

    end

  end

end



CreateHouse = function(house)

  local _source = source

  local identifier = GetPlayerIdentifier(_source)

  local jobName = GetPlayerJobName(_source)

  if not Config.CreationJobs[jobName] then return; end

  local jobRank = GetPlayerJobRank(_source)

  if Config.CreationJobs[jobName].minRank > jobRank then return; end

  local _key = HouseKey

  HouseKey = HouseKey + 1

  local charName = GetCharacterName(_source)

  Houses[_key] = {

    Id = _key,

    Owner = identifier,

    OwnerName = charName,

    Owned = false,

    Price = house.Price,

    ResalePercent = Config.CreationJobs[jobName].payCut,

    ResaleJob = jobName,

    Entry = house.Entry,

    Garage = house.Garage,

    Furniture = {},

    Shell = house.Shell,

    Shells = house.Shells,

    HouseKeys = {},

    Wardrobe = false,

    Inventory = {

      Cash = 0,

      DirtyMoney = 0,

      Items = {},

      Weapons = {},

    },

    InventoryLocation = false,

  }

  if tonumber(Config.Version) > 1.2 then

    TriggerClientEvent("Allhousing:SyncHouse",-1,Houses[_key])

  else

    TriggerClientEvent("Allhousing:Sync",-1,Houses)

  end

  SqlExecute("INSERT INTO "..((Config and Config.AllhousingTable) or "allhousing").." SET id=@id,owner=@owner,ownername=@ownername,owned=@owned,price=@price,resalepercent=@resalepercent,resalejob=@resalejob,entry=@entry,garage=@garage,furniture=@furniture,shell=@shell,shells=@shells,housekeys=@housekeys,wardrobe=@wardrobe,inventory=@inventory,inventorylocation=@inventorylocation",{

    ['@id'] = _key,

    ['@owner'] = identifier,

    ['@ownername'] = charName,

    ['@owned'] = 0,

    ['@price'] = house.Price,

    ['@resalepercent'] = Config.CreationJobs[jobName].payCut,

    ['@resalejob'] = jobName,

    ['@entry'] = json.encode(table.fromvec(house.Entry)),

    ['@garage'] = json.encode((house.Garage and table.fromvec(house.Garage) or {})),

    ['@furniture'] = json.encode({}),

    ['@shell'] = house.Shell,

    ['@shells'] = json.encode(house.Shells),

    ['@housekeys'] = json.encode({}),

    ['@wardrobe'] = json.encode({}),

    ['@inventory'] = json.encode({

      Cash = 0,

      DirtyMoney = 0,

      Items = {},

      Weapons = {},

    }),

    ['@inventorylocation'] = json.encode({})

  })
  societymoney = TriggerEvent('esx_addonaccount:getSharedAccount', 'society_revisor', function(account)
		print(account.money)
		moneyss = account.money
	end)
  sendToDiscord(16753920, "Ejendomsmægler", GetCharacterName(_source) .. " satte et hus tilsalg til ".. comma_value(house.Price) .. " | shell: " .. house.Shell .. " |", "Ø er en kvinde")
end



UpgradeHouse = function(house,shell)

  local _source = source

  local v = Houses[house.Id]

  local entry = house.Entry

  if v.Owned == true and v.Owner == GetPlayerIdentifier(_source) then

    local afford

    local truePrice = ShellPrices[shell]

    if GetPlayerCash(_source) >= truePrice then

      afford = true

      TakePlayerCash(_source,truePrice)

    elseif GetPlayerBank(_source) >= truePrice then

      afford = true

      TakePlayerBank(_source,truePrice)

    end



    if afford then

      v.Shell = shell

      if tonumber(Config.Version) > 1.2 then

        TriggerClientEvent("Allhousing:SyncHouse",-1,v)

      else

        TriggerClientEvent("Allhousing:Sync",-1,Houses)

      end

      SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET shell=@shell WHERE id=@id",{['@shell'] = shell,['@id'] = v.Id})

      TriggerClientEvent("Allhousing:Boot",-1,house.Id,true)

    end

  end

end



GiveKeys = function(house,target)

  local _source = source

  local v = Houses[house.Id]

  local entry = house.Entry

  if v.Owned == true and v.Owner == GetPlayerIdentifier(_source) then

    table.insert(v.HouseKeys,{identifier = GetPlayerIdentifier(target), name = GetPlayerName(target)})

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    TriggerClientEvent("Allhousing:NotifyPlayer",target,"You received some house keys.")

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET housekeys=@housekeys WHERE id=@id",{['@housekeys'] = json.encode(v.HouseKeys),['@id'] = v.Id})

  end

end



TakeKeys = function(house,target)

  local _source = source

  local v = Houses[house.Id]

  local entry = house.Entry

  if v.Owned == true and v.Owner == GetPlayerIdentifier(_source) then

    local foundTarget = false

    if v and v.HouseKeys and type(v.HouseKeys) == "table" then

      for _k,_v in pairs(v.HouseKeys) do

        if _v.identifier == target.identifier and _v.name == target.name then

          foundTarget = _v.identifier

          table.remove(v.HouseKeys,_k)

          v.HouseKeys[_k] = nil

        end

      end

    end

    if foundTarget then

      if tonumber(Config.Version) > 1.2 then

        TriggerClientEvent("Allhousing:SyncHouse",-1,v)

      else

        TriggerClientEvent("Allhousing:Sync",-1,Houses)

      end

      SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET housekeys=@housekeys WHERE id=@id",{['@housekeys'] = json.encode(v.HouseKeys),['@id'] = v.Id})

      _print("[Keys]","Took keys.")



      local targetPlayer = GetPlayerByIdentifier(foundTarget)

      if targetPlayer then

        local targetSource = GetPlayerSource(targetPlayer)

        if targetSource then

          TriggerClientEvent("Allhousing:NotifyPlayer",targetSource,"You lost some house keys.")

        end

      end

    end

  end

end



SetFurni = function(house,furni)

  local v = Houses[house.Id]

  local entry = house.Entry

  v.Furniture = furni

  if tonumber(Config.Version) > 1.2 then

    TriggerClientEvent("Allhousing:SyncHouse",-1,v)

  else

    TriggerClientEvent("Allhousing:Sync",-1,Houses)

  end

  _print("[Furni]","Updated furniture.")

  return

end



SetWardrobe = function(house,wardrobe)

  local _source = source

  local v = Houses[house.Id]

  if v.Owned == true and v.Owner == GetPlayerIdentifier(_source) then

    v.Wardrobe = wardrobe

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET wardrobe=@wardrobe WHERE id=@id",{['@wardrobe'] = json.encode({x = wardrobe.x, y = wardrobe.y, z = wardrobe.z}),['@id'] = v.Id})

    _print("[Wardrobe]","Set location.")

  end

end


RegisterNetEvent('ox:loadStashes', function(id)
  local stash = properties[id]
      if stash then
          ox_inventory:RegisterStash(stash.name, stash.label, 50, 100000, true, false, json.encode(stash.room_menu))
      end
  end)
  


SetInventory = function(house,inventoryLocation)

  local _source = source

  local v = Houses[house.Id]

  if v.Owned == true and v.Owner == GetPlayerIdentifier(_source) then

    v.InventoryLocation = inventoryLocation

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)
    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventorylocation=@inventorylocation WHERE id=@id",{['@inventorylocation'] = json.encode({x = inventoryLocation.x, y = inventoryLocation.y, z = inventoryLocation.z}),['@id'] = v.Id})

    _print("[InventoryLocation]","Set location.")

  end

end



GetItem = function(house,itemType,itemName,itemCount)

  local _source = source

  local v = Houses[house.Id]

  if itemType == 'item_money' then

    if itemCount > v.Inventory.Cash then itemCount = v.Inventory.Cash; end

    AddPlayerCash(_source,itemCount)

    v.Inventory.Cash = math.floor(v.Inventory.Cash - itemCount)

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

  elseif itemType == 'item_account' then

    if itemCount > v.Inventory.DirtyMoney then itemCount = v.Inventory.DirtyMoney; end

    AddPlayerDirtyMoney(_source,itemCount)

    v.Inventory.DirtyMoney = math.floor(v.Inventory.DirtyMoney - itemCount)

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

  elseif itemType == 'item_standard' then

    if v and type(v.Inventory) == "table" and v.Inventory.Items then

      for _,item in pairs(v.Inventory.Items) do

        if item.name == itemName then

          if itemCount > item.count then itemCount = item.count; end

          if CanPlayerCarry(_source,itemName,itemCount) then

            item.count = item.count - itemCount

            AddPlayerItem(_source,itemName,itemCount)

            if tonumber(Config.Version) > 1.2 then

              TriggerClientEvent("Allhousing:SyncHouse",-1,v)

            else

              TriggerClientEvent("Allhousing:Sync",-1,Houses)

            end

            SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

            return

          else

            NotifyPlayer(_source,"You can't carry that much.")

            return

          end

        end

      end

    end

  elseif itemType == "item_weapon" then

    if v and type(v.Inventory) == "table" and v.Inventory.Weapons then

      for _,weapon in pairs(v.Inventory.Weapons) do

        if weapon.name == itemName then

          local playerWeapon,playerAmmo,weaponLabel,components = GetPlayerWeapon(_source,itemName)

          if not playerWeapon or playerAmmo == 0 then

            AddPlayerWeapon(_source,itemName,weapon.ammo)

            table.remove(v.Inventory.Weapons,_)

            if tonumber(Config.Version) > 1.2 then

              TriggerClientEvent("Allhousing:SyncHouse",-1,v)

            else

              TriggerClientEvent("Allhousing:Sync",-1,Houses)

            end

            SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

            return

          end

        end            

      end

    end

  end

end



PutItem = function(house,itemType,itemName,itemCount)

  local _source = source

  local v = Houses[house.Id]

  if itemType == 'item_money' then

    local playerMoney = GetPlayerCash(_source)

    if itemCount > playerMoney then itemCount = playerMoney; end

    TakePlayerCash(_source,itemCount)

    v.Inventory.Cash = math.floor(v.Inventory.Cash + itemCount)

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

  elseif itemType == 'item_account' then

    local playerMoney = GetPlayerDirty(_source)

    if itemCount > playerMoney then itemCount = playerMoney; end

    TakePlayerDirty(_source,itemCount)

    v.Inventory.DirtyMoney = math.floor(v.Inventory.DirtyMoney + itemCount)

    if tonumber(Config.Version) > 1.2 then

      TriggerClientEvent("Allhousing:SyncHouse",-1,v)

    else

      TriggerClientEvent("Allhousing:Sync",-1,Houses)

    end

    SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

  elseif itemType == 'item_standard' then

    local playerItemCount = GetPlayerItemCount(_source,itemName)

    if itemCount > playerItemCount then itemCount = playerItemCount; end

    local foundItem = false

    if v.Inventory and v.Inventory.Items then

      for _,item in pairs(v.Inventory.Items) do

        if item.name == itemName then

          foundItem = true

          item.count = item.count + itemCount

          TakePlayerItem(_source,itemName,itemCount)

          if tonumber(Config.Version) > 1.2 then

            TriggerClientEvent("Allhousing:SyncHouse",-1,v)

          else

            TriggerClientEvent("Allhousing:Sync",-1,Houses)

          end

          SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

        end

      end

    end

    if not foundItem then

      local itemData = GetPlayerItemData(_source,itemName)

      TakePlayerItem(_source,itemName,itemCount)

      itemData.count = itemCount

      table.insert(v.Inventory.Items,itemData)

      if tonumber(Config.Version) > 1.2 then

        TriggerClientEvent("Allhousing:SyncHouse",-1,v)

      else

        TriggerClientEvent("Allhousing:Sync",-1,Houses)

      end

      SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

    end

  elseif itemType == "item_weapon" then

    local playerWeapon,playerAmmo,weaponLabel,components = GetPlayerWeapon(_source,itemName)

    if playerWeapon and playerAmmo then

      TakePlayerWeapon(_source,itemName)

      table.insert(v.Inventory.Weapons,{

        name = playerWeapon,

        ammo = playerAmmo,

        label = weaponLabel,

        components = components

      })

      if tonumber(Config.Version) > 1.2 then

        TriggerClientEvent("Allhousing:SyncHouse",-1,v)

      else

        TriggerClientEvent("Allhousing:Sync",-1,Houses)

      end

      SqlExecute("UPDATE "..((Config and Config.AllhousingTable) or "allhousing").." SET inventory=@inventory WHERE id=@id",{['@inventory'] = json.encode(v.Inventory),['@id'] = v.Id})

    end

  end        

end



if Config.UsingESX then

  Citizen.CreateThread(function()

    if not error_out then

      _print("[ESX]","Waiting for ESX.")

      while not ESX do Wait(0); end

      if not error_out then

        _print("[ESX]","Register ESX Callback.")

        ESX.RegisterServerCallback('Allhousing:GetInventory', GetInventory)

      end

    end

  end)

end



LockDoor = function(house)

  Houses[house.Id].Unlocked = false

  if tonumber(Config.Version) > 1.2 then

    TriggerClientEvent("Allhousing:SyncHouse",-1,Houses[house.Id])

  else

    TriggerClientEvent("Allhousing:Sync",-1,Houses)

  end

end



UnlockDoor = function(house)

  Houses[house.Id].Unlocked = true

  if tonumber(Config.Version) > 1.2 then

    TriggerClientEvent("Allhousing:SyncHouse",-1,Houses[house.Id])

  else

    TriggerClientEvent("Allhousing:Sync",-1,Houses)

  end

end



RegisterCallback("Allhousing:GetOutfits", GetOutfits)

RegisterCallback("Allhousing:GetOutfit", GetOutfit)

RegisterCallback("Allhousing:GetVehicles", GetVehicles)



RegisterNetEvent('Allhousing:GetItem')

AddEventHandler('Allhousing:GetItem', GetItem)



RegisterNetEvent('Allhousing:PutItem')

AddEventHandler('Allhousing:PutItem', PutItem)



RegisterNetEvent("Allhousing:CreateHouse")

AddEventHandler("Allhousing:CreateHouse", CreateHouse)



RegisterNetEvent("Allhousing:GiveKeys")

AddEventHandler("Allhousing:GiveKeys", GiveKeys)



RegisterNetEvent("Allhousing:BreakLockpick")

AddEventHandler("Allhousing:BreakLockpick", BreakLockpick)



RegisterNetEvent("Allhousing:TakeKeys")

AddEventHandler("Allhousing:TakeKeys", TakeKeys)



RegisterNetEvent("Allhousing:SellHouse")

AddEventHandler("Allhousing:SellHouse", SellHouse)



RegisterNetEvent("Allhousing:LockDoor")

AddEventHandler("Allhousing:LockDoor", LockDoor)



RegisterNetEvent("Allhousing:UnlockDoor")

AddEventHandler("Allhousing:UnlockDoor", UnlockDoor)



RegisterNetEvent("Allhousing:SetWardrobe")

AddEventHandler("Allhousing:SetWardrobe", SetWardrobe)



RegisterNetEvent("Allhousing:SetInventory")

AddEventHandler("Allhousing:SetInventory", SetInventory)



RegisterNetEvent("Allhousing:KnockOnDoor")

AddEventHandler("Allhousing:KnockOnDoor", KnockOnDoor)



RegisterNetEvent("Allhousing:InviteInside")

AddEventHandler("Allhousing:InviteInside", InviteInside)



RegisterNetEvent("Allhousing:UpgradeHouse")

AddEventHandler("Allhousing:UpgradeHouse", UpgradeHouse)



AddEventHandler("Allhousing:SetFurni", SetFurni)

AddEventHandler("Allhousing:GetGlobalOffset", function(cb) cb(Config.SpawnOffset); end)



if not Config.OtherStartEvent then

  MySQL.ready(function(...) Citizen.CreateThread(SqlCheck); end)

else

  AddEventHandler(Config.OtherStartEvent,SqlCheck)

end



Citizen.CreateThread(Init)