Config = {}

getGender = function()
    local gender = "male"
    if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then
        gender = "female"
    end

    return gender
end
