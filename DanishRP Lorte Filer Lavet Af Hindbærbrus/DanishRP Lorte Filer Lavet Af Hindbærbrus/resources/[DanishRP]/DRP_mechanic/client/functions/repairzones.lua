local auto_exotic = nil
local auto_exotic_fly = nil
local lsc_sandy = nil
local lsc_paleto = nil
local lsc_city_one = nil
local lsc_city_two = nil
local lsc_la_mesa = nil
local lsc_bilforhandler = nil
local casino = nil

RegisterPolyZone = function(mechanic)
    Citizen.CreateThread(function()
		if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lsc' then
            casino = PolyZone:Create({
                vector2(1218.0703125, 377.85745239258),
                vector2(950.26739501953, -51.042736053467),
                vector2(1078.3338623047, -154.48208618164),
                vector2(1344.8321533203, 293.46600341797)
            }, {
                name="casino",
                debugPoly = false
            })

            casino:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
        end
		
        if ESX.PlayerData.job.name == 'mecano' then
            auto_exotic = PolyZone:Create({
                vector2(533.03826904297, -221.2173614502),
                vector2(518.146484375, -164.40370178223),
                vector2(555.26684570312, -164.33081054688),
                vector2(554.74102783203, -203.77021789551),
                vector2(547.84466552734, -223.14898681641)
            }, {
                name = "auto_exotic",
                debugPoly = false
            })

            auto_exotic_fly = PolyZone:Create({
                vector2(1771.9191894531, 3339.046875),
                vector2(1764.3162841797, 3335.0903320312),
                vector2(1757.7706298828, 3344.0270996094),
                vector2(1740.7344970703, 3333.8503417969),
                vector2(1747.7298583984, 3307.1174316406),
                vector2(1781.1284179688, 3321.7084960938)
              }, {
                name="flywheel_ae",
                debugPoly = false
            })
            
            auto_exotic:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'mecano' then
                    insideRepairZone = isPointInside
                end
            end)

            auto_exotic_fly:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'mecano' then
                    insideRepairZone = isPointInside
                end
            end)
            
            return
        end
        
        if ESX.PlayerData.job.name == 'lsc' then
            lsc_sandy = PolyZone:Create({
                vector2(1160.0057373047, 2674.3640136719),
                vector2(1185.3817138672, 2674.7758789062),
                vector2(1187.7072753906, 2653.3913574219),
                vector2(1200.34765625, 2631.6733398438),
                vector2(1189.7930908203, 2629.5124511719),
                vector2(1190.9686279297, 2622.6831054688),
                vector2(1159.9666748047, 2622.3703613281)
            }, {
                name = "lsc_sandy",
                debugPoly = false
            })
            
            lsc_paleto = PolyZone:Create({
                vector2(116.71868896484, 6642.462890625),
                vector2(140.25163269043, 6618.7890625),
                vector2(113.52184295654, 6593.4145507812),
                vector2(90.513404846191, 6616.6831054688)
            }, {
                name = "lsc_paleto",
                debugPoly = false
            })
            
            lsc_city_one = PolyZone:Create({
                vector2(-359.70373535156, -184.28135681152),
                vector2(-417.73281860352, -81.922645568848),
                vector2(-401.65640258789, -65.550552368164),
                vector2(-295.25268554688, -99.834945678711),
                vector2(-305.92810058594, -161.80426025391),
                vector2(-309.21871948242, -166.57102966309)
            }, {
                name = "lsc_ls_one",
                debugPoly = false
            })
            
            lsc_city_two = PolyZone:Create({
                vector2(-1136.0635986328, -1977.1174316406),
                vector2(-1106.5515136719, -2014.9272460938),
                vector2(-1118.5822753906, -2023.4345703125),
                vector2(-1144.4879150391, -2049.2209472656),
                vector2(-1179.4385986328, -2028.1229248047),
                vector2(-1172.5911865234, -2005.7224121094),
                vector2(-1158.1184082031, -1986.6343994141),
                vector2(-1139.3843994141, -1973.6740722656)
            }, {
                name = "lsc_ls_two",
                debugPoly = false
            })
            
            lsc_la_mesa = PolyZone:Create({
                vector2(767.53955078125, -1053.0767822266),
                vector2(773.07208251953, -1107.4022216797),
                vector2(740.64147949219, -1103.2392578125),
                vector2(723.681640625, -1094.7618408203),
                vector2(701.38098144531, -1080.5329589844),
                vector2(702.19116210938, -1052.4714355469)
            }, {
                name = "lsc_ls_lamesa",
                debugPoly = false
            })

            lsc_bilforhandler = PolyZone:Create({
                vector2(-764.50402832031, -1090.7861328125),
                vector2(-717.0537109375, -1061.7900390625),
                vector2(-737.20416259766, -1025.5926513672),
                vector2(-743.76647949219, -1028.8718261719),
                vector2(-768.14904785156, -985.30346679688),
                vector2(-810.32696533203, -1019.0403442383),
                vector2(-776.10443115234, -1082.8891601562)
            }, {
                name = "lsc_bilforhandler",
                debugPoly = false
            })
            
            lsc_sandy:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
            
            lsc_paleto:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
            
            lsc_city_one:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
            
            lsc_city_two:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
            
            lsc_la_mesa:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)

            lsc_bilforhandler:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if ESX.PlayerData.job.name == 'lsc' then
                    insideRepairZone = isPointInside
                end
            end)
            
            return
        end
    end)
end

RemoveRegisteredPolyZones = function()
    if auto_exotic ~= nil then
        auto_exotic:destroy()
    end

    if auto_exotic_fly ~= nil then
        auto_exotic_fly:destroy()
    end

    if lsc_sandy ~= nil then
        lsc_sandy:destroy()
    end

    if lsc_paleto ~= nil then
        lsc_paleto:destroy()
    end

    if lsc_city_one ~= nil then
        lsc_city_one:destroy()
    end

    if lsc_city_two ~= nil then
        lsc_city_two:destroy()
    end

    if lsc_la_mesa ~= nil then
        lsc_la_mesa:destroy()
    end

    if lsc_bilforhandler ~= nil then
        lsc_bilforhandler:destroy()
    end
end

SetInsideZone = function()
    insideRepairZone = true
end

-- exports.qtarget:AddTargetModel({690372739, -1317235795, -654402915, 1114264700, 1099892058, -1034034125, 992069095}, {
--     options = {
--         {
--             icon = "fas fa-box-circle-check",
--             label = "Køb Kaffe",
--             action = function(entity)
-- 				print(entity)
--                 print(GetEntityModel(entity))
-- 			end,
--             job = 'mecano',
--             canInteract = function()
-- 				return insideRepairZone
-- 			end,
--         }
--     },
--     distance = 2
-- })
-- exports['qtarget']:AddTargetModel({690372739}, {
--     options = {
--         {
--             event = "coffee:buy",
--             icon = "fas fa-coffee",
--             label = "Køb Kaffe - 30,-",
--             item = "coffee", -- custom parameter
--             price = 5 -- custom parameter
--         },
--     },
--     distance = 2.5
-- })
