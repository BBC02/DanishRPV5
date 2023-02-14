ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

local VehiclesForSale = 0

ESX.RegisterServerCallback("esx-qalle-sellvehicles:retrieveVehicles", function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local identifier = ESX.GetPlayerFromId(src)["identifier"]

    MySQL.Async.fetchAll("SELECT seller, vehicleProps, price FROM vehicles_for_sale", {}, function(result)
        local vehicleTable = {}

        VehiclesForSale = 0

        if result[1] ~= nil then
            for i = 1, #result, 1 do
                VehiclesForSale = VehiclesForSale + 1

				local seller = false

				if result[i]["seller"] == identifier then
					seller = true
				end

                table.insert(vehicleTable, { ["price"] = result[i]["price"], ["vehProps"] = json.decode(result[i]["vehicleProps"]), ["owner"] = seller })
            end
        end

        cb(vehicleTable)
    end)
end)

ESX.RegisterServerCallback("esx-qalle-sellvehicles:isVehicleValid", function(source, cb, vehicleProps, price, model, vehicleName)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
    
    local plate = vehicleProps["plate"]

	local isFound = false

	RetrievePlayerVehicles(xPlayer.identifier, function(ownedVehicles)

		for id, v in pairs(ownedVehicles) do

			if Trim(plate) == Trim(v.plate) and #Config.VehiclePositions ~= VehiclesForSale then
				local name = GetPlayerName(source)
				sendToDiscord(16753920, "Sell vehicle (used vehicles)", name.." (".. xPlayer.getName() ..")  Satte en ".. vehicleName.. " ( ".. model .. ") med nummerpladen " .. v.plate .. " til salg for ".. comma_value(math.floor(price)), "California", "sell")
                MySQL.Async.execute("INSERT INTO vehicles_for_sale (seller, vehicleProps, price) VALUES (@sellerIdentifier, @vehProps, @vehPrice)",
                    {
						["@sellerIdentifier"] = xPlayer["identifier"],
                        ["@vehProps"] = json.encode(vehicleProps),
                        ["@vehPrice"] = price
                    }
                )

				MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', { ["@plate"] = plate})

                TriggerClientEvent("esx-qalle-sellvehicles:refreshVehicles", -1)

				isFound = true
				break

			end		

		end

		cb(isFound)

	end)
end)

ESX.RegisterServerCallback("esx-qalle-sellvehicles:buyVehicle", function(source, cb, vehProps, price, model, vehicleName)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
    
	local price = price
	local plate = vehProps["plate"]
	local date = os.date('%Y-%m-%d')

	if xPlayer.getAccount("bank")["money"] >= price or price == 0 then
		xPlayer.removeAccountMoney("bank", price)
		local name = GetPlayerName(source)
		--sendToDiscord(16753920, "Buy vehicle (used vehicles)", name.." (".. xPlayer.getName() ..")  Købte en ".. vehicleName.. " (".. model .. ") med nummerpladen " .. plate .. " for ".. comma_value(math.floor(price)), "California", "buy")
		MySQL.Async.execute("INSERT INTO owned_vehicles (plate, owner, vehicle, model, name, paidprice, date, stored) VALUES (@plate, @identifier, @vehProps, @model, @name, @paidprice, @date, @stored)",
			{
				["@plate"] = plate,
				["@identifier"] = xPlayer["identifier"],
				["@vehProps"] = json.encode(vehProps),
				["@model"] = model,
				["@name"] = vehicleName,
				["@paidprice"] = price,
				["@date"] = date,
				["@stored"] = 1,
			}
		)

		TriggerClientEvent("esx-qalle-sellvehicles:refreshVehicles", -1)

		MySQL.Async.fetchAll('SELECT seller FROM vehicles_for_sale WHERE vehicleProps LIKE "%' .. plate .. '%"', {}, function(result)
			if result[1] ~= nil and result[1]["seller"] ~= nil then
				UpdateCash(result[1]["seller"], price)
				sendToDiscord(16753920, "Buy vehicle (used vehicles)", name.." (".. xPlayer.getName() ..")  Købte en ".. vehicleName.. " (".. model .. ") med nummerpladen " .. plate .. " af ".. result[1]["seller"] .." for ".. comma_value(math.floor(price)), "California", "buy")
			else
				print("Something went wrong, there was no car.")
			end
		end)

		MySQL.Async.execute('DELETE FROM vehicles_for_sale WHERE vehicleProps LIKE "%' .. plate .. '%"', {})

		cb(true)
	else
		cb(false, xPlayer.getAccount("bank")["money"])
	end
end)

function RetrievePlayerVehicles(newIdentifier, cb)
	local identifier = newIdentifier

	local yourVehicles = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @identifier", {['@identifier'] = identifier}, function(result) 

		for id, values in pairs(result) do

			local vehicle = json.decode(values.vehicle)
			local plate = values.plate

			table.insert(yourVehicles, { vehicle = vehicle, plate = plate })
		end

		cb(yourVehicles)

	end)
end

function UpdateCash(identifier, cash)
	local xPlayer = ESX.GetPlayerFromIdentifier(identifier)

	if xPlayer ~= nil then
		xPlayer.addAccountMoney("bank", cash)

		TriggerClientEvent("esx:showNotification", xPlayer.source, "Someone bought your vehicle and transferred $" .. cash)
	else
		MySQL.Async.fetchAll('SELECT accounts FROM users WHERE identifier = @identifier', { ["@identifier"] = identifier }, function(result)
			local test = json.decode(result[1].accounts)
			local accounts = {
				bank = test.bank + cash,
				black_money = test.black_money,
				money = test.money
			}
			if result[1] ~= nil then
				MySQL.Async.execute("UPDATE users SET accounts = @newBank WHERE identifier = @identifier",
					{
						["@identifier"] = identifier,
						["@newBank"] = json.encode(accounts)
					}
				)
			end
		end)
	end
end

Trim = function(word)
	if word ~= nil then
		return word:match("^%s*(.-)%s*$")
	else
		return nil
	end
end

function sendToDiscord(color, name, message, footer, type)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer.. " ".. os.date("%x %X %p"),
			  },
		  }
	  }
	
	if type == "buy" then
		PerformHttpRequest('https://discord.com/api/webhooks/977585777716396062/ZqgzPPDq_vHDpR02bhzsJOSWHByxyz76deVe5eh755joWN1Y-1N2GpYbktl4bDHpWVd2', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
	elseif type == "sell" then
 		PerformHttpRequest('https://discord.com/api/webhooks/977585822360547369/QDyqmlXmCheYzGBJq9Vm6bDyDBIq9ZXY6yPEQ7EliVG8Uc2gJhQBqf1QX_fDVd5y2j_j', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    elseif type == "remove" then
        PerformHttpRequest('https://discord.com/api/webhooks/977585887460343849/u8qyPSUPbS_H3b1K2Nrj7ftghscS371_pH6zV-ALtW_D0vZw0fkfPOb761aodVTF5Bss', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end

function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end