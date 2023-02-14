 local jobName = "containerRobbery"
 local eventName = 'srp_illegaljobs:' .. jobName

 local containerObjects = {}

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

     exports.qtarget:

AddTargetModel({ "tr_prop_tr_lock_01a", "tr_prop_tr_container_01a" }, {
         options = {
             {
                 icon = "fa-solid fa-container-storage",
                 label = "Åben Container",
                 action = function(entity)
                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     HandleContainerAction(handlerID, "open", entity)
                 end,
                 canInteract = function()
                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     return ValidateContainerHandler() 
                 end,
             },
         },
         distance = 2.0
     })
 end)

 HandleContainerAction = function(stageID, action, entity)

    hasTask = true


    local requiredItems = {}
    if action == "open" then
        requiredItems = { { name = "circular_saw", amount = 1 } }
    end

    

    local hasItems = true
    local checkedItems = isTableEmpty(requiredItems)
    for k, v in pairs(requiredItems) do
        local checkedItem = false
        ESX.TriggerServerCallback("srp_illegaljobs:checkItem", function(hasItem)
            checkedItem = true

            if not hasItem and hasItems then
                hasItems = hasItem
            end
        end, v.name, v.amount)

        while not checkedItem do
            Wait(0);
        end

        if k == #requiredItems or not hasItems then
            checkedItems = true
            break
        end
    end

    while not checkedItems do
        Wait(0);
    end

    if not hasItems then
        hasTask = false
        TriggerServerEvent(eventName .. ':OccupyContainer', stageID, true)
        return
    end

    if action ~= "open" and action ~= "safe" then
        local canCarryItems = true
        local checkCarryItems = false
        ESX.TriggerServerCallback("srp_illegaljobs:canCarryRewards", function(canCarry)
            canCarryItems = canCarry
            checkCarryItems = true
        end, jobName, action)

        while not checkCarryItems do
            Wait(0);
        end

        if not canCarryItems then
            hasTask = false

            exports['mythic_notify']:SendAlert("error", 'Du har ikke plads til præmierne fra dette sted.', 5000)
            TriggerServerEvent(eventName .. ':OccupyHandler', stageID, true)
            return
        end
    end

    local canProceed = false
    if action == "open" then
        OpenContainer(stageID, function(isOpen)
            canProceed = isOpen
        end)
    end

    if action == "safe" then
        OpenContainerSafe(entity, stageID, function(isOpen)
            canProceed = isOpen
        end)
    end

    if action == "lootsafe" then
        local playerPed = PlayerPedId()
        TaskTurnPedToFaceEntity(playerPed, entity, -1)
        Citizen.Wait(1000)

        TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'mechanic')

        exports['progressBars']:startUI(20000, 'Tømmer Pengeskabet')
        Citizen.Wait(20000)

        canProceed = true
        TriggerEvent('srp_animation:EmoteCancel')
        hasTask = false
    end

    if action == "lootcrate" then
        local playerPed = PlayerPedId()
        TaskTurnPedToFaceEntity(playerPed, entity, -1)

        Citizen.Wait(1000)

        TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'mechanic3')

        exports['progressBars']:startUI(20000, 'Leder i kassen')
        Citizen.Wait(20000)

        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end

        canProceed = true
        TriggerEvent('srp_animation:EmoteCancel')
        hasTask = false
    end

    if action == "loot" then
        GrabContainerStack(function(haslooted)
            canProceed = haslooted
        end)
    end

    while hasTask do
        Wait(500)
    end

    if canProceed and action ~= "open" and action ~= "safe" then
        TriggerServerEvent('srp_illegaljobs:AddReward', jobName, action)
    end
 end

 OpenContainerSafe = function(entity, stageID, cb)
     hasTask = true

     local playerPed = PlayerPedId()
     TaskTurnPedToFaceEntity(playerPed, entity, -1)

     Citizen.Wait(1000)

     SafeCracking.Toggle(true, 3, function(isCracked)
         hasTask = false
         ClearPedTasks(playerPed)

         if isCracked then
             local playerCoords = GetEntityCoords(playerPed)
             local sceneObject = GetClosestObjectOfType(playerCoords, 2.5, GetHashKey('tr_prop_tr_container_01a'), 0, 0, 0)
             if not DoesEntityExist(sceneObject) then
                 return
             end

             exports.qtarget:

RemoveZone("container_locked_safe")

             local animDict = "anim@scripted@heist@ig15_safe_crack@male@"
             RequestAnimDict(animDict)
             while not HasAnimDictLoaded(animDict) do
                 Wait(10);
             end

             local safeModel = "h4_prop_h4_safe_01b"
             RequestModel(safeModel)
             while not HasModelLoaded(safeModel) do
                 Wait(10);
             end

             local safeScene = NetworkCreateSynchronisedScene(GetEntityCoords(entity), GetEntityRotation(entity), 2, false, false, 1065353216, 0, 1.0)
             NetworkAddPedToSynchronisedScene(playerPed, safeScene, animDict, "door_open_player", 1.5, -4.0, 1, 16, 1148846080, 0)
             NetworkAddEntityToSynchronisedScene(entity, safeScene, animDict, "door_open_safe", 4.0, -8.0, 1)
             NetworkStartSynchronisedScene(safeScene)

             Wait(GetAnimDuration(animDict, 'door_open_player') * 1000 - 500)
             ClearPedTasks(playerPed)

             if DoesEntityExist(entity) then
                 DeleteEntity(entity)
             end

             local containerHeading = GetEntityHeading(sceneObject)
             local safeOffset = GetOffsetFromEntityInWorldCoords(sceneObject, vector3(0.75, -0.25, 0.19))
             local safeObject = CreateObject(GetHashKey(safeModel), safeOffset.x, safeOffset.y, safeOffset.z, true, true, false)
             SetEntityHeading(safeObject, (containerHeading - 90.0))
             FreezeEntityPosition(safeObject, true)

             local min, max = GetModelDimensions(GetHashKey(safeModel))
             local length = (max.y - min.y) + 0.15
             local width = (max.x - min.x) + 0.15

             local SafeZoneName = "container_unlocked_safe"
             exports.qtarget:


AddBoxZone(SafeZoneName, safeOffset, length, width, {
                 heading = (containerHeading - 90.0),
                 name = SafeZoneName,
                 minZ = safeOffset.z + min.z,
                 maxZ = safeOffset.z + max.z,
             }, {
                 options = {
                     {
                         icon = "fa-solid fa-money-bill",
                         label = "Tøm Pengeskab",
                         action = function(entity)
                             exports.qtarget:

RemoveZone(SafeZoneName)

                             local handlerID, handler, closestHandler = GetClosestContainerHandler()
                             HandleContainerAction(handlerID, "lootsafe", entity)
                         end,
                         canInteract = function()
                             local handlerID, handler, closestHandler = GetClosestContainerHandler()
                             return ValidateContainerHandler() and handler.isLooted
                         end,
                     },
                 },
                 distance = 1.0
             })

             table.insert(containerObjects, safeObject)
             table.insert(objects, safeObject)
         end

         if cb then
             cb(isCracked)
         end
     end)
 end

 local GrabCash = {
     ['animations'] = {
         { 'enter', 'enter_bag' },
         { 'grab', 'grab_bag', 'grab_cash' },
         { 'grab_idle', 'grab_idle_bag' },
         { 'exit', 'exit_bag' },
     },
     ['scenes'] = {},
     ['scenesObjects'] = {}
 }

 GrabContainerStack = function(cb)
     local playerPed = PlayerPedId()
     local playerCoords = GetEntityCoords(playerPed)

     local animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
     local stackModel = "h4_prop_h4_cash_stack_01a"

     local sceneObject = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(stackModel), 0, 0, 0)
     while not NetworkHasControlOfEntity(sceneObject) do
         Citizen.Wait(1)
         NetworkRequestControlOfEntity(sceneObject)
     end

     RequestAnimDict(animDict)
     while not HasAnimDictLoaded(animDict) do
         Wait(10);
     end

     local objectDict = "ch_p_m_bag_var02_arm_s"
     RequestModel(objectDict)
     while not HasModelLoaded(objectDict) do
         Wait(10);
     end

     RequestModel(stackModel)
     while not HasModelLoaded(stackModel) do
         Wait(10);
     end

     local bag = CreateObject(GetHashKey(objectDict), playerCoords, true, true, false)
     SetEntityCollision(bag, false, true)
     table.insert(objects, bag)

     local scenePos = GetEntityCoords(sceneObject)
     local sceneRot = GetEntityRotation(sceneObject)

     for i = 1, #GrabCash['animations'] do
         GrabCash['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.0)
         NetworkAddPedToSynchronisedScene(playerPed, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
         NetworkAddEntityToSynchronisedScene(bag, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][2], 1.0, -1.0, 1148846080)

         if i == 2 then
             NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][3], 1.0, -1.0, 1148846080)
         end
     end

     NetworkStartSynchronisedScene(GrabCash['scenes'][1])
     Wait(GetAnimDuration(animDict, 'enter') * 1000)
     NetworkStartSynchronisedScene(GrabCash['scenes'][2])
     Wait(GetAnimDuration(animDict, 'grab') * 1000)

     if DoesEntityExist(sceneObject) then
         while not NetworkHasControlOfEntity(sceneObject) do
             Citizen.Wait(1)
             NetworkRequestControlOfEntity(sceneObject)
         end

         DeleteObject(sceneObject)
     end

     NetworkStartSynchronisedScene(GrabCash['scenes'][4])
     Wait(GetAnimDuration(animDict, 'exit') * 1000)

     if DoesEntityExist(bag) then
         DeleteEntity(bag)
     end

     RemoveAnimDict(animDict)
     SetModelAsNoLongerNeeded(stackModel)
     SetModelAsNoLongerNeeded(objectDict)

     hasTask = false

     if cb then
         cb(true)
     end
 end

 local TrainAnimation = {
     ['objects'] = {
         'tr_prop_tr_grinder_01a',
         'ch_p_m_bag_var02_arm_s'
     },
     ['animations'] = {
         { 'action', 'action_container', 'action_lock', 'action_angle_grinder', 'action_bag' }
     },
     ['scenes'] = {},
     ['sceneObjects'] = {}
 }

 OpenContainer = function(container_id, cb)
     local playerPed = PlayerPedId()
     local playerCoords = GetEntityCoords(playerPed)

     local animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'
     RequestAnimDict(animDict)
     while not HasAnimDictLoaded(animDict) do
         Wait(10);
     end

     local fakeTargetModel = "prop_ld_container"
     RequestModel(fakeTargetModel)
     while not HasModelLoaded(fakeTargetModel) do
         Wait(10);
     end

     local tableModel = "h4_prop_h4_table_isl_01a"
     RequestModel(tableModel)
     while not HasModelLoaded(tableModel) do
         Wait(10);
     end

     local cashModel = "h4_prop_h4_cash_stack_01a"
     RequestModel(cashModel)
     while not HasModelLoaded(cashModel) do
         Wait(10);
     end

     local safeModel = "h4_prop_h4_safe_01a"
     RequestModel(safeModel)
     while not HasModelLoaded(safeModel) do
         Wait(10);
     end

     local chestModel = "sm_prop_smug_crate_s_bones"
     RequestModel(chestModel)
     while not HasModelLoaded(chestModel) do
         Wait(10);
     end

     local ptfxDict = "scr_tn_tr"
     RequestNamedPtfxAsset(ptfxDict)
     while not HasNamedPtfxAssetLoaded(ptfxDict) do
         Wait(10);
     end

     local sceneObject = GetClosestObjectOfType(playerCoords, 2.5, GetHashKey('tr_prop_tr_container_01a'), 0, 0, 0)
     local lockObject = GetClosestObjectOfType(playerCoords, 2.5, GetHashKey('tr_prop_tr_lock_01a'), 0, 0, 0)

     for i = 1, #TrainAnimation['objects'] do
         local model = TrainAnimation['objects'][i]
         RequestModel(model)
         while not HasModelLoaded(model) do
             Wait(10);
         end

         TrainAnimation['sceneObjects'][i] = CreateObject(GetHashKey(model), playerCoords, 1, 1, 0)
         table.insert(objects, TrainAnimation['sceneObjects'][i])
     end

     local sceneCoords = GetEntityCoords(sceneObject)
     local sceneRotation = GetEntityRotation(sceneObject)
     local containerHeading = GetEntityHeading(sceneObject)

     local tableOffset = GetOffsetFromEntityInWorldCoords(sceneObject, vector3(0.0, 1.05, 0.19))
     local tableObject = CreateObject(GetHashKey(tableModel), tableOffset.x, tableOffset.y, tableOffset.z, true, true, false)
     SetEntityHeading(tableObject, containerHeading)
     FreezeEntityPosition(tableObject, true)

     table.insert(objects, tableObject)
     table.insert(containerObjects, tableObject)

     local cashOffset = GetOffsetFromEntityInWorldCoords(tableObject, vector3(-0.55, -0.15, 0.945132))
     local cashObject = CreateObject(GetHashKey(cashModel), cashOffset.x, cashOffset.y, cashOffset.z, true, true, false)
     SetEntityHeading(cashObject, containerHeading)

     table.insert(objects, cashObject)
     table.insert(containerObjects, cashObject)

     local zoneName = "containerRobbery_" .. container_id
     exports.qtarget:


AddBoxZone(zoneName, cashOffset, 0.5, 0.5, {
         name = zoneName,
         minZ = cashOffset.z - 0.1,
         maxZ = cashOffset.z + 0.1,
     }, {
         options = {
             {
                 icon = "fa-solid fa-play",
                 label = "Tag pengene",
                 action = function()
                     exports.qtarget:

RemoveZone(zoneName)

                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     HandleContainerAction(handlerID, "loot")
                 end,
                 canInteract = function()
                     return ValidateContainerHandler()
                 end,
             },
         },
         distance = 1.0
     })

     local safeOffset = GetOffsetFromEntityInWorldCoords(sceneObject, vector3(0.75, -0.25, 0.19))
     local safeObject = CreateObject(GetHashKey(safeModel), safeOffset.x, safeOffset.y, safeOffset.z, true, true, false)
     SetEntityHeading(safeObject, (containerHeading - 90.0))
     FreezeEntityPosition(safeObject, true)

     local min, max = GetModelDimensions(GetHashKey(safeModel))
     local length = (max.y - min.y) + 0.15
     local width = (max.x - min.x) + 0.15

     local SafeZoneName = "container_locked_safe"
     exports.qtarget:


AddBoxZone(SafeZoneName, safeOffset, length, width, {
         heading = (containerHeading - 90.0),
         name = SafeZoneName,
         minZ = safeOffset.z + min.z,
         maxZ = safeOffset.z + max.z,
     }, {
         options = {
             {
                 icon = "fa-solid fa-money-bill",
                 label = "Åben Pengeskab",
                 action = function(entity)
                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     HandleContainerAction(handlerID, "safe", entity)
                 end,
                 canInteract = function()
                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     return ValidateContainerHandler() and handler.isLooted
                 end,
             },
         },
         distance = 1.0
     })

     table.insert(objects, safeObject)
     table.insert(containerObjects, safeObject)

     local chestOffset = GetOffsetFromEntityInWorldCoords(tableObject, vector3(0.0, -0.10, 0.0))
     local chestObject = CreateObject(GetHashKey(chestModel), chestOffset.x, chestOffset.y, chestOffset.z, true, true, false)
     SetEntityHeading(chestObject, containerHeading)
     FreezeEntityPosition(chestObject, true)

     local min, max = GetModelDimensions(GetHashKey(chestModel))
     local length = (max.y - min.y) + 0.15
     local width = (max.x - min.x) + 0.15

     local ChestZoneName = "container_chest"
     exports.qtarget:


AddBoxZone(ChestZoneName, chestOffset, length, width, {
         heading = containerHeading,
         name = ChestZoneName,
         minZ = chestOffset.z + min.z,
         maxZ = chestOffset.z + max.z + 0.2,
     }, {
         options = {
             {
                 icon = "fa-solid fa-crate-empty",
                 label = "Åben Kassen",
                 action = function(entity)
                     exports.qtarget:

RemoveZone(ChestZoneName)

                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     HandleContainerAction(handlerID, "lootcrate", entity)
                 end,
                 canInteract = function()
                     local handlerID, handler, closestHandler = GetClosestContainerHandler()
                     return ValidateContainerHandler() and handler.isLooted
                 end,
             },
         },
         distance = 1.0
     })

     table.insert(objects, chestObject)
     table.insert(containerObjects, chestObject)

     local fakeObject = CreateObject(GetHashKey(fakeTargetModel), sceneCoords.x, sceneCoords.y, sceneCoords.z, true, true, false)
     SetEntityHeading(fakeObject, containerHeading)
     SetEntityVisible(fakeObject, false)
     FreezeEntityPosition(fakeObject, true)

     table.insert(objects, fakeObject)
     table.insert(containerObjects, fakeObject)

     local scene = NetworkCreateSynchronisedScene(sceneCoords, sceneRotation, 2, true, false, 1065353216, 0, 1065353216)
     NetworkAddPedToSynchronisedScene(playerPed, scene, animDict, TrainAnimation['animations'][1][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
     NetworkAddEntityToSynchronisedScene(sceneObject, scene, animDict, TrainAnimation['animations'][1][2], 1.0, -1.0, 1148846080)
     NetworkAddEntityToSynchronisedScene(lockObject, scene, animDict, TrainAnimation['animations'][1][3], 1.0, -1.0, 1148846080)
     NetworkAddEntityToSynchronisedScene(TrainAnimation['sceneObjects'][1], scene, animDict, TrainAnimation['animations'][1][4], 1.0, -1.0, 1148846080)
     NetworkAddEntityToSynchronisedScene(TrainAnimation['sceneObjects'][2], scene, animDict, TrainAnimation['animations'][1][5], 1.0, -1.0, 1148846080)

     SetEntityCoords(playerPed, sceneCoords)
     NetworkStartSynchronisedScene(scene)

     Wait(4000)
     UseParticleFxAssetNextCall('scr_tn_tr')
     local sparks = StartParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", TrainAnimation['sceneObjects'][1], 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)

     Wait(1000)
     StopParticleFxLooped(sparks, 1)
     Wait(GetAnimDuration(animDict, 'action') * 1000 - 5000)

     TriggerServerEvent(eventName .. ':containerSync_s', container_id, sceneCoords, sceneRotation)

     DeleteObject(TrainAnimation['sceneObjects'][1])
     DeleteObject(TrainAnimation['sceneObjects'][2])
     ClearPedTasks(playerPed)

     RemoveAnimDict(animDict)
     RemoveNamedPtfxAsset(ptfxDict)

     SetModelAsNoLongerNeeded(fakeTargetModel)
     SetModelAsNoLongerNeeded(tableModel)
     SetModelAsNoLongerNeeded(cashModel)
     SetModelAsNoLongerNeeded(safeModel)
     SetModelAsNoLongerNeeded(chestModel)

     hasTask = false

     if cb then
         cb(true)
     end
 end

 RegisterNetEvent(eventName .. ':containerSync_c')
 AddEventHandler(eventName .. ':containerSync_c', function(coords, rotation)
        print(coords)
     local playerPed = PlayerPedId()
     local playerCoords = GetEntityCoords(playerPed)
     local containerDistance = #(playerCoords - coords)

     if containerDistance > (Config.CarSpawnDistance * 2) then
         return
     end

     local animDict = 'anim@scripted@player@mission@tunf_train_ig1_container_p1@male@'
     RequestAnimDict(animDict)
     while not HasAnimDictLoaded(animDict) do
         Wait(10);
     end

     local containerModel = "tr_prop_tr_container_01a"
     RequestModel(containerModel)
     while not HasModelLoaded(containerModel) do
         Wait(10);
     end

     local lockModel = "tr_prop_tr_lock_01a"
     RequestModel(lockModel)
     while not HasModelLoaded(lockModel) do
         Wait(10);
     end

     local clientContainer = CreateObject(GetHashKey(containerModel), coords, 0, 0, 0)
     print(coords)
     print(coords.x)
     print(coords.y)
     print(coords.z)
     table.insert(objects, clientContainer)

     local clientLock = CreateObject(GetHashKey(lockModel), coords, 0, 0, 0)
     table.insert(objects, clientLock)

     local clientScene = CreateSynchronizedScene(coords, rotation, 2, true, false, 1065353216, 0, 1065353216)
     PlaySynchronizedEntityAnim(clientContainer, clientScene, TrainAnimation['animations'][1][2], animDict, 1.0, -1.0, 0, 1148846080)
     ForceEntityAiAndAnimationUpdate(clientContainer)
     PlaySynchronizedEntityAnim(clientLock, clientScene, TrainAnimation['animations'][1][3], animDict, 1.0, -1.0, 0, 1148846080)
     ForceEntityAiAndAnimationUpdate(clientLock)

     SetSynchronizedScenePhase(clientScene, 0.99)
     SetEntityCollision(clientContainer, false, true)
     FreezeEntityPosition(clientContainer, true)

     RemoveAnimDict(animDict)
     SetModelAsNoLongerNeeded(containerModel)
     SetModelAsNoLongerNeeded(lockModel)
 end)

 RegisterNetEvent(eventName .. ':cleanupSync_c')
 AddEventHandler(eventName .. ':cleanupSync_c', function(container_id, coords)
     local zoneName = "containerRobbery_" .. container_id
     exports.qtarget:

RemoveZone(zoneName)

     for i = 1, #containerObjects, 1 do
         if DoesEntityExist(containerObjects[i]) then
             DeleteEntity(containerObjects[i])
         end
     end

     local sceneObject = GetClosestObjectOfType(coords, 2.5, GetHashKey('tr_prop_tr_container_01a'), 0, 0, 0)
     while not NetworkHasControlOfEntity(sceneObject) do
         NetworkRequestControlOfEntity(sceneObject);
         Wait(0);
     end

     while not NetworkGetEntityIsNetworked(sceneObject) do
         NetworkRegisterEntityAsNetworked(sceneObject);
         Wait(0);
     end

     while not IsEntityAMissionEntity(sceneObject) do
         SetEntityAsMissionEntity(sceneObject, true, true);
         Wait(0);
     end

     DeleteEntity(sceneObject)

     local lockObject = GetClosestObjectOfType(coords, 2.5, GetHashKey('tr_prop_tr_lock_01a'), 0, 0, 0)
     while not NetworkHasControlOfEntity(lockObject) do
         NetworkRequestControlOfEntity(lockObject);
         Wait(0);
     end

     while not NetworkGetEntityIsNetworked(lockObject) do
         NetworkRegisterEntityAsNetworked(lockObject);
         Wait(0);
     end

     while not IsEntityAMissionEntity(lockObject) do
         SetEntityAsMissionEntity(lockObject, true, true);
         Wait(0);
     end

     DeleteEntity(lockObject)
 end)

 ValidateContainerHandler = function()
     local handlerID, handler, closestHandler = GetClosestContainerHandler()
     if handler == nil then
         return false
     end

     if closestHandler > 5.0 then
         return false
     end

     local playerSource = GetPlayerServerId(PlayerId())
     return not hasTask and (handler.occupySource == playerSource or handler.occupySource == 0)
 end

 GetClosestContainerHandler = function()
     local playerPed = PlayerPedId()
     local playerCoords = GetEntityCoords(playerPed)
     local closestDistance, closestHandler, closestHandlerID = -1, -1, -1

     for k, handler in pairs(GlobalState.Containers) do
         local handlerDistance = #(playerCoords - handler.location)

         if closestDistance == -1 or closestDistance > handlerDistance then
             closestHandlerID = k
             closestHandler = handler
             closestDistance = handlerDistance
         end
     end

     return closestHandlerID, closestHandler, closestDistance
 end

