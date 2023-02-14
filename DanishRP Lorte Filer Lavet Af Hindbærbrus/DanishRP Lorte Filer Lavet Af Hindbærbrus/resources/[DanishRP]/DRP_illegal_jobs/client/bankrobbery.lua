local jobName = "bankRobbery"
local BlowTorchTime = 20

local Time, Stage, rewards, hasTask = 0, 0, 0, false
local SelectedBank, CurrentStage, DrillProp = nil, nil, nil

Banks = {
    ["fleeca"] = {
        name = "Midtby Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(147.349,-1046.24,29.3681, 250.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(148.03, -1044.36, 29.50),
                    obj = "v_ilev_gb_vauldr",
                    heading = 150.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(149.24, -1047.06, 29.5, 160.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(149.24, -1047.06, 29.50),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(146.81, -1048.5, 29.50, 70.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(148.26, -1050.72, 29.50, 160.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(150.30, -1049.84, 29.50, 250.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["fleeca2"] = {
        name = "Great Ocean Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(-2956.52, 481.79, 15.80, 0.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(-2956.52, 481.79, 15.80),
                    obj = "hei_prop_heist_sec_door",
                    heading = 260.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(-2956.27, 484.24, 15.80, 270.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(-2956.27, 484.24, 15.80),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(-2954.07, 482.46, 15.80, 180.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(-2952.51, 484.33, 15.80, 270.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(-2954.03, 486.29, 15.80, 0.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["fleeca3"] = {
        name = "Rockford Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(-1210.87, -336.46, 37.90, 300.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(-1210.87, -336.46, 37.90),
                    obj = "v_ilev_gb_vauldr",
                    heading = 200.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(-1208.11, -335.63, 37.90, 210),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(-1208.11, -335.63, 37.90),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(-1209.01, -338.22, 37.90, 120.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(-1206.44, -338.83, 37.90, 210.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(-1205.56, -336.48, 37.90, 300.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["fleeca4"] = {
        name = "Burton Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(-353.87, -55.29, 49.20, 250.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(-353.87, -55.29, 49.20),
                    obj = "v_ilev_gb_vauldr",
                    heading = 160.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(-351.32, -56.51, 49.20, 160.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(-351.32, -56.51, 49.20),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(-353.67, -57.71, 49.20, 70.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(-352.50, -59.90, 49.20, 160.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(-350.20, -59.15, 49.20, 250.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["fleeca5"] = {
        name = "Alta Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(311.22, -284.52, 54.30, 250.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(311.22, -284.52, 54.30),
                    obj = "v_ilev_gb_vauldr",
                    heading = 160.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(313.73, -285.54, 54.30, 160.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(313.73, -285.54, 54.30),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(311.2, -286.94, 54.30, 70.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(312.59, -289.1, 54.30, 160.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(314.82, -288.31, 54.30, 250.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["fleeca6"] = {
        name = "Route68 Fleeca Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(1175.72, 2712.85, 38.10, 90.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(1172.77, 2713.25, 38.06),
                    obj = "v_ilev_gb_vauldr",
                    heading = 0.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(1173.64, 2712.77, 38.40, 180.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(1172.77, 2713.25, 38.06),
                    obj = "v_ilev_gb_vaubar",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(1171.25, 2715.15, 38.40, 270.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(1173.15, 2716.81, 38.40, 180.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(1175.26, 2715.15, 38.40, 90.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
    ["paletobank"] = {
        name = "Paleto Bank",
        actions = {
            ["hackdoor"] = {
                pos = vector4(-105.54, 6471.84, 31.80, 45.0),
                text = "Tryk ~r~[H]~w~ for at påbegynde hack",
                stage = 0,
                door = {
                    pos = vector3(-104.6049, 6473.443, 31.80),
                    obj = "v_ilev_cbankvauldoor01",
                    heading = 135.0,
                    locked = true
                }
            },
            ["breakdoor"] = {
                pos = vector4(-105.84, 6475.52, 31.80, 315.0),
                text = "Tryk ~r~[H]~w~ for at lockpick låsen",
                stage = 1,
                door = {
                    pos = vector3(-105.79, 6474.88, 31.80),
                    obj = "v_ilev_cbankvaulgate02",
                    locked = true
                }
            },
            ["breakup1"] = {
                pos = vector4(-102.85, 6475.63, 31.80, 225.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup2"] = {
                pos = vector4(-103.28, 6478.28, 31.80, 315.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
            ["breakup3"] = {
                pos = vector4(-105.86, 6478.57, 31.80, 45.0),
                text = "Tryk ~r~[H]~w~ for at bryde skab op",
                stage = 2,
                hasCompleted = false,
            },
        },
    },
}


CreateThread(function()
    while true do
        Citizen.Wait(2)
        local letSleep = true

        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)

        if not hasTask then
            for name, bank in pairs(Banks) do
                for k, v in pairs(bank.actions) do
                    if v.stage == Stage then
                        if v.hasCompleted == nil or not v.hasCompleted then
                            local pos = vector3(v.pos.x, v.pos.y, v.pos.z)
                            local distance = #(pos - playerCoords)

                            if distance <= 1.0 then
                                letSleep = false
                                DrawText3D(pos.x, pos.y, pos.z, v.text)

                                if IsControlJustReleased(0, Keys['H']) and (GetGameTimer() - Time) > 1000 then
                                    Time = GetGameTimer()
                                    ExecuteAction(name, k)
                                end
                            end
                        end
                    end

                    if v.door ~= nil then
                        local doorDistance = #(playerCoords - v.door.pos)
                        if doorDistance <= 2.0 then
                            letSleep = false
                            ApplyDoorState(v.door.pos, v.door.obj, v.door.locked)
                        end
                    end
                end
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)


ExecuteAction = function(bank, action)
    hasTask = true

    SelectedBank = bank
    CurrentStage = action

    local BankHeist = Banks[SelectedBank]["actions"][CurrentStage]
    local playerPed = PlayerPedId()

    if action == "hackdoor" then

        Debug("Checking Startup Conditions")


        Debug("Starting Hacking")

        SetEntityHeading(playerPed, BankHeist.pos.w)
        FreezeEntityPosition(playerPed, true)
        
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", 3, 60, ForceDoorHeading)
        TriggerServerEvent("savanha_bankrobbery:startJobSV")

    
    elseif action == "breakdoor" then
        Debug("Checking Item Conditions")

        ESX.TriggerServerCallback('savanha_bankrobbery:hackerDevice', function(gotDevice)
            if gotDevice then
                Debug("Starting Lockpicking")
                local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    RequestAnimDict(animDict)
                    Citizen.Wait(10)
                end

                SetEntityHeading(playerPed, BankHeist.pos.w)
                FreezeEntityPosition(playerPed, true)

                TaskPlayAnim(playerPed, animDict, "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 1, 0, 0, 0)

                TriggerEvent("lockpicking:StartMinigame", 2, function(didWin)
                    if didWin then
                        exports['mythic_notify']:DoHudText('success', "Du er igennem døren!", 5000)
                        Stage = Stage + 1
                        Banks[SelectedBank]["actions"][CurrentStage]["door"]["locked"] = false
                    else
                        exports['mythic_notify']:DoHudText('error', 'Du ødelagde din lockpick!', 5000)
                    end

                    RemoveAnimDict(animDict)
                    FreezeEntityPosition(playerPed, false)
                    ClearPedTasksImmediately(playerPed)

                    hasTask = false
                end)
            else
                hasTask = false
                exports['mythic_notify']:DoHudText('error', 'Du har ingen hackerdevice.', 5000)
            end
        end)
    elseif action == "breakup1" or action == "breakup2" or action == "breakup3" then
        ESX.TriggerServerCallback('savanha_bankrobbery:drillItem', function(hasDrill)
            if hasDrill then
                hasTask = true

                exports['mythic_notify']:DoHudText('inform', "Brug PIL OP & PIL NED for at bruge boremaskinen.", 10000)

                local animDict = "anim@heists@fleeca_bank@drilling"
                local prop_hash = GetHashKey("hei_prop_heist_drill")

                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(10)
                end

                RequestModel(prop_hash)
                while not HasModelLoaded(prop_hash) do
                    Wait(0); 
                end

                local coords = GetEntityCoords(playerPed)
                local offsetPosition = GetAnimInitialOffsetPosition(animDict, "drill_straight_idle", coords.x, coords.y, coords.z, coords.x, coords.y, coords.z, 0, 2)
                local attachPosition = GetPedBoneCoords(playerPed, 57005, offsetPosition.x, offsetPosition.y, offsetPosition.z)

                DrillProp = CreateObject(prop_hash, attachPosition.x, attachPosition.y, attachPosition.z, false, false, false)
                AttachEntityToEntity(DrillProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, 270.0, 90.0, 0.0, true, true, false, true, 1, true)
                TaskPlayAnim(playerPed, animDict, "drill_straight_idle", 8.0, -8.0, -1, 33, 1, 0, 0, 0)

                SetModelAsNoLongerNeeded(prop_hash)
                RemoveAnimDict(animDict)

                Savanha.MiniGame.Drilling.ToggleDrilling(true, 'Savanha_bankrobbery:finishDrilling')
            else
                hasTask = false
                exports['mythic_notify']:DoHudText('error', 'Du har ingen boremaskine.', 5000)
            end
        end, "drill")
    end
end

ApplyDoorState = function(coords, object, state)
    local closeDoor = GetClosestObjectOfType(coords.x, coords.y, coords.z, 2.0, GetHashKey(object), false, false, false)
    FreezeEntityPosition(closeDoor, state)
end

ForceDoorHeading = function(success, timeremaining)
    local start = GetGameTimer()

    TriggerEvent('mhacking:hide')
    FreezeEntityPosition(PlayerPedId(), false)

    if success then
        exports['mythic_notify']:DoHudText('success', "Systemet er hacked! Afvent døren.", 5000)
        local minutes = math.random(3, 5)
        local time = (minutes * 1000) * 1

        DrawBusySpinner("Afvent åbning af bankboksen")
        while GetGameTimer() - start < time do 
            Wait(0); 
        end

        RemoveLoadingPrompt()
        exports['mythic_notify']:DoHudText('success', "Du er igennem!", 5000)

        local BankHeist = Banks[SelectedBank]["actions"][CurrentStage]
        local door = BankHeist["door"]

        local closeDoor = GetClosestObjectOfType(door.pos.x, door.pos.y, door.pos.z, 2.0, GetHashKey(door.obj), false, false, false)
        SetEntityHeading(closeDoor, door.heading)

        Stage = Stage + 1
        ClearPedTasks(player)
        FreezeEntityPosition(player, false)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        TriggerServerEvent('esx_outlawalert:fleecabank', {
            x = ESX.Math.Round(playerCoords.x, 1),
            y = ESX.Math.Round(playerCoords.y, 1),
            z = ESX.Math.Round(playerCoords.z, 1)
        }, streetName, playerGender)
    else
        exports['mythic_notify']:DoHudText('error', 'Du fejlede at hack!', 5000)
    end

    hasTask = false
end

RegisterNetEvent("Savanha_bankrobbery:syncDoor")
AddEventHandler("Savanha_bankrobbery:syncDoor", function(bank, stage)
    UnlockDoor(bank, stage)
end)

RegisterNetEvent("Savanha_bankrobbery:finishDrilling")
AddEventHandler("Savanha_bankrobbery:finishDrilling", function()
    local playerPed = PlayerPedId()

    TriggerServerEvent('savanha_bankrobbery:safeReward')
    Banks[SelectedBank]["actions"][CurrentStage]["hasCompleted"] = true

    DeleteObject(DrillProp)
    FreezeEntityPosition(playerPed, false)
    ClearPedTasksImmediately(playerPed)

    rewards = rewards + 1

    if rewards >= 3 then
        ResetRobbery()
    end

    hasTask = false
end)

UnlockDoor = function(bank, stage)
    Banks[bank]["actions"][stage]["door"]["locked"] = false
end

ResetRobbery = function()
    Debug("Finish Bank Robbery")

    rewards = 0
    Stage = 0

    SelectedBank = nil
    CurrentStage = nil
    DrillProp = nil
end