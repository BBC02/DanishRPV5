local TeleportFromTo = {
	["Humane Labs"] = {
		positionFrom = { ['x'] = 3540.7106933594, ['y'] = 3675.5920410156, ['z'] = 28.121137619019,  nom = "tilgå ~r~Humane Labs~w~"}, -- 859.29925537109,-2496.5471191406,28.31386756897
		positionTo = { ['x'] = 3540.8044433594, ['y'] = 3675.5910644531, ['z'] = 20.991771697998 , nom = "forlade ~r~Humane lab~w~"}, -- 1118.7159423828,-3193.4584960938,-40.392364501953
	},
	["DavisPD"] = {
		positionFrom = { ['x'] = 342.50021362305, ['y'] = -1637.283203125, ['z'] = 24.284442901611,  nom = "gå op til ~r~Politistationen"}, -- 342.50021362305,-1637.283203125,23.784442901611
		positionTo = { ['x'] = 371.46353149414, ['y'] = -1612.8151855469, ['z'] = 29.792039871216, nom = "gå ned til ~r~Garagen"}, -- 371.46353149414,-1612.8151855469,29.292039871216
	},
	["M&D Ejendomsmægler"] = {
		positionFrom = { ['x'] = -69.1406, ['y'] = -802.3477, ['z'] = 44.2273,  nom = "tilgå ~r~Ejendomsmægleren"}, -- -69.1406, -802.3477, 44.2273
		positionTo = { ['x'] = -140.4975, ['y'] = -619.2810, ['z'] = 168.8206, nom = "forlade ~r~Ejendomsmægleren"}, -- -140.4975, -619.2810, 168.8206
	},
	["A&J Revisor"] = {
		positionFrom = { ['x'] = -1581.0979, ['y'] = -558.1254, ['z'] = 34.9534,  nom = "tilgå ~r~Revisoren"}, -- --1581.0979, -558.1254, 34.9534, 34.4918
		positionTo = { ['x'] = -1579.4329, ['y'] = -563.2569, ['z'] = 108.5229, nom = "forlade ~r~Revisoren"}, -- -1579.4329, -563.2569, 108.5229, 211.6704
	},
	["Marijuana"] = {
		positionFrom = { ['x'] = 780.6646, ['y'] = 1296.7517, ['z'] = 361.3615,  nom = "tilgå ~r~labbet"}, -- 780.6646, 1296.7517, 361.3615, 268.0053
		positionTo = { ['x'] = 1066.3041, ['y'] = -3183.5203, ['z'] = -39.1636, nom = "forlade ~r~labbet"}, -- 1066.3041, -3183.5203, -39.1636
	},
	["Heroin Omdanning"] = {
		positionFrom = { ['x'] = -14.8917, ['y'] = -612.7955, ['z'] = 35.8615,  nom = "tilgå ~r~labbet"}, -- -14.8917, -612.7955, 35.8615
		positionTo = { ['x'] = 996.8979, ['y'] = -3200.6997, ['z'] = -36.3937, nom = "forlade ~r~labbet"}, -- 996.8979, -3200.6997, -36.3937
	},
}

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing


function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*0
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 120)
end


function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k, j in pairs(TeleportFromTo) do

			--msginf(k .. " " .. tostring(j.positionFrom.x), 15000)
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 150.0)then
				DrawMarker(-1, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 151, 255, 100, false, true, 2, true, false, false, false)
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 5.0)then
					Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.100, j.positionFrom.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 2.0)then
						--[[ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Tryk ~g~E~w~ for at gå til ".. j.positionFrom.nom)
						DrawSubtitleTimed(2000, 1) ]]
						      DrawText3Ds(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z, "Tryk [~g~E~w~] for at ".. j.positionFrom.nom)
						if IsControlJustPressed(1, 38) then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
							DoScreenFadeIn(1000)
						end
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 150.0)then
				DrawMarker(-1, j.positionTo.x, j.positionTo.y, j.positionTo.z - 0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 151, 255, 100, false, true, 2, true, false, false, false)
				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 5.0)then
					Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.100, j.positionTo.nom, 1, 0.2, 0.1, 255, 255, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 2.0)then
						 DrawText3Ds(j.positionTo.x, j.positionTo.y, j.positionTo.z, "Tryk [~g~E~w~] for at ".. j.positionTo.nom)
						
						if IsControlJustPressed(1, 38) then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
							DoScreenFadeIn(1000)
						end
					end
				end
			end
		end
	end
end)
