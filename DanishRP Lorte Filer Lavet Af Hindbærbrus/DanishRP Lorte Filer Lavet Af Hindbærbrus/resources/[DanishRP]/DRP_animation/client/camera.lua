local fov_max = 70.0
local fov_min = 4.0
local zoomspeed = 6.0
local speed_lr = 4.0
local speed_ud = 4.0

local camera = false
local fov = (fov_max+fov_min)*0.5

local cam = nil
local scaleform = nil

RegisterNetEvent('srp_animation:camera:Toggle')
AddEventHandler('srp_animation:camera:Toggle', function()
	ESX.UI.Menu.CloseAll()
	ToggleCamera()
end)

ToggleCamera = function()
	local playerPed = PlayerPedId()

	if not DoesEntityExist(playerPed) then
		return
	end

	if IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	if not camera then
		EmoteHandler('Emotes', "camera")
		PlayAmbientSpeech1(playerPed, "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")

		Citizen.Wait(2000)

		SetTimecycleModifier("default")
		SetTimecycleModifierStrength(0.3)

		scaleform = RequestScaleformMovie("DRONE_CAM")
		while not HasScaleformMovieLoaded(scaleform) do
			Citizen.Wait(0)
		end

		cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
		AttachCamToEntity(cam, playerPed, 0.0,0.0,1.0, true)
		SetCamRot(cam, 0.0,0.0, GetEntityHeading(playerPed))
		SetCamFov(cam, fov)
		RenderScriptCams(true, false, 0, 1, 0)
		PushScaleformMovieFunction(scaleform, "DRONE_CAM")
		PushScaleformMovieFunctionParameterInt(0)
		PopScaleformMovieFunctionVoid()

		camera = true
	else
		EmoteCancel()

		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
		ClearTimecycleModifier()

		fov = (fov_max + fov_min) * 0.5
		RenderScriptCams(false, false, 0, 1, 0)
		SetScaleformMovieAsNoLongerNeeded(scaleform)
		DestroyCam(cam, false)

		camera = false
	end

	while camera do
		Citizen.Wait(5)

		if IsControlJustPressed(0, 177) then
			ToggleCamera()
		end

		local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
		CheckInputRotation(cam, zoomvalue)

		HandleZoom(cam)
		HideHUDThisFrame()

		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
	end
end

HideHUDThisFrame = function()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(11)
	HideHudComponentThisFrame(12)
	HideHudComponentThisFrame(15)
	HideHudComponentThisFrame(18)
	HideHudComponentThisFrame(19)
end

CheckInputRotation = function(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)

	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

HandleZoom = function(cam)
	if IsControlJustPressed(0,241) then -- Scrollup
		fov = math.max(fov - zoomspeed, fov_min)
	end

	if IsControlJustPressed(0,242) then
		fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov-current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
end
