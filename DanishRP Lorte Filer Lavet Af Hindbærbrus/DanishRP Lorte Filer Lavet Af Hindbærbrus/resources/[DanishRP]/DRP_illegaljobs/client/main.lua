ESX = nil
SRP = nil

hackFinished, hackStatus = false, false
local isInMenu = false

local isPedSpawned = false
local isWeaponPedSpawned = false

hasTask = false
Time = 0
hariktarget = true
peds = {}
objects = {}

RobberyDoors = {}
BankStageHandlers, NationalStageHandlers, HumaneHandlers, UnionStageHandlers = {}, {}, {}, {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end

	while SRP == nil do
		TriggerEvent('srp:getSharedObject', function(obj) SRP = obj end)
		Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()

    SendNUIMessage({
        init = true,
        NameResource = {GetCurrentResourceName(), GetCurrentServerEndpoint()},
    })

    SetupMissionNPC()
    StartIllegalJobsLoop()

    local filteredModels = {}
   -- RobberyDoors = lib.callback.await('srp_illegaljobs:GetDoors', false)

    while isTableEmpty(NationalStageHandlers) do
        Wait(500)
    end

    for k, v in pairs(NationalStageHandlers) do
        if v.targetModel and not v.boxZone and v.label then
            if not filteredModels[v.targetModel] then
                filteredModels[v.targetModel] = {}
            end

            if not filteredModels[v.targetModel][v.label] then
                filteredModels[v.targetModel][v.label] = { handler = "national", icon = v.icon }
            end
        end
    end

    while isTableEmpty(HumaneHandlers) do
        Wait(500)
    end

    for k, v in pairs(HumaneHandlers) do
        if v.targetModel and not v.boxZone and v.label then
            if not filteredModels[v.targetModel] then
                filteredModels[v.targetModel] = {}
            end

            if not filteredModels[v.targetModel][v.label] then
                filteredModels[v.targetModel][v.label] = { handler = "humaneRobbery", icon = v.icon }
            end
        end
    end

    while isTableEmpty(UnionStageHandlers) do
        Wait(500)
    end

    for k, v in pairs(UnionStageHandlers) do
        if v.targetModel and not v.boxZone and v.label then
            if not filteredModels[v.targetModel] then
                filteredModels[v.targetModel] = {}
            end

            if not filteredModels[v.targetModel][v.label] then
                filteredModels[v.targetModel][v.label] = { handler = "unionRobbery", icon = v.icon }
            end
        end
    end

    while isTableEmpty(BankStageHandlers) do
        Wait(500)
    end

    for bank, bankHandler in pairs(BankStageHandlers) do
		for k, v in pairs(bankHandler) do
            if v.targetModel and not v.boxZone and v.label then
                if not filteredModels[v.targetModel] then
                    filteredModels[v.targetModel] = {}
                end
    
                if not filteredModels[v.targetModel][v.label] then
                    filteredModels[v.targetModel][v.label] = { handler = "bankRobbery", icon = v.icon }
                end
            end
        end
    end

    for model, modelOptions in pairs(filteredModels) do
        for label, option in pairs(modelOptions) do
            exports.qtarget:AddTargetModel({ model }, {
                options = {
                    {
                        icon = option.icon,
                        label = label,
                        action = function(entity)
                            if option.handler == "national" then
                                local handlerID, handler, closestHandler = GetClosestBankHandler()
                                NationalActionHandler(handlerID, handler, entity)
                                return
                            end

                            if option.handler == "humaneRobbery" then
                                local handlerID, handler, closestHandler = GetClosestHumaneHandler()
                                HumaneActionHandler(handlerID, handler, entity)
                                return
                            end

                            if option.handler == "unionRobbery" then
                                local handlerID, handler, closestHandler = GetClosestUnionHandler()
                                UnionActionHandler(handlerID, handler, entity)
                                return
                            end

                            if option.handler == "bankRobbery" then
                                local handlerBank, handlerID, handler, closestHandler = GetClosestNormalBankHandler()
                                BankActionHandler(handlerBank, handlerID, handler, entity)
                                return
                            end
                        end,
                        canInteract = function(entity)
                            if option.handler == "national" then
                                return ValidateBankHandler()
                            end

                            if option.handler == "humaneRobbery" then
                                return ValidateHumaneHandler()
                            end

                            if option.handler == "unionRobbery" then
                                return ValidateUnionHandler()
                            end

                            if option.handler == "bankRobbery" then
                                return ValidateNormalBankHandler()
                            end

                            return false
                        end,
                    },
                },
                distance = 2.0
            })
        end
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    StartIllegalJobsLoop()
end)

RegisterNetEvent('srp_illegaljobs:notifyReward')
AddEventHandler('srp_illegaljobs:notifyReward', function(rewards)
    if #rewards > 0 then
        for i = 1, #rewards, 1 do
            local name  = rewards[i]["name"]
            local count = rewards[i]["amount"]

            exports['mythic_notify']:SendAlert('success', 'Du fik ' .. ESX.Math.GroupDigits(count) .. 'x ' .. name, 5000)
        end
    end
end)

local helpTextIndex = -1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)

        local letSleep = true
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(RobberyDoors) do
            local distance = #(playerCoords - v.loc)

            if distance <= 30.0 then
                local doorOne = GetClosestObjectOfType(v.loc, 5.0, GetHashKey(v.model), false, false, false)
                if DoesEntityExist(doorOne) then
                    FreezeEntityPosition(doorOne, v.locked)

                    if v.locked then
                        SetEntityHeading(doorOne, v.heading)
                    end
                end

                local interactDistance = 1.5
                if v.interactDistance then
                    interactDistance = v.interactDistance
                end

                if ValidateJob('police') and distance <= interactDistance and not hasTask then
                    letSleep = false

                    if helpTextIndex == -1 then
                        local textLabel = "åbne døren"
                        if not v.locked then
                            textLabel = "lukke døren"
                        end

                        TriggerEvent('cd_drawtextui:ShowUI', "Tryk [E] for at " .. textLabel)
                        helpTextIndex = k
                    end

                    if IsControlJustReleased(0, Keys['E']) and (GetGameTimer() - Time) > 1000 then
                        Time = GetGameTimer()

                        lib.callback.await('srp_illegaljobs:Unlockdoor', false, k, true, not v.locked)

                        local animDict = "anim@heists@keycard@"
                        RequestAnimDict(animDict)
                        while not HasAnimDictLoaded(animDict) do
                            Wait(10);
                        end

                        if helpTextIndex == k then
                            TriggerEvent('cd_drawtextui:HideUI')
                            helpTextIndex = -1
                        end

                        TaskPlayAnim(playerPed, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
                        Wait(550)

                        ClearPedTasks(playerPed)
                        RemoveAnimDict(animDict)
                    end
                end

                if ValidateJob('police') and distance > interactDistance and not hasTask then
                    if helpTextIndex == k then
                        TriggerEvent('cd_drawtextui:HideUI')
                        helpTextIndex = -1
                    end
                end
            end
        end

        if letSleep then
            Citizen.Wait(2000)
            collectgarbage()
        end
        if hariktarget then
            exports.qtarget:Ped({
                options = {
                    {
                        event = 'crafterrerereer',
                        icon = 'fa-sharp fa-solid fa-screwdriver-wrench',
                        label = 'Åben Crafting Hints',
        
                        action = function(entity)
                            Citizen.Wait(100)
                            hints()
                        end,
                        canInteract = function(entity)
                            if IsPedModel((entity), 0x9855C974) then
                                return true
                            end
                            return false
                        end,
                        
                    },
        
                },
                distance = 3

            })
            hariktarget = false
        end
    end
end)
hints = function(entity)
	
    exports['progressBars']:startUI(500, "Tilgår crafting hints...")
    Citizen.Wait(500)
 --   table.insert(elements, { label = ('%s - <span style="color: lightgreen;">%s,- DKK Per Stk.</span>'):format("Tutorial #1", "2000"), value = v.price, name = v.item, key = k })
    local elements = {}
    table.insert(elements, {label = '<b>Start Tutorial</b>', value = 'sguide'})
    table.insert(elements, {label = '<span style="color: lightgreen;">Crafting Hint', value = 'cguide'})
    table.insert(elements, {label = '<span style="color: lightgreen;">Materiale Hint', value = 'mguide'})
    table.insert(elements, {label = '<span style="color: lightgreen;">Blueprint Hint', value = 'bguide'})

    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craft', {
        title = 'Peters Craft-Hjælp',
        align = 'left',
        elements = elements
    }, function(data, menu)
        menu.close()
        FreezeEntityPosition(playerPed, false)
        TriggerServerEvent("craft:buyitem", data.current.name, data.current.value)


    end, function(data, menu)
        menu.close()
        collectgarbage()
        FreezeEntityPosition(playerPed, false)
    end)
end

RegisterNetEvent("srp_illegaljobs:UpdateDoors", function(doors)
    RobberyDoors = doors
end)

StartIllegalJobsLoop = function()
    if not HasValidJob() then
        return
    end

    StartHouseRobberyLoop()
end

SetupMissionNPC = function()


    if not isWeaponPedSpawned then
        local coords1 = vector3(-239.64, 2597.71, 52.66 - 1.0)
        local ped1 = SRP.Game.CreatePed('g_m_m_casrn_01', coords1, 88.0)
        SetEntityInvincible(ped1, true)
        FreezeEntityPosition(ped1, true)

        local coords = vector3(754.75, -3195.2, 6.07 - 1.0)
        local propcoords = vector3(755.78, -3195.2, 6.07 - 1.0)
        local peds = SRP.Game.CreatePed('mp_m_counterfeit_01', coords, 279.68)
        CreateObject(904554844, propcoords, 0, 1, 0)
    --    758.78, -3195.2, 6.07
       
    end

    collectgarbage()
end

OpenNPCMenu = function(entity)
    ESX.TriggerServerCallback("srp_illegaljobs:getStatus", function(illegalJobs)
        hasTask = true

        if not illegalJobs then
            hasTask = false
            return
        end

        if DoesEntityExist(entity) then
            PlayPedAmbientSpeechWithVoiceNative(entity, "SHOP_GREET", "mp_m_shopkeep_01_latino_mini_01", "SPEECH_PARAMS_FORCE", 1)
        end

        local illegalMenu = {
            {header = "Ulovlige Aktiviteter"}
        }
    
        local filteredJobs = {
            ["unionRobbery"] = "Start Union Heist",
            ["stockadeRobbery"] = "Start Pengetransporter Røveri",
            ["carjack"] = "Start Biltyveri",
        }

        table.sort(illegalJobs, function(a,b) return a.name > b.name end)

        for type, robbery in pairs(illegalJobs) do
            if filteredJobs[type] == nil then
                goto continue
            end

            local returnValue = false
            local statusBoolean = robbery["police"] and not robbery["cooldown"]

            local status = "⛔ Ikke Tilgændelig"
            if statusBoolean then
                status = "✅ Tilgændelig"
                returnValue = type
            end

            table.insert(illegalMenu, { header = filteredJobs[type], context = status, args = {returnValue}})

            ::continue::
        end

        local startedJob = exports["nh-context"]:ContextMenu(illegalMenu)
        if DoesEntityExist(entity) then
            PlayPedAmbientSpeechWithVoiceNative(entity, "SHOP_GOODBYE", "mp_m_shopkeep_01_latino_mini_01", "SPEECH_PARAMS_FORCE", 1)
        end
        
        if startedJob == nil then
            hasTask = false
            return
        end

        if startedJob == false then
            exports['mythic_notify']:SendAlert('error', 'Du kan ikke starte dette Job lige nu.', 5000)
            hasTask = false
            return
        end

        if not Config.Jobs[startedJob] then
            hasTask = false
            return
        end
    
        if startedJob == "unionRobbery" then
            StartUnionHeist()
        end
        
        if startedJob == "stockadeRobbery" then
            StartStockadeRobbery()
        end
        
        if startedJob == "carjack" then
            StartCarJackRobbery()
        end

        hasTask = false
    end)
end

local activeMinigame = ''
local isPlaying = false
local minigameRespond = false

StartHackingMinigame = function(type, timeout, interval, cb)
    SetNuiFocus(true, true)

    isPlaying = true
    activeMinigame = 'hacking'

    SendNUIMessage({
        openMinigame = true,
        minigameType = activeMinigame,
        hackingType = type,
        hackingTimeout = timeout,
        hackingInterval = interval,
    })

    while isPlaying do
        Wait(500);
    end

    SetNuiFocus(false)

    if cb then
        cb(minigameRespond)
    end
end

StartThermiteMinigame = function(mode, speed, cb)
    SetNuiFocus(true, true)

    isPlaying = true
    activeMinigame = 'thermite'

    SendNUIMessage({
        openMinigame = true,
        minigameType = activeMinigame,
        mode = mode,
        speed = speed,
    })

    while isPlaying do
        Wait(500);
    end

    SetNuiFocus(false)

    if cb then
        cb(minigameRespond)
    end
end

StartLockpickMinigame = function(needed, time, cb)
    SetNuiFocus(true, true)

    isPlaying = true
    activeMinigame = 'lockpick'

    SendNUIMessage({
        openMinigame = true,
        minigameType = activeMinigame,
        corrects = needed,
        timeMultiplier = time,
    })

    while isPlaying do
        Wait(500);
    end

    SetNuiFocus(false)

    if cb then
        cb(minigameRespond)
    end
end

RegisterNUICallback('miniGameRespond', function(data, cb)
    local type = data["type"]
    if type ~= activeMinigame then 
        return 
    end

    minigameRespond = data["respond"]
    isPlaying = false

    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
    
    cb('ok')
end)

RegisterNetEvent('srp_illegaljobs:StartHackingMinigame')
AddEventHandler('srp_illegaljobs:StartHackingMinigame', function(...) StartHackingMinigame(...); end)

RegisterNetEvent('srp_illegaljobs:StartThermiteMinigame')
AddEventHandler('srp_illegaljobs:StartThermiteMinigame', function(...) StartThermiteMinigame(...); end)

RegisterNetEvent('srp_illegaljobs:StartLockpickMinigame')
AddEventHandler('srp_illegaljobs:StartLockpickMinigame', function(...) StartLockpickMinigame(...); end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        for i = 1, #peds, 1 do
            if DoesEntityExist(peds[i]) then
                DeletePed(peds[i])
            end
        end

        for i = 1, #objects, 1 do
            if DoesEntityExist(objects[i]) then
                DeleteEntity(objects[i])
            end
        end

        exports.qtarget:RemoveZone('missionNPC')
        exports.qtarget:RemoveZone('bankRobberyNPC')

        DoScreenFadeIn(100)
        Citizen.Wait(100)

        CleanScenario()
	end
end)
