fixWheel = function(vehicle, wheelIndex)
    local hasItem = GotItem('tire')
    
    if hasItem then
        if DoesEntityExist(vehicle) then
            exports.rprogress:Custom({
                Type = 'linear',
                Duration = 60000,
                Width = 300,
                Height = 35,
                y = 0.75,
                Label = "Skifter dæk",
                Animation = {
                    scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
                },
                DisableControls = {
                    Player = true,
                    Vehicle = true
                },
                onComplete = function()
                    if networkControl(vehicle) then
                        SetVehicleTyreFixed(vehicle, wheelIndex)
                        exports['mythic_notify']:DoHudText('success', 'Du har skiftet et dæk.', 5000)
                    end
                end
            })
        end
    else
        exports['mythic_notify']:DoHudText('error', 'Du har ikke et reservedæk.', 5000)
    end
end

fixWheelMechanic = function(vehicle, wheelIndex)
    if DoesEntityExist(vehicle) then
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 60000,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Skifter dæk",
            Animation = {
                scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(vehicle) then
                    SetVehicleTyreFixed(vehicle, wheelIndex)
                    exports['mythic_notify']:DoHudText('success', 'Du har skiftet et dæk.', 5000)
                end
            end
        })
    end
end

slashTire = function(vehicle, wheelIndex)
    if DoesEntityExist(vehicle) then
        exports.rprogress:Custom({
            Type = 'linear',
            Duration = 1500,
            Width = 300,
            Height = 35,
            y = 0.75,
            Label = "Punkter dæk",
            Animation = {
                animationDictionary = "melee@knife@streamed_core_fps",
                animationName = "ground_attack_on_spot",
                flag = 1, -- optional
            },
            DisableControls = {
                Player = true,
                Vehicle = true
            },
            onComplete = function()
                if networkControl(vehicle) then
                    SetVehicleTyreBurst(vehicle, wheelIndex, false, 1000.0)
                    exports['mythic_notify']:DoHudText('success', 'Du har skåret et dæk op.', 5000)
                end
            end
        })
    end
end
