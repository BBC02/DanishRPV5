if not lib then return end

local Weapon = {}
local Items = client.items
local Utils = client.utils
client.weapon = Weapon

local Vehicles = data 'vehicles'

function Utils.PlayAnim(wait, dict, name, blendIn, blendOut, duration, flag, rate, lockX, lockY, lockZ)
	lib.requestAnimDict(dict)
	CreateThread(function()
		TaskPlayAnim(cache.ped, dict, name, blendIn, blendOut, duration, flag, rate, lockX, lockY, lockZ)
		Wait(wait)
		if wait > 0 then ClearPedSecondaryTask(cache.ped) end
	end)
end

function Utils.PlayAnimAdvanced(wait, dict, name, posX, posY, posZ, rotX, rotY, rotZ, animEnter, animExit, duration, flag, time)
	lib.requestAnimDict(dict)
	CreateThread(function()
		TaskPlayAnimAdvanced(cache.ped, dict, name, posX, posY, posZ, rotX, rotY, rotZ, animEnter, animExit, duration, flag, time, 0, 0)
		Wait(wait)
		if wait > 0 then ClearPedSecondaryTask(cache.ped) end
	end)
end

function Utils.Raycast(flag)
	local playerCoords = GetEntityCoords(cache.ped)
	local plyOffset = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 2.2, -0.25)
	local rayHandle = StartShapeTestCapsule(playerCoords.x, playerCoords.y, playerCoords.z + 0.5, plyOffset.x, plyOffset.y, plyOffset.z, 2.2, flag or 30, cache.ped, 4)
	while true do
		Wait(0)
		local result, _, _, _, entityHit = GetShapeTestResult(rayHandle)
		if result ~= 1 then
			local entityType
			if entityHit then entityType = GetEntityType(entityHit) end
			if entityHit and entityType ~= 0 then
				return entityHit, entityType
			end
			return false
		end
	end
end

function Utils.GetClosestPlayer()
	local players = GetActivePlayers()
	local playerCoords = GetEntityCoords(cache.ped)
	local targetDistance, targetId, targetPed

	for i = 1, #players do
		local player = players[i]

		if player ~= cache.playerId then
			local ped = GetPlayerPed(player)
			local distance = #(playerCoords - GetEntityCoords(ped))

			if distance < (targetDistance or 2) then
				targetDistance = distance
				targetId = player
				targetPed = ped
			end
		end
	end

	return targetId, targetPed
end

function Utils.DeleteObject(obj)
	SetEntityAsMissionEntity(obj, false, true)
	DeleteObject(obj)
end

-- Enables the weapon wheel, but disables the use of inventory items
-- Mostly used for weaponised vehicles, though could be called for "minigames"
function Utils.WeaponWheel(state)
	if state == nil then state = EnableWeaponWheel end

	EnableWeaponWheel = state
	SetWeaponsNoAutoswap(not state)
	SetWeaponsNoAutoreload(not state)
end
exports('weaponWheel', Utils.WeaponWheel)

function Utils.AddWeaponToHolster(Holster)
	local playerPed = PlayerPedId()

	if Holster == 73 then
		SetPedComponentVariation(playerPed, 8, 130, 0, 0)
	elseif Holster == 141 then
		SetPedComponentVariation(playerPed, 8, 138, 0, 0)
	elseif Holster == 76 then
		SetPedComponentVariation(playerPed, 8, 122, 0, 0)
	elseif Holster == 64 then
		SetPedComponentVariation(playerPed, 8, 143, 0, 0)
	elseif Holster == 49 then
		SetPedComponentVariation(playerPed, 8, 50, 0, 0)
	elseif Holster == 114 then
		SetPedComponentVariation(playerPed, 8, 113, 0, 0)
	elseif Holster == 112 then
		SetPedComponentVariation(playerPed, 8, 111, 0, 0)
	elseif Holster == 142 then
		SetPedComponentVariation(playerPed, 8, 139, 0, 0)	
	end
end

function Utils.RemoveWeaponFromHolster(Holster)
	local playerPed = PlayerPedId()

	if Holster == 130 then
		SetPedComponentVariation(playerPed, 8, 73, 0, 0)
	elseif Holster == 138 then
		SetPedComponentVariation(playerPed, 8, 141, 0, 0)
	elseif Holster == 122 then
		SetPedComponentVariation(playerPed, 8, 76, 0, 0)
	elseif Holster == 143 then
		SetPedComponentVariation(playerPed, 8, 64, 0, 0)
	elseif Holster == 50 then
		SetPedComponentVariation(playerPed, 8, 49, 0, 0)
	elseif Holster == 113 then
		SetPedComponentVariation(playerPed, 8, 114, 0, 0)
	elseif Holster == 111 then
		SetPedComponentVariation(playerPed, 8, 112, 0, 0)
	elseif Holster == 139 then
		SetPedComponentVariation(playerPed, 8, 142, 0, 0)	
	end
end
HolsterWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_PISTOL`] = true,
    [`WEAPON_PISTOL_MK2`] = true,
    [`WEAPON_COMBATPISTOL`] = true,
    [`WEAPON_APPISTOL`] = true,
    [`WEAPON_PISTOL50`] = true,
    [`WEAPON_HEAVYPISTOL`] = true,
    [`WEAPON_VINTAGEPISTOL`] = true,
    [`WEAPON_STUNGUN`] = true,
    [`WEAPON_SNSPISTOL`] = true,
    [`WEAPON_SNSPISTOL_MK2`] = true,
    [`WEAPON_CERAMICPISTOL`] = true,
    [`WEAPON_REVOLVER`] = true,
    [`WEAPON_NAVYREVOLVER`] = true,
}

StashWeapons = {
    [`WEAPON_BAT`] = true,
    [`WEAPON_GOLFCLUB`] = true,
    [`WEAPON_CROWBAR`] = true,
    [`WEAPON_WRENCH`] = true,
    [`WEAPON_HATCHET`] = true,
    [`WEAPON_BATTLEAXE`] = true,
    [`WEAPON_MACHETE`] = true,
    [`WEAPON_POOLCUE`] = true,
    [`WEAPON_MICROSMG`] = true,
    [`WEAPON_MINISMG`] = true,
    [`WEAPON_SMG`] = true,
    [`WEAPON_DBSHOTGUN`] = true,
    [`WEAPON_MACHINEPISTOL`] = true,
    [`WEAPON_GUSENBERG`] = true,
    [`WEAPON_COMPACTRIFLE`] = true,
    [`WEAPON_ASSAULTRIFLE`] = true,
    [`WEAPON_CARBINERIFLE`] = true,
    [`WEAPON_COMBATPDW`] = true,
    [`WEAPON_PUMPSHOTGUN`] = true,
}

MaleHolsters = {
    [130] = true,
    [138] = true,
    [122] = true,
    [50] = true,
    [111] = true,
    [113] = true,
    [139] = true,
    [73] = true,
    [141] = true,
    [76] = true,
    [64] = true,
    [49] = true,
    [114] = true,
    [112] = true,
    [142] = true,
}

FemaleHolsters = {
    [152] = true,
    [160] = true,
    [178] = true,
    [179] = true,
}

MaleDecalHolsters = {
    [15] = true,
}

FemaleDecalHolsters = {
    [129] = true,
}

ValidPedBags = {
    [`mp_m_freemode_01`] = {
        variation = 5,
        bags = {
            [11] = true,
            [40] = true,
            [41] = true,
            [49] = true,
            [52] = true,
            [81] = true,
            [82] = true,
            [85] = true,
            [86] = true,
            [112] = true,
            [114] = true,
            [115] = true,
            [116] = true,
            [117] = true,
            [118] = true,
            [119] = true,
            [120] = true,
            [121] = true,
        }
    },
    [`mp_f_freemode_01`] = {
        variation = 5,
        bags = {
            [11] = true,
            [111] = true,
            [112] = true,
            [113] = true,
            [114] = true,
            [115] = true,
            [116] = true,
        }
    },
    [`konrad`] = {
        variation = 9,
        bags = {
            [1] = true,
        }
    },
    [`a_m_o_soucent_02`] = {
        variation = 5,
        bags = {
            [1] = true,
        }
    },
    [`g_m_m_kakki_001`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`u_m_m_ishkan`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`dracul`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`darko`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`g_m_m_zlatko_01`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`vlad`] = {
        variation = 5,
        bags = {
            [0] = true,
        }
    },
    [`ivan`] = {
        variation = 8,
        bags = {
            [3] = true,
        }
    },
}

client.utils = Utils

local plyState = LocalPlayer.state
function Weapon.Equip(item, data)
	plyState:set('animation', true, true)
	local playerPed = cache.ped
	
	if StashWeapons[data.hash] then
		local playerModel = GetEntityModel(playerPed)
		if ValidPedBags[playerModel] then
			local currentBag = GetPedDrawableVariation(playerPed, ValidPedBags[playerModel].variation)
			local currentTextureBag = GetPedTextureVariation(playerPed, ValidPedBags[playerModel].variation)
			local hasStash = ValidPedBags[playerModel].bags[currentBag] and (currentTextureBag ~= 255 and currentTextureBag ~= -1)

			if not hasStash then
				local entity, type = Utils.Raycast()
				if entity and type == 2 then
					local vehicle, position = entity, GetEntityCoords(entity)

					local vehicleClass = GetVehicleClass(vehicle)
					if Vehicles.trunk[vehicleClass] then
						local playerCoords = GetEntityCoords(playerPed)
						if #(playerCoords - position) < 6 and NetworkGetEntityIsNetworked(vehicle) then
							local locked = GetVehicleDoorLockStatus(vehicle)
							if locked == 0 or locked == 1 then
								hasStash = true
							end
						end
					end
				end
			end

			if not hasStash then
				exports['mythic_notify']:SendAlert('error', 'Du kan ikke tage våbnet frem, da du ikke har en taske, eller et bagagerum i nærheden.', 7000)
				plyState:set('animation', false, true)
				return
			end

			local animDict = "anim@heists@ornate_bank@grab_cash"
			Utils.PlayAnim(1400, animDict, 'intro', 3.0, 3.0, -1, 50, 0.0, 0, 0, 0)
			Citizen.Wait(800)

			SetPedAmmo(playerPed, data.hash, 0)
			GiveWeaponToPed(playerPed, data.hash, 0, false, true)
		end
	elseif HolsterWeapons[data.hash] then
		local hasFoundHolster = false

		if not hasFoundHolster then
			local holsters = GetEntityModel(playerPed) == GetHashKey('mp_f_freemode_01') and FemaleHolsters or MaleHolsters
			local currentHolster = GetPedDrawableVariation(playerPed, 8)

			if holsters[currentHolster] then
				hasFoundHolster = true

				Utils.PlayAnim(250, "rcmjosh4", 'josh_leadout_cop2', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)
				Citizen.Wait(250)

				SetPedAmmo(playerPed, data.hash, 0)
				GiveWeaponToPed(playerPed, data.hash, 0, false, true)

				Utils.RemoveWeaponFromHolster(currentHolster)
			end
		end

		if not hasFoundHolster then
			local decals = GetEntityModel(cache.ped) == GetHashKey('mp_f_freemode_01') and FemaleDecalHolsters or MaleDecalHolsters
			local currentDecal = GetPedDrawableVariation(cache.ped, 10)

			if decals[currentDecal] then
				hasFoundHolster = true

				Utils.PlayAnim(250, "rcmjosh4", 'josh_leadout_cop2', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)
				Citizen.Wait(250)

				SetPedAmmo(playerPed, data.hash, 0)
				GiveWeaponToPed(playerPed, data.hash, 0, false, true)
			end
		end
		
		if not hasFoundHolster then
			Utils.PlayAnim(2500, "reaction@intimidation@1h", 'intro', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)

			Citizen.Wait(1000)
			SetPedAmmo(playerPed, data.hash, 0)
			GiveWeaponToPed(playerPed, data.hash, 0, false, true)
			Citizen.Wait(1500)
		end
	elseif data.hash == `WEAPON_SWITCHBLADE` then
		local animDict = 'anim@melee@switchblade@holster'
		Utils.PlayAnim(900, animDict, 'unholster', 8.0, 3.0, -1, 48, 0.0, 0, 0, 0)

		Citizen.Wait(100)
		SetPedAmmo(playerPed, data.hash, 0)
		GiveWeaponToPed(playerPed, data.hash, 0, false, true)
		Citizen.Wait(800)
	else
		SetPedAmmo(playerPed, data.hash, 0)
		GiveWeaponToPed(playerPed, data.hash, 0, false, true)
	end

	if item.metadata.tint then SetPedWeaponTintIndex(playerPed, data.hash, item.metadata.tint) end

	if item.metadata.components then
		for i = 1, #item.metadata.components do
			local components = Items[item.metadata.components[i]].client.component
			for v=1, #components do
				local component = components[v]
				if DoesWeaponTakeWeaponComponent(data.hash, component) then
					if not HasPedGotWeaponComponent(playerPed, data.hash, component) then
						GiveWeaponComponentToPed(playerPed, data.hash, component)
					end
				end
			end
		end
	end

	item.hash = data.hash
	item.ammo = data.ammoname
	item.melee = (not item.throwable and not data.ammoname) and 0
	item.timer = 0

	if data.throwable then item.throwable = true end

	SetCurrentPedWeapon(playerPed, data.hash, true)
	SetPedCurrentWeaponVisible(playerPed, true, false, false, false)
	AddAmmoToPed(playerPed, data.hash, item.metadata.ammo or 100)
	Wait(0)
	RefillAmmoInstantly(playerPed)

	if data.hash == `WEAPON_PETROLCAN` or data.hash == `WEAPON_HAZARDCAN` or data.hash == `WEAPON_FIREEXTINGUISHER` then
		item.metadata.ammo = item.metadata.durability
		SetPedInfiniteAmmo(playerPed, true, data.hash)
	end

	TriggerEvent('ox_inventory:currentWeapon', item)
	Utils.ItemNotify({item.metadata.label or item.label, item.metadata.image or item.name, 'ui_equipped'})

	plyState:set('animation', false, true)

	return item
end

function Weapon.Disarm(currentWeapon, skipAnim)
	if source == '' then
		TriggerServerEvent('ox_inventory:updateWeapon')
	end

	if currentWeapon then
		plyState:set('animation', true, true)
		SetPedAmmo(cache.ped, currentWeapon.hash, 0)

		if not skipAnim then
			ClearPedSecondaryTask(cache.ped)

			if StashWeapons[currentWeapon.hash] then
				local animDict = "anim@heists@ornate_bank@grab_cash"
				Utils.PlayAnim(1400, animDict, 'intro', 3.0, 3.0, -1, 50, 0.0, 0, 0, 0)
				Citizen.Wait(900)
			elseif HolsterWeapons[currentWeapon.hash] then
				local hasFoundHolster = false

				if not hasFoundHolster then
					local holsters = GetEntityModel(cache.ped) == GetHashKey('mp_f_freemode_01') and FemaleHolsters or MaleHolsters
					local currentHolster = GetPedDrawableVariation(cache.ped, 8)

					if holsters[currentHolster] then
						hasFoundHolster = true

						Utils.PlayAnim(250, "rcmjosh4", 'josh_leadout_cop2', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)
						Citizen.Wait(250)
						Utils.AddWeaponToHolster(currentHolster)
					end
				end

				if not hasFoundHolster then
					local decals = GetEntityModel(cache.ped) == GetHashKey('mp_f_freemode_01') and FemaleDecalHolsters or MaleDecalHolsters
					local currentDecal = GetPedDrawableVariation(cache.ped, 10)

					if decals[currentDecal] then
						hasFoundHolster = true

						Utils.PlayAnim(250, "rcmjosh4", 'josh_leadout_cop2', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)
						Citizen.Wait(250)
					end
				end

				if not hasFoundHolster then	
					Utils.PlayAnim(2500, "reaction@intimidation@1h", 'outro', 5.0, 1.0, -1, 50, 0.0, 0, 0, 0)
					Citizen.Wait(1500)
				end
			elseif currentWeapon.hash == `WEAPON_SWITCHBLADE` then
				Utils.PlayAnim(900, 'anim@melee@switchblade@holster', 'holster', 8.0, 3.0, -1, 48, 0.0, 0, 0, 0)
				Citizen.Wait(900)
			end
		end

		Utils.ItemNotify({currentWeapon.metadata.label or currentWeapon.label, currentWeapon.metadata.image or currentWeapon.name, 'ui_holstered'})
		TriggerEvent('ox_inventory:currentWeapon')

		plyState:set('animation', false, true)
	end

	Utils.WeaponWheel()
	RemoveAllPedWeapons(cache.ped, true)
end

function Weapon.ClearAll(currentWeapon)
	Weapon.Disarm(currentWeapon)

	if client.parachute then
		local chute = `GADGET_PARACHUTE`
		GiveWeaponToPed(cache.ped, chute, 0, true, false)
		SetPedGadget(cache.ped, chute, true)
	end
end

Utils.Disarm = Weapon.Disarm
Utils.ClearWeapons = Weapon.ClearAll
