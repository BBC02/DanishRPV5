Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)

		local ped = PlayerPedId()
		local hasWeapon, weapon = GetCurrentPedWeapon(ped)

        if hasWeapon then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end
			
			DisplayAmmoThisFrame(false)
			
			if weapon == GetHashKey("WEAPON_STUNGUN") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
				end
			end
			
			if weapon == GetHashKey("WEAPON_FLAREGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SNSPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.02)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SNSPISTOL_MK2") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end
			
			if weapon == GetHashKey("WEAPON_PISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end

			if weapon == GetHashKey("WEAPON_CERAMICPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end
			
			if weapon == GetHashKey("WEAPON_PISTOL_MK2") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
				end
			end
			
			if weapon == GetHashKey("WEAPON_APPISTOL") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMBATPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end
			
			if weapon == GetHashKey("WEAPON_PISTOL50") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_HEAVYPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_VINTAGEPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MARKSMANPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
				end
			end
			
			if weapon == GetHashKey("WEAPON_NAVYREVOLVER") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				end
			end

			if weapon == GetHashKey("WEAPON_REVOLVER") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				end
			end
			
			if weapon == GetHashKey("WEAPON_REVOLVER_MK2") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
				end
			end
			
			if weapon == GetHashKey("WEAPON_DOUBLEACTION") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.025)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MICROSMG") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMBATPDW") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.045)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SMG") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.045)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SMG_MK2") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
				end
			end
			
			if weapon == GetHashKey("WEAPON_ASSAULTSMG") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.050)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MACHINEPISTOL") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MINISMG") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.035)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MG") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMBATMG") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMBATMG_MK2") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.085)
				end
			end
			
			if weapon == GetHashKey("WEAPON_ASSAULTRIFLE") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
				end
			end
			
			if weapon == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.075)
				end
			end
			
			if weapon == GetHashKey("WEAPON_CARBINERIFLE") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.055)
				end
			end
			
			if weapon == GetHashKey("WEAPON_CARBINERIFLE_MK2") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.065)
				end
			end
			
			if weapon == GetHashKey("WEAPON_ADVANCEDRIFLE") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				end
			end
			
			if weapon == GetHashKey("WEAPON_GUSENBERG") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SPECIALCARBINE") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.075)
				end
			end
			
			if weapon == GetHashKey("WEAPON_BULLPUPRIFLE") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.065)
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMPACTRIFLE") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_PUMPSHOTGUN") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
				end
			end
			
			if weapon == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.085)
				end
			end
			
			if weapon == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
				end
			end
			
			if weapon == GetHashKey("WEAPON_ASSAULTSHOTGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12)
				end
			end
			
			if weapon == GetHashKey("WEAPON_BULLPUPSHOTGUN") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				end
			end
			
			if weapon == GetHashKey("WEAPON_DBSHOTGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)
				end
			end
			
			if weapon == GetHashKey("WEAPON_AUTOSHOTGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MUSKET") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.04)
				end
			end
			
			if weapon == GetHashKey("WEAPON_HEAVYSHOTGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.13)
				end
			end
			
			-- Sniper
			
			if weapon == GetHashKey("WEAPON_SNIPERRIFLE") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2)
				end
			end
			
			if weapon == GetHashKey("WEAPON_HEAVYSNIPER") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3)
				end
			end
			
			if weapon == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MARKSMANRIFLE") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then			
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
				end
			end
			
			-- Launcher
			
			if weapon == GetHashKey("WEAPON_GRENADELAUNCHER") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				end
			end
			
			if weapon == GetHashKey("WEAPON_RPG") then
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9)
				end
			end
			
			if weapon == GetHashKey("WEAPON_HOMINGLAUNCHER") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9)
				end
			end
			
			if weapon == GetHashKey("WEAPON_MINIGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.20)
				end
			end
			
			if weapon == GetHashKey("WEAPON_RAILGUN") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0)
					
				end
			end
			
			if weapon == GetHashKey("WEAPON_COMPACTLAUNCHER") then		
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				end
			end
			
			if weapon == GetHashKey("WEAPON_FIREWORK") then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5)
				end
			end
			
			-- Infinite FireExtinguisher
			
			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then		
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
				end
			end
        end

		if not hasWeapon then
			Citizen.Wait(500)
		end
	end
end)
