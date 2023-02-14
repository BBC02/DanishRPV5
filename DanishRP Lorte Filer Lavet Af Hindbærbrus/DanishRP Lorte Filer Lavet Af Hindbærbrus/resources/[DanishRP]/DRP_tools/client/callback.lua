
RegisterNetEvent('__Savanha_callback:client')
AddEventHandler('__Savanha_callback:client', function(eventName, ...)
	local p = promise.new()

	TriggerEvent(('c__Savanha_callback:%s'):format(eventName), function(...)
		p:resolve({...})
	end, ...)

	local result = Citizen.Await(p)
	TriggerServerEvent(('__Savanha_callback:server:%s'):format(eventName), table.unpack(result))
end)
