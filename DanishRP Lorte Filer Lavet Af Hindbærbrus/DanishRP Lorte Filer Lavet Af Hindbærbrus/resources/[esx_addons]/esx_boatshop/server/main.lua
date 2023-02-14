ESX = nil
local categories, vehicles = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'boatdealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'boatdealer', _U('car_dealer'), 'society_boatdealer', 'society_boatdealer', 'society_boatdealer', {type = 'private'})

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
	MySQL.Async.fetchAll('SELECT * FROM `vehicle_categories_boat`', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM `vehicles_boat`', {}, function(_vehicles)
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
	TriggerClientEvent('esx_boatshop:sendCategories', -1, categories)
	TriggerClientEvent('esx_boatshop:sendVehicles', -1, vehicles)
end

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

ESX.RegisterServerCallback('esx_boatshop:setVehicleOwnedPlayerId', function(source, cb, playerId, plate, model, label, price)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'boatdealer' and xTarget then
        if xTarget.getMoney() >= price then
            xTarget.removeMoney(price)
            MySQL.Async.fetchAll('SELECT id FROM boatdealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
                ['@vehicle'] = model
            }, function(result)
                if result[1] then
                    local id = result[1].id
    
                    MySQL.Async.execute('DELETE FROM boatdealer_vehicles WHERE id = @id', {
                        ['@id'] = id
                    }, function(rowsChanged)
                        if rowsChanged == 1 then
                            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                                ['@owner']   = xTarget.identifier,
                                ['@plate']   = plate,
                                ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
                                ['@type']    = 'boat'
                            }, function(rowsChanged)
                                local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                                xPlayer.showNotification(_U('vehicle_set_owned', label, plate, rpName, ESX.Math.GroupDigits(price)))
                                xTarget.showNotification(_U('vehicle_belongs', label, plate, ESX.Math.GroupDigits(price)))
                            end)
    
                            local dateNow = os.date('%d/%m-%Y - %H:%M')
                            
                            local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                            local rpName2 = xPlayer.get('firstName')..' '.. xPlayer.get('lastName')
                            MySQL.Async.execute('INSERT INTO vehicle_sold_boat (client, model, plate, soldby, date, price) VALUES (@client, @model, @plate, @soldby, @date, @price)', {
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
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
				account.addMoney(price)
			end)
            TriggerEvent('cb_logs:boatdealer:soldVehicle', source, playerId, {model = model, label = label, plate = plate}, ESX.Math.GroupDigits(price))
            cb(true)
        elseif xTarget.getAccount('bank').money >= price then
            xTarget.removeAccountMoney('bank', price)
            MySQL.Async.fetchAll('SELECT id FROM boatdealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
                ['@vehicle'] = model
            }, function(result)
                if result[1] then
                    local id = result[1].id
    
                    MySQL.Async.execute('DELETE FROM boatdealer_vehicles WHERE id = @id', {
                        ['@id'] = id
                    }, function(rowsChanged)
                        if rowsChanged == 1 then
                            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                                ['@owner']   = xTarget.identifier,
                                ['@plate']   = plate,
                                ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
                                ['@type']    = 'boat'
                            }, function(rowsChanged)
                                local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                                xPlayer.showNotification(_U('vehicle_set_owned', label, plate, rpName, ESX.Math.GroupDigits(price)))
                                xTarget.showNotification(_U('vehicle_belongs', label, plate, ESX.Math.GroupDigits(price)))
                            end)
    
                            local dateNow = os.date('%d/%m-%Y - %H:%M')
    
                            local rpName = xTarget.get('firstName')..' '.. xTarget.get('lastName')
                            local rpName2 = xPlayer.get('firstName')..' '.. xPlayer.get('lastName')
                            MySQL.Async.execute('INSERT INTO vehicle_sold_boat (client, model, plate, soldby, date, price) VALUES (@client, @model, @plate, @soldby, @date, @price)', {
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
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
				account.addMoney(price)
			end)
            TriggerEvent('cb_logs:boatdealer:soldVehicle', source, playerId, {model = model, label = label, plate = plate}, ESX.Math.GroupDigits(price))
            cb(true)
        else
            cb(false)
        end
	end
end)

ESX.RegisterServerCallback('esx_boatshop:getSoldVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT client, model, plate, soldby, date, price FROM vehicle_sold_boat', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_boatshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

ESX.RegisterServerCallback('esx_boatshop:buyVehicle', function(source, cb, model, plate)
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

ESX.RegisterServerCallback('esx_boatshop:getCommercialVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT price, vehicle FROM boatdealer_vehicles ORDER BY vehicle ASC', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:buyboatdealerVehicle', function(source, cb, model, vehicleAmount)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'boatdealer' then
		local modelPrice

		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end

        buyPrice = modelPrice * vehicleAmount

		if modelPrice and buyPrice then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
				if account.money >= buyPrice then
					account.removeMoney(buyPrice)

                    for i=1, vehicleAmount, 1 do
                        MySQL.Async.execute('INSERT INTO boatdealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
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

RegisterNetEvent('esx_boatshop:returnProvider')
AddEventHandler('esx_boatshop:returnProvider', function(vehicleModel)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'boatdealer' then
		MySQL.Async.fetchAll('SELECT id, price FROM boatdealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicleModel
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM boatdealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
							local price = ESX.Math.Round(result[1].price * 0.75)
							local vehicleLabel = getVehicleLabelFromModel(vehicleModel)

							account.addMoney(price)
							xPlayer.showNotification(_U('vehicle_sold_for', vehicleLabel, ESX.Math.GroupDigits(price)))
						end)
					end
				end)
			else
				print(('[esx_boatshop] [^3WARNING^7] %s attempted selling an invalid vehicle!'):format(xPlayer.identifier))
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_boatshop:resellVehicle', function(source, cb, plate, model, label)
	local xPlayer, resellPrice = ESX.GetPlayerFromId(source)

    -- calculate the resell price
    for i=1, #vehicles, 1 do
        if GetHashKey(vehicles[i].model) == model then
            resellPrice = ESX.Math.Round(vehicles[i].price / 100 * Config.ResellPercentage)
            break
        end
    end

    if not resellPrice then
        print(('[esx_boatshop] [^3WARNING^7] %s attempted to sell an unknown vehicle!'):format(xPlayer.identifier))
        cb(false)
    else
        MySQL.Async.fetchAll('SELECT * FROM rented_boats WHERE plate = @plate', {
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
                                TriggerEvent("cb_logs:boatdealer:quickSell", source, label, plate, ESX.Math.GroupDigits(resellPrice))
                                cb(true)
                            else
                                print(('[esx_boatshop] [^3WARNING^7] %s attempted to sell an vehicle with plate mismatch!'):format(xPlayer.identifier))
                                cb(false)
                            end
                        else
                            print(('[esx_boatshop] [^3WARNING^7] %s attempted to sell an vehicle with model mismatch!'):format(xPlayer.identifier))
                            cb(false)
                        end
                    end
                end)
            end
        end)
    end
end)

ESX.RegisterServerCallback('esx_boatshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_boatshop:setJobVehicleState')
AddEventHandler('esx_boatshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_boatshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)


RegisterNetEvent('esx_boatshop:parkVehicle')
AddEventHandler('esx_boatshop:parkVehicle', function(vehProps)
    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
		['@stored'] = true,
		['@plate'] = vehProps.plate,
	})
    MySQL.Async.execute('UPDATE owned_vehicles SET `vehicle` = @vehicle WHERE plate = @plate', {
		['@plate'] = vehProps.plate,
        ['@vehicle'] = json.encode(vehProps)
	})
end)




ESX.RegisterServerCallback('esx_boatshop:getRPName', function(source, cb, players)
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


RegisterNetEvent('esx_boatshop:confirmBuy')
AddEventHandler('esx_boatshop:confirmBuy', function(target, plate, model, label, price)
    local src = source
    TriggerClientEvent('esx_boatshop:confirmBuy', target, src, plate, model, label, price)
end)

RegisterNetEvent('esx_boatshop:deniedConfirm')
AddEventHandler('esx_boatshop:deniedConfirm', function(seller)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(seller)
    local xTarget = ESX.GetPlayerFromId(src)

    xPlayer.showNotification(_U('denied_confirm', xTarget.getName()))
end)

RegisterNetEvent('esx_boatshop:acceptetConfirm')
AddEventHandler('esx_boatshop:acceptetConfirm', function(seller, plate, model, label, price)
    local src = source
    TriggerClientEvent('esx_boatshop:acceptetConfirm', seller, src, plate, model, label, price)
end)

RegisterNetEvent('esx_boatshop:confirmRent')
AddEventHandler('esx_boatshop:confirmRent', function(target, plate, model, label, price)
    local src = source
    TriggerClientEvent('esx_boatshop:confirmRent', target, src, plate, model, label, price)
end)

RegisterNetEvent('esx_boatshop:deniedConfirmRent')
AddEventHandler('esx_boatshop:deniedConfirmRent', function(seller)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(seller)
    local xTarget = ESX.GetPlayerFromId(src)

    xPlayer.showNotification(_U('denied_confirm', xTarget.getName()))
end)

RegisterNetEvent('esx_boatshop:acceptetConfirmRent')
AddEventHandler('esx_boatshop:acceptetConfirmRent', function(seller, plate, model, label, price)
    local src = source
    TriggerClientEvent('esx_boatshop:acceptetConfirmRent', seller, src, plate, model, label, price)
end)

--========================
--==    Båd Leasing     ==
--========================
ESX.RegisterServerCallback('esx_boatshop:rentVehicle', function(source, cb, target, plate, model, rentPrice)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)

	if xPlayer.job.name == 'boatdealer' and xTarget then
		MySQL.Async.fetchAll('SELECT id, price FROM boatdealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = model
		}, function(result)
			if result[1] then
				local price = result[1].price

				MySQL.Async.execute('DELETE FROM boatdealer_vehicles WHERE id = @id', {
					['@id'] = result[1].id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO rented_boats (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)', {
							['@vehicle']     = model,
							['@plate']       = plate,
							['@player_name'] = xTarget.getName(),
							['@base_price']  = price,
							['@rent_price']  = rentPrice,
							['@owner']       = xTarget.identifier
						}, function(rowsChanged2)
							xPlayer.showNotification(_U('vehicle_set_rented', plate, xTarget.getName()))
						end)
                        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
                            ['@owner']   = xTarget.identifier,
                            ['@plate']   = plate,
                            ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
                            ['@type']    = 'boat'
                        })
                        cb()
					end
				end)
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_boatshop:getRentedVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_boats ORDER BY player_name ASC', {}, function(result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name = result[i].vehicle,
				plate = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_boatshop:giveBackVehicle', function(source, cb, plate)
    plate = plate:upper()
	MySQL.Async.fetchAll('SELECT base_price, vehicle FROM rented_boats WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			local vehicle = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('DELETE FROM rented_boats WHERE plate = @plate', {
				['@plate'] = plate
			}, function(rowsChanged)
                if rowsChanged > 0 then
                    MySQL.Async.execute('INSERT INTO boatdealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
                        ['@vehicle'] = vehicle,
                        ['@price']   = basePrice
                    })
                    RemoveOwnedVehicle(plate)
                    cb(true)
                else
                    cb(false)
                    RconPrint('^1[DEBUG]^0: Båden blev ikke slettet fra databasen!')
                    TriggerClientEvent('chat:addMessage', source, {
                        color = {255,0,0},
                        args = {'[FEJL]', 'Kontakt en developer!'}
                    })
                end
			end)
		else
			cb(false)
		end
	end)
end)

function UnrentVehicleAsync(identifier, plate)
	MySQL.Async.execute('DELETE FROM rented_boats WHERE identifier = @identifier AND plate = @plate', {
		['@identifier'] = identifier,
		['@plate'] = plate
	})
    MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    })
end

function PayRent(d, h, m)
	local tasks, timeStart = {}, os.clock()
	print('[esx_boatshop] [^2INFO^7] Paying rent cron job started')

	MySQL.Async.fetchAll('SELECT owner, rent_price, plate FROM rented_boats', {}, function(result)
		for k,v in ipairs(result) do
			table.insert(tasks, function(cb)
				local xPlayer = ESX.GetPlayerFromIdentifier(v.owner)

				if xPlayer then
					if xPlayer.getAccount('bank').money >= v.rent_price then
						xPlayer.removeAccountMoney('bank', v.rent_price)
						xPlayer.showNotification(_U('paid_rental', ESX.Math.GroupDigits(v.rent_price), v.plate))
					else
						xPlayer.showNotification(_U('paid_rental_evicted', ESX.Math.GroupDigits(v.rent_price), v.plate))
						UnrentVehicleAsync(v.owner, v.plate)
					end
				else
					MySQL.Async.fetchScalar('SELECT bank FROM users WHERE identifier = @identifier', {
						['@identifier'] = v.owner
					}, function(accounts)
						if accounts then
							local playerAccounts = accounts[1]

							if playerAccounts and playerAccounts then
								if playerAccounts >= v.price then
									playerAccounts = playerAccounts - v.price

									MySQL.Async.execute('UPDATE users SET bank = @accounts WHERE identifier = @identifier', {
										['@identifier'] = v.owner,
										['@accounts'] = playerAccounts
									})
								else
									UnrentVehicleAsync(v.owner, v.plate)
								end
							end
						end
					end)
				end

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
					account.addMoney(v.rent_price)
				end)

				cb()
			end)
		end

		Async.parallelLimit(tasks, 5, function(results) end)

		local elapsedTime = os.clock() - timeStart
		print(('[esx_boatshop] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
	end)
end

TriggerEvent('cron:runAt', 20, 00, PayRent)