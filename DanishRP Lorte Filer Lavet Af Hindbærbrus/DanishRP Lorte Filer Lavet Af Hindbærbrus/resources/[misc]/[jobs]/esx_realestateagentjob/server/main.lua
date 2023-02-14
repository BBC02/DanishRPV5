ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

TriggerEvent('esx_phone:registerNumber', 'realestateagent', 'realestateagent', true, true)

TriggerEvent('esx_society:registerSociety', 'realestateagent', 'realestateagent', 'society_realestateagent', 'society_realestateagent', 'society_realestateagent', {type = 'public'})

