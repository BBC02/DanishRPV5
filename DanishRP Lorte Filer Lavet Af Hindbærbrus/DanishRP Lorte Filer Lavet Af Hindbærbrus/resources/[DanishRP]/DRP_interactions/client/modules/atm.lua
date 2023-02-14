exports.qtarget:AddTargetModel(Config.ATMProps, {
	options = {
		{
			icon = "fas fa-box-circle-check",
			label = "Tilgå Hæveautomaten",
            action = function(entity)
				local playerPed = PlayerPedId()
                TaskTurnPedToFaceEntity(playerPed, entity, 2000)
				Citizen.Wait(2000)

                local gender = getGender()

				local animDict = "amb@prop_human_atm@" .. gender .. "@enter"
                RequestAnimDict(animDict)
                while (not HasAnimDictLoaded(animDict)) do
                    Citizen.Wait(1)
                end

				TaskPlayAnim(playerPed, animDict, "enter", 1.0, 1.0, 3000, 0, 1, true, true, true)
                Citizen.Wait(3000)

				local animDict2 = "amb@prop_human_atm@" .. gender .. "@idle_a"
                RequestAnimDict(animDict2)
                while (not HasAnimDictLoaded(animDict2)) do
                    Citizen.Wait(10)
                end

				TaskPlayAnim(playerPed, animDict2, "idle_a", 1.0, -1.0, 5000, 0, 1, true, true, true)

                Citizen.Wait(5000)

                RemoveAnimDict(animDict)
                RemoveAnimDict(animDict2)

				exports.esx_atm:OpenUI()
			end,
			canInteract = function(entity)
				if not HasEntityClearLosToEntity(entity, PlayerPedId(), 17) then
					return false
				end

				return true
            end
		}
	},
	distance = 2.0
})
