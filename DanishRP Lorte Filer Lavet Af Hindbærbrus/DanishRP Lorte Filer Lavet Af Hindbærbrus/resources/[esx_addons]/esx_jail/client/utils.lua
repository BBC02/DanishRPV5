
RegisterCommand("jailmenu", function(source, args)
	if PlayerData.job.name == "police" then
		OpenJailMenu()
	else
		ESX.ShowNotification("Du er ikke betjent!")
	end
end)

function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Wait(10)
	end
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Wait(10)
	end
end

function HideHUDThisFrame()
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

function Cutscene()
	-- DoScreenFadeOut(100)

	-- Wait(250)

	-- LoadModel(-1320879687)

	-- local PolicePosition = Config.Cutscene["PolicePosition"]
	-- local Police = CreatePed(5, -1320879687, PolicePosition["x"], PolicePosition["y"], PolicePosition["z"], PolicePosition["h"], false)
	-- TaskStartScenarioInPlace(Police, "WORLD_HUMAN_PAPARAZZI", 0, false)

	-- local PlayerPosition = Config.Cutscene["PhotoPosition"]
	local PlayerPed = PlayerPedId()
	-- SetEntityCoords(PlayerPed, PlayerPosition["x"], PlayerPosition["y"], PlayerPosition["z"] - 1)
	-- SetEntityHeading(PlayerPed, PlayerPosition["h"])
	-- FreezeEntityPosition(PlayerPed, true)

	-- Cam()

	-- Wait(1000)

	-- DoScreenFadeIn(100)

	-- Wait(10000)

	-- DoScreenFadeOut(250)

	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPed, JailPosition["x"], JailPosition["y"], JailPosition["z"])

	DoScreenFadeIn(250)

	TriggerServerEvent("InteractSound_SV:PlayOnSource", "cell", 0.3)


	InJail()
end

function Cam()
	local CamOptions = Config.Cutscene["CameraPos"]

	CamOptions["cameraId"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    SetCamCoord(CamOptions["cameraId"], CamOptions["x"], CamOptions["y"], CamOptions["z"])
	SetCamRot(CamOptions["cameraId"], CamOptions["rotationX"], CamOptions["rotationY"], CamOptions["rotationZ"])

	RenderScriptCams(true, false, 0, true, true)
end
