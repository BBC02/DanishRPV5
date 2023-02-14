OpenMenu = function(player)
    local player = player
    local menuOptions = exports["nh-context"]:ContextMenu({
        {
            header = "Handlinger",
        },
        {
            header = "ID Kort",
            context = "Vis id kort" ,
            args = {"idcard"}
        

        },
        {
            header = "Giv visitkort",
            context = "Giv visitkort til personen",
            args = {"visitkort"}
        },
        {
            header = "Giv Strips På",
            context = "Sæt strips på personen",
            args = {"ziptie_on"}
        },
        {
            header = "Tag Strips Af",
            context = "Fjern strips fra personen",
            args = {"ziptie_off"}
        },
        {
            header = "Eskorter",
            context = "Eskorter personen",
            args = {"escort"}
        },
        {
            header = "Sæt i køretøj",
            context = "Sæt personen ind i nærmeste køretøj",
            args = {"put_in_vehicle"}
        },
    })

    if menuOptions ~= nil then
        if menuOptions == "idcard" then
            print('id kort')
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
        elseif menuOptions == "visitkort" then
            print('visitkort')
            TriggerServerEvent('srp:visitkort', GetPlayerServerId(player))
        elseif menuOptions == "blindfold" then
            print('blindfold')
            if IsPedInAnyVehicle(GetPlayerPed(GetPlayerServerId(player))) then
                exports['mythic_notify']:SendAlert('error', 'Du kan ikke give personer i et køretøj blindfold på.', 5000)
            else
                ESX.TriggerServerCallback('jsfour-blindfold:itemCheck', function(hasItem)
                    TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
                end)
            end
        elseif menuOptions == "ziptie_on" then
            print('ziptie_on')
            if not IsPedInAnyVehicle(GetPlayerPed(GetPlayerServerId(player)), false) then
                TriggerServerEvent('srp_thiefmenu:handcuff', GetPlayerServerId(player))
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'zipties', 0.5)
            else
                exports['mythic_notify']:SendAlert('error', 'Du kan ikke give strips på en der sider i en bil', 5000)
            end
        elseif menuOptions == "ziptie_off" then
            print('ziptie_off')
            if not IsPedInAnyVehicle(GetPlayerPed(GetPlayerServerId(player)), false) then
                TriggerServerEvent('srp_thiefmenu:handcuff2', GetPlayerServerId(player))
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'scissors', 0.2)
            else
                exports['mythic_notify']:SendAlert('error', 'Du kan ikke tage strips af en der sider i en bil', 5000)
            end
        elseif menuOptions == "escort" then
            print('escort')
            TriggerServerEvent('srp_thiefmenu:drag', GetPlayerServerId(player))
        elseif menuOptions == "put_in_vehicle" then
            print('put_in_vehicle')
            TriggerServerEvent('srp_thiefmenu:putInVehicle', GetPlayerServerId(player))
        end
    end
end

exports.qtarget:Player({
    options = {
        {
            icon = "fa-solid fa-book-open-cover",
            label = "Handlinger",
            action = function(entity)
                OpenMenu(NetworkGetPlayerIndexFromPed(entity))
            end
        }
    },
    distance = 2.0
})

exports.qtarget:Vehicle({
	options = {
		{
			icon = "fas fa-cars",
			label = "Vend køretøjet",
            action = function(entity)
                if DoesEntityExist(entity) then
                    local playerPed = PlayerPedId()
                    TaskTurnPedToFaceEntity(playerPed, entity, 1500)
                    Citizen.Wait(1500)

                    TriggerEvent('esx_animation:OnEmotePlay', 'Emotes', 'Push2')

                    exports.rprogress:Custom({
                        Type = 'linear',
                        Duration = 10000,
                        Width = 300,
                        Height = 35,
                        y = 0.75,
                        Label = "Vender køretøj",
                        Animation = {},
                        DisableControls = {
                            Player = true,
                            Vehicle = true
                        },
                        onComplete = function()
                            if networkControl(entity) then
                                TriggerEvent('esx_animation:EmoteCancel')
                                SetEntityRotation(entity, 1.0, 1.0, 1.0, 1.0, true)
                            end
                        end
                    })
                end
			end,
            canInteract = function(entity)
                local roll = GetEntityRoll(entity)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(entity) < 2 then
                    return true
                end

                return false
            end,
		},
	},
	distance = 2
})