function StartPayCheck()
	CreateThread(function()
		while true do
			Wait(Config.PaycheckInterval)
			local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
				local job     = xPlayer.job.grade_name
				local jobname = xPlayer.job.name
                local onDuty  = xPlayer.job.onDuty
				local salary  = xPlayer.job.grade_salary

				if salary >= 0 then
					if job == 'unemployed' then -- unemployed
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
					elseif Config.EnableSocietyPayouts and onDuty then -- possibly a society
						TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
							if society ~= nil then -- verified society
								if jobname == 'denaro' or jobname == 'ndg' or jobname == 'btd' or jobname == 'ltf' or jobname == 'hb' or jobname == 'irish' or jobname == 'corleonefamily' or jobname == 'vatoslocos' or jobname == 'ms13' or jobname == 'asf' or jobname == 'sicarios' or jobname == 'lz' or jobname == 'bloods' or jobname == 'ha' or jobname == 'bandidos' or jobname == 'tbf' or jobname == 'rffr' or jobname == 'peacocks' or jobname == 'snm' or jobname == 'marabunta' or jobname == 'dfl' or jobname == 'alessio' then
									xPlayer.addAccountMoney('bank', 500)
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
									return
								end
								TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
									if account.money >= salary then -- does the society money to pay its employees?
										xPlayer.addAccountMoney('bank', salary)
										account.removeMoney(salary)

										TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
									else
										TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
									end
								end)
							else -- not a society
								xPlayer.addAccountMoney('bank', salary)
								TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
							end
						end)
					elseif onDuty then -- generic job
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
					end
				end
			end
		end
	end)
end
