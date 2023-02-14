local doors = cfg.doors
local owned = {}

RegisterServerEvent('vrp_doors:status12')
AddEventHandler('vrp_doors:status12', function()
        TriggerClientEvent('vrp_doors:load', source, doors)
end)

RegisterServerEvent('vrp_doors:status')
AddEventHandler('vrp_doors:status', function(id, status)
    if (doors[id].name ~= nil and doors[id].number ~= nil and owned[doors[id].name] ~= nil and owned[doors[id].name][doors[id].number] ~= nil and owned[doors[id].name][doors[id].number] == user_id) then
        if doors[id].pairs ~= nil then
            doors[doors[id].pairs].locked=status
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[id].pairs, status)
        end
        doors[id].locked=status
        TriggerClientEvent('vrp_doors:statusSend', -1, id, status)
    end
end)

RegisterServerEvent('vrp_doors:owneddoor')
AddEventHandler('vrp_doors:owneddoor', function(user_id,home,number)
    owned[home][tonumber(number)] = user_id
end)

RegisterServerEvent('karsten-unlock')
AddEventHandler('karsten-unlock', function()
		if doors[184].pairs ~= nil then
            doors[doors[184].pairs].locked=false
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[184].pairs, false)
        end
        doors[184].locked=false
        TriggerClientEvent('vrp_doors:statusSend', -1, 184, false)	
		if doors[185].pairs ~= nil then
            doors[doors[185].pairs].locked=false
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[185].pairs, false)
        end
        doors[185].locked=false
        TriggerClientEvent('vrp_doors:statusSend', -1, 185, false)
end)

RegisterServerEvent('karsten-lock')
AddEventHandler('karsten-lock', function()
		if doors[184].pairs ~= nil then
            doors[doors[184].pairs].locked=true
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[184].pairs, true)
        end
        doors[184].locked=true
        TriggerClientEvent('vrp_doors:statusSend', -1, 184, true)	
		if doors[185].pairs ~= nil then
            doors[doors[185].pairs].locked=true
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[185].pairs, true)
        end
        doors[185].locked=true
        TriggerClientEvent('vrp_doors:statusSend', -1, 185, true)
end)

