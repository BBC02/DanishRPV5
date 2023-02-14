RegisterNetEvent('policeclothing', function()
	TriggerEvent('pp:policecloth')
end)


RegisterNetEvent('esx_policejob:policeboss')
AddEventHandler('esx_policejob:policeboss', function(targetName,optionName,vars,entityHit)
	if ESX.PlayerData.job.grade_name == "boss" then
		if optionName == "PoliceBoss" then
			ESX.UI.Menu.CloseAll()
			TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
				menu.close()
			end, { wash = false }) -- disable washing money
		elseif optionName == "PoliceSellVehicle" then
			ESX.UI.Menu.CloseAll()
			givevehicle()
		end
	end
end)

RegisterNetEvent('policeboss', function()
	if ESX.PlayerData.job.grade_name == "boss" then
		ESX.UI.Menu.CloseAll()
			TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
				menu.close()
			end, { wash = false })
		end
end)

 exports['qtarget']:AddBoxZone("onoffduty", vector3(469.29, -992.47, 26.27), 0.45, 0.45, {
	name="Gå på arbejde",
	heading=0,
	minZ=23.27,
	maxZ=29.27
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("onoffdutysandy", vector3(1833.9968, 3677.9131, 34.1892), 2.5, 2.5, {
	name="Gå på arbejde",
	heading=0,
	minZ=31.22,
	maxZ=37.22
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("vespuccionoff", vector3(-1097.48, -840.1, 19.0), 2.5, 2.5, {
	name="Gå på arbejde",
	heading=0,
	minZ=16.0,
	maxZ=22.0
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("rockfordonoff", vector3(-565.05, -126.42, 38.44), 1, 1, {
	name="Gå på arbejde",
	heading=0,
	minZ=35.44,
	maxZ=41.44
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("onoffduty1", vector3(1853.6514, 3688.0664, 34.2670), 1.70, 1.70, {
	name="Gå på arbejde",
	heading=0,
	minZ=31.2670,
	maxZ=39.2670
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 5.5
})

exports['qtarget']:AddBoxZone("onoffduty2", vector3(-447.4268, 6013.3477, 31.7164), 1.70, 1.70, {
	name="Gå på arbejde",
	heading=0,
	minZ=28.71764,
	maxZ=36.71764
	}, {
		options = {
			{
				event = "esx_policejob:goonduty",
				icon = "fas fa-sign-in-alt",
				label = "Gå på arbejde",
				job = "police",
				canInteract = function(entity)
					if not playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			{
				event = "esx_policejob:gooffduty",
				icon = "fas fa-sign-out-alt",
				label = "Gå af arbejde",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 5.5
})

exports['qtarget']:AddBoxZone("policeclothing", vector3(462.02, -995.61, 30.69), 0.5, 5, {
	name="Omklædning",
	heading=0,
	minZ=27.69,
	maxZ=33.69
	}, {
		options = {
			{
				event = "policeclothing",
				icon = "fas fa-tshirt",
				label = "Tilgå omklædning",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("sandyclothing", vector3(1842.1227, 3680.6338, 34.1892), 3, 3, {
	name="Omklædning",
	heading=0,
	minZ=26.82,
	maxZ=32.82
	}, {
		options = {
			{
				event = "policeclothing",
				icon = "fas fa-tshirt",
				label = "Tilgå omklædning",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("vespucciclothing", vector3(-1097.94, -831.63, 14.28), 3, 3, {
	name="Omklædning",
	heading=0,
	minZ=11.28,
	maxZ=17.28
	}, {
		options = {
			{
				event = "policeclothing",
				icon = "fas fa-tshirt",
				label = "Tilgå omklædning",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("rockfordclothing", vector3(-545.53, -114.57, 37.88), 2, 4, {
	name="Omklædning",
	heading=0,
	minZ=34.88,
	maxZ=40.88
	}, {
		options = {
			{
				event = "policeclothing",
				icon = "fas fa-tshirt",
				label = "Tilgå omklædning",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("policeboss", vector3(461.46, -986.3, 30.73), 1, 1, {
	name="Chef menu",
	heading=0,
	minZ=27.73,
	maxZ=33.73
	}, {
		options = {
			{
				event = "policeboss",
				icon = "fas fa-briefcase",
				label = "Tilgå chef muligheder",
				job = "police",
				canInteract = function(entity)
					if playerInService and ESX.PlayerData.job.grade_name == "boss" then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("vespucciboss", vector3(-1112.91, -832.54, 34.36), 1.5, 1.5, {
	name="Chef menu",
	heading=0,
	minZ=31.36,
	maxZ=37.36
	}, {
		options = {
			{
				event = "policeboss",
				icon = "fas fa-briefcase",
				label = "Tilgå chef muligheder",
				job = "police",
				canInteract = function(entity)
					if playerInService and ESX.PlayerData.job.grade_name == "boss" then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("rockfordboss", vector3(-567.36, -129.47, 47.52), 2, 2, {
	name="Chef menu",
	heading=0,
	minZ=44.52,
	maxZ=50.52
	}, {
		options = {
			{
				event = "policeboss",
				icon = "fas fa-briefcase",
				label = "Tilgå chef muligheder",
				job = "police",
				canInteract = function(entity)
					if playerInService and ESX.PlayerData.job.grade_name == "boss" then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

-- exports['qtarget']:AddBoxZone("politistash", vector3(473.25, -990.7, 26.27), 1.5, 1.5, {
-- 	name="Politi Stash",
-- 	heading=0,
-- 	minZ=23.27,
-- 	maxZ=29.27
-- 	}, {
-- 		options = {
-- 			{
-- 				event = "policestash",
-- 				icon = "fas fa-container-storage",
-- 				label = "Tilgå politi stash",
-- 				job = "police",
-- 				canInteract = function(entity)
-- 					if playerInService then 
-- 						return true
-- 					else 
-- 						return false
-- 					end 
-- 				end,
-- 			},
-- 		},
-- 		distance = 3.5
-- })

exports['qtarget']:AddBoxZone("politiskab", vector3(482.5, -995.19, 30.69), 1.5, 1.5, {
	name="Politi Våbenskab",
	heading=0,
	minZ=27.69,
	maxZ=33.69
	}, {
		options = {
			{
				event = "OpenArmoryMenu",
				icon = "fas fa-tools",
				label = "Tilgå våbenskabet",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
			-- {
			-- 	event = "OpenSkud",
			-- 	icon = "fas fa-tools",
			-- 	label = "Modtag Skud",
			-- 	job = "police",
			-- 	canInteract = function(entity)
			-- 		if playerInService then 
			-- 			return true
			-- 		else 
			-- 			return false
			-- 		end 
			-- 	end,
			-- },
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("armorysandy", vector3(1838.8071, 3686.7085, 34.9793), 1.5, 1.5, {
	name="Politi Våbenskab",
	heading=0,
	minZ=31.22,
	maxZ=37.22
	}, {
		options = {
			{
				event = "OpenArmoryMenu",
				icon = "fas fa-tools",
				label = "Tilgå våbenskabet",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("vespucciarmory", vector3(-1106.87, -826.13, 14.28), 2.5, 2.5, {
	name="Politi Våbenskab",
	heading=0,
	minZ=11.28,
	maxZ=17.28
	}, {
		options = {
			{
				event = "OpenArmoryMenu",
				icon = "fas fa-tools",
				label = "Tilgå våbenskabet",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("rockfordarmory", vector3(-541.61, -117.31, 37.86), 4, 1, {
	name="Politi Våbenskab",
	heading=0,
	minZ=34.86,
	maxZ=40.86
	}, {
		options = {
			{
				event = "OpenArmoryMenu",
				icon = "fas fa-tools",
				label = "Tilgå våbenskabet",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})


exports['qtarget']:AddBoxZone("policecafe", vector3(448.47, -973.23, 34.97), 1, 3, {
	name="Politi Cafe",
	heading=0,
	minZ=31.97,
	maxZ=37.97
	}, {
		options = {
			{
				event = "openpolicecafe",
				icon = "fas fa-coffee",
				label = "Tilgå Cafe",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("vespuccicafe", vector3(-1092.22, -836.4, 23.04), 2.5, 2.5, {
	name="Politi Cafe",
	heading=0,
	minZ=20.04,
	maxZ=26.04
	}, {
		options = {
			{
				event = "openpolicecafe",
				icon = "fas fa-coffee",
				label = "Tilgå Cafe",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

exports['qtarget']:AddBoxZone("rockfordcafe", vector3(-568.67, -126.28, 37.86), 1, 1, {
	name="Politi Cafe",
	heading=0,
	minZ=34.86,
	maxZ=40.86
	}, {
		options = {
			{
				event = "openpolicecafe",
				icon = "fas fa-coffee",
				label = "Tilgå Cafe",
				job = "police",
				canInteract = function(entity)
					if playerInService then 
						return true
					else 
						return false
					end 
				end,
			},
		},
		distance = 3.5
})

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Targets()
-- 		Citizen.Wait(5000)
-- 	end
-- end)