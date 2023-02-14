local PlayerPed = nil
local Player = nil
local post = nil
local isLoaded = false
local setInvis = false
local changePedMulti = false

LoadInterior(GetInteriorAtCoords(440.84, -983.14, 30.69))

local BlockedVehicleGenerators = {}
AddBlockedVehicleGenerator = function(position, maxDistance)
    table.insert(BlockedVehicleGenerators, {pos = position, maxDistance = maxDistance})
end
exports("AddBlockedVehicleGenerator", AddBlockedVehicleGenerator)

local limit = 50.0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        local letSleep = true
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(BlockedVehicleGenerators) do
            local distance = #(pos - v.pos)

            if distance <= v.maxDistance then
                letSleep = false
                RemoveVehiclesFromGeneratorsInArea(v.pos.x - limit, v.pos.y - limit, v.pos.z - 300.0, v.pos.x + limit, v.pos.y + limit, v.pos.z + 300.0)
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local letSleep = true
        local pos = vector3(-137.84, 914.02, 235.81)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local distance = #(pos - playerCoords)

        if distance <= 125.0 then
            letSleep = false
            ClearAreaOfVehicles(-137.84, 914.02, 235.81, 125.0, false, false, false, false, false)
        end

        if letSleep then
            Wait(2000)
        end
    end
end)

CreateThread(function()
	for i = 1, 16 do
		EnableDispatchService(i, false)
	end
end)

Citizen.CreateThread(function()    
    while true do
        Citizen.Wait(0)
        Player = PlayerId()
		
		local playerPed = PlayerPedId()
        pos = GetEntityCoords(playerPed)

        if IsPedArmed(playerPed, 6) then
            SetPlayerLockonRangeOverride(Player, 0.0)
        end
        
        -- disableEmergencyServices.
        SetDispatchCopsForPlayer(Player, false)-- PoliceAutomobileDispatch

        SetPlayerWantedLevel(Player, 0, false)
		SetPlayerWantedLevelNow(Player, false)
		SetPlayerWantedLevelNoDrop(Player, 0, false)

        SetCreateRandomCops(false) -- Enable/Disable Random Cops
		SetCreateRandomCopsNotOnScenarios(false) --- Enable/Disable Spawn Cops Off Scenarios
        SetCreateRandomCopsOnScenarios(false) -- Enable/Disable Spawn Cops On Scenarios
        
        --RemoveVehiclesFromGeneratorsInArea(pos['x'] - 900.0, pos['y'] - 900.0, pos['z'] - 900.0, pos['x'] + 900.0, pos['y'] + 900.0, pos['z'] + 900.0);
        
        ResetPlayerStamina(Player)
        DistantCopCarSirens(false)

        SetVehicleDensityMultiplierThisFrame(0.5)
		SetParkedVehicleDensityMultiplierThisFrame(0.7)
    end
end)

Citizen.CreateThread(function()    
    while true do
        Citizen.Wait(400)
        ClearAreaOfCops(pos['x'], pos['y'], pos['z'], 400.0)
    end
end)

Citizen.CreateThread(function() 
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam() --Disable the vehicle idle camera
		Wait(25000) --The idle camera activates after 30 second so we don't need to call this per frame
		
		SetWeaponsNoAutoswap(true)
        --print("Set No Auto Swap to True")
	end 
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0) -- Wait 0 seconds to prevent crashing.
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(2)
        HideHudComponentThisFrame(14)
		HideHudComponentThisFrame(16) -- Radio Wheel disabled
        HideHudComponentThisFrame(20)
    end
end)

-- Forsøg på at stoppe eksplosioner på stribe.
AddEventHandler('explosionEvent', function(sender, ev)
    CancelEvent()
end)

CheckModel = function()
    Citizen.CreateThread(function()
        while not isLoaded do
            local playerPed = GetPlayerPed(-1)

            if GetEntityModel(playerPed) == GetHashKey('a_m_y_hipster_01') then
                local playerCoords = GetEntityCoords(playerPed)

                SetEntityVisible(playerPed, false)
                ClearAreaOfPeds(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1)
                ClearAreaOfVehicles(playerCoords.x, playerCoords.y, playerCoords.z, 200, false, false, false, false, false)

                --SetVehicleDensityMultiplierThisFrame(0.5)
                -- SetRandomVehicleDensityMultiplierThisFrame(0.0)
                -- SetParkedVehicleDensityMultiplierThisFrame(0.0)
                -- SetPedDensityMultiplierThisFrame(0.0)
                -- SetScenarioPedDensityMultiplierThisFrame(0.0)
            else
                print('Loaded in')
                SetEntityVisible(playerPed, true)
                setInvis = false
                isLoaded = true
                CheckLocation()
            end
            Citizen.Wait(0)
        end
    end)
end

CheckLocation = function()
    Citizen.CreateThread(function()
		print('Check Ped Location')
        Wait(10000)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local coordZero = vector3(0.0, 0.0, 0.0)
        local distance = #(playerCoords - coordZero)

        if distance <= 40.0 then
			print('Moved Ped from 0')
            SetEntityCoords(GetPlayerPed(-1), -268.99, -956.58, 30.58, 1, 0, 0, 1)
        end
		
		print('Starting Audio Scene')
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    end)
end

BlockPeds = function()
    Citizen.CreateThread(function()
        print('Block Peds From Spawning')
        while not changePedMulti do           
            --SetVehicleDensityMultiplierThisFrame(0.0)
            --SetRandomVehicleDensityMultiplierThisFrame(0.0)
            --SetParkedVehicleDensityMultiplierThisFrame(0.0)
    
            Citizen.Wait(0)
        end
    end)
end

vBasicSRP = function()
    Citizen.CreateThread(function()
		print('Wait 2 min to set Multipliers')
        Wait(120000)
        print('Activate Ped Multipliers')
        changePedMulti = true

        while true do           
            --SetVehicleDensityMultiplierThisFrame(0.5)
            --SetRandomVehicleDensityMultiplierThisFrame(0.4)
            --SetParkedVehicleDensityMultiplierThisFrame(0.5)

            Citizen.Wait(0)
        end
    end)
end

AddEventHandler("playerSpawned", function()
    print('Aktivere Check model')
    --BlockPeds()
    CheckModel()
end)

RegisterCommand("door", function(source, args, rawCommand)
	if args[1] then
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			local door = tonumber(args[1])

			local angle = GetVehicleDoorAngleRatio(vehicle, door)
			if angle == 0.0 then
				SetVehicleDoorOpen(vehicle, door, 0, 0)
			else
				SetVehicleDoorShut(vehicle, door, 0)
			end
		else
			print("No Vehicle")
		end
	else
		print("No Args")
	end
end)

-- RegisterCommand("cinv", function(source, args, rawCommand)
--     local playerPed = PlayerPedId()
--     SetEntityVisible(playerPed, false)
-- end, false)

-- DisableAimLock = function(toggle)
--     if toggle then
--         SetPlayerLockon(PlayerId(), false)
--         SetPlayerTargetingMode(2)
--     else
--         SetPlayerLockon(PlayerId(), true)
--     end
-- end

-- local toggleAimLock = false

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(500)
-- 		if GetSelectedPedWeapon(PlayerPedId()) ~= -1569615261 then
--             if not toggleAimLock then
--                 toggleAimLock = true
--                 DisableAimLock(true)
--             end
--         else
--             if toggleAimLock then
--                 toggleAimLock = false
--         	    DisableAimLock(false)
--             end
-- 		end
-- 	end
-- end)
