ESX = nil
local categories, vehicles = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'cardealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'cardealer', _U('car_dealer'), 'society_cardealer', 'society_cardealer', 'society_cardealer', {type = 'private'})

Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('[esx_vehicleshop] [^3WARNING^7] Plate character count reached, %s/8 characters!'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

AddEventHandler('onResourceStart', function(resourceName)
  if resourceName == GetCurrentResourceName() then
    MySQL.ready(function() SQLVehiclesAndCategories() end)
  end
end)

function SQLVehiclesAndCategories()
	MySQL.Async.fetchAll('SELECT * FROM `vehicle_categories`', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM `vehicles`', {}, function(_vehicles)
			vehicles = _vehicles

			GetVehiclesAndCategories(categories, vehicles)
		end)

	end)
end

function GetVehiclesAndCategories(categories, vehicles)
	for k,v in ipairs(vehicles) do
		for k2,v2 in ipairs(categories) do
			if v2.name == v.category then
				vehicles[k].categoryLabel = v2.label
				break
			end
		end
	end

	-- send information after db has loaded, making sure everyone gets vehicle information
	TriggerClientEvent('esx_vehicleshop:sendCategories', -1, categories)
	TriggerClientEvent('esx_vehicleshop:sendVehicles', -1, vehicles)
end

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

ESX.RegisterServerCallback('esx_vehicleshop:setVehicleOwnedPlayerId', function(source, cb, playerId, plate, model, label, price)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'cardealer' and xTarget then
        if xTarget.getMoney() >= price then
            xTarget.removeMoney(price)
            MySQL.Async.fetchAll('SELECT id FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
                ['@vehicle'] = model
            }, function(result)
                if result[1] then
                    local id = result[1].id
    
                    MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
                        ['@id'] = id
                    }, function(rowsChanged)
                        if rowsChanged == 1 then
                            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, model) VALUES (@owner, @plate, @vehicle, @model)', {
                                ['@owner']   = xTarget.identifier,
                                ['@plate']   = plate,
                                ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
                                ['@model'] = label
                            }, function(rowsChanged)
                                local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                                xPlayer.showNotification(_U('vehicle_set_owned', label, plate, rpName, ESX.Math.GroupDigits(price)))
                                xTarget.showNotification(_U('vehicle_belongs', label, plate, ESX.Math.GroupDigits(price)))
                            end)
    
                            local dateNow = os.date('%d/%m-%Y - %H:%M')
                            
                            local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                            local rpName2 = xPlayer.get('firstName')..' '.. xPlayer.get('lastName')
                            MySQL.Async.execute('INSERT INTO vehicle_sold (client, model, plate, soldby, date, price) VALUES (@client, @model, @plate, @soldby, @date, @price)', {
                                ['@client'] = rpName,
                                ['@model'] = label,
                                ['@plate'] = plate,
                                ['@soldby'] = rpName2,
                                ['@date'] = dateNow,
                                ['@price'] = ESX.Math.GroupDigits(price)..' DKK'
                            })
                        end
                    end)
                end
            end)
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				account.addMoney(price)
			end)
            TriggerEvent('cb_logs:cardealer:soldVehicle', source, playerId, {model = model, label = label, plate = plate}, ESX.Math.GroupDigits(price))
            cb(true)
        elseif xTarget.getAccount('bank').money >= price then
            xTarget.removeAccountMoney('bank', price)
            MySQL.Async.fetchAll('SELECT id FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
                ['@vehicle'] = model
            }, function(result)
                if result[1] then
                    local id = result[1].id
    
                    MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
                        ['@id'] = id
                    }, function(rowsChanged)
                        if rowsChanged == 1 then
                            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, model) VALUES (@owner, @plate, @vehicle, @model)', {
                                ['@owner']   = xTarget.identifier,
                                ['@plate']   = plate,
                                ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
                                ['@model'] = label
                            }, function(rowsChanged)
                                local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                                xPlayer.showNotification(_U('vehicle_set_owned', label, plate, rpName, ESX.Math.GroupDigits(price)))
                                xTarget.showNotification(_U('vehicle_belongs', label, plate, ESX.Math.GroupDigits(price)))
                            end)
    
                            local dateNow = os.date('%d/%m-%Y - %H:%M')
    
                            local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                            local rpName2 = xPlayer.get('firstName')..' '.. xPlayer.get('lastName')
                            MySQL.Async.execute('INSERT INTO vehicle_sold (client, model, plate, soldby, date, price) VALUES (@client, @model, @plate, @soldby, @date, @price)', {
                                ['@client'] = rpName,
                                ['@model'] = label,
                                ['@plate'] = plate,
                                ['@soldby'] = rpName2,
                                ['@date'] = dateNow,
                                ['@price'] = ESX.Math.GroupDigits(price)..' DKK'
                            })
                        end
                    end)
                end
            end)
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				account.addMoney(price)
			end)
            TriggerEvent('cb_logs:cardealer:soldVehicle', source, playerId, {model = model, label = label, plate = plate}, ESX.Math.GroupDigits(price))
            cb(true)
        else
            cb(false)
        end
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getSoldVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT client, model, plate, soldby, date, price FROM vehicle_sold', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice

	for k,v in ipairs(vehicles) do
		if model == v.model then
			modelPrice = v.price
			break
		end
	end

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
    elseif modelPrice and xPlayer.getAccount('bank').money >= modelPrice then
		xPlayer.removeAccountMoney('bank', modelPrice)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCommercialVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT price, vehicle FROM cardealer_vehicles ORDER BY vehicle ASC', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyCarDealerVehicle', function(source, cb, model, vehicleAmount)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		local modelPrice

		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end

        buyPrice = modelPrice * vehicleAmount

		if modelPrice and buyPrice then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				if account.money >= buyPrice then
					account.removeMoney(buyPrice)

                    for i=1, vehicleAmount, 1 do
                        MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
                            ['@vehicle'] = model,
                            ['@price'] = modelPrice
                        })
                    end
                    cb(true)
				else
					cb(false)
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_vehicleshop:returnProvider')
AddEventHandler('esx_vehicleshop:returnProvider', function(vehicleModel)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		MySQL.Async.fetchAll('SELECT id, price FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicleModel
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
							local price = ESX.Math.Round(result[1].price * 0.75)
							local vehicleLabel = getVehicleLabelFromModel(vehicleModel)

							account.addMoney(price)
							xPlayer.showNotification(_U('vehicle_sold_for', vehicleLabel, ESX.Math.GroupDigits(price)))
						end)
					end
				end)
			else
				print(('[esx_vehicleshop] [^3WARNING^7] %s attempted selling an invalid vehicle!'):format(xPlayer.identifier))
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:resellVehicle', function(source, cb, plate, model, label)
	local xPlayer, resellPrice = ESX.GetPlayerFromId(source)

    -- calculate the resell price
    for i=1, #vehicles, 1 do
        if GetHashKey(vehicles[i].model) == model then
            resellPrice = ESX.Math.Round(vehicles[i].price / 100 * Config.ResellPercentage)
            break
        end
    end

    if not resellPrice then
        print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an unknown vehicle!'):format(xPlayer.identifier))
        cb(false)
    else
        MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE plate = @plate', {
            ['@plate'] = plate
        }, function(result)
            if result[1] then -- is it a rented vehicle?
                cb(false) -- it is, don't let the player sell it since he doesn't own it
            else
                MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate', {
                    ['@owner'] = xPlayer.identifier,
                    ['@plate'] = plate
                }, function(result)
                    if result[1] then -- does the owner match?
                        local vehicle = json.decode(result[1].vehicle)

                        if vehicle.model == model then
                            if vehicle.plate == plate then
                                xPlayer.addAccountMoney('bank', resellPrice)
                                RemoveOwnedVehicle(plate)
                                TriggerEvent("cb_logs:cardealer:quickSell", source, label, plate, ESX.Math.GroupDigits(resellPrice))
                                cb(true)
                            else
                                print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with plate mismatch!'):format(xPlayer.identifier))
                                cb(false)
                            end
                        else
                            print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with model mismatch!'):format(xPlayer.identifier))
                            cb(false)
                        end
                    end
                end)
            end
        end)
    end
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_vehicleshop:setJobVehicleState')
AddEventHandler('esx_vehicleshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_vehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

TriggerEvent('cron:runAt', 22, 00, PayRent)


RegisterNetEvent('esx_vehicleshop:parkVehicle')
AddEventHandler('esx_vehicleshop:parkVehicle', function(vehProps)
    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
		['@stored'] = true,
		['@plate'] = vehProps.plate,
	})
    MySQL.Async.execute('UPDATE owned_vehicles SET `vehicle` = @vehicle WHERE plate = @plate', {
		['@plate'] = vehProps.plate,
        ['@vehicle'] = json.encode(vehProps)
	})
end)




ESX.RegisterServerCallback('esx_vehicleshop:getRPName', function(source, cb, players)
    local playerNames = {}
    for i=1, #players, 1 do
        local xPlayer = ESX.GetPlayerFromId(players[i])
        table.insert(playerNames, {
            rpName = xPlayer.get('firstName')..' '..xPlayer.get('lastName'),
            serverId = players[i]
        })
    end
    cb(playerNames)
end)


RegisterNetEvent('esx_vehicleshop:confirmBuy')
AddEventHandler('esx_vehicleshop:confirmBuy', function(target, plate, model, label, price)
    local src = source
    TriggerClientEvent('esx_vehicleshop:confirmBuy', target, src, plate, model, label, price)
end)

RegisterNetEvent('esx_vehicleshop:deniedConfirm')
AddEventHandler('esx_vehicleshop:deniedConfirm', function(seller)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(seller)
    local xTarget = ESX.GetPlayerFromId(src)

    xPlayer.showNotification(_U('denied_confirm', xTarget.getName()))
end)

RegisterNetEvent('esx_vehicleshop:acceptetConfirm')
AddEventHandler('esx_vehicleshop:acceptetConfirm', function(seller, plate, model, label, price)
    local src = source
    print('Trykket JA!')
    TriggerClientEvent('esx_vehicleshop:acceptetConfirm', seller, src, plate, model, label, price)
end)