RegisterBoxZone = function(data)
    exports.qtarget:AddBoxZone(data.name, data.coords, data.width, data.depth, {
        name = data.name,
        heading = data.heading,
        debugPoly = false,
        minZ = data.minZ,
        maxZ = data.maxZ,
    }, {
        options = data.options,
        distance = 3.0
    })
end

RemoveBoxZone = function(name)
    exports.qtarget:RemoveZone(name)
end
