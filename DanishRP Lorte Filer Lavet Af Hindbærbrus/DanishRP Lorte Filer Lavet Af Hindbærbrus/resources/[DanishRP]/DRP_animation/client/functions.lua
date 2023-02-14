PtfxStart = function()
    if PtfxNoProp then
        PtfxAt = PlayerPedId()
    else
        PtfxAt = prop
    end

    UseParticleFxAssetNextCall(PtfxAsset)
    Ptfx = StartNetworkedParticleFxLoopedOnEntityBone(PtfxName, PtfxAt, Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, GetEntityBoneIndexByName(PtfxName, "VFX"), 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
    SetParticleFxLoopedColour(Ptfx, 1.0, 1.0, 1.0)
    table.insert(PlayerParticles, Ptfx)
end

PtfxStop = function()
    for a,b in pairs(PlayerParticles) do
        StopParticleFxLooped(b, false)
        table.remove(PlayerParticles, a)
    end
end

AddPropToPlayer = function(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
  
    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end
  
    local prop = CreateObject(GetHashKey(prop1), x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    table.insert(PlayerProps, prop)

    PlayerHasProp = true
    SetModelAsNoLongerNeeded(prop1)
end

DestroyAllProps = function()
    for _,v in pairs(PlayerProps) do
        DeleteEntity(v)
    end
    PlayerHasProp = false
end

getGender = function()
    local hashSkinMale = GetHashKey("mp_m_freemode_01")
    local hashSkinFemale = GetHashKey("mp_f_freemode_01")
    
    local gender = ""
    if GetEntityModel(PlayerPedId()) == hashSkinMale then
        gender = "male"
    elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
        gender = "female"
    end
    return gender
end

SimpleNotify = function(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

EmoteCancel = function()
    local ped = PlayerPedId()

    if isCancelDisabled then
        return
    end

    if IsPlayerFreeAiming(PlayerId()) then
        return
    end

    if ChosenDict == "MaleScenario" and IsInAnimation then
        ClearPedTasksImmediately(ped)
        IsInAnimation = false
    elseif ChosenDict == "Scenario" and IsInAnimation then
        ClearPedTasksImmediately(ped)

        local playerCoords = GetEntityCoords(ped)
        ClearAreaOfObjects(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, 0)

        IsInAnimation = false
    else
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
    end
    
    PtfxNotif = false
    PtfxPrompt = false
  
    if IsInAnimation then
        PtfxStop()
        ClearPedTasks(ped)

        DestroyAllProps()
        IsInAnimation = false
    end

    if isSurrendered then
        isSurrendered = false
        TriggerServerEvent('srp_ziptie:update', isSurrendered)
    end
end

CommandHandler = function(source, args, raw, type)
    if LocalPlayer.state.animation then
        return
    end
    
    if #args > 0 then
        local name = string.lower(args[1])
        
        if LocalPlayer.state.isDead then
            return
        end

        if type == "Walks" and name == "reset" then
            ResetPedMovementClipset(PlayerPedId()) 
            return
        end

        if type == "Expressions" and name == "reset" then
            ClearFacialIdleAnimOverride(PlayerPedId()) 
            return
        end

        local Emote = Config[type][name]
        if Emote ~= nil then
            if type == "Walks" then
                OnWalkPlay(Emote)
            elseif type == "Expressions" then
                OnExpressionPlay(Emote)
            else
                OnEmotePlay(Emote)
            end
        else
            exports['mythic_notify']:SendAlert('error', 'Der er ingen Emote/Gangart med dette navn', 5000)
        end
    end
end

EmoteHandler = function(Type, EmoteName)
    local name = string.lower(EmoteName)
    local Emote = Config[Type][name]

    if Type == "Walks" and name == "reset" then
        ResetPedMovementClipset(PlayerPedId()) 
        return
    end

    if Type == "Expressions" and name == "reset" then
        ClearFacialIdleAnimOverride(PlayerPedId()) 
        return
    end

    if Emote ~= nil then
        if Type == "Walks" then
            OnWalkPlay(Emote)
        elseif Type == "Expressions" then
            OnExpressionPlay(Emote)
        else
            OnEmotePlay(Emote)
        end
    else
        exports['mythic_notify']:SendAlert('error', 'Der er ingen Emote/Gangart med dette navn', 5000)
    end
end

OnWalkPlay = function(EmoteName)
    local name = EmoteName[1]

    RequestWalking(name)
    SetPedMovementClipset(PlayerPedId(), name, 0.2)
    RemoveAnimSet(name)
end

OnExpressionPlay = function(EmoteName)
    ChosenDict, ChosenAnimation, ename = table.unpack(EmoteName)
    SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
end

function print_r ( t ) 
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    sub_print_r(t,"  ")
end

OnEmotePlay = function(EmoteName)
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, true) and not EmoteName['AnimationOptions'].Vehicle then
        return
    end
  
    if not DoesEntityExist(ped) then
        return false
    end

    ChosenDict, ChosenAnimation, ename = table.unpack(EmoteName)
    AnimationDuration = -1
  
    -- if IsPedArmed(ped, 7) and (not EmoteName['AnimationOptions'] or not EmoteName['AnimationOptions'].allowedWeapon) then
    --     exports['mythic_notify']:SendAlert('error', 'Du kan ikke lave ' .. ename .. ' med et våben i hånden. Kontakt supporten hvis du synes denne animation skal tilføjes.', 5000)
    --     return
    -- end
  
    if PlayerHasProp then
        DestroyAllProps()
    end
  
    if ChosenDict == "MaleScenario" or "Scenario" then 
        if ChosenDict == "MaleScenario" and getGender() == "male" then
            ClearPedTasks(ped)
            TaskStartScenarioInPlace(ped, ChosenAnimation, 0, true)

            IsInAnimation = true
            return
        elseif ChosenDict == "ScenarioObject" then
            BehindPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0 - 0.5, -0.5);
            ClearPedTasks(ped)
            TaskStartScenarioAtPosition(ped, ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)

            IsInAnimation = true
            return
        elseif ChosenDict == "Scenario" then
            ClearPedTasks(ped)
            TaskStartScenarioInPlace(ped, ChosenAnimation, 0, true)

            IsInAnimation = true
            return 
        end 
    end
  
    LoadAnim(ChosenDict)
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteLoop then
            MovementType = 1

            if EmoteName.AnimationOptions.EmoteMoving then
                MovementType = 51
            end
        elseif EmoteName.AnimationOptions.EmoteMoving then
            MovementType = 51
        elseif EmoteName.AnimationOptions.EmoteMoving == false then
            MovementType = 0
        elseif EmoteName.AnimationOptions.EmoteStuck then
            MovementType = 50
        end
    else
        MovementType = 0
    end
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteDuration == nil then 
            EmoteName.AnimationOptions.EmoteDuration = -1
            AttachWait = 0
        else
            AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
            AttachWait = EmoteName.AnimationOptions.EmoteDuration
        end
    
        if EmoteName.AnimationOptions.PtfxAsset then
            PtfxAsset = EmoteName.AnimationOptions.PtfxAsset
            PtfxName = EmoteName.AnimationOptions.PtfxName

            if EmoteName.AnimationOptions.PtfxNoProp then
                PtfxNoProp = EmoteName.AnimationOptions.PtfxNoProp
            else
                PtfxNoProp = false
            end

            Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(EmoteName.AnimationOptions.PtfxPlacement)
            PtfxInfo = EmoteName.AnimationOptions.PtfxInfo
            PtfxWait = EmoteName.AnimationOptions.PtfxWait
            PtfxNotif = false
            PtfxPrompt = true

            PtfxThis(PtfxAsset)
        else
            PtfxPrompt = false
        end
    end
  
    TaskPlayAnim(ped, ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
    RemoveAnimDict(ChosenDict)

    if ename == "surrender" then
        isSurrendered = true

        TriggerServerEvent('3dme:shareDisplay', 'Overgiver sig', 'me')
        TriggerServerEvent('srp_ziptie:update', isSurrendered)
    end

    if ename == "Hænderne op" then
        isSurrendered = true
        TriggerServerEvent('srp_ziptie:update', isSurrendered)
    end

    IsInAnimation = true
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.Prop then
            PropName = EmoteName.AnimationOptions.Prop
            PropBone = EmoteName.AnimationOptions.PropBone
            PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(EmoteName.AnimationOptions.PropPlacement)
            if EmoteName.AnimationOptions.SecondProp then
                SecondPropName = EmoteName.AnimationOptions.SecondProp
                SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
                SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(EmoteName.AnimationOptions.SecondPropPlacement)
                SecondPropEmote = true
            else
                SecondPropEmote = false
            end

            Wait(AttachWait)

            AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
            if SecondPropEmote then
                AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
            end
        end
    end
    return true
end

RequestWalking = function(set)
    RequestAnimSet(set)
    while not HasAnimSetLoaded(set) do
      Citizen.Wait(1)
    end 
end

LoadAnim = function(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

LoadPropDict = function(model)
    while not HasModelLoaded(GetHashKey(model)) do
      RequestModel(GetHashKey(model))
      Wait(10)
    end
end

PtfxThis = function(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        RequestNamedPtfxAsset(asset)
        Wait(10)
    end
    UseParticleFxAssetNextCall(asset)
end
