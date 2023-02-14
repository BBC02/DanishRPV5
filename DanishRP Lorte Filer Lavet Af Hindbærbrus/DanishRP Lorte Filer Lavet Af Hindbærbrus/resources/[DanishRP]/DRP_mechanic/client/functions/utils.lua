KeyBlocker = function()
    Citizen.CreateThread(function()
        while isBusy do
            DisableControlAction(0, 84, true)
            DisableControlAction(0, 48, true)
            Wait(0)
        end
    end)
end

GotItem = function(item)
    for k, v in pairs(ESX.GetPlayerData().inventory) do
        if v.name == item then
            if v.count >= 1 then
                return true
            else
                return false
            end
        end
    end
end

GetVehicleInFront = function()
    local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
    local plyOffset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 5.0, 0.0)
    local rayHandle = StartShapeTestCapsule(plyCoords.x, plyCoords.y, plyCoords.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 10, GetPlayerPed(PlayerId()), 7)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

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
        local factor = (string.len(text)) / 570
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 90)
    end
end

networkControl = function(entity)
    local netId = NetworkGetNetworkIdFromEntity(entity)
    
    local attempts = 0
    
    while not NetworkHasControlOfNetworkId(netId) do
        NetworkRequestControlOfNetworkId(netId)
        
        attempts = attempts + 1
        if attempts == 100 then
            return false
        end
        Wait(0)
    end
    
    return true
end

toggleDoor = function(vehicle, door)
	if GetVehicleDoorLockStatus(vehicle) ~= 2 then 
		if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
			SetVehicleDoorShut(vehicle, door, false)
		else
			SetVehicleDoorOpen(vehicle, door, false)
		end
	end
end

getVehicleData = function(entity)
    local vehicleModel = GetEntityModel(entity)
    local vehicleDisplayName = GetDisplayNameFromVehicleModel(vehicleModel)
    local vehicleNumberplate = GetVehicleNumberPlateText(entity)

    table.insert(lastVehicle, {entity = entity, name = vehicleDisplayName, plate = vehicleNumberplate})
end

clearTable = function(array)
    for k, v in ipairs(array) do
        table.remove(array, 1)
    end
end

function firstToUpper(str)
    return str.lower(str)
end

function print_r(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end
    sub_print_r(t, "  ")
end
