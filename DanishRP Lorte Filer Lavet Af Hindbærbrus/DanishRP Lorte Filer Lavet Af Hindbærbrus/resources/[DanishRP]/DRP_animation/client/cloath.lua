local pants_1, pants_2, shirt_1, shirt_2, torso_1, torso_2, arms, arms_2, shoes_1, shoes_2, bags_1, bags_2, mask_1, mask_2, helmet_1, helmet_2, glasses_1, glasses_2, watches_1, watches_2, chain_1, chain_2, bproof_1, bproof_2, decals_1, decals_2 = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('srp_animation:glasses-toggle')
AddEventHandler('srp_animation:glasses-toggle', function()
    local glassesOff = -1

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.glasses_1 == glassesOff then
            local dict = "clothingspecs"
            PlayToggleEmote(dict, "take_off", 1400, 51)

            local clothesSkin = {
                ['glasses_1'] = glasses_1, 
                ['glasses_2'] = glasses_2
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.glasses_1 ~= glassesOff then
            local dict = "clothingspecs"
            PlayToggleEmote(dict, "take_off", 1400, 51)

            glasses_1 = skin.glasses_1
            glasses_2 = skin.glasses_2
            local clothesSkin = {
                ['glasses_1'] = glassesOff, 
                ['glasses_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:hat-toggle')
AddEventHandler('srp_animation:hat-toggle', function()
    local helmetOff = -1

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.helmet_1 == helmetOff then
            local dict = "mp_masks@standard_car@ds@"
            PlayToggleEmote(dict, "put_on_mask", 800, 51)

            local clothesSkin = {
                ['helmet_1'] = helmet_1, 
                ['helmet_2'] = helmet_2
            }

            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.helmet_1 ~= helmetOff then
            local dict = "missheist_agency2ahelmet"
            PlayToggleEmote(dict, "take_off_helmet_stand", 1200, 51)

            helmet_1 = skin.helmet_1
            helmet_2 = skin.helmet_2
                
            local clothesSkin = {
                ['helmet_1'] = helmetOff, 
                ['helmet_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:mask-toggle')
AddEventHandler('srp_animation:mask-toggle', function()
    local maskOff = 0

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.mask_1 == maskOff then
            local dict = "mp_masks@standard_car@ds@"
            PlayToggleEmote(dict, "put_on_mask", 800, 51)

            local clothesSkin = {
                ['mask_1'] = mask_1, 
                ['mask_2'] = mask_2
            }

            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.mask_1 ~= maskOff then
            local dict = "mp_masks@standard_car@ds@"
            PlayToggleEmote(dict, "put_on_mask", 800, 51)

            mask_1 = skin.mask_1
            mask_2 = skin.mask_2

            local clothesSkin = {
                ['mask_1'] = maskOff, 
                ['mask_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:bag-toggle')
AddEventHandler('srp_animation:bag-toggle', function()
    local bagOff = 0

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.bags_1 == bagOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_negative_a", 1200, 51)

            local clothesSkin = {
                ['bags_1'] = bags_1, 
                ['bags_2'] = bags_2
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.bags_1 ~= bagOff then
            local dict = "anim@heists@ornate_bank@grab_cash"
            PlayToggleEmote(dict, "intro", 1600, 51)

            bags_1 = skin.bags_1
            bags_2 = skin.bags_2

            local clothesSkin = {
                ['bags_1'] = bagOff, 
                ['bags_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:pants-toggle')
AddEventHandler('srp_animation:pants-toggle', function()
    local pantsOff = 21

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.pants_1 == pantsOff then
            local dict = "re@construction"
            PlayToggleEmote(dict, "out_of_breath", 1300, 51)

            local clothesSkin = {
                ['pants_1'] = pants_1, 
                ['pants_2'] = pants_2
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.pants_1 ~= pantsOff then
            local dict = "re@construction"
            PlayToggleEmote(dict, "out_of_breath", 1300, 51)

            pants_1 = skin.pants_1
            pants_2 = skin.pants_2

            local clothesSkin = {
                ['pants_1'] = pantsOff, 
                ['pants_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:shirt-toggle')
AddEventHandler('srp_animation:shirt-toggle', function()
    local shirtOff = 15

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.torso_1 == shirtOff then
            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            local clothesSkin = {
                ['tshirt_1'] = shirt_1, ['tshirt_2'] = shirt_2,
                ['torso_1'] = torso_1, ['torso_2'] = torso_2,
                ['arms'] = arms, ['arms_2'] = arms_2
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.torso_1 ~= shirtOff then
            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            shirt_1 = skin.tshirt_1
            shirt_2 = skin.tshirt_2
            torso_1 = skin.torso_1
            torso_2 = skin.torso_2
            arms = skin.arms
            arms_2 = skin.arms_2

            local clothesSkin = {
                ['tshirt_1'] = shirtOff, ['tshirt_2'] = 0,
                ['torso_1'] = shirtOff, ['torso_2'] = 0,
                ['arms'] = shirtOff, ['arms_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:tshirt-toggle')
AddEventHandler('srp_animation:tshirt-toggle', function()
    local shirtOff = 15

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.tshirt_1 == shirtOff then
            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            local clothesSkin = {
                ['tshirt_1'] = shirt_1, ['tshirt_2'] = shirt_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.tshirt_1 ~= shirtOff then
            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            shirt_1 = skin.tshirt_1
            shirt_2 = skin.tshirt_2

            local clothesSkin = {
                ['tshirt_1'] = shirtOff, ['tshirt_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:shoes-toggle')
AddEventHandler('srp_animation:shoes-toggle', function()
    local shoesOff = 34

    local playerPed = PlayerPedId()
    if GetEntityModel(playerPed) == GetHashKey("mp_f_freemode_01") then
        shoesOff = 35
    end

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.shoes_1 == shoesOff then
            local dict = "random@domestic"
            PlayToggleEmote(dict, "pickup_low", 1200, 0)

            local clothesSkin = {
                ['shoes_1'] = shoes_1, 
                ['shoes_2'] = shoes_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.shoes_1 ~= shoesOff then
            local dict = "random@domestic"
            PlayToggleEmote(dict, "pickup_low", 1200, 0)

            shoes_1 = skin.shoes_1
            shoes_2 = skin.shoes_2

            local clothesSkin = {
                ['shoes_1'] = shoesOff, 
                ['shoes_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:watch-toggle')
AddEventHandler('srp_animation:watch-toggle', function()
    local watchOff = -1

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.watches_1 == watchOff then
            local dict = "nmt_3_rcm-10"
            PlayToggleEmote(dict, "cs_nigel_dual-10", 1200, 0)

            local clothesSkin = {
                ['watches_1'] = watches_1, 
                ['watches_2'] = watches_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.watches_1 ~= watchOff then
            local dict = "nmt_3_rcm-10"
            PlayToggleEmote(dict, "cs_nigel_dual-10", 1200, 0)

            watches_1 = skin.watches_1
            watches_2 = skin.watches_2

            local clothesSkin = {
                ['watches_1'] = watchOff, 
                ['watches_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:chain-toggle')
AddEventHandler('srp_animation:chain-toggle', function()
    local chainOff = 0

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.chain_1 == chainOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_positive_a", 2100, 0)

            local clothesSkin = {
                ['chain_1'] = chain_1, 
                ['chain_2'] = chain_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.chain_1 ~= chainOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_positive_a", 2100, 0)

            chain_1 = skin.chain_1
            chain_2 = skin.chain_2

            local clothesSkin = {
                ['chain_1'] = chainOff, 
                ['chain_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:vest-toggle')
AddEventHandler('srp_animation:vest-toggle', function()
    local bproofOff = 0

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.bproof_1 == bproofOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_negative_a", 1200, 0)

            local clothesSkin = {
                ['bproof_1'] = bproof_1, 
                ['bproof_2'] = bproof_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.bproof_1 ~= bproofOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_negative_a", 1200, 0)

            bproof_1 = skin.bproof_1
            bproof_2 = skin.bproof_2

            local clothesSkin = {
                ['bproof_1'] = bproofOff, 
                ['bproof_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:decals-toggle')
AddEventHandler('srp_animation:decals-toggle', function()
    local decalsOff = 0

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.decals_1 == decalsOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_negative_a", 1200, 0)

            local clothesSkin = {
                ['decals_1'] = decals_1, 
                ['decals_2'] = decals_2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end

        if skin.decals_1 ~= decalsOff then
            local dict = "clothingtie"
            PlayToggleEmote(dict, "try_tie_negative_a", 1200, 0)

            decals_1 = skin.decals_1
            decals_2 = skin.decals_2

            local clothesSkin = {
                ['decals_1'] = 0, 
                ['decals_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterNetEvent('srp_animation:nipple-toggle')
AddEventHandler('srp_animation:nipple-toggle', function()
    local shirtOff = -1

    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.tshirt_1 == 14 then
            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = shirt_2,
                ['torso_1'] = 15, ['torso_2'] = torso_2,
                ['arms'] = 15, ['arms_2'] = arms_2
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            Wait(1000)
            TriggerEvent('srp_animation:shirt-toggle')
        end

        if skin.tshirt_1 ~= 14 then
            if skin.torso_1 ~= 15 then
                TriggerEvent('srp_animation:shirt-toggle')
                Wait(1500)
            end

            local dict = "missmic4"
            PlayToggleEmote(dict, "michael_tux_fidget", 1500, 51)

            local clothesSkin = {
                ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                ['torso_1'] = -1, ['torso_2'] = 0,
                ['arms'] = 15, ['arms_2'] = 0
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end)

RegisterCommand('maske', function()
    TriggerEvent('srp_animation:mask-toggle')
end)

RegisterCommand('briller', function()
    TriggerEvent('srp_animation:glasses-toggle')
end)

RegisterCommand('hat', function()
    TriggerEvent('srp_animation:hat-toggle')
end)

RegisterCommand('taske', function()
    TriggerEvent('srp_animation:bag-toggle')
end)

RegisterCommand("bukser", function()
    TriggerEvent('srp_animation:pants-toggle')
end)

RegisterCommand("shirt", function()
    TriggerEvent('srp_animation:shirt-toggle')
end)

RegisterCommand("tshirt", function()
    TriggerEvent('srp_animation:tshirt-toggle')
end)

RegisterCommand("shoes", function()
    TriggerEvent('srp_animation:shoes-toggle')
end)

RegisterCommand("watch", function()
    TriggerEvent('srp_animation:watch-toggle')
end)

RegisterCommand("chain", function()
    TriggerEvent('srp_animation:chain-toggle')
end)

RegisterCommand("vest", function()
    TriggerEvent('srp_animation:vest-toggle')
end)

RegisterCommand("decals", function()
    TriggerEvent('srp_animation:decals-toggle')
end)

RegisterCommand("nipples", function()
    TriggerEvent('srp_animation:nipple-toggle')
end)

PlayToggleEmote = function(dict, anim, duration, move)
	local Ped = PlayerPedId()
    while not HasAnimDictLoaded(dict) do 
        RequestAnimDict(dict)
        Wait(100) 
    end
    
    if IsPedInAnyVehicle(Ped) then 
        move = 51 
    end

    TaskPlayAnim(Ped, dict, anim, 3.0, 3.0, duration, move, false, false, false)
    RemoveAnimDict(dict)

	Wait(duration)
end