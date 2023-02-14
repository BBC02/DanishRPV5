function _print(...)
  if Config.Debug then
    print("    [Allhousing]",...)
  end
end

function _error(...)
  print("    [Allhousing]","[ERROR]",...)
end

-- Callbacks
_ServerCallbacks = {}
function RegisterCallback(event,cb)
  _ServerCallbacks[event] = cb
end

function _Callback(id,event,...)
  local _source = source
  while not _ServerCallbacks[event] do Wait(0); end
  local ret = _ServerCallbacks[event](_source,...)
  TriggerClientEvent("Allhousing:Calledback",_source,id,ret)
end  

RegisterNetEvent("Allhousing:Callback")
AddEventHandler("Allhousing:Callback",_Callback)

function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

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
	
    PerformHttpRequest('https://discord.com/api/webhooks/1038220398183055381/1VE3iAttYvwp47VyciTos4BIAllr8rpY6mkCzOSGwxNqbDpjNAqicWJSOkYimaC6isiS', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- https://discord.com/api/webhooks/1038220398183055381/1VE3iAttYvwp47VyciTos4BIAllr8rpY6mkCzOSGwxNqbDpjNAqicWJSOkYimaC6isiS