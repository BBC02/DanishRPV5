for k, v in pairs(Config.BankLocations) do
    exports.qtarget:AddBoxZone("Bank" .. k, v.pos, v.width, v.depth, {
        name = "Bank" .. k,
        heading = v.heading,
        debugPoly = false,
        minZ = v.minZ,
        maxZ = v.maxZ,
    }, {
        options = {
            {
                icon = "fas fa-box-circle-check",
                label = "Tilgå Banken",
                action = function()
                    exports.esx_atm:OpenUI(true)
                end
            }
        },
        distance = 2.0
    })
end
