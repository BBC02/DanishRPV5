ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
RegisterNetEvent('ndrp-garbage:pay')
AddEventHandler('ndrp-garbage:pay', function(jobStatus, runs, token)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
    if jobStatus then
        if xPlayer ~= nil then
            local randomMoney = math.random(1000,2000)
            local paymoney = runs * randomMoney
            xPlayer.addMoney(paymoney)
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Du fik udbetalt  ' ..paymoney.. ' for dit sindssyge gode arbejde!'})
        end
    else
        print("Probably a cheater: ",xPlayer.getName())
    end
end)


RegisterNetEvent('ndrp-garbage:reward')
AddEventHandler('ndrp-garbage:reward', function(item,rewardStatus, token)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local itemname = ESX.GetItemLabel(item)
    if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
    if rewardStatus then
        if xPlayer ~= nil then
            if item == "WEAPON_PISTOL" then
                xPlayer.addWeapon(item, 50)
                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Du fandt ' ..item})
            else
                if xPlayer.canCarryItem(item,1) then
                    xPlayer.addInventoryItem(item,1)
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Du fandt ' ..itemname})
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = ' '.. itemname .. ' fundet men du kan ikke bære det.'})
                end
            end
        end
    else
        print("Probably a cheater: ",xPlayer.getName())
    end
end)