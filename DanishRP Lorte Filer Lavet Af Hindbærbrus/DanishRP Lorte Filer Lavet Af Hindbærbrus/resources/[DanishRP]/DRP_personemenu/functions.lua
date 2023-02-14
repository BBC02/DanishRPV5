isHoodOpen = false
isTrunkOpen = false
isAllOpen = false
myPhoneNumber = ''

outHood = false
outTrunk = false
outFrontRight = false
outFrontLeft = false
outBackRight = false
outBackLeft = false

outFrontWindowRight = false
outFrontWindowLeft = false
outBackWindowRight = false
outBackWindowLeft = false
EnableCash = true
inTrunk = false
local cam = nil
local ems = nil

local hasHelpText = false
local isCarrying = false
local isCarried = false
local IsZiptied = false
local IsDragged = false
local DraggedBy = nil

local carry = {
    targetSrc = -1,
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.15,
		attachZ = 0.63,
		flag = 33,
	}
}
local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



local surrenderStatus = false

AddEventHandler('esx:onPlayerDeath', function(data)
    isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
    isDead = false
end)

RegisterNetEvent("gcPhone:myPhoneNumber")
AddEventHandler("gcPhone:myPhoneNumber", function(_myPhoneNumber)
    myPhoneNumber = _myPhoneNumber
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
    myPhoneNumber = phoneNumber
end)

RegisterNetEvent('esx_ziptie:status')
AddEventHandler('esx_ziptie:status', function(status)
    if status then
        Config.QuickCommands[4].label = '~r~Overgiv Dig'
    elseif not status then
        Config.QuickCommands[4].label = 'Overgiv Dig'
    end
    if mainMenu:Visible() then
        mainMenu:Visible(false)
        Settings()
        CleanUp()
        mainMenu:Visible(true)
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function VehicleMenuFunctions(value)
    currentPlayer = PlayerPedId()
    currentVehicle = GetVehiclePedIsIn(currentPlayer)
    openDistance = 3.0
    if value == 'open_hood' then
        if isHoodOpen == false then
            SetVehicleDoorOpen(currentVehicle, 4, 0, 0)
            isHoodOpen = true
        else
            SetVehicleDoorShut(currentVehicle, 4, 0)
            isHoodOpen = false
        end
    elseif value == 'open_trunk' then
        if isTrunkOpen == false then
            SetVehicleDoorOpen(currentVehicle, 5, 0, 0)
            isTrunkOpen = true
        else
            SetVehicleDoorShut(currentVehicle, 5, 0)
            isTrunkOpen = false
        end
    elseif value == 'open_all' then
        if isAllOpen == false then
            SetVehicleDoorOpen(currentVehicle, 0, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 1, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 2, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 3, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 4, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 5, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 6, 0, 0)
            SetVehicleDoorOpen(currentVehicle, 7, 0, 0)
            isAllOpen = true
        else
            SetVehicleDoorShut(currentVehicle, 0, 0)
            SetVehicleDoorShut(currentVehicle, 1, 0)
            SetVehicleDoorShut(currentVehicle, 2, 0)
            SetVehicleDoorShut(currentVehicle, 3, 0)
            SetVehicleDoorShut(currentVehicle, 4, 0)
            SetVehicleDoorShut(currentVehicle, 5, 0)
            SetVehicleDoorShut(currentVehicle, 6, 0)
            SetVehicleDoorShut(currentVehicle, 7, 0)
            isAllOpen = false
        end
    elseif value == 'neon_control' then
        isNeonOn = IsVehicleNeonLightEnabled(currentVehicle, 0)
        if isNeonOn == false then
            SetVehicleNeonLightEnabled(currentVehicle, 0, 1)
            SetVehicleNeonLightEnabled(currentVehicle, 1, 1)
            SetVehicleNeonLightEnabled(currentVehicle, 2, 1)
            SetVehicleNeonLightEnabled(currentVehicle, 3, 1)
        else
            SetVehicleNeonLightEnabled(currentVehicle, 0, 0)
            SetVehicleNeonLightEnabled(currentVehicle, 1, 0)
            SetVehicleNeonLightEnabled(currentVehicle, 2, 0)
            SetVehicleNeonLightEnabled(currentVehicle, 3, 0)
        end
    elseif value == 'engine_toggle' then
        toggleEngine()
    elseif value == 'open_hood_out' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outHood == false then
                SetVehicleDoorOpen(vehicle, 4, 0, 0)
                outHood = true
            else
                SetVehicleDoorShut(vehicle, 4, 0)
                outHood = false
            end
        end
    elseif value == 'open_trunk_out' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outTrunk == false then
                SetVehicleDoorOpen(vehicle, 5, 0, 0)
                SetVehicleDoorOpen(vehicle, 6, 0, 0)
                SetVehicleDoorOpen(vehicle, 7, 0, 0)
                outTrunk = true
            else
                SetVehicleDoorShut(vehicle, 5, 0)
                SetVehicleDoorShut(vehicle, 6, 0)
                SetVehicleDoorShut(vehicle, 7, 0)
                outTrunk = false
            end
        end
    elseif value == 'open_frontdoor_right' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outFrontRight == false then
                SetVehicleDoorOpen(vehicle, 0, 0, 0)
                outFrontRight = true
            else
                SetVehicleDoorShut(vehicle, 0, 0)
                outFrontRight = false
            end
        end
    elseif value == 'open_frontdoor_left' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outFrontLeft == false then
                SetVehicleDoorOpen(vehicle, 1, 0, 0)
                outFrontLeft = true
            else
                SetVehicleDoorShut(vehicle, 1, 0)
                outFrontLeft = false
            end
        end
    elseif value == 'open_backdoor_right' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outBackRight == false then
                SetVehicleDoorOpen(vehicle, 3, 0, 0)
                outBackRight = true
            else
                SetVehicleDoorShut(vehicle, 3, 0)
                outBackRight = false
            end
        end
    elseif value == 'open_backdoor_left' then
        local playerPos = GetEntityCoords(currentPlayer, 1)
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(currentPlayer, 0.0, openDistance, 0.0)
        local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)
        if (DoesEntityExist(vehicle)) then
            if outBackLeft == false then
                SetVehicleDoorOpen(vehicle, 2, 0, 0)
                outBackLeft = true
            else
                SetVehicleDoorShut(vehicle, 2, 0)
                outBackLeft = false
            end
        end
    elseif value == 'open_frontwindow_right' then
        local vehicle = GetVehiclePedIsIn(currentPlayer)
        if (DoesEntityExist(vehicle)) then
            if outFrontWindowRight == false then
                RollDownWindow(vehicle, 1)
                outFrontWindowRight = true
            else
                RollUpWindow(vehicle, 1)
                outFrontWindowRight = false
            end
        end
        
    elseif value == 'open_frontwindow_left' then
        local vehicle = GetVehiclePedIsIn(currentPlayer)
        if (DoesEntityExist(vehicle)) then
            if outFrontWindowLeft == false then
                RollDownWindow(vehicle, 0)
                outFrontWindowLeft = true
            else
                RollUpWindow(vehicle, 0)
                outFrontWindowLeft = false
            end
        end
    elseif value == 'open_backwindow_right' then
        local vehicle = GetVehiclePedIsIn(currentPlayer)
        if (DoesEntityExist(vehicle)) then
            if outBackWindowRight == false then
                RollDownWindow(vehicle, 3)
                outBackWindowRight = true
            else
                RollUpWindow(vehicle, 3)
                outBackWindowRight = false
            end
        end
    elseif value == 'open_backwindow_left' then
        local vehicle = GetVehiclePedIsIn(currentPlayer)
        if (DoesEntityExist(vehicle)) then
            if outBackWindowLeft == false then
                RollDownWindow(vehicle, 2)
                outBackWindowLeft = true
            else
                RollUpWindow(vehicle, 2)
                outBackWindowLeft = false
            end
        end
    end
end

function commonFunctions(value)
    if value == 'show_phonenumber' then
        if myPhoneNumber == '' then
            ESX.TriggerServerCallback('srp:requestNumber', function(thisNumber)
                myPhoneNumber = thisNumber
                TriggerServerEvent('3dme:shareDisplay', "* Telefonnummer: " .. myPhoneNumber .. ' *')
            end)
        else
            TriggerServerEvent('3dme:shareDisplay', "* Telefonnummer: " .. myPhoneNumber .. ' *')
        end
    elseif value == 'show_id' then
        local player, distance = ESX.Game.GetClosestPlayer()
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
        
        if distance ~= -1 and distance <= 3.0 then
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
        end
    elseif value == 'blindfold_toggle' then
        local player, distance = ESX.Game.GetClosestPlayer()
        if distance ~= -1 and distance <= 3.0 then
            if IsPedInAnyVehicle(GetPlayerPed(player)) then
                exports['mythic_notify']:DoHudText('error', 'Du kan ikke give personer i et køretæj blindfold på.', 5000)
            else
                ESX.TriggerServerCallback('jsfour-blindfold:itemCheck', function(hasItem)
                    TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
                end)
            end
        else
            exports['mythic_notify']:DoHudText('error', 'Ingen personer i nærheden', 5000)
        end
    elseif value == 'surrender_now' then
        TriggerEvent('srp_animation:OnEmotePlay', 'Emotes', 'surrender')
    elseif value == 'hat_toggle' then
        TriggerEvent('srp_animation:hat-toggle')
    elseif value == 'glasses_toggle' then
        TriggerEvent('srp_animation:glasses-toggle')
    elseif value == 'mask_toggle' then
        TriggerEvent('srp_animation:mask-toggle')
    elseif value == 'bag_toggle' then
        TriggerEvent('srp_animation:bag-toggle')
    elseif value == 'shirt_toggle' then
        TriggerEvent('srp_animation:shirt-toggle')
    elseif value == 'pants_toggle' then
        TriggerEvent('srp_animation:pants-toggle')
    elseif value == 'shoes_toggle' then
        TriggerEvent('srp_animation:shoes-toggle')
    elseif value == 'watch_toggle' then
        TriggerEvent('srp_animation:watch-toggle')
    elseif value == 'chain_toggle' then
        TriggerEvent('srp_animation:chain-toggle')
    elseif value == 'vest_toggle' then
        TriggerEvent('srp_animation:vest-toggle')
    elseif value == 'decals_toggle' then
        TriggerEvent('srp_animation:decals-toggle')
    end
end

exports.qtarget:
Vehicle({
	options = {
		{
			icon = "fas fa-mask",
			label = "Læg dig i bagagerummet",
			action = function(entity)
                HideInTrunk(entity)
			end,
			canInteract = function(vehicle)
                local isLocked = Entity(vehicle).state.isLocked
                local isTrunkOccupied = Entity(vehicle).state.isTrunkOccupied
				local model = GetEntityModel(vehicle)

                local isCloseToTrunk = true
                local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
                if trunk ~= -1 then
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local bootCoords = GetWorldPositionOfEntityBone(vehicle, trunk)
                    isCloseToTrunk = #(playerCoords - bootCoords) <= 3.0
                end

                return not isLocked and not isTrunkOccupied and not inTrunk and Config.TrunkVehiclePositions[model] ~= nil and isCloseToTrunk and not isCarrying
			end
		},
		{
			icon = "fas fa-user-secret",
			label = "Smid i bagagerum",
			action = function(entity)
                local netID = NetworkGetNetworkIdFromEntity(entity)
                TriggerServerEvent("srp_thiefmenu:throwInTrunk", carry.targetSrc, netID)
			end,
			canInteract = function(vehicle)
                local isLocked = Entity(vehicle).state.isLocked
                local isTrunkOccupied = Entity(vehicle).state.isTrunkOccupied
				local model = GetEntityModel(vehicle)

                local isCloseToTrunk = true
                local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
                if trunk ~= -1 then
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local bootCoords = GetWorldPositionOfEntityBone(vehicle, trunk)
                    isCloseToTrunk = #(playerCoords - bootCoords) <= 3.0
                end

                return not isLocked and not isTrunkOccupied and not inTrunk and Config.TrunkVehiclePositions[model] ~= nil and isCloseToTrunk and isCarrying
			end
		},
		{
			icon = "fas fa-user-secret",
			label = "Tag ud af bagagerum",
			action = function(entity)
                local netID = NetworkGetNetworkIdFromEntity(entity)
                TriggerServerEvent("srp_thiefmenu:takeOutTrunk", netID)
			end,
			canInteract = function(vehicle)
                local isLocked = Entity(vehicle).state.isLocked
                local isTrunkOccupied = Entity(vehicle).state.isTrunkOccupied
				local model = GetEntityModel(vehicle)

                local isCloseToTrunk = true
                local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
                if trunk ~= -1 then
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local bootCoords = GetWorldPositionOfEntityBone(vehicle, trunk)
                    isCloseToTrunk = #(playerCoords - bootCoords) <= 3.0
                end

                return not isLocked and isTrunkOccupied and not inTrunk and Config.TrunkVehiclePositions[model] ~= nil and isCloseToTrunk and not isCarrying
			end
		},
        --[[
		{
			icon = "fa-solid fa-hat-cowboy-side",
			label = "Sæt Y værdi",
			action = function(entity)
				local model = GetEntityModel(entity)
				if Config.TrunkVehiclePositions[model] == nil then
					Config.TrunkVehiclePositions[model] = {}
				end

				exports["input"]:Open("Sæt Offset", ("ESX"), function(data)
					local number = tonumber(data)
					Config.TrunkVehiclePositions[model]["y"] = number
                end)
			end
		},
		{
			icon = "fa-solid fa-hat-cowboy-side",
			label = "Sæt Z værdi",
			action = function(entity)
				local model = GetEntityModel(entity)
				if Config.TrunkVehiclePositions[model] == nil then
					Config.TrunkVehiclePositions[model] = {}
				end

				exports["input"]:Open("Sæt Offset", ("ESX"), function(data)
					local number = tonumber(data)
					Config.TrunkVehiclePositions[model]["z"] = number
                end)
			end
		},
        ]]
	},
	distance = 2.0
})

exports.qtarget:

Player({
	options = {
		{
			icon = "fas fa-people-carry",
			label = "Bære personen",
            action = function(entity)
                local closestID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                CarryPerson(closestID)
			end,
            canInteract = function(entity)
                local closestID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                return Player(closestID).state.IsZiptied or Player(closestID).state.isDead
            end,
		},
	},
	distance = 2.0
})

RegisterNetEvent('srp_thiefmenu:syncTarget')
AddEventHandler('srp_thiefmenu:syncTarget', function(targetSrc)
    CarriedPerson(targetSrc)
end)

RegisterNetEvent('srp_thiefmenu:stopCarry')
AddEventHandler('srp_thiefmenu:stopCarry', function()
    StopCarry()
end)

RegisterNetEvent('srp_thiefmenu:takeOutTrunk')
AddEventHandler('srp_thiefmenu:takeOutTrunk', function()
    LeaveTrunk()
end)

RegisterNetEvent('srp_thiefmenu:throwInTrunk')
AddEventHandler('srp_thiefmenu:throwInTrunk', function(netID)
    isCarrying = false
    isCarried = false
    inTrunk = true

    Citizen.Wait(100)

    local playerPed = PlayerPedId()
	ClearPedTasksImmediately(playerPed)
	DetachEntity(playerPed, true, false)

    Citizen.Wait(100)
    
    local entity = NetworkGetEntityFromNetworkId(netID)
    HideInTrunk(entity)
end)

CarryPerson = function(closestID)
    isCarrying = true

    RequestAnimDict(carry.personCarrying.animDict)
    while not HasAnimDictLoaded(carry.personCarrying.animDict) do
        Citizen.Wait(100)
    end

    carry.targetSrc = closestID
    TriggerServerEvent("srp_thiefmenu:syncTarget", closestID)

    Citizen.CreateThread(function()
        while isCarrying do
            Wait(0)

            --DisableControlAction(0, 24, true)-- Attack
            --DisableControlAction(0, 257, true)-- Attack 2
            --DisableControlAction(0, 25, true)-- Aim
            --DisableControlAction(0, 263, true)-- Melee Attack 1
            --DisableControlAction(0, Keys["LEFTSHIFT"], true)-- Reload
            
            DisableControlAction(0, Keys["R"], true)-- Reload
            DisableControlAction(0, Keys["SPACE"], true)-- Jump
            DisableControlAction(0, Keys["TAB"], true)-- Select Weapon
            DisableControlAction(0, Keys["F"], true)-- Also 'enter'?
            
            DisableControlAction(0, Keys["F6"], true)-- Job
            
            DisableControlAction(0, Keys["C"], true)-- Disable looking behind
            DisableControlAction(0, Keys["X"], true)-- Disable clearing animation
            DisableControlAction(0, 48, true)
            
            DisableControlAction(0, 59, true)-- Disable steering in vehicle
            DisableControlAction(0, 71, true)-- Disable driving forward in vehicle
            DisableControlAction(0, 72, true)-- Disable reversing in vehicle
            
            DisableControlAction(2, Keys["LEFTCTRL"], true)-- Disable going stealth
            
            DisableControlAction(0, 47, true)-- Disable weapon
            DisableControlAction(0, 264, true)-- Disable melee
            DisableControlAction(0, 257, true)-- Disable melee
            DisableControlAction(0, 140, true)-- Disable melee
            DisableControlAction(0, 141, true)-- Disable melee
            DisableControlAction(0, 142, true)-- Disable melee
            DisableControlAction(0, 143, true)-- Disable melee
            DisableControlAction(0, 75, true)-- Disable exit vehicle
            DisableControlAction(27, 75, true)-- Disable exit vehicle

            local playerPed = PlayerPedId()
            if not IsEntityPlayingAnim(playerPed, carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
                TaskPlayAnim(playerPed, carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, -1, carry.personCarrying.flag, 0, false, false, false)
            end

            if not hasHelpText and isCarrying then
                TriggerEvent('cd_drawtextui:ShowUI', "Tryk [E] for at smide personen")
                hasHelpText = true
            end

            if IsControlJustReleased(0, Keys["E"]) and hasHelpText then
                TriggerServerEvent("srp_thiefmenu:stopCarry", carry.targetSrc)
                carry.targetSrc = 0

                hasHelpText = false
                TriggerEvent('cd_drawtextui:HideUI')

                Citizen.Wait(5000)
            end
        end
    end)
end

CarriedPerson = function(targetSrc)
    isCarried = true

    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))

    RequestAnimDict(carry.personCarried.animDict)
    while not HasAnimDictLoaded(carry.personCarried.animDict) do
        Citizen.Wait(100)
    end

    ClearPedTasksImmediately(playerPed)
    SetEnableHandcuffs(playerPed, false)
    DisablePlayerFiring(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, true)
    DetachEntity(playerPed, true, false)

    --exports.srp_ambulance:SetCancelDeathAnimationLoopValue(true)
    AttachEntityToEntity(playerPed, targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY, carry.personCarried.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)

    Citizen.CreateThread(function()
        while isCarried do
            Wait(0)

            DisableFirstPersonCamThisFrame()

            DisableControlAction(0, 24, true)-- Attack
            DisableControlAction(0, 257, true)-- Attack 2
            DisableControlAction(0, 25, true)-- Aim
            DisableControlAction(0, 263, true)-- Melee Attack 1
            DisableControlAction(0, Keys["LEFTSHIFT"], true)-- Reload
            
            DisableControlAction(0, Keys["R"], true)-- Reload
            DisableControlAction(0, Keys["SPACE"], true)-- Jump
            DisableControlAction(0, Keys["TAB"], true)-- Select Weapon
            DisableControlAction(0, Keys["F"], true)-- Also 'enter'?
            
            DisableControlAction(0, Keys["F6"], true)-- Job
            
            DisableControlAction(0, Keys["C"], true)-- Disable looking behind
            DisableControlAction(0, Keys["X"], true)-- Disable clearing animation
            DisableControlAction(0, 48, true)
            
            DisableControlAction(0, 59, true)-- Disable steering in vehicle
            DisableControlAction(0, 71, true)-- Disable driving forward in vehicle
            DisableControlAction(0, 72, true)-- Disable reversing in vehicle
            
            DisableControlAction(2, Keys["LEFTCTRL"], true)-- Disable going stealth
            
            DisableControlAction(0, 47, true)-- Disable weapon
            DisableControlAction(0, 264, true)-- Disable melee
            DisableControlAction(0, 257, true)-- Disable melee
            DisableControlAction(0, 140, true)-- Disable melee
            DisableControlAction(0, 141, true)-- Disable melee
            DisableControlAction(0, 142, true)-- Disable melee
            DisableControlAction(0, 143, true)-- Disable melee
            DisableControlAction(0, 75, true)-- Disable exit vehicle
            DisableControlAction(27, 75, true)-- Disable exit vehicle

            local playerPed = PlayerPedId()
            if not IsEntityPlayingAnim(playerPed, carry.personCarried.animDict, carry.personCarried.anim, 3) then
                TaskPlayAnim(playerPed, carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, -1, carry.personCarried.flag, 0, false, false, false)
            end
        end
    end)
end

StopCarry = function()
    local playerPed = PlayerPedId()
   -- exports.srp_ambulance:SetCancelDeathAnimationLoopValue(false)

    isCarrying = false
    isCarried = false

    Citizen.Wait(100)

	ClearPedTasksImmediately(playerPed)
	DetachEntity(playerPed, true, false)

    hasHelpText = false
    TriggerEvent('cd_drawtextui:HideUI')
	
	if HasAnimDictLoaded(carry.personCarrying.animDict) then
        RemoveAnimDict(carry.personCarrying.animDict)
    end

    if HasAnimDictLoaded(carry.personCarried.animDict) then
        RemoveAnimDict(carry.personCarried.animDict)
    end
end

HideInTrunk = function(vehicle)
    Citizen.CreateThread(function()
        local trunkDict = "fin_ext_p1-7"
        local trunkAnim = "cs_devin_dual-7"

        RequestAnimDict(trunkDict)
        while not HasAnimDictLoaded(trunkDict) do
            Citizen.Wait(100)
        end

        local model = GetEntityModel(vehicle)
        local d1,d2 = GetModelDimensions(model)

        local playerPed = PlayerPedId()
        SetBlockingOfNonTemporaryEvents(playerPed, true)                   
        DetachEntity(playerPed)
        ClearPedTasks(playerPed)
        ClearPedSecondaryTask(playerPed)
        ClearPedTasksImmediately(playerPed)
        TaskPlayAnim(playerPed, trunkDict, trunkAnim, 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)

        local offsets = Config.TrunkVehiclePositions[model]
        if offsets == nil then
            return
        end

        inTrunk = true

        local netID = NetworkGetNetworkIdFromEntity(vehicle)
        --TriggerServerEvent("srp_thiefmenu:SetTrunkValue", netID, true)

        --exports.srp_ambulance:SetCancelDeathAnimationLoopValue(true)
        AttachEntityToEntity(playerPed, vehicle, 0, -0.1, d1["y"] + offsets.y, d2["z"] - offsets.z, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)

        while inTrunk do
            Wait(0)

            trunkCam()
            local playerPed = PlayerPedId()
            local vehicle = GetEntityAttachedTo(playerPed)
			if not DoesEntityExist(vehicle) then
                LeaveTrunk()

                Citizen.Wait(5000)
            end
			
            if DoesEntityExist(vehicle) then
                SetEntityCollision(playerPed, false, false)

                if not hasHelpText then
                    TriggerEvent('cd_drawtextui:ShowUI', "Tryk [E] for at forlade bagagerummet - [G] Toggle bagagerum")
                    hasHelpText = true
                end

                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, Keys["LEFTSHIFT"], true)-- Reload
                
                DisableControlAction(0, Keys["R"], true)-- Reload
                DisableControlAction(0, Keys["SPACE"], true)-- Jump
                DisableControlAction(0, Keys["Q"], true)-- Cover
                DisableControlAction(0, Keys["TAB"], true)-- Select Weapon
                DisableControlAction(0, Keys["F"], true)-- Also 'enter'?
                
                DisableControlAction(0, Keys["F1"], true)-- Disable phone
                DisableControlAction(0, Keys["F2"], true)-- Inventory
                DisableControlAction(0, Keys["F3"], true)-- Animations
                DisableControlAction(0, Keys["F6"], true)-- Job
                
                DisableControlAction(0, Keys["C"], true)-- Disable looking behind
                DisableControlAction(0, Keys["X"], true)-- Disable clearing animation
                DisableControlAction(2, Keys["P"], true)-- Disable pause screen
                DisableControlAction(0, 48, true)
                
                DisableControlAction(0, 59, true)-- Disable steering in vehicle
                DisableControlAction(0, 71, true)-- Disable driving forward in vehicle
                DisableControlAction(0, 72, true)-- Disable reversing in vehicle
                
                DisableControlAction(0, Keys["LEFTCTRL"], true)-- Disable going stealth
                
                DisableControlAction(0, 264, true)-- Disable melee
                DisableControlAction(0, 257, true)-- Disable melee
                DisableControlAction(0, 140, true)-- Disable melee
                DisableControlAction(0, 141, true)-- Disable melee
                DisableControlAction(0, 142, true)-- Disable melee
                DisableControlAction(0, 143, true)-- Disable melee
                DisableControlAction(0, 75, true)-- Disable exit vehicle
                DisableControlAction(27, 75, true)-- Disable exit vehicle

                if not IsEntityPlayingAnim(playerPed, trunkDict, 3) then
                    TaskPlayAnim(playerPed, trunkDict, trunkAnim, 8.0, -8.0, -1, 1, 0, false, false, false)
                end

                local speed = GetEntitySpeed(vehicle) * 3.6
                if IsControlJustReleased(0, Keys["G"]) and speed <= 10 and hasHelpText then
                    if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                        SetCarBootOpen(vehicle)
                    end

                    if GetVehicleDoorAngleRatio(vehicle, 5) >= 0.9 then
                        SetVehicleDoorShut(vehicle, 5)
                    end
                end

                if IsControlJustReleased(0, Keys["E"]) and speed <= 10 and hasHelpText and not LocalPlayer.state.isDead and not IsZiptied then
                    LeaveTrunk()

                    Citizen.Wait(5000)
                end
            end
        end
    end)
end

LeaveTrunk = function()
    local playerPed = PlayerPedId()
    local vehicle = GetEntityAttachedTo(playerPed)

    SetEntityCollision(playerPed, true, true)
    DetachEntity(playerPed, true, true)
    ClearPedTasks(playerPed)

   -- exports.srp_ambulance:SetCancelDeathAnimationLoopValue(false)

    if DoesEntityExist(vehicle) then
        local model = GetEntityModel(vehicle)
        local d1,d2 = GetModelDimensions(model)
        
        local dropPosition = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, d1["y"]-0.6, 0.0)
        SetEntityCoords(playerPed, dropPosition["x"], dropPosition["y"], dropPosition["z"])

        local netID = NetworkGetNetworkIdFromEntity(vehicle)
        TriggerServerEvent("srp_thiefmenu:SetTrunkValue", netID, false)
    end

    inTrunk = false
    hasHelpText = false
    TriggerEvent('cd_drawtextui:HideUI')

    Citizen.Wait(100)

    disableCam()

    if HasAnimDictLoaded("fin_ext_p1-7") then
        RemoveAnimDict("fin_ext_p1-7")
    end
end

trunkCam = function()
    if not DoesCamExist(cam) then
        TriggerEvent('cd_drawtextui:ShowUI', "Tryk [E] for at forlade bagagerummet - [G] Toggle bagagerum")
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        local plyPed = PlayerPedId()
        SetCamCoord(cam, GetEntityCoords(plyPed))
        SetCamRot(cam, 0.0, 0.0, 0.0)
        SetCamActive(cam,  true)
        RenderScriptCams(true,  false,  0,  true,  true)
        SetCamCoord(cam, GetEntityCoords(plyPed))
    end
    AttachCamToEntity(cam, PlayerPedId(), 0.0, -2.5, 1.0, true)
    SetCamRot(cam, -30.0, 0.0, GetEntityHeading(PlayerPedId()))
end

disableCam = function()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
end
function crimeFunctions(value)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    spiller = GetPlayerPed(ESX.Game.GetClosestPlayer())
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        if value == 'ziptie_on' then
            if not IsPedInAnyVehicle(GetPlayerPed(GetPlayerServerId(closestPlayer)), false) then
                TriggerServerEvent('srp_thiefmenu:ziptie', GetPlayerServerId(closestPlayer))
                --TriggerEvent('RunCheck', '')
            else
                exports['mythic_notify']:SendAlert('error', 'Du kan ikke give strips pæ en der sider i en bil', 5000)
            end
        elseif value == 'ziptie_off' then
            if not IsPedInAnyVehicle(GetPlayerPed(GetPlayerServerId(closestPlayer)), false) then
                TriggerServerEvent('srp_thiefmenu:RemoveZiptie', GetPlayerServerId(closestPlayer))
                --TriggerEvent('RunCheck', '')
            else
                exports['mythic_notify']:SendAlert('error', 'Du kan ikke tage strips af en der sider i en bil', 5000)
            end
        elseif value == 'put_vehicle' then
            TriggerServerEvent('srp_thiefmenu:putInVehicle', GetPlayerServerId(closestPlayer))
            --TriggerEvent('RunCheck', '')
        elseif value == 'takeout_vehicle' then
            TriggerServerEvent('srp_thiefmenu:OutVehicle', GetPlayerServerId(closestPlayer))
            --TriggerEvent('RunCheck', '')
        elseif value == 'drag_person' then
            TriggerServerEvent('srp_thiefmenu:drag', GetPlayerServerId(closestPlayer))
            

            --TriggerEvent('RunCheck', 'drag')
        elseif value == 'check_pockets' then
            if IsPedArmed(PlayerPedId(), 7) then
                if IsEntityPlayingAnim(spiller, "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(spiller, 'misslamar1dead_body', 'dead_idle', 3) then
                    exports.ox_inventory:openInventory('player', GetPlayerServerId(closestPlayer))
                else
                    exports['mythic_notify']:SendAlert('error', 'Spilleren er ikke pæ knæ.', 5000)
                end
            else
                exports['mythic_notify']:SendAlert('error', 'Du skal have et væben i hænden.', 5000)
            end
        end
    else
        exports['mythic_notify']:SendAlert('error', 'Ingen personer i nærheden', 5000)
        --ESX.ShowNotification("Ingen personer i nærheden")
    end
end

RegisterNetEvent('srp_thiefmenu:checkPocket')
AddEventHandler('srp_thiefmenu:checkPocket', function(player)
    local ped = PlayerPedId()
    
    if not LocalPlayer.state.isDead and IsPedOnFoot(ped) then
        local target, distance = ESX.Game.GetClosestPlayer()

        if player then
            target = player

            local playerIdx = GetPlayerFromServerId(player)
            local targetCoords = GetEntityCoords(GetPlayerPed(playerIdx))
            distance = #(targetCoords - GetEntityCoords(ped))
        end

        if target ~= -1 and distance ~= -1 and distance <= 2.0 then
            local target_id = GetPlayerServerId(target)
            
            if IsEntityDead(player) or IsEntityPlayingAnim(player, 'misslamar1dead_body', 'dead_idle', 3) then
                if OpenStealMenu(target, target_id) then
                    TriggerServerEvent('3dme:shareDisplay', "Leder efter ting i personens lommer", 'me')
                end
            else
                exports['mythic_notify']:SendAlert('inform', 'Du kan ikke ræve personen.', 5000)
            end
        
        elseif distance < 20 and distance > 2.0 then
            exports['mythic_notify']:SendAlert('inform', 'Du er for langt væk fra personen', 5000)
        else
            exports['mythic_notify']:SendAlert('error', 'Ingen personer i nærheden', 5000)
        end
    end
end)

function IsAbleToSteal(targetSID, err)
    if not Player(targetSID).state.IsSurrendered then
        return err(true)
    end

    if Player(targetSID).state.isDead then
        return err(true)
    end

    return err(false)
end

function OpenStealMenu(target, target_id)
    return exports.ox_inventory:openInventory('player', target_id)
end

RegisterNetEvent("RunCheck")
AddEventHandler("RunCheck", function(type)
    --local type = type

    --if isDragging then
    --    isDragging = false
    --elseif type == 'drag' and not isDragging then
    --    isDragging = true
    --    TriggerEvent('disableRun')
    --end
end)

RegisterNetEvent("disableRun")
AddEventHandler("disableRun", function()
    while isDragging do
        Wait(0)
        --SetPedMoveRateOverride(GetPlayerPed(-1), 0.6)
        DisableControlAction(0, 21, true)
        DisableControlAction(0, 22, true)
        DisableControlAction(0, 24, true)-- Attack
        DisableControlAction(0, 257, true)-- Attack 2
        DisableControlAction(0, 25, true)-- Aim
        DisableControlAction(0, 263, true)-- Melee Attack 1
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end

function startScenario(anim)
    TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end

function changeAimStyle(lib)
    local player = PlayerPedId()
    SetWeaponAnimationOverride(player, GetHashKey(lib))
end
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end
function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end
function Loot()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if IsPlayerDead(closestPlayer) then 
        if closestPlayer ~= -1 and closestDistance <= 5.0 then
            _menuPool:CloseAllMenus()
            TriggerServerEvent('3dme:shareDisplay', '**Looter person**', 'me')
            exports['mythic_notify']:DoHudText('success', 'Looter personen!', 5000)
            exports.ox_inventory:openInventory('player', GetPlayerServerId(closestPlayer))
            ClearPedTasksImmediately(playerPed)
            Citizen.Wait(25)
            ExecuteCommand('e medic')
            Citizen.Wait(250)
            
            
            loadAnimDict('amb@medic@standing@kneel@base')
            loadAnimDict('anim@gangops@facility@servers@bodysearch@')
            TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
            TaskPlayAnim(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
            Citizen.Wait(5000)
            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search", 1.0)
        end
    else
        exports['mythic_notify']:DoHudText('success', 'Personen er ved bevidsthed!', 5000)
    end
end

Citizen.CreateThread(function()
	while true do
		plyPed = PlayerPedId()

		

		Citizen.Wait(0)
	end
end)