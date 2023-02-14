ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

TriggerEvent('esx_society:registerSociety', 'bloods', 'bloods', 'society_bloods', 'society_bloods', 'society_bloods', {type = 'public'})