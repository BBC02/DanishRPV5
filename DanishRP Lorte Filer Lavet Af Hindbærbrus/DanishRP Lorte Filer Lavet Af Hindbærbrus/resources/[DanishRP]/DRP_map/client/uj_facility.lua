--DisableInteriorProp
--EnableInteriorProp


local ch
local iaa
local ns
local mw
local fbi
local gx
RequestIpl("qnx_fib_milo_")
RequestIpl("qnx_fib2_milo_")

-- RegisterCommand("2ch", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if ch then
--         ch = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2iaa_logo")
--         DisableInteriorProp(interiorHash, "iaa_logo")
--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")
--         DisableInteriorProp(interiorHash, "2ns_logo")
--         DisableInteriorProp(interiorHash, "ns_logo")
--         DisableInteriorProp(interiorHash, "2fbi_logo")
--         DisableInteriorProp(interiorHash, "fbi_logo")
--         DisableInteriorProp(interiorHash, "2g6_logo")
--         DisableInteriorProp(interiorHash, "g6_logo")
--     else
--         ch = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2ch_logo")
--         EnableInteriorProp(interiorHash, "ch_logo")
--     end
-- end, false)

-- RegisterCommand("iaa", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if iaa then
--         iaa = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2ch_logo")
--         DisableInteriorProp(interiorHash, "ch_logo")
--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")
--         DisableInteriorProp(interiorHash, "2ns_logo")
--         DisableInteriorProp(interiorHash, "ns_logo")
--         DisableInteriorProp(interiorHash, "2fbi_logo")
--         DisableInteriorProp(interiorHash, "fbi_logo")
--         DisableInteriorProp(interiorHash, "2g6_logo")
--         DisableInteriorProp(interiorHash, "g6_logo")
--     else
--         iaa = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2ch_logo")
--         EnableInteriorProp(interiorHash, "ch_logo")

--         EnableInteriorProp(interiorHash, "2iaa_logo")
--         EnableInteriorProp(interiorHash, "iaa_logo")
--     end
-- end, false)

-- RegisterCommand("ns", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if ns then
--         ns = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2ch_logo")
--         DisableInteriorProp(interiorHash, "ch_logo")
--         DisableInteriorProp(interiorHash, "2iaa_logo")
--         DisableInteriorProp(interiorHash, "iaa_logo")
--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")
--         DisableInteriorProp(interiorHash, "2fbi_logo")
--         DisableInteriorProp(interiorHash, "fbi_logo")
--         DisableInteriorProp(interiorHash, "2g6_logo")
--         DisableInteriorProp(interiorHash, "g6_logo")
--     else
--         ns = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2ns_logo")
--         EnableInteriorProp(interiorHash, "ns_logo")
--     end
-- end, false)

-- RegisterCommand("mw", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if mw then
--         mw = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2ch_logo")
--         DisableInteriorProp(interiorHash, "ch_logo")

--         DisableInteriorProp(interiorHash, "2iaa_logo")
--         DisableInteriorProp(interiorHash, "iaa_logo")

--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")

--         DisableInteriorProp(interiorHash, "2ns_logo")
--         DisableInteriorProp(interiorHash, "ns_logo")

--         DisableInteriorProp(interiorHash, "2fbi_logo")
--         DisableInteriorProp(interiorHash, "fbi_logo")

--         DisableInteriorProp(interiorHash, "2g6_logo")
--         DisableInteriorProp(interiorHash, "g6_logo")
--     else
--         mw = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2ch_logo")
--         EnableInteriorProp(interiorHash, "ch_logo")

--         EnableInteriorProp(interiorHash, "2iaa_logo")
--         EnableInteriorProp(interiorHash, "iaa_logo")

--         EnableInteriorProp(interiorHash, "2mw_logo")
--         EnableInteriorProp(interiorHash, "mw_logo")

--         EnableInteriorProp(interiorHash, "2ns_logo")
--         EnableInteriorProp(interiorHash, "ns_logo")

--         EnableInteriorProp(interiorHash, "2fbi_logo")
--         EnableInteriorProp(interiorHash, "fbi_logo")

--         EnableInteriorProp(interiorHash, "2g6_logo")
--         EnableInteriorProp(interiorHash, "g6_logo")
--     end
-- end, false)

-- RegisterCommand("fbi", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if fbi then
--         fbi = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2ch_logo")
--         DisableInteriorProp(interiorHash, "ch_logo")
--         DisableInteriorProp(interiorHash, "2iaa_logo")
--         DisableInteriorProp(interiorHash, "iaa_logo")
--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")
--         DisableInteriorProp(interiorHash, "2ns_logo")
--         DisableInteriorProp(interiorHash, "ns_logo")
--         DisableInteriorProp(interiorHash, "2g6_logo")
--         DisableInteriorProp(interiorHash, "g6_logo")
--     else
--         fbi = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2fbi_logo")
--         EnableInteriorProp(interiorHash, "fbi_logo")
--     end
-- end, false)

-- RegisterCommand("g6", function(source, args, rawCommand)
--     local ped = PlayerPedId()
--     local interiorHash = GetInteriorFromEntity(ped)
--     if gx then
--         gx = false
--         RefreshInterior(interiorHash)
--         DisableInteriorProp(interiorHash, "2ch_logo")
--         DisableInteriorProp(interiorHash, "ch_logo")
--         DisableInteriorProp(interiorHash, "2iaa_logo")
--         DisableInteriorProp(interiorHash, "iaa_logo")
--         DisableInteriorProp(interiorHash, "2mw_logo")
--         DisableInteriorProp(interiorHash, "mw_logo")
--         DisableInteriorProp(interiorHash, "2ns_logo")
--         DisableInteriorProp(interiorHash, "ns_logo")
--         DisableInteriorProp(interiorHash, "2fbi_logo")
--         DisableInteriorProp(interiorHash, "fbi_logo")
--     else
--         gx = true
--         RefreshInterior(interiorHash)
--         EnableInteriorProp(interiorHash, "2g6_logo")
--         EnableInteriorProp(interiorHash, "g6_logo")
--     end
-- end, false)
