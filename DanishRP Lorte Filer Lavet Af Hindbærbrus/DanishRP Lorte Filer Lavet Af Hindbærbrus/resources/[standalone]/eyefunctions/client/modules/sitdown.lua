LocalPlayer.state:set('sitting', false, true)

sitdown = function(object)
    if LocalPlayer.state.IsPlayingAnimation and LocalPlayer.state.sitting then
        return
    end

    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)

    --FreezeEntityPosition(object, true)
    PlaceObjectOnGroundProperly(object)

    local objectPos = GetEntityCoords(object)
    local objectHeading = GetEntityHeading(object)
    local objectModel = GetEntityModel(object)

    local objectData = Config.Sitable[objectModel]

    local divider = 2
    local heading = 180.0

    if objectData.divider then
        divider = objectData.divider
    end

    if objectData.vOffsetH then
        heading = objectData.vOffsetH
    end

    if objectData.forceZ then
        offsetZ = objectPos.z + objectData.vOffsetZ
    else
        offsetZ = objectPos.z + (pedPos.z - objectPos.z)/divider
    end

    TaskStartScenarioAtPosition(ped, objectData.scenario, objectPos.x, objectPos.y, objectPos.z + (pedPos.z - objectPos.z)/divider, objectHeading + heading, 0, true, true)
    
    --FreezeEntityPosition(ped, true)
    LocalPlayer.state:set('sitting', true, true)
end

stopsit = function()
    if LocalPlayer.state.sitting then
        local ped = PlayerPedId()
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        --FreezeEntityPosition(ped, false)

        LocalPlayer.state:set('sitting', false, true)
    end
end

exports.qtarget:AddTargetModel(Config.SitableProps, {
	options = {
		{
			icon = "fas fa-chair",
			label = "Sid ned",
            action = function(entity)
				sitdown(entity)
			end
		}
	},
	distance = 1.5
})

RegisterCommand('stopsit', stopsit, false)
RegisterKeyMapping('stopsit', 'Stop Sitting', 'keyboard', 'z')
