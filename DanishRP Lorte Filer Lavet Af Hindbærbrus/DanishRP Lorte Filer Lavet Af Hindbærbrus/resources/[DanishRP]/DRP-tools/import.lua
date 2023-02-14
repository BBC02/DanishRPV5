local IS_SERVER = IsDuplicityVersion()
local EVENT_PREFIX = GetCurrentResourceName() .. '-Savanha:'
local DEBUG = false

local tse = TriggerServerEvent
local tce = TriggerClientEvent
local event = AddEventHandler

local function netEvent(name, func)
	RegisterNetEvent(name)
	AddEventHandler(name, func)
end

local function log(name, text)
	if DEBUG then
		Citizen.Trace('^1' .. name .. ': ^0' .. text .. '\n')
	end
end

if IsDuplicityVersion() then
    _G.RegisterServerCallback = function(eventName, fn)
        assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))
        assert(type(fn) == 'function', 'Invalid Lua type at argument #2, expected function, got ' .. type(fn))
        
        AddEventHandler(('s__Savanha_callback:%s'):format(eventName), function(cb, s, ...)
            local result = {fn(s, ...)}
            cb(table.unpack(result))
        end)
    end
    
    _G.TriggerClientCallback = function(src, eventName, ...)
        assert(type(src) == 'number', 'Invalid Lua type at argument #1, expected number, got ' .. type(src))
        assert(type(eventName) == 'string', 'Invalid Lua type at argument #2, expected string, got ' .. type(eventName))
        
        local p = promise.new()
        
        RegisterNetEvent('__Savanha_callback:server:' .. eventName)
        local e = AddEventHandler('__Savanha_callback:server:' .. eventName, function(...)
            local s = source
            if src == s then
                p:resolve({...})
            end
        end)
        
        TriggerClientEvent('__Savanha_callback:client', src, eventName, ...)
        
        local result = Citizen.Await(p)
        RemoveEventHandler(e)
        return table.unpack(result)
	end
	
	local function registerMethod(remoteObject, key, func)
        local eventName = remoteObject.prefix .. key .. ':'

        if type(func) == 'function' then   
            log('Savanha-info', 'Registered a new method: "' .. eventName .. '".')

            remoteObject.functions[key] = true

            netEvent(eventName .. 'request', function(...)
                tce(eventName .. 'send', source, func(source, ...))
            end)
        else
            log('Savanha-error', 'You tried to register something that isn\'t a method: "' .. eventName .. '".')
        end
    end

    -- @desc Create a new remote object that can be loaded by a client.
    -- @param name name of the object
    -- @return the remote object
    function CreateRemoteObject(name)
        local remoteObject = {}
        remoteObject.prefix = EVENT_PREFIX .. name .. ':'
        remoteObject.functions = {}

        setmetatable(remoteObject, { __newindex = registerMethod })

        netEvent(remoteObject.prefix .. 'get', function()
            tce(remoteObject.prefix .. 'set', source, remoteObject.functions)
        end)

        return remoteObject
    end
else
    _G.TriggerServerCallback = function(eventName, ...)
        assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))
        
        local p = promise.new()
        local ticket = GetGameTimer()
        
        RegisterNetEvent(('__Savanha_callback:client:%s:%s'):format(eventName, ticket))
        local e = AddEventHandler(('__Savanha_callback:client:%s:%s'):format(eventName, ticket), function(...)
            p:resolve({...})
        end)
        
        TriggerServerEvent('__Savanha_callback:server', eventName, ticket, ...)
        
        local result = Citizen.Await(p)
        RemoveEventHandler(e)
        return table.unpack(result)
    end
    
    _G.RegisterClientCallback = function(eventName, fn)
        assert(type(eventName) == 'string', 'Invalid Lua type at argument #1, expected string, got ' .. type(eventName))
        assert(type(fn) == 'function', 'Invalid Lua type at argument #2, expected function, got ' .. type(fn))
        
        AddEventHandler(('c__Savanha_callback:%s'):format(eventName), function(cb, ...)
            cb(fn(...))
        end)
	end
	
	local function registerMethods(remoteObject, functions)
        remoteObject.handlers = {}
        for key, _ in pairs(functions) do
            local eventName = remoteObject.prefix .. key .. ':'
            
            netEvent(eventName .. 'send', function(...) -- Register the event one time
                remoteObject.handlers[key](...)
            end)

            remoteObject[key] = function(...)
                local p = promise.new()

                log('Savanha-info', 'New method called : "' .. eventName .. '".')
                tse(eventName .. 'request', ...)

                remoteObject.handlers[key] = function(args)
                    p:resolve(args)
                end

                return Citizen.Await(p)
            end
        end
    end

    -- @desc Get a remote object created by the server.
    -- @param name name of the object
    -- @return the remote object
    function LoadRemoteObject(name)
        local p = promise.new()
        local remoteObject = {}
        remoteObject.prefix = EVENT_PREFIX .. name .. ':'

        tse(remoteObject.prefix .. 'get')

        netEvent(remoteObject.prefix .. 'set', function(functions)
            registerMethods(remoteObject, functions)
            p:resolve(remoteObject)
        end)

        return Citizen.Await(p)
    end
end
