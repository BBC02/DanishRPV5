ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx_phone:registerNumber', 'revisor', 'revisor', true, true)

TriggerEvent('esx_society:registerSociety', 'revisor', 'revisor', 'society_revisor', 'society_revisor', 'society_revisor', {type = 'public'})


ESX.RegisterServerCallback('zrp_jobs:revisor:getBlackMoneyAmount', function(source, cb, money)
	local xPlayer = ESX.GetPlayerFromId(source)
	money = xPlayer.getAccount('black_money').money
	cb(money)
end)

RegisterServerEvent('zrp_jobs:revisor:startWhiteWash', function(procent)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	societymoney = TriggerEvent('esx_addonaccount:getSharedAccount', 'society_revisor', function(account)
		print(account.money)
		moneyss = account.money
	end)
	money = xPlayer.getAccount('black_money').money
	xPlayer.addMoney((100-procent)*money/100)
	xPlayer.removeAccountMoney("black_money", money)
	Wait(1000)
	sendToDiscord(16753920, "Revisor", xPlayer.getName() .. " Hvidvasket til ".. procent .. "% med et beløb på " .. comma_value(money) .. ' kr '.. " | ".. comma_value(round((procent*money/100)+200000)) .. " kr " .. " er tilføjet firmakontoen | " .. "Revisor konto: " .. comma_value(moneyss + (procent*money/100)+200000) .. " kr ", "ø er en kvinde")
end)


RegisterNetEvent('addSocietymoney')
AddEventHandler('addSocietymoney', function(society, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney(bank, amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        account.addMoney(amount + 200000)
      end)
end)

function sendToDiscord(color, name, message, footer)
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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1033531252260737175/hDzuXcovUPmQ93zgQ4PLlMRxNeFOFh5JygCsdt0m9q5fDuf0_39_eIDFFrFUhVEEXX1F', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

round = function(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end