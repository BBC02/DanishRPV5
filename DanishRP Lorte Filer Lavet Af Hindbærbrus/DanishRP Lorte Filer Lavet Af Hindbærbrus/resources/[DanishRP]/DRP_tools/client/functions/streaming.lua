Savanha.Streaming.SpawnObject = function(model, coords, v1, v2)
    local model = GetHashKey(model)
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(0)
    end

    spawnedModel = CreateObject(model, coords, v1, v2)
    SetEntityAsMissionEntity(spawnedModel, true, true)

    SetModelAsNoLongerNeeded(model)

    return spawnedModel
end

Savanha.Streaming.PlayAnimation = function(ped, dict, anim, v1, v2, v3, v4, v5, v6, v7, v8)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    
    TaskPlayAnim(ped, dict, anim, v1, v2, v3, v4, v5, v6, v7, v8)
    
    RemoveAnimDict(dict)
end

Savanha.Streaming.PlayAnimationLoop = function(ped, dict, anim, v1, v2, v3, v4, v5, v6, v7, v8)
    if not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then
        TaskPlayAnim(ped, dict, anim, v1, v2, v3, v4, v5, v6, v7, v8)
    end
end

Savanha.Streaming.LoadAnimationDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

Savanha.Streaming.UnloadAnimationDict = function(dict)
    RemoveAnimDict(dict)
end

Savanha.Streaming.AnimationSpeed = function(ped, dict, anim, speed)
    SetEntityAnimSpeed(ped, dict, anim, speed)
end

Savanha.Streaming.RequestStreamedTextureDict = function(textureDict)
	if not HasStreamedTextureDictLoaded(textureDict) then
		RequestStreamedTextureDict(textureDict)
		while not HasStreamedTextureDictLoaded(textureDict) do
			Wait(0)
		end
	end
end
