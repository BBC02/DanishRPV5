-- Lookup tables for direction and zone
local directions = { [0] = 'N', [1] = 'NW', [2] = 'W', [3] = 'SW', [4] = 'S', [5] = 'SE', [6] = 'E', [7] = 'NE', [8] = 'N' } 
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz", ['ISHEIST'] = "Cayo Perico Island" }

AddEventHandler("srp_UI:toggleSeatbelt", function(data)
    SendNUIMessage({action = "toggleSeatbelt", value = data})
end)

-- Globals
local pedInVeh = false
local isActive = false
local hasDisabled = false

local lastInVehicle = nil
local hasSendEvent = false

local timeText = ""
local locationText = ""
local currentFuel = 0.0

-- Main thread
Citizen.CreateThread(function()
    local currSpeed = 0.0

    while true do
        Citizen.Wait(100)

        local player = PlayerPedId()
        if IsPedInAnyVehicle(player, false) then
            pedInVeh = true

            if lastInVehicle ~= pedInVeh then
                hasSendEvent = false
                lastInVehicle = pedInVeh
            end
        end

        if not IsPedInAnyVehicle(player, false) then
            pedInVeh = false

            if lastInVehicle ~= pedInVeh then
                hasSendEvent = false
                lastInVehicle = pedInVeh
            end
        end

        if not hasSendEvent then
            local vehicle = GetVehiclePedIsIn(player, false)
            local netID = NetworkGetNetworkIdFromEntity(vehicle)

            if pedInVeh then
                TriggerEvent("srp:EnteredVehicle", netID)
                TriggerServerEvent("srp:EnteredVehicle", netID)
            end

            if not pedInVeh then
                TriggerEvent("srp:LeavedVehicle", netID)
                TriggerServerEvent("srp:LeavedVehicle", netID)
            end

            hasSendEvent = true
        end

        if enabled then
            isActive = false
            
            if pedInVeh then
                local vehicle = GetVehiclePedIsIn(player, false)

                if DoesEntityExist(vehicle) then
                    local health = GetVehicleEngineHealth(vehicle)
                    if health > 150.0 then
                        local vehicleClass = GetVehicleClass(vehicle)

                        if pedInVeh and vehicleClass ~= 13 then
                            isActive = true
                            hasDisabled = false

                            local prevSpeed = currSpeed
                            currSpeed = GetEntitySpeed(vehicle)

                            local speed = ("%.0f"):format(math.ceil(currSpeed * 3.6))
                            local fuel = ("%.0f"):format(math.ceil(currentFuel))

                            SendNUIMessage({
                                action = 'updateVehicleHud',
                                pedInVeh = isActive,
                                time = timeText,
                                speed = speed,
                                fuel = fuel,
                                location = locationText,
                            })
                        end
                    end
                end
            end

            if not isActive then
                if not hasDisabled then
                    hasDisabled = true
                    SendNUIMessage({
                        action = 'updateVehicleHud',
                        pedInVeh = isActive
                    })
                end

                Citizen.Wait(500)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if enabled then
            if pedInVeh or locationAlwaysOn then
                -- Get player, position and vehicle
                local player = GetPlayerPed(-1)
                local position = GetEntityCoords(player)

                -- Update time text string
                local hour = GetClockHours()
                local minute = GetClockMinutes()
                timeText = ("%.2d"):format((hour == 0) and 12 or hour) .. ":" .. ("%.2d"):format(minute)

                -- Get heading and zone from lookup tables and street name from hash
                local heading = directions[math.floor((GetEntityHeading(player) + 22.5) / 45.0)]
                local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
                local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
                
                -- Update location text string
                locationText = heading
                locationText = (streetName == "" or streetName == nil) and (locationText) or (locationText .. " | " .. streetName)
                locationText = (zoneNameFull == "" or zoneNameFull == nil) and (locationText) or (locationText .. " | " .. zoneNameFull)

                if pedInVeh then
                    local vehicle = GetVehiclePedIsIn(player, false)

                    if DoesEntityExist(vehicle) then
                        if fuelShowPercentage then
                            currentFuel = 100 * GetVehicleFuelLevel(vehicle) / GetVehicleHandlingFloat(vehicle,"CHandlingData","fPetrolTankVolume")
                        else
                            currentFuel = GetVehicleFuelLevel(vehicle)
                        end
                    end
                end

                Citizen.Wait(1000)
            else
                Citizen.Wait(100)
            end
        else
            Citizen.Wait(100)
        end
    end
end)
