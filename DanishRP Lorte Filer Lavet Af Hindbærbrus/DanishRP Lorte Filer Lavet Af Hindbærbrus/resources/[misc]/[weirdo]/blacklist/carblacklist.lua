-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
    "RHINO",
    "HYDRA",
    "lazer",
    "annihilator",
    "buzzard",
    "buzzard2",
    "cargobob",
    "cargobob2",
    "cargobob3",
    "cargobob4",
    "frogger",
    "frogger2",
    "maverick",
    "savage",
    "skylift",
    "supervolito",
    "supervolito2",
    "swift",
    "swift2",
    "valkyrie",
    "valkyrie2",
    "volatus",
    "rhino",
    "LAZOR",
    "LAZER",
    "khanjali",
    "minitank",
    "barrage",
    "halftrack",
    "apc",
	"phantom2",
	"cerberus2",
	"cerberus",
	"cerberus3",
	"dinghy5",
	"patrolboat",
	"thruster",
	"oppressor",
	"oppressor2",
	"dune2",
	"dune3",
	"dune4",
	"dune5",
	"insurgent",
	"insurgent2",
	"insurgent3",
	"menacer",
	"technical",
	"technical2",
	"technical3",
	"Limo2",
	"mogul"
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			TriggerServerEvent('banplayer')
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end