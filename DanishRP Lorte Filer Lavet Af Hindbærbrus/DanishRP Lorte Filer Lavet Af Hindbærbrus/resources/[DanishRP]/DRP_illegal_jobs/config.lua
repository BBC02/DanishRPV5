-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Config = {}

-- Police Settings:
Config.PoliceJobs = {"police","ambulance"}	-- Jobs that can't do criminal things etc.
Config.RequiredCops = -1					-- required police online for players to do jobs
Config.RequiredLastBil = -1
Config.CarJackRequiredCops = -1
Config.RequiredCopsHouseRobbery = -2
Config.RequiredCopsBankRobbery = -5
Config.NotfiyCops = true				-- Notify Cops on blowing the truck
Config.AlertBlipShow = true				-- enable or disable blip on map on police notify
Config.AlertBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.AlertBlipRadius = 50.0			-- set radius of the police notify blip
Config.AlertBlipAlpha = 250			-- set alpha of the blip
Config.AlertBlipColor = 5				-- set blip color

Config.KeyToStartJob = 38
Config.HackItem = "hackerDevice"
Config.LockPick = "lockpick"
Config.DrillItem = "drill"
Config.HammerWireCutter = "hammerwirecutter"
Config.AccessCard = "accesscard"
Config.JobFees = 0			-- Amount of money to start a job
Config.UseBankMoney = false		-- Set to false to pay job fees with cash
Config.HackingBlocks = 4		-- amount of blocks u have to match
Config.HackingSeconds = 40		-- seconds to hack

Config.HackDataTimer = 3.5		-- time from pressed E to receving location on the truck
Config.DetonateTimer = 10			-- time until bomb is detonated
Config.RobTruckTimer = 30			-- time spent to rob the truck
Config.SafeMoneyReward = {{
	dirtyCash = true,			-- set to false to receive normal cash
	minAmount = 15,				-- this value is multiplied with 1000 in script, so 15 means 15.000$
	maxAmount = 30,				-- this value is multiplied with 1000 in script, so 30 means 30.000$
}}
Config.EnablePlayerMoneyBag = false   -- Enable or disable player wearing a 'heist money bag' after the robbery:

Config.CooldownTimer = 160		-- set cooldown time in minutes, before a player can start a job again
Config.CooldownTimerCarJack = 20		-- set cooldown time in minutes, before a player can start a job again
Config.CooldownTimerCarScrap = 15	-- set cooldown time in minutes, before a player can start a job again
Config.CooldownTimerBankRobbery = 200
Config.DrillStopKey = 178		-- button to stop drill

Config.ChanceToKeepDrill = 25
Config.HasItemLabel = false		-- set to false if your ESX vers. doesnt support item labels

Config.Reward = {min = 50000, max = 60000, dirty = true}

Config.RewardBankRobbery = {min = 500000, max = 700000, dirty = true}

Config.RewardCarjack = {min = 60000, max = 70000, dirty = true}

Config.RewardCarscrap = {min = 10000, max = 15000, dirty = true}

Config.validJobs = {
    'unemployed',
}

Config.SpawnOffset = vector3(0.0, 0.0, -100.0)

Config.Jobs = {
    ["bankRobbery"] = true,
    ["stockadeRobbery"] = true,
    ["truckRobbery"] = true,
    ["houseRobbery"] = true,
    ["carjack"] = true,
    ["carscrap"] = true,
}

Config.JobConfigCFG = {
	[1] = {
		rewards = {
			[1] = {item = "lockpick", min = 1, max = 2, chance = 400},
			[2] = {item = "ammunition", min = 5, max = 15, chance = 50},
		},
	},
	[2] = {
		rewards = {
			[1] = {item = "lockpick", min = 1, max = 2, chance = 400},
			[2] = {item = "suppressor", min = 1, max = 1, chance = 1},
		},
	},
	[3] = {
		rewards = {
			[1] = {item = "opium_pooch", min = 10, max = 20, chance = 300},
			[2] = {item = "lockpick", min = 1, max = 2, chance = 400},
		},
	},
	[4] = {
		rewards = {
			[1] = {item = "meth_pooch",  min = 10, max = 20, chance = 300},
			[2] = {item = "lockpick",  min = 1, max = 2, chance = 400},
		},
	},
	[5] = {
		rewards = {
			[1] = {item = "coke_pooch",  min = 10, max = 20, chance = 300},
			[2] = {item = "lockpick",  min = 1, max = 2, chance = 400},
		},
	},
	[6] = {
		rewards = {
			[1] = {item = "weed_pooch",  min = 10, max = 20, chance = 300},
			[2] = {item = "lockpick",  min = 1, max = 2, chance = 400},
		},
	},
	[7] = {
		rewards = {
			[1] = {item = "svampe", min = 10, max = 20, chance = 300},
			[2] = {item = "lockpick", min = 1, max = 2, chance = 400},
		},
	},
}

Config.SpecialRewards = {
	[1] = {
		rewards = {
			[1] = {item = "lockpick", min = 1, max = 3, chance = 800},
			[2] = {item = "dia_box", min = 1, max = 2, chance = 200},
			[3] = {item = "gold_bar", min = 4, max = 5, chance = 400},
			[4] = {item = "transporter_scheme", min = 1, max = 1, chance = 800},
		},
	},
}

Config.ItemReward = {
	enable = true,
	items = {
		[1] = {item = 'id_card', min = 2, max = 2, chance = 100},
	}
}

Config.TruckSpawn = {
	[1] = {
		pos = {-1215.3358, -356.8380, 37.2893, 281.8774},
		inUse = false,

	},
	[2] = {
		pos = {-2941.3391, 478.3390, 15.2405, 158.2602},
		inUse = false,

	},
	[3] = {
		pos = {-397.4479, 1229.5667, 325.6416, 64.8401},
		inUse = false,

	},
	[4] = {
		pos = {-1676.3165, 489.4032, 128.8762, 288.6453},
		inUse = false,

	},
	[5] = {
		pos = {-1055.9036, -1685.7089, 4.5505, 312.3919},
		inUse = false,

	},
}

Config.JobSpot = {
	[1] = {
		pos = {-1125.6173, 2694.5303, 18.8004, 50.1761},
		heading = 302.12,
		blip = {enable = false, sprite = 47, display = 4, scale = 0.65, color = 5, name = "Pengetransport Røveri"},
	},
}



Config.PawnShopNPC = vector4(-267.41, 235.05, 90.57, 18.5)
Config.PawnBuyShop = {
    {
        shopItem = { item = "c4", amount = 1 },
        requiredItems = {
            { item = "c4_part_1", amount = 1 },
            { item = "c4_part_3", amount = 1 },
        },
    }, {
        shopItem = { item = "c4_part_3", amount = 1 },
        requiredItems = {
            { item = "c4_part_2", amount = 4 },
        },
    }, {
        shopItem = { item = "thermal", amount = 1 },
        requiredItems = {
            { item = "thermal_part_1", amount = 1 },
            { item = "thermal_part_2", amount = 1 },
        },
    }, {
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
    { item = "painting_1", price = 500 }, -- %70
    { item = "painting_2", price = 5000 }, -- %25
    { item = "painting_3", price = 25000 }, -- %4
    { item = "painting_4", price = 75000 }, -- 1%
    { item = "ring", price = 2500 },
    { item = "ring_deluxe", price = 7500 },
    { item = "watch", price = 2500 },
    { item = "watch_deluxe", price = 7500 },
    { item = "necklace", price = 2500 },
    { item = "necklace_deluxe", price = 7500 },
    { item = "gold_bar", price = 15000 },
    { item = "dia_box", price = 20000 },
}

Config.CarSpawnDistance = 150.0


Config.JobConfig = {
	["truckRobbery"] = {
        [1] = {
            model = 'mule',
            pedType = 's_m_m_trucker_01',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
        [2] = {
            model = 'pounder',
            pedType = 's_m_m_trucker_01',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
        [3] = {
            model = 'boxville2',
            pedType = 's_m_m_postal_01',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
        [4] = {
            model = 'boxville3',
            pedType = 's_m_m_highsec_01',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
        [5] = {
            model = 'burrito2',
            pedType = 'hc_driver',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
        [6] = {
            model = 'burrito4',
            pedType = 's_m_y_construct_02',
            rewards = {
                [1] = {item = "black_money", name = "Kroner", amount = {min = 60000, max = 70000}, chance = 1000},
                [2] = {item = "lockpick", name = "Lockpick", amount = {min = 2, max = 4}, chance = 800},
            }
        },
    },
    ["carjack"] = {
        [1] = {
            rewards = {
                [1] = {item = "lockpick", name = "Lockpick", amount = {min = 1, max = 3}, chance = 800},
                [2] = {item = "black_money", name = "Kroner", amount = {min = 40000, max = 50000}, chance = 1000},
            },
        },
    },
    ["carscrap"] = {
        [1] = {
            rewards = {
                [1] = {item = "lockpick", name = "Lockpick", amount = {min = 1, max = 2}, chance = 800},
                [2] = {item = "black_money", name = "Kroner", amount = {min = 10000, max = 15000}, chance = 1000},
            },
        },
    },
}

Debug = function(msg)
    if Config.Debug then
        print("[" .. GetCurrentResourceName() .. "] : " .. msg)
    end
end
