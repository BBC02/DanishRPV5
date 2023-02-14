Config = {}

Config.Debug = false
Config.DeveloperState = false

Config.NameLength = 20
Config.MaxMembers = 16
Config.InviteDistance = 30.0

Config.RacingEnabled = true

Config.MaxDistanceRaceStart = 100.0
Config.TopLapTimes = 10
Config.MaxLaps = 10
Config.MinimumRacers = 2

Config.AutoResetLapTimes = 7 * (24 * (60 * 60))
Config.FinishTimeOut = 5 * (60 * 1000)

Debug = function(msg)
    if Config.Debug or Config.DeveloperState then
        print("[" .. GetCurrentResourceName() .. "] " .. msg)
    end
end
