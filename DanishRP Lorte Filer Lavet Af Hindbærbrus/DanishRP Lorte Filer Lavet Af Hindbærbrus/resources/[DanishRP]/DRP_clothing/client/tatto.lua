local my_tattoos = Config.Tattoos
local update_tattoos = {}

RegisterNetEvent('drp_clothing:Init')
AddEventHandler('drp_clothing:Init', function(playerTattos, Identifier)
    
    PlayerIdentifier = Identifier
    print(playerTattos..Identifier)
    local playerPed = PlayerPedId()
    ClearPedDecorations(playerPed)

    local model = GetPlayerModel()
    
    local start = GetGameTimer()
    while Config.TattooList[model] == nil and GetGameTimer() - start < 30000 do 
        print("Model is nil.. Trying Again")
        model = GetPlayerModel()
        
        Wait(5000); 
    end

    if Config.TattooList[model] == nil then
        print(model .. " is nil (Model)", GetEntityModel(playerPed))
        return
    end
    
    for k,v in pairs(playerTattos) do
        local tattoModels = Config.TattooList[model][v.category]

        if tattoModels == nil then
            print(v.category .. " is nil (Category)")
        end

        for i=1, #tattoModels, 1 do
            local tattoModel = tattoModels[i]

            if tattoModel then
                if tattoModel["nameHash"] == v.nameHash and tattoModel["dlc"] == v.dlc then
                    AddPedDecorationFromHashes(playerPed, GetHashKey(tattoModel.dlc), GetHashKey(tattoModel.nameHash))

                    for y,z in pairs(my_tattoos) do
                        if z.dlc == v.category then
                            table.insert(z.acquired, i)
                        end
                    end
                end
            end
        end
    end

    hasInit = true
end)

RegisterNetEvent('drp_clothing:activateTempTat')
AddEventHandler('drp_clothing:activateTempTat', function(tattoo, identifier)
    for k,v in pairs(my_tattoos) do
        if v.dlc == tattoo then
            if v.whitelistedPlayers == nil then
                v.whitelistedPlayers = {}
            end

            table.insert(v.whitelistedPlayers, identifier)
        end
    end

    if isInMenu then
        SendNUIMessage({
            refreshTattos = true,
            Tattos = my_tattoos,
        })
    end
end)

Citizen.CreateThread(function()
    while not hasInit do
        Wait(0);
    end

    while true do
        Citizen.Wait(5000)

        if not isInMenu then
            local playerPed = PlayerPedId()
            ClearPedDecorations(playerPed)

            local model = GetPlayerModel()
            for _, tattos in pairs(my_tattoos) do
                for _, acquired in pairs(tattos.acquired) do
                    local tattoModel = Config.TattooList[model][tattos.dlc][acquired]

                    if tattoModel then
                        AddPedDecorationFromHashes(playerPed, GetHashKey(tattoModel.dlc), GetHashKey(tattoModel.nameHash))
                    end
                end
            end
        end
    end
end)
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(5500)
--         TriggerServerEvent("drp_clothing:GetTattoos")
--     end
-- end)
OpenTattoMenu = function()
    local model = GetPlayerModel()

    for k,v in pairs(my_tattoos) do
        local modelList = Config.TattooList[model]
        v.qty = #modelList[v.dlc]
    end

    isInMenu = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        openTatto = true,
        Tattos = my_tattoos,
    })

    CustomCamera('torso', true)
    startRotation = GetEntityHeading(playerPed)

    update_tattoos = my_tattoos
end

RegisterNUICallback('SetTatto', function(data, cb)
    local dlc = data["item"]["dlc"]
    local current = tonumber(data["item"]["current"])

    local playerPed = PlayerPedId()
    ClearPedDecorations(playerPed)

    local tatto = nil
    for k,v in pairs(my_tattoos) do
        if v.dlc == dlc then
            tatto = v
        end
    end

    if tatto == nil then
        return
    end

    tatto.current = current

    local model = GetPlayerModel()
    if current ~= 0 and not tableContains(tatto.acquired, current) then
        local tattoModel = Config.TattooList[model][dlc][current]
        
        if tattoModel then
            AddPedDecorationFromHashes(playerPed, GetHashKey(tattoModel.dlc), GetHashKey(tattoModel.nameHash))
        end
    end

    for _, tattos in pairs(update_tattoos) do
        for _, acquired in pairs(tattos.acquired) do
            local tattoModel = Config.TattooList[model][tattos.dlc][acquired]

            if tattoModel then
                AddPedDecorationFromHashes(playerPed, GetHashKey(tattoModel.dlc), GetHashKey(tattoModel.nameHash))
            end
        end
    end

    cb('ok')
end)

RegisterNUICallback('RemoveTatto', function(data, cb)
    local current = data["item"]["current"]

    for _, tattos in pairs(update_tattoos) do
        for k, acquired in pairs(tattos.acquired) do
            if acquired == current then
                table.remove(tattos.acquired, k)
            end
        end
    end

    SendNUIMessage({
        refreshTattos = true,
        Tattos = update_tattoos,
    })

    cb('ok')
end)

RegisterNUICallback('AddTatto', function(data, cb)
    local dlc = data["item"]["dlc"]
    local current = data["item"]["current"]

    for _, tattos in pairs(update_tattoos) do
        if tattos.dlc == dlc then
            table.insert(tattos.acquired, current)
        end
    end

    SendNUIMessage({
        refreshTattos = true,
        Tattos = update_tattoos,
    })

    cb('ok')
end)

RegisterNUICallback('ResetAllTattos', function(data, cb)
    local playerPed = PlayerPedId()
    ClearPedDecorations(playerPed)

    for k,v in pairs(my_tattoos) do
        v.acquired = {}
    end

    update_tattoos = {}

    SendNUIMessage({
        refreshTattos = true,
        Tattos = my_tattoos,
    })

    cb('ok')
end)

RegisterNUICallback('closeTattoShop', function(data, cb)
    
    local playerPed = PlayerPedId()
    ClearPedDecorations(playerPed)

    local model = GetPlayerModel()

    local updatedTattos = {}
    for _, tattos in pairs(update_tattoos) do
        for _, acquired in pairs(tattos.acquired) do
            local tattoModel = Config.TattooList[model][tattos.dlc][acquired]

            if tattoModel then
                AddPedDecorationFromHashes(playerPed, GetHashKey(tattoModel.dlc), GetHashKey(tattoModel.nameHash))
                table.insert(updatedTattos, {
                    category = tattos.dlc,
                    dlc = tattoModel.dlc,
                    nameHash = tattoModel.nameHash,
                })
            end
        end
    end

    my_tattoos = update_tattoos
    update_tattoos = {}
    TriggerServerEvent("drp_clothing:FjernTattoos")
    TriggerServerEvent("drp_clothing:RegisterTattoos", updatedTattos)

    TriggerServerEvent("drp_clothing:GetTattoos")

    
    SetNuiFocus(false)
    CustomCamera('cancel', false)

    isInMenu = false

    cb('ok')
end)

GetPlayerModel = function()
    local model = "maleModel"

    local playerPed = PlayerPedId()
    if GetEntityModel(playerPed) == GetHashKey('mp_f_freemode_01') then
        model = "femaleModel"
    end

    return model
end

tableContains = function(t,val)
	for k,v in pairs(t) do
		if v == val then
			return true
		end
	end
	return false
end
