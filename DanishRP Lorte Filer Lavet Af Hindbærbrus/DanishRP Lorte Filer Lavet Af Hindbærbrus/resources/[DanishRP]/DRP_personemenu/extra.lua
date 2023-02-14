local AvailableExtras = {['VehicleExtras'] = {}, ['TrailerExtras'] = {}}
local Items = {['Vehicle'] = {}, ['Trailer'] = {}}

function AddVehiExtraMenu(menu)
    AvailableExtras = {['VehicleExtras'] = {}, ['TrailerExtras'] = {}}
    Items = {['Vehicle'] = {}, ['Trailer'] = {}}
    local submenu = _menuPool:AddSubMenu(menu, "~r~Bil Extra", "", 1320, 0)
    Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local Got, Handle = GetVehicleTrailerVehicle(CurrentVehicle)
    GotVehicleExtras = false
    GotTrailerExtras = false
    GotTrailer = Got
    TrailerHandle = Handle
    
    for ExtraID = 0, 20 do
        if DoesExtraExist(Vehicle, ExtraID) then
            AvailableExtras.VehicleExtras[ExtraID] = (IsVehicleExtraTurnedOn(Vehicle, ExtraID) == 1)
            GotVehicleExtras = true
        end
        
        if GotTrailer and DoesExtraExist(TrailerHandle, ExtraID) then
            if not TrailerMenu then
                TrailerMenu = Menupool:AddSubMenu(submenu, 'Trailer Extras', '~b~Enable/Disable trailer extras')
            end
            
            AvailableExtras.TrailerExtras[ExtraID] = (IsVehicleExtraTurnedOn(TrailerHandle, ExtraID) == 1)
            GotTrailerExtras = true
        end
    end
    
    -- Vehicle Extras
    if GotVehicleExtras then
        SetVehicleAutoRepairDisabled(Vehicle, true)
        
        for Key, Value in pairs(AvailableExtras.VehicleExtras) do
            local ExtraItem = UIMenuCheckboxItem.New('Extra ' .. Key, AvailableExtras.VehicleExtras[Key])
            submenu:AddItem(ExtraItem)
            Items.Vehicle[Key] = ExtraItem
        end
        
        submenu.OnCheckboxChange = function(Sender, Item, Checked)
            for Key, Value in pairs(Items.Vehicle) do
                if Item == Value then
                    AvailableExtras.VehicleExtras[Key] = Checked
                    if AvailableExtras.VehicleExtras[Key] then
                        SetVehicleExtra(Vehicle, Key, 0)
                    else
                        SetVehicleExtra(Vehicle, Key, 1)
                    end
                end
            end
        end
    end
    
    -- Trailer Extras
    if GotTrailerExtras then
        SetVehicleAutoRepairDisabled(TrailerHandle, true)
        
        for Key, Value in pairs(AvailableExtras.TrailerExtras) do
            local ExtraItem = UIMenuCheckboxItem.New('Extra ' .. Key, AvailableExtras.TrailerExtras[Key])
            TrailerMenu:AddItem(ExtraItem)
            Items.Trailer[Key] = ExtraItem
        end
        
        TrailerMenu.OnCheckboxChange = function(Sender, Item, Checked)
            for Key, Value in pairs(Items.Trailer) do
                if Item == Value then
                    AvailableExtras.TrailerExtras[Key] = Checked
                    local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(Vehicle)
                    if AvailableExtras.TrailerExtras[Key] then
                        SetVehicleExtra(TrailerHandle, Key, 0)
                    else
                        SetVehicleExtra(TrailerHandle, Key, 1)
                    end
                end
            end
        end
    end
    
    if GotVehicleExtras or GotTrailerExtras then
        _menuPool:RefreshIndex()
    end
end


--point
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)


--crouch

Crouched = false
CrouchedForce = false
Aimed = false
LastCam = 0
Cooldown = false

CoolDownTime = 500 -- in ms

NormalWalk = function() 
	local Player = PlayerPedId()
	SetPedMaxMoveBlendRatio(Player, 1.0)
	ResetPedMovementClipset(Player, 0.55)
	ResetPedStrafeClipset(Player)
	SetPedCanPlayAmbientAnims(Player, true)
	SetPedCanPlayAmbientBaseAnims(Player, true)
	ResetPedWeaponMovementClipset(Player)
	Crouched = false
end

SetupCrouch = function()
	while not HasAnimSetLoaded('move_ped_crouched') do
		Citizen.Wait(5)
		RequestAnimSet('move_ped_crouched')
	end
end

RemoveCrouchAnim = function()
	RemoveAnimDict('move_ped_crouched')
end

CanCrouch = function()
	local PlayerPed = PlayerPedId()
	if IsPedOnFoot(PlayerPed) and not IsPedJumping(PlayerPed) and not IsPedFalling(PlayerPed) and not IsPedDeadOrDying(PlayerPed) then
		return true
	else
		return false
	end
end

CrouchPlayer = function()
	local Player = PlayerPedId()
	SetPedUsingActionMode(Player, false, -1, "DEFAULT_ACTION")
	SetPedMovementClipset(Player, 'move_ped_crouched', 0.55)
	SetPedStrafeClipset(Player, 'move_ped_crouched_strafing') -- it force be on third person if not player will freeze but this func make player can shoot with good anim on crouch if someone know how to fix this make request :D
	SetWeaponAnimationOverride(Player, "Ballistic")
	Crouched = true
	Aimed = false
end

SetPlayerAimSpeed = function()
	local Player = PlayerPedId()
	SetPedMaxMoveBlendRatio(Player, 0.2)
	Aimed = true
end

IsPlayerFreeAimed = function()
	local PlayerID = GetPlayerIndex()
	if IsPlayerFreeAiming(PlayerID) or IsAimCamActive() or IsAimCamThirdPersonActive() then
		return true
	else
		return false
	end
end

CrouchLoop = function()
	SetupCrouch()
	while CrouchedForce do
		local CanDo = CanCrouch()
		if CanDo and Crouched and IsPlayerFreeAimed() then
			SetPlayerAimSpeed()
		elseif CanDo and (not Crouched or Aimed) then
			CrouchPlayer()
		elseif not CanDo and Crouched then
			CrouchedForce = false
			NormalWalk()
		end

		local NowCam = GetFollowPedCamViewMode()
		if CanDo and Crouched and NowCam == 4 then
			SetFollowPedCamViewMode(LastCam)
		elseif CanDo and Crouched and NowCam ~= 4 then
			LastCam = NowCam
		end

		Citizen.Wait(5)
	end
	NormalWalk()
	RemoveCrouchAnim()
end

RegisterCommand('crouch', function()
	DisableControlAction(0, 36, true) -- magic
	if not Cooldown then
		CrouchedForce = not CrouchedForce

		if CrouchedForce then
			CreateThread(CrouchLoop) -- Magic Part 2 lamo
		end

		Cooldown = true
		SetTimeout(CoolDownTime, function()
			Cooldown = false
		end)
	end
end, false)

RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'LCONTROL') -- now its better player can change to any bottom they want


-- Exports --
IsCrouched = function()
	return Crouched
end

exports("IsCrouched", IsCrouched)