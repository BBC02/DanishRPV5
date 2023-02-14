local jobName = "stockadeRobbery"
local RobTimer = 60

local CurrentRobbery, CurrentPeds, combatPeds = {}, {}, {}
local hasTask, isActiveRobbery, hasSpawned, hasAgro, hasBlowned, hasPlanted, hasRobbed, PoliceAlerted, ExplosionAlerted = false, false, false, false, false, false, false, false, false

local plate = nil
local hasBeenSeened = false
local hasBeenCleaned = false
local TargetBlip = nil
local Time = 0

StockadeScenarios = {
    [1] = {
        location = vector3(-2944.62, 478.52, 14.85),
        heading = 357.5,
        peds = {
            [1] = {
                type = 's_m_m_security_01',
                location = vector3(-2951.63, 492.20, 15.30),
                heading = 88.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [2] = {
                type = 's_m_m_security_01',
                location = vector3(-2951.63, 465.06, 15.16),
                heading = 88.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [3] = {
                type = 's_m_m_security_01',
                location = vector3(-2944.81, 473.47, 15.25),
                heading = 176.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [4] = {
                type = 's_m_m_security_01',
                location = vector3(-2936.03, 477.80, 15.23),
                heading = 246.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
        }
    },
    [2] = {
        location = vector3(-1213.44, -352.51, 36.89),
        heading = 300.5,
        peds = {
            [1] = {
                type = 's_m_m_security_01',
                location = vector3(-1200.88, -354.16, 37.28),
                heading = 189.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [2] = {
                type = 's_m_m_security_01',
                location = vector3(-1199.43, -364.58, 37.28),
                heading = 8.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [3] = {
                type = 's_m_m_security_01',
                location = vector3(-128.53, -354.85, 37.28),
                heading = 211.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
            [4] = {
                type = 's_m_m_security_01',
                location = vector3(-1217.63, -360.84, 37.28),
                heading = 230.5,
                weapon = 'WEAPON_COMBATPISTOL',
                scenario = "WORLD_HUMAN_GUARD_STAND",
            },
        }
    },
}

StartStockadeRobbery = function()
    ESX.TriggerServerCallback("savanha:checkItemTruck", function(hasItem)
        if hasItem then
            ESX.TriggerServerCallback('savanha_bankrobbery:copCount', function(cops)
                if cops >= Config.RequiredCops then
                            
                    isActiveRobbery = true
                    local index = math.random(1, #StockadeScenarios)
                    CurrentRobbery = StockadeScenarios[index]

                    CreateBlipRoute(CurrentRobbery["location"], 'Find Pengetransporteren', function(blip)
                        TargetBlip = blip
                    end)

                    TriggerServerEvent('savanha:removeitemTruckTransporter')

                    exports['mythic_notify']:DoHudText('success', 'Find transporteren og røv den.', 5000)

                    Citizen.CreateThread(function()
                        while isActiveRobbery do
                            Citizen.Wait(2)
                            local letSleep = true
                            if not hasTask then
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local distance = #(playerCoords - CurrentRobbery["location"])
                                if distance <= Config.CarSpawnDistance or hasSpawned then
                                    if not hasSpawned then
                                        SpawnScenario()
                                    end
                                    AgroScenario()
                                    if hasSpawned and hasAgro and not hasRobbed then
                                        if not IsPedInAnyVehicle(playerPed) then
                                            local found, vehicle, vehplate = ClosestVehicle()
                                            if found then
                                                if plate == vehplate then

                                                    local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
                                                    local pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, d1.y-0.2, 0.0)
                                                    local trunkDistance = #(playerCoords - vector3(pos.x, pos.y, pos.z))

                                                    if trunkDistance <= 2.0 then
                                                        if hasBlowned then
                                                            letSleep = false
                                                            DrawText3D(pos.x, pos.y, pos.z + 1.0, 'Tryk ~r~[H]~w~ for at tømme køretøjet')
                                                            if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                                                Time = GetGameTimer()
                                                                RobbingTheMoney(vehicle)
                                                            end
                                                        elseif not hasPlanted then

                                                            letSleep = false

                                                            DrawText3D(pos.x, pos.y, pos.z + 1.0, 'Tryk ~r~[H]~w~ for at putte C4 på køretøjet')
                                                            if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                                                Time = GetGameTimer()
                                                                ESX.TriggerServerCallback("savanha:checkItemTruckbank", function(hasItem)
                                                                    if hasItem then
                                                                        PlantExplosive(vehicle)
                                                                    else
                                                                        exports['mythic_notify']:DoHudText("error", "Du har ikke en C4 på dig.")
                                                                    end
                                                                end, "c4_bank")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end

                                if distance > (Config.CarSpawnDistance / 2) and hasSpawned and hasAgro then
                                    CleanScenario()
                                end

                                if distance > (Config.CarSpawnDistance / 2) and hasBeenCleaned and hasBlowned and hasRobbed then
                                    EndScenario()
                                end

                            end

                            if letSleep then
                                Citizen.Wait(500)
                            end
                        end
                    end)

                else
                    exports['mythic_notify']:DoHudText('error', 'Der er ikke nok Politi på arbejde.', 5000)
                end
            end)
        else
            exports['mythic_notify']:DoHudText('error', 'Du har ingen kørselsplan.', 5000)
        end
    end, "transporter_scheme")
end

PlantExplosive = function(vehicle)
    local playerPed = PlayerPedId()
    local _,wep = GetCurrentPedWeapon(playerPed)
    if wep ~= GetHashKey("WEAPON_UNARMED") then
        exports['mythic_notify']:DoHudText("error", 'Din hånd skal være fri!')
        return
    end

    hasTask = true
    hasPlanted = true

    Debug("Starting Plating Explosive")

    local animDict = "anim@heists@ornate_bank@thermal_charge_heels"
    local model = "prop_c4_final_green"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(50)
    end

    FreezeEntityPosition(playerPed, true)
    SetEntityHeading(playerPed, GetEntityHeading(vehicle))

    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local ItemC4prop = CreateObject(GetHashKey(model), x, y, z + 0.2,  true,  true, true)
    AttachEntityToEntity(ItemC4prop, playerPed, GetPedBoneIndex(playerPed, 60309), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
    TaskPlayAnim(playerPed, animDict, "thermal_charge", 3.0, -8, -1, 63, 0, 0, 0, 0)

    exports['progressBars']:startUI(5000, 'Påsætter C4')
    Citizen.Wait(5500)

    ClearPedTasks(playerPed)
    DetachEntity(ItemC4prop)
    AttachEntityToEntity(ItemC4prop, vehicle, GetEntityBoneIndexByName(vehicle, 'door_pside_r'), -0.7, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(model)

    TriggerServerEvent("savanha:removeitemTruckBankc4")
    FreezeEntityPosition(playerPed, false)

    exports['progressBars']:startUI(10000, 'Afventer eksplosion')
    Citizen.Wait(10000)

    SetVehicleDoorBroken(vehicle, 2, false)
    SetVehicleDoorBroken(vehicle, 3, false)

    local C4Location = GetEntityCoords(ItemC4prop)
    DeleteEntity(ItemC4prop)
    AddExplosion(C4Location.x, C4Location.y, C4Location.z, 'EXPLOSION_STICKYBOMB', 2.0, true, false, 2.0)
    ApplyForceToEntity(vehicle, 0, C4Location.x, C4Location.y, C4Location.z, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(vehicle, 'door_pside_r'), true, true, true, true, true)
    SetVehicleEngineHealth(vehicle, -4000)

    AlertExplosionPolice()

    exports['mythic_notify']:DoHudText("success", 'Du kan nu røve transporteren!')
    hasBlowned = true
    hasTask = false
end

RobbingTheMoney = function(vehicle)
    hasTask = true

    Debug("Starting Robbing Money")

    local playerPed = PlayerPedId()
    local animDict = "anim@heists@ornate_bank@grab_cash_heels"
    local model = "prop_cs_heist_bag_02"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(50)
    end
    
    local pos = GetEntityCoords(playerPed)
    local moneyBag = CreateObject(GetHashKey(model), pos.x, pos.y,pos.z, true, true, true)
    AttachEntityToEntity(moneyBag, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
    TaskPlayAnim(playerPed, animDict, "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
    SetModelAsNoLongerNeeded(model)

    FreezeEntityPosition(playerPed, true)
    
    local robtime = RobTimer * 1000
    exports['progressBars']:startUI(robtime, 'Tømmer Transporteren')
    Citizen.Wait(robtime)

    TriggerServerEvent('savanha:jobReward')
    
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
    DeleteEntity(moneyBag)

    local vehicleBlip = GetBlipFromEntity(vehicle)
    if DoesBlipExist(vehicleBlip) then
        RemoveBlip(vehicleBlip)
        TargetBlip = nil
    end

    hasRobbed = true
    hasTask = false
end

AlertStockadePolice = function()
    if not PoliceAlerted then
        PoliceAlerted = true


        local playerCoords = GetEntityCoords(PlayerPedId())
        streetName = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        TriggerServerEvent('esx_outlawalert:pengetransporter', {
            x = ESX.Math.Round(playerCoords.x, 1),
            y = ESX.Math.Round(playerCoords.y, 1),
            z = ESX.Math.Round(playerCoords.z, 1)
        }, streetName, playerGender)
    end
end

AlertExplosionPolice = function()
    if not ExplosionAlerted then
        if not Chance(60) then return end
        
        ExplosionAlerted = true
        local playerCoords = GetEntityCoords(PlayerPedId())
        streetName = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        TriggerServerEvent('esx_outlawalert:pengetransportereksplosion', {
            x = ESX.Math.Round(playerCoords.x, 1),
            y = ESX.Math.Round(playerCoords.y, 1),
            z = ESX.Math.Round(playerCoords.z, 1)
        }, streetName, playerGender)
    end
end

SpawnScenario = function()
    hasSpawned = true

    Debug("Starting Spawning Scenario")

    SpawnVehicle('stockade', CurrentRobbery["location"], CurrentRobbery["heading"], function(spawnVehicle)
        local platenum = math.random(1000, 9999)
        local newPlate = 'SEC' .. platenum
        SetVehicleNumberPlateText(spawnVehicle, newPlate)
        exports["LegacyFuel"]:SetFuel(spawnVehicle, 100)

        plate = newPlate

        RemoveBlip(TargetBlip)
        CreateEntityBlipRoute(spawnVehicle, "Røv køretøjet", function(blip)
            TargetBlip = blip
        end)

        for i = 1, #CurrentRobbery["peds"], 1 do
            local ped = CurrentRobbery["peds"][i]
            local pedSpawn = vector3(ped.location.x, ped.location.y, ped.location.z - 0.50)

            local hash = GetHashKey(ped.type)
            SpawnPed(hash, pedSpawn, ped.heading, 5, function(spawnPed)
                SetPedRelationshipGroupHash(spawnPed, GetHashKey("KOS"))
                SetPedFleeAttributes(spawnPed, 0, 0)
                SetPedCombatAttributes(spawnPed, 46, 1)
                SetPedCombatAbility(spawnPed, 100)
                SetPedCombatMovement(spawnPed, 2)
                SetPedCombatRange(spawnPed, 2)
                SetPedKeepTask(spawnPed, true)
                GiveWeaponToPed(spawnPed, GetHashKey(ped.weapon:upper()), 250, false, true)

                table.insert(CurrentPeds, spawnPed)
            end)
        end
    end)
end

AgroScenario = function()
    if hasAgro then return end
    Debug("Agro Scenario")

    local playerPed = PlayerPedId()
    for i=1, #CurrentPeds, 1 do
        local ped = CurrentPeds[i]

        if not IsEntityDead(ped) and not combatPeds[ped] == true then
            if HasEntityClearLosToEntityInFront(ped, playerPed) or HasEntityClearLosToEntity(ped, playerPed, 17) or hasPedsAgro then
                TaskCombatPed(ped, playerPed, 0, 16)
                combatPeds[ped] = true

                hasAgro = true
            end
        end
    end

    if hasAgro then
        AlertStockadePolice()
    end
end

CleanScenario = function()
    Debug("Clean Scenario")

    for i=1, #CurrentPeds, 1 do
        DeletePed(CurrentPeds[i])
    end

    CurrentPeds = {}
    hasBeenCleaned = true
end

EndScenario = function()
    CurrentRobbery, combatPeds = {}, {}
    hasTask, isActiveRobbery, hasSpawned, hasAgro, hasBlowned, hasPlanted, hasRobbed, PoliceAlerted, ExplosionAlerted = false, false, false, false, false, false, false, false, false
    hasBeenCleaned = false
    plate = nil
end