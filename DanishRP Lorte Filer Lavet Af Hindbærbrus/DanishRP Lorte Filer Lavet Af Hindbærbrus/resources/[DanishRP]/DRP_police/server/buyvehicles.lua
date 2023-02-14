AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
      MySQL.ready(function() SQLVehiclesAndCategories() end)
    end
  end)

  function SQLVehiclesAndCategories()
	MySQL.Async.fetchAll('SELECT * FROM `police_vehicle_categories`', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM `police_vehicles`', {}, function(_vehicles)
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
	TriggerClientEvent('esx_policejob:sendCategories', -1, categories)
	TriggerClientEvent('esx_policejob:sendVehicles', -1, vehicles)
end

ESX.RegisterServerCallback('getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('getVehicles', function(source, cb)
	cb(vehicles)
end)


ESX.RegisterServerCallback('esx_policejob:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:buyVehicle', function(source, cb, model, plate, target, category)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
	local modelPrice
    local test = test
    local date = os.date('%Y-%m-%d')
	for k,v in ipairs(vehicles) do
		if model == v.model then
			modelPrice = v.price
			break
		end
	end
	if modelPrice and xTarget.getMoney() >= modelPrice then
		xTarget.removeMoney(modelPrice)
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, model, date, category, paidprice) VALUES (@owner, @plate, @vehicle, @model, @date, @category, @paidprice)', {
			['@owner']   = xTarget.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
            ['@model'] = model,
            ['@date'] = date,
            ['@category'] = category,
            ['@paidprice']   = modelPrice,
		}, function(rowsChanged)
            exports['t1ger_keys']:UpdateKeysToDatabase(plate, true)
            xPlayer.showNotification(('Du solgte %s en %s for %s!'):format(xTarget.getName(), model, modelPrice))
			xTarget.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
	else
		cb(false)
	end
end)

  