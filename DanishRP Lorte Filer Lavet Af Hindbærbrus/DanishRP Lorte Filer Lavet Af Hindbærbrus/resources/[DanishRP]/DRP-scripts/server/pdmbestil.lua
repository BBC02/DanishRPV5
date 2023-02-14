ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

RegisterNetEvent('refillstock')
AddEventHandler('refillstock', function(item, antal)
  local source = source
    MySQL.Async.execute('UPDATE vehicles SET stock = stock + ? WHERE model = ? ', {antal, item})

    MySQL.query("SELECT price FROM vehicles WHERE model = ?", {item}, function(result)
        if result ~= nil then 
          local price = result[1].price * antal / 2
          
          TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
              if account.money >= price then
                account.removeMoney(price)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du bestilte ' .. antal .. 'x '.. item ..' hjem!', 5000 })
              else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du kan ikke bestille køretøjer på lager, når firmaet ikke har nok penge til det!', 5000 })
              end
          end)
        end
    end)

end)