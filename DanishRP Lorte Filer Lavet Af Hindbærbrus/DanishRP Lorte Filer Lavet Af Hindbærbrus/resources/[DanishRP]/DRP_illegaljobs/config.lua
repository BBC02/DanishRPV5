Config = {}

Config.Debug = false

Config.SpawnOffset = vector3(0.0, 0.0, -100.0)
Config.CarSpawnDistance = 150.0

Config.ReturnRate = 75
Config.MaxActiveDeliverances = 1
Config.HeistNeedLevel = 3

-- c4
-- c4_part_1 (Explosion)
-- c4_part_2 (Bil Radio)
-- c4_part_3 (Circuit Board)
-- thermal
-- thermal_part_1
-- thermal_part_2
-- transporter_scheme_expanded
-- lockpick_advanced
-- blue_id_card
-- red_id_card
-- document_1
-- document_2

-- SHOPPEN I PAWNSHOP --
-- circular_saw
-- bolt_cutter
-- blowtorch - Fjern fra shop
-- laptop_h (Lav om til bærbar) - Fjern fra shop
-- drill - Fjern fra shop

-- black_money
-- painting_1
-- painting_2
-- painting_3
-- painting_4
-- ring
-- ring_deluxe
-- watch
-- watch_deluxe
-- necklace
-- necklace_deluxe
-- dia_box
-- gold_bar
-- weed_pooch
-- coke_pooch
-- meth_pooch

Config.Jobs = {
    ["bankRobbery"] = true,
    ["unionRobbery"] = true,
    ["humaneRobbery"] = true,
    ["stockadeRobbery"] = true,
    ["truckRobbery"] = false,
    ["houseRobbery"] = true,
    ["containerRobbery"] = true,
    ["carjack"] = true,
}

Config.Cooldowns = {
    ["bankRobbery"] = 36000,
    ["unionRobbery"] = 36000,
    ["humaneRobbery"] = 36000,
    ["stockadeRobbery"] = 7200,
    ["truckRobbery"] = 1800,
    ["houseRobbery"] = 3600,
    ["containerRobbery"] = 3600,
    ["carjack"] = 900,
}

Config.Police = {
    ["bankRobbery"] = 6,
    ["unionRobbery"] = 6,
    ["humaneRobbery"] = 6,
    ["stockadeRobbery"] = 3,
    ["truckRobbery"] = 0,
    ["houseRobbery"] = 2,
    ["containerRobbery"] = 2,
    ["carjack"] = 2,
}

Config.validJobs = {
    'gang1',
    'gang2',
    'gang3',
    'gang4',
    'gang5',
    'gang6',
    'gang7',
    'gang8',
    'gang9',
    'gang10',
    'gang11',
    'gang12',
    'police',
}

Config.GangJobs = {
    'gang1',
    'gang2',
    'gang3',
    'gang4',
    'gang5',
    'gang6',
    'gang7',
    'gang8',
    'gang9',
    'gang10',
    'gang11',
    'gang12',
}

Config.AddRobberZones = {
    ["bankRobbery"] = vector3(2747.10, 1503.35, 30.79),
}

Config.PawnShopNPC = vector4(-267.41, 235.05, 90.57, 18.5)
Config.PawnBuyShop = {
    {
        shopItem = { item = "bolt_cutter", amount = 1 },
        costPrice = 10000,
    }, {
        shopItem = { item = "circular_saw", amount = 1 },
        costPrice = 10000,
    }, {
        shopItem = { item = "blowtorch", amount = 1 },
        costPrice = 10000,
    }, {
        shopItem = { item = "drill", amount = 1 },
        costPrice = 10000,
    }, {
        shopItem = { item = "laptop_h", amount = 1 },
        costPrice = 100000,
    },
}

Config.PawnSellShop = {
    { item = "painting_1", label = "Maleri #1", price = 500 }, -- %70
    { item = "painting_2", label = "Maleri #2", price = 5000 }, -- %25
    { item = "painting_3", label = "Maleri #3", price = 25000 }, -- %4
    { item = "painting_4", label = "Maleri #4", price = 75000 }, -- 1%
    { item = "ring", label = "Forlovelsesring", price = 2500 },
    { item = "ring_deluxe", label = "Vielsesring", price = 7500 },
    { item = "watch", label = "Armbåndsur", price = 2500 },
    { item = "watch_deluxe", label = "Dyrt armbåndsur", price = 7500 },
    { item = "necklace", label = "Halskæde", price = 2500 },
    { item = "necklace_deluxe", label = "Luksus halskæde", price = 7500 },
    { item = "gold_bar", label = "Guldbar", price = 15000 },
    { item = "dia_box", label = "Diamantboks",  price = 20000 },
    { item = "gold", label = "Guldstykke", price = 1500 },
    { item = "diamond", label = "Lille diamant",  price = 2000 },
}

Config.JobConfig = {
    ["houseRobbery"] = {
        ["rewards"] = {
            [1] = {
                { item = "ring", amount = { min = 1, max = 2 }, chance = 100 },
                { item = "ring_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
            [2] = {
                { item = "watch", amount = { min = 1, max = 2 }, chance = 100 },
                { item = "watch_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
            [3] = {
                { item = "necklace", amount = { min = 1, max = 2 }, chance = 100 },
                { item = "necklace_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
        },
        ["low_end"] = {
            [1] = {
                { item = "black_money", name = "DKK", amount = { min = 2500, max = 3500 }, chance = 100 },
                { item = "thermal_part_1", amount = { min = 1, max = 1 }, chance = 25 },
            },
            [2] = {
                { item = "black_money", name = "DKK", amount = { min = 2500, max = 3500 }, chance = 100 },
                { item = "thermal_part_2", amount = { min = 1, max = 1 }, chance = 25 },
            },
            [3] = {
                { item = "black_money", name = "DKK", amount = { min = 2500, max = 3500 }, chance = 100 },
                { item = "meth_pooch", amount = { min = 10, max = 20 }, chance = 30 },
            },
            [4] = {
                { item = "black_money", name = "DKK", amount = { min = 2500, max = 3500 }, chance = 100 },
                { item = "opium_pooch", amount = { min = 10, max = 20 }, chance = 30 },
            },
            [5] = {
                { item = "black_money", name = "DKK", amount = { min = 2500, max = 3500 }, chance = 100 },
                { item = "coke_pooch", amount = { min = 10, max = 20 }, chance = 30 },
            },
        },
    },
    ["carjack"] = {
        ["sell"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 5000, max = 10000 }, chance = 100 }, -- 5x Super - 3x Sport
            },
        },
        ["scrap"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 2500, max = 7500 }, chance = 100 },
                { item = "c4_part_2", amount = { min = 1, max = 1 }, chance = 100 },
                { item = "lockpick_advanced", amount = { min = 1, max = 2 }, chance = 50 },
            },
        },
    },
    ["bankRobbery"] = {
        ["rewards"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 450000, max = 550000 }, chance = 100 },
            },
        },
        ["register_loot"] = {
            [1] = {
                { item = "transporter_scheme_expanded", amount = { min = 1, max = 1 }, chance = 100 },
            },
            [2] = {
                { item = "transporter_scheme_expanded", amount = { min = 2, max = 2 }, chance = 100 },
            },
        },
        ["cash_trolly"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 14000, max = 16000 }, chance = 100 },
            }
        },
        ["gold_trolly"] = {
            [1] = {
                { item = "gold_bar", amount = { min = 1, max = 1 }, chance = 100 },
            }
        },
        ["diamond_trolly"] = {
            [1] = {
                { item = "dia_box", amount = { min = 1, max = 1 }, chance = 100 },
            }
        },
        ["cash_table"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 100000, max = 100000 }, chance = 100 },
            }
        },
        ["gold_table"] = {
            [1] = {
                { item = "gold_bar", amount = { min = 24, max = 24 }, chance = 100 },
            }
        },
        ["table_loot"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 10000, max = 20000 }, chance = 100 },
                { item = "document_1", amount = { min = 1, max = 1 }, chance = 10 },
            },
            [2] = {
                { item = "black_money", name = "Kroner", amount = { min = 10000, max = 20000 }, chance = 100 },
                { item = "document_2", amount = { min = 1, max = 1 }, chance = 5 },
            },
        },
    },
    ["unionRobbery"] = {
        ["cash_trolly"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 4500, max = 5500 }, chance = 100 },
            }
        },
        ["gold_trolly"] = {
            [1] = {
                { item = "gold_bar", amount = { min = 1, max = 1 }, chance = 100 },
            }
        },
        ["cash_table"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 100000, max = 100000 }, chance = 100 },
            }
        },
        ["gold_table"] = {
            [1] = {
                { item = "gold_bar", amount = { min = 24, max = 24 }, chance = 100 },
            }
        },
    },
    ["humaneRobbery"] = {
        ["default"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 500000, max = 500000 }, chance = 100 },
            }
        }
    },
    ["containerRobbery"] = {
        ["lootsafe"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 7500, max = 15000 }, chance = 100 },
                { item = "necklace_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
            [2] = {
                { item = "black_money", name = "Kroner", amount = { min = 7500, max = 15000 }, chance = 100 },
                { item = "watch_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
            [3] = {
                { item = "black_money", name = "Kroner", amount = { min = 7500, max = 15000 }, chance = 100 },
                { item = "ring_deluxe", amount = { min = 1, max = 1 }, chance = 10 },
            },
        },
        ["lootcrate"] = {
            [1] = {
                { item = "ammo", amount = { min = 5, max = 10 }, chance = 100 },
                { item = "thermal_part_1", amount = { min = 1, max = 1 }, chance = 25 },
                { item = "c4_part_1", amount = { min = 1, max = 1 }, chance = 25 },
            },
            [2] = {
                { item = "ammo", amount = { min = 5, max = 10 }, chance = 100 },
                { item = "thermal_part_2", amount = { min = 1, max = 1 }, chance = 25 },
                { item = "c4_part_1", amount = { min = 1, max = 1 }, chance = 25 },
            },
        },
        ["loot"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 20000, max = 20000 }, chance = 100 },
            }
        }
    },
    ["stockadeRobbery"] = {
        ["rewards"] = {
            [1] = {
                { item = "black_money", name = "Kroner", amount = { min = 100000, max = 175000 }, chance = 100 },
                { item = "gold_bar", amount = { min = 10, max = 15 }, chance = 100 },
                { item = "dia_box", amount = { min = 5, max = 10 }, chance = 50 },
                { item = "blue_id_card", amount = { min = 1, max = 1 }, chance = 50 },
            },
            [2] = {
                { item = "black_money", name = "Kroner", amount = { min = 100000, max = 175000 }, chance = 100 },
                { item = "gold_bar", amount = { min = 10, max = 15 }, chance = 100 },
                { item = "dia_box", amount = { min = 5, max = 10 }, chance = 50 },
                { item = "red_id_card", amount = { min = 1, max = 1 }, chance = 50 },
            },
        },
    },
}

Config.GunDelivery = {
    vector4(-1578.96, 5168.97, 19.38, 85.5),
    vector4(-2309.14, 264.61, 169.41, 94.5),
    vector4(3615.95, 3727.8, 28.5, 324.5),
    vector4(1263.66, 1905.15, 78.63, 53.5),
    vector4(1020.95, 2449.96, 44.23, 141.5),
    vector4(706.17, 4173.05, 40.67, 105.5),
    vector4(1908.66, 573.82, 175.63, 65.5),
    vector4(2136.28, 4776.64, 40.78, 204.5),
}

Config.CarGeneratorSpawn = {
    "asterope",
    "baller2",
    "banshee",
    "bfinjection",
    "bifta",
    "bison",
    "blazer",
    "blista",
    "bobcatxl",
    "brioso",
    "buffalo",
    "caddy",
    "carbonizzare",
    "casco",
    "chino2",
    "cogcabrio",
    "coquette",
    "cyclone",
    "dloader",
    "drafter",
    "dubsta",
    "dynasty",
    "emperor",
    "entityxf",
    "f620",
    "fagaloa",
    "feltzer3",
    "fq2",
    "freecrawler",
    "fugitive",
    "futo",
    "gauntlet",
    "gresley",
    "habanero",
    "hotknife",
    "infernus2",
    "ingot",
    "issi2",
    "jester",
    "jester3",
    "mamba",
    "mesa",
    "michelli",
    "moonbeam2",
    "mule",
    "nebula",
    "paradise",
    "patriot",
    "peyote2",
    "peyote",
    "picador",
    "prairie",
    "premier",
    "primo",
    "rancherxl",
    "regina",
    "rentalbus",
    "retinue",
    "revolter",
    "ratloader",
    "btype",
    "sabregt",
    "sadler",
    "sentinel3",
    "stalion",
    "stratum",
    "stretch",
    "surge",
    "tampa",
    "tornado2",
    "tornado3",
    "virgo",
    "voodoo",
    "washington",
    "youga2",
}

Debug = function(msg)
    if Config.Debug then
        print("[" .. GetCurrentResourceName() .. "] : " .. msg)
    end
end

deepcopy = function(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

print_r = function(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end

    sub_print_r(t, "  ")
end

has_value = function(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

isTableEmpty = function(table)
    return next(table) == nil
end

tablelength = function(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

GroupDigits = function(value)
    local left, num, right = string.match(value, '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1.'):reverse()) .. right
end

firstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end

shuffle = function(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
end

all_trim = function(s)
    if s ~= nil then
        return s:match("^%s*(.-)%s*$")
    else
        return nil
    end
end

tableContains = function(t, val)
    for k, v in pairs(t) do
        if v == val then
            return true
        end
    end
    return false
end
