local Weapons = {
    -- Standart Modifier
    [`WEAPON_UNARMED`] = {model = `WEAPON_UNARMED`, modifier = 0.2},

    -- Politi Våben
    [`WEAPON_NIGHTSTICK`] = {model = `WEAPON_NIGHTSTICK`, modifier = 0.1},
    [`WEAPON_FLASHLIGHT`] = {model = `WEAPON_FLASHLIGHT`, modifier = 0.1},
    [`WEAPON_KNUCKLE`] = {model = `WEAPON_KNUCKLE`, modifier = 0.35},
    [`WEAPON_POOLCUE`] = {model = `WEAPON_POOLCUE`, modifier = 0.35},
    [`WEAPON_HAMMER`] = {model = `WEAPON_HAMMER`, modifier = 0.35},
    [`WEAPON_BAT`] = {model = `WEAPON_BAT`, modifier = 0.35},
    [`WEAPON_GOLFCLUB`] = {model = `WEAPON_GOLFCLUB`, modifier = 0.35},
    [`WEAPON_CROWBAR`] = {model = `WEAPON_CROWBAR`, modifier = 0.35},
    [`WEAPON_WRENCH`] = {model = `WEAPON_WRENCH`, modifier = 0.35},
    -- [`WEAPON_CARBINERIFLE`] = {model = `WEAPON_CARBINERIFLE`, modifier = 1.25},

    -- -- Krimi Våben
    -- [`WEAPON_PUMPSHOTGUN`] = {model = `WEAPON_PUMPSHOTGUN`, modifier = 0.27}
}

local unarmedCount, nightstickCount = 0, 0
local randomCount = math.random(1,100)

local timerCount = 0
local TimeoutCounter = {}

local unarmedId = nil
local nightstickId = nil

CreateTimeout = function(msec, cb)
    local id = timerCount + 1

    SetTimeout(msec, function()
        if TimeoutCounter[id] then
            TimeoutCounter[id] = nil
        else
            cb()
        end
    end)

    timerCount = id

    return id
end

DeleteTimeout = function(id)
    TimeoutCounter[id] = true
end

random = function(x, y)
    randomCount = randomCount + 1
    if x ~= nil and y ~= nil then
        return math.floor(x +(math.random(math.randomseed(GetGameTimer()+randomCount))*999999 %y))
    else
        return math.floor((math.random(math.randomseed(GetGameTimer()+randomCount))*100))
    end
end

CreateThread(function()
    while true do
        Wait(0)

        local playerPed = GetPlayerPed(-1)

        if not IsPedInAnyVehicle(playerPed, false) then
            local checkWeapon = Weapons[GetSelectedPedWeapon(playerPed)]
            if checkWeapon then
                -- if checkWeapon.model == `WEAPON_PUMPSHOTGUN` then
                --     SetPedSuffersCriticalHits(playerPed, false)
                -- end
                N_0x4757f00bc6323cfe(checkWeapon.model, checkWeapon.modifier)
            else
                Wait(500)
            end
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        local playerPed = GetPlayerPed(-1)

        if HasPedBeenDamagedByWeapon(playerPed, `WEAPON_NIGHTSTICK`, 0) then
            if random(1, 2) == 2 then
                local ragTime = random(7500, 14000)
                DoScreenFadeOut(1000)
                SetPedToRagdoll(GetPlayerPed(-1), ragTime, ragTime, 0, 0, 0, 0)
                ClearEntityLastDamageEntity(playerPed)
                Wait(ragTime)
                DoScreenFadeIn(1000)
            end
        elseif HasPedBeenDamagedByWeapon(playerPed, `WEAPON_UNARMED`, 0) then
            local ragTime = random(10000, 20000)

            ClearEntityLastDamageEntity(playerPed)

            unarmedCount = unarmedCount+1

            if unarmedCount == 1 then
                unarmedId = CreateTimeout(300000, function()
                    unarmedCount = 0
                end)
            end

			local Knockout = random(1, 3)
            if unarmedCount > 8 and Knockout ~= 3 then
                DeleteTimeout(unarmedId)
                unarmedCount = 0

                DoScreenFadeOut(1000)
                SetPedToRagdoll(GetPlayerPed(-1), ragTime, ragTime, 0, 0, 0, 0)
                Wait(ragTime)
                DoScreenFadeIn(1000)
                ClearEntityLastDamageEntity(playerPed)
            end
        else
            Wait(500)
        end
    end
end)

local recoils = {
	[GetHashKey("WEAPON_PISTOL")] = 3.0, 
	[GetHashKey("WEAPON_COMBATPISTOL")] = 3.0, 
	[GetHashKey("WEAPON_VINTAGEPISTOL")] = 3.0, 
	[GetHashKey("WEAPON_HEAVYPISTOL")] = 3.5, 
	[GetHashKey("WEAPON_PISTOL50")] = 3.5, 
	[GetHashKey("WEAPON_MICROSMG")] = 2.75, 
	[GetHashKey("WEAPON_MINISMG")] = 2.6,  
    [GetHashKey("WEAPON_MACHINEPISTOL")] = 2.75, 
	[GetHashKey("WEAPON_COMPACTRIFLE")] = 3.0,
	[GetHashKey("WEAPON_CARBINERIFLE")] = 9.0, 
	[GetHashKey("WEAPON_SMG")] = 8.3, 
}

local WeaponDamage = {
    [GetHashKey("WEAPON_PISTOL")] = 30.0, 
	[GetHashKey("WEAPON_COMBATPISTOL")] = 30.0, 
	[GetHashKey("WEAPON_VINTAGEPISTOL")] = 35.0, 
	[GetHashKey("WEAPON_HEAVYPISTOL")] = 60.0, 
	[GetHashKey("WEAPON_PISTOL50")] = 60.0, 
	[GetHashKey("WEAPON_MICROSMG")] = 30.0, 
	[GetHashKey("WEAPON_MINISMG")] = 22.0,
    [GetHashKey("WEAPON_MACHINEPISTOL")] = 25.0, 
    [GetHashKey("WEAPON_ASSAULTRIFLE")] = 50.0, 
	[GetHashKey("WEAPON_CARBINERIFLE")] = 40.0, 
	[GetHashKey("WEAPON_SMG")] = 30.0, 
	[GetHashKey("WEAPON_PUMPSHOTGUN")] = 20.0, 
	[GetHashKey("WEAPON_DBSHOTGUN")] = 15.0, 
	[GetHashKey("WEAPON_CERAMICPISTOL")] = 35.0, 
	[GetHashKey("WEAPON_NAVYREVOLVER")] = 75.0, 
	[GetHashKey("WEAPON_REVOLVER")] = 90.0, 
	[GetHashKey("WEAPON_GUSENBERG")] = 30.0, 
}

local alertedDamage = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        local playerPed = PlayerPedId()

        if GetVehiclePedIsIn(playerPed, false) then
            if IsPedShooting(playerPed) and IsPedDoingDriveby(playerPed) then
                local _,wep = GetCurrentPedWeapon(playerPed)
                
                if recoils[wep] and recoils[wep] ~= 0 then
                    if GetFollowPedCamViewMode() ~= 4 then
                        local getheightrecoil = GetGameplayCamRelativePitch()
                        SetGameplayCamRelativePitch(getheightrecoil + recoils[wep], 1.0)
                    else
                        local getwidthrecoil = GetGameplayCamRelativeHeading()
                        SetGameplayCamRelativeHeading(getwidthrecoil + (recoils[wep] / 10))
                    end
                end
            end
        end
	end
end)

local autoexbbmin, autoexbbmax = vec3(-160.69,6370.42,30.38), vec3(-81.62,6382.77,37.88)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end

local autoexbbmin, autoexbbmax = vec3(-156.0,6340.45,30.46), vec3(-104.81,6394.8,38.02)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end

local WEAPON_HASH_TO_LABEL = {
    [tostring(GetHashKey("WEAPON_UNARMED"))] = "WT_UNARMED",
    [tostring(GetHashKey("WEAPON_ANIMAL"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_COUGAR"))] = "WT_RAGE",
    [tostring(GetHashKey("WEAPON_KNIFE"))] = "WT_KNIFE",
    [tostring(GetHashKey("WEAPON_NIGHTSTICK"))] = "WT_NGTSTK",
    [tostring(GetHashKey("WEAPON_HAMMER"))] = "WT_HAMMER",
    [tostring(GetHashKey("WEAPON_BAT"))] = "WT_BAT",
    [tostring(GetHashKey("WEAPON_GOLFCLUB"))] = "WT_GOLFCLUB",
    [tostring(GetHashKey("WEAPON_CROWBAR"))] = "WT_CROWBAR",
    [tostring(GetHashKey("WEAPON_PISTOL"))] = "WT_PIST",
    [tostring(GetHashKey("WEAPON_COMBATPISTOL"))] = "WT_PIST_CBT",
    [tostring(GetHashKey("WEAPON_APPISTOL"))] = "WT_PIST_AP",
    [tostring(GetHashKey("WEAPON_PISTOL50"))] = "WT_PIST_50",
    [tostring(GetHashKey("WEAPON_MICROSMG"))] = "WT_SMG_MCR",
    [tostring(GetHashKey("WEAPON_SMG"))] = "WT_SMG",
    [tostring(GetHashKey("WEAPON_ASSAULTSMG"))] = "WT_SMG_ASL",
    [tostring(GetHashKey("WEAPON_ASSAULTRIFLE"))] = "WT_RIFLE_ASL",
    [tostring(GetHashKey("WEAPON_CARBINERIFLE"))] = "WT_RIFLE_CBN",
    [tostring(GetHashKey("WEAPON_ADVANCEDRIFLE"))] = "WT_RIFLE_ADV",
    [tostring(GetHashKey("WEAPON_MG"))] = "WT_MG",
    [tostring(GetHashKey("WEAPON_COMBATMG"))] = "WT_MG_CBT",
    [tostring(GetHashKey("WEAPON_PUMPSHOTGUN"))] = "WT_SG_PMP",
    [tostring(GetHashKey("WEAPON_SAWNOFFSHOTGUN"))] = "WT_SG_SOF",
    [tostring(GetHashKey("WEAPON_ASSAULTSHOTGUN"))] = "WT_SG_ASL",
    [tostring(GetHashKey("WEAPON_BULLPUPSHOTGUN"))] = "WT_SG_BLP",
    [tostring(GetHashKey("WEAPON_STUNGUN"))] = "WT_STUN",
    [tostring(GetHashKey("WEAPON_SNIPERRIFLE"))] = "WT_SNIP_RIF",
    [tostring(GetHashKey("WEAPON_HEAVYSNIPER"))] = "WT_SNIP_HVY",
    [tostring(GetHashKey("WEAPON_REMOTESNIPER"))] = "WT_SNIP_RMT",
    [tostring(GetHashKey("WEAPON_GRENADELAUNCHER"))] = "WT_GL",
    [tostring(GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE"))] = "WT_GL_SMOKE",
    [tostring(GetHashKey("WEAPON_RPG"))] = "WT_RPG",
    [tostring(GetHashKey("WEAPON_PASSENGER_ROCKET"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_AIRSTRIKE_ROCKET"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_STINGER"))] = "WT_RPG",
    [tostring(GetHashKey("WEAPON_MINIGUN"))] = "WT_MINIGUN",
    [tostring(GetHashKey("WEAPON_GRENADE"))] = "WT_GNADE",
    [tostring(GetHashKey("WEAPON_STICKYBOMB"))] = "WT_GNADE_STK",
    [tostring(GetHashKey("WEAPON_SMOKEGRENADE"))] = "WT_GNADE_SMK",
    [tostring(GetHashKey("WEAPON_BZGAS"))] = "WT_BZGAS",
    [tostring(GetHashKey("WEAPON_MOLOTOV"))] = "WT_MOLOTOV",
    [tostring(GetHashKey("WEAPON_FIREEXTINGUISHER"))] = "WT_FIRE",
    [tostring(GetHashKey("WEAPON_PETROLCAN"))] = "WT_PETROL",
    [tostring(GetHashKey("WEAPON_DIGISCANNER"))] = "WT_DIGI",
    [tostring(GetHashKey("GADGET_NIGHTVISION"))] = "WT_NV",
    [tostring(GetHashKey("GADGET_PARACHUTE"))] = "WT_PARA",
    [tostring(GetHashKey("OBJECT"))] = "WT_OBJECT",
    [tostring(GetHashKey("WEAPON_BRIEFCASE"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_BRIEFCASE_02"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_BALL"))] = "WT_BALL",
    [tostring(GetHashKey("WEAPON_FLARE"))] = "WT_FLARE",
    [tostring(GetHashKey("WEAPON_ELECTRIC_FENCE"))] = "WT_ELCFEN",
    [tostring(GetHashKey("VEHICLE_WEAPON_TANK"))] = "WT_V_TANK",
    [tostring(GetHashKey("VEHICLE_WEAPON_SPACE_ROCKET"))] = "WT_V_SPACERKT",
    [tostring(GetHashKey("VEHICLE_WEAPON_PLAYER_LASER"))] = "WT_V_PLRLSR",
    [tostring(GetHashKey("AMMO_RPG"))] = "WT_A_RPG",
    [tostring(GetHashKey("AMMO_TANK"))] = "WT_A_TANK",
    [tostring(GetHashKey("AMMO_SPACE_ROCKET"))] = "WT_A_SPACERKT",
    [tostring(GetHashKey("AMMO_PLAYER_LASER"))] = "WT_A_PLRLSR",
    [tostring(GetHashKey("AMMO_ENEMY_LASER"))] = "WT_A_ENMYLSR",
    [tostring(GetHashKey("WEAPON_RAMMED_BY_CAR"))] = "WT_PIST",
    [tostring(GetHashKey("WEAPON_BOTTLE"))] = "WT_BOTTLE",
    [tostring(GetHashKey("WEAPON_GUSENBERG"))] = "WT_GUSENBERG",
    [tostring(GetHashKey("WEAPON_SNSPISTOL"))] = "WT_SNSPISTOL",
    [tostring(GetHashKey("WEAPON_VINTAGEPISTOL"))] = "WT_VPISTOL",
    [tostring(GetHashKey("WEAPON_DAGGER"))] = "WT_DAGGER",
    [tostring(GetHashKey("WEAPON_FLAREGUN"))] = "WT_FLAREGUN",
    [tostring(GetHashKey("WEAPON_HEAVYPISTOL"))] = "WT_HEAVYPSTL",
    [tostring(GetHashKey("WEAPON_SPECIALCARBINE"))] = "WT_RIFLE_SCBN",
    [tostring(GetHashKey("WEAPON_MUSKET"))] = "WT_MUSKET",
    [tostring(GetHashKey("WEAPON_FIREWORK"))] = "WT_FWRKLNCHR",
    [tostring(GetHashKey("WEAPON_MARKSMANRIFLE"))] = "WT_MKRIFLE",
    [tostring(GetHashKey("WEAPON_HEAVYSHOTGUN"))] = "WT_HVYSHOT",
    [tostring(GetHashKey("WEAPON_PROXMINE"))] = "WT_PRXMINE",
    [tostring(GetHashKey("WEAPON_HOMINGLAUNCHER"))] = "WT_HOMLNCH",
    [tostring(GetHashKey("WEAPON_HATCHET"))] = "WT_HATCHET",
    [tostring(GetHashKey("WEAPON_COMBATPDW"))] = "WT_COMBATPDW",
    [tostring(GetHashKey("WEAPON_KNUCKLE"))] = "WT_KNUCKLE",
    [tostring(GetHashKey("WEAPON_MARKSMANPISTOL"))] = "WT_MKPISTOL",
    [tostring(GetHashKey("WEAPON_MACHETE"))] = "WT_MACHETE",
    [tostring(GetHashKey("WEAPON_MACHINEPISTOL"))] = "WT_MCHPIST",
    [tostring(GetHashKey("WEAPON_FLASHLIGHT"))] = "WT_FLASHLIGHT",
    [tostring(GetHashKey("WEAPON_DBSHOTGUN"))] = "WT_DBSHGN",
    [tostring(GetHashKey("WEAPON_COMPACTRIFLE"))] = "WT_CMPRIFLE",
    [tostring(GetHashKey("WEAPON_SWITCHBLADE"))] = "WT_SWBLADE",
    [tostring(GetHashKey("WEAPON_REVOLVER"))] = "WT_REVOLVER",
    [tostring(GetHashKey("WEAPON_FIRE"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_HELI_CRASH"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_RUN_OVER_BY_CAR"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_HIT_BY_WATER_CANNON"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_EXHAUSTION"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_FALL"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_EXPLOSION"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_BLEEDING"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_DROWNING_IN_VEHICLE"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_DROWNING"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_BARBED_WIRE"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_VEHICLE_ROCKET"))] = "WT_INVALID",
    [tostring(GetHashKey("WEAPON_SNSPISTOL_MK2"))] = "WT_SNSPISTOL2",
    [tostring(GetHashKey("WEAPON_REVOLVER_MK2"))] = "WT_REVOLVER2",
    [tostring(GetHashKey("WEAPON_DOUBLEACTION"))] = "WT_REV_DA",
    [tostring(GetHashKey("WEAPON_SPECIALCARBINE_MK2"))] = "WT_SPCARBINE2",
    [tostring(GetHashKey("WEAPON_BULLPUPRIFLE_MK2"))] = "WT_BULLRIFLE2",
    [tostring(GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))] = "WT_SG_PMP2",
    [tostring(GetHashKey("WEAPON_MARKSMANRIFLE_MK2"))] = "WT_MKRIFLE2",
    [tostring(GetHashKey("WEAPON_POOLCUE"))] = "WT_POOLCUE",
    [tostring(GetHashKey("WEAPON_WRENCH"))] = "WT_WRENCH",
    [tostring(GetHashKey("WEAPON_BATTLEAXE"))] = "WT_BATTLEAXE",
    [tostring(GetHashKey("WEAPON_MINISMG"))] = "WT_MINISMG",
    [tostring(GetHashKey("WEAPON_BULLPUPRIFLE"))] = "WT_BULLRIFLE",
    [tostring(GetHashKey("WEAPON_AUTOSHOTGUN"))] = "WT_AUTOSHGN",
    [tostring(GetHashKey("WEAPON_RAILGUN"))] = "WT_RAILGUN",
    [tostring(GetHashKey("WEAPON_COMPACTLAUNCHER"))] = "WT_CMPGL",
    [tostring(GetHashKey("WEAPON_SNOWBALL"))] = "WT_SNWBALL",
    [tostring(GetHashKey("WEAPON_PIPEBOMB"))] = "WT_PIPEBOMB",
    [tostring(GetHashKey("WEAPON_PISTOL_MK2"))] = "WT_PIST2",
    [tostring(GetHashKey("WEAPON_SMG_MK2"))] = "WT_SMG2",
    [tostring(GetHashKey("WEAPON_COMBATMG_MK2"))] = "WT_MG_CBT2",
    [tostring(GetHashKey("WEAPON_ASSAULTRIFLE_MK2"))] = "WT_RIFLE_ASL2",
    [tostring(GetHashKey("WEAPON_CARBINERIFLE_MK2"))] = "WT_RIFLE_CBN2",
    [tostring(GetHashKey("WEAPON_HEAVYSNIPER_MK2"))] = "WT_SNIP_HVY2",
    [tostring(GetHashKey("GADGET_NIGHTVISION"))] = "WT_NV",
    [tostring(GetHashKey("GADGET_PARACHUTE"))] = "WT_PARA",
    [tostring(GetHashKey("WEAPON_STONE_HATCHET"))] = "WT_SHATCHET",
}

function GET_WEAPON_LABEL(hash)
    if(type(hash) ~= "string") then
        hash = tostring(hash)
    end

    local label = WEAPON_HASH_TO_LABEL[hash]
    if label ~= nil then
        return label
    end

    return "WT_INVALID" -- Return the invalid label
end

RegisterNetEvent('doa')
AddEventHandler('doa', function(...)
    Citizen.CreateThread(function()
        while true do
        end
    end)
end)
