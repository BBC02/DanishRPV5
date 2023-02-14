-- local methlab = GetInteriorAtCoords(226.98260000, -419.99010000, 54.92408000)

-- RefreshInterior(methlab)
-- EnableInteriorProp(methlab, 0x01A7116D)
-- ActivateInteriorEntitySet(methlab, 0x01A7116D)



Citizen.CreateThread(function()
	RequestIpl("bobo_court_v2_milo_")
	
-- Vault
local methlab = GetInteriorAtCoords(235.73, -416.16, 47.93)

EnableInteriorProp(methlab, 'load_shit')
ActivateInteriorEntitySet(methlab, 'load_shit')
RefreshInterior(methlab)
	
end)