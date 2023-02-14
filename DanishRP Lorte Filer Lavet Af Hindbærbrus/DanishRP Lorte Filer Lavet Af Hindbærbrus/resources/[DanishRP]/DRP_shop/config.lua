Config = {}

-- Change menu alignment
Config.MenuAlign = "top-left"

-- Change items that can be sold at the Shop, the number behind = is the price
Config.ShopItems = {
	blueberry = 1000,
	strawberry = 2000,
	blackberry = 6000,
	-- { name = 'transporter_scheme', chance = 2, min = 1, max = 1 },
    -- { name = 'lockpick', chance = 32, min = 1, max = 1 },
    -- { name = 'painting_1', chance = 70, min = 1, max = 1 },
    -- { name = 'painting_2', chance = 60, min = 1, max = 1 },
    -- { name = 'painting_3', chance = 50, min = 1, max = 1 },
    -- { name = 'painting_4', chance = 40, min = 1, max = 1 },
    -- { name = 'ring', chance = 25, min = 1, max = 1 },
    -- { name = 'ring_deluxe', chance = 10, min = 1, max = 1 },
    -- { name = 'watch', chance = 20, min = 1, max = 1 },
    -- { name = 'necklace', chance = 20, min = 1, max = 1 },
    -- { name = 'necklace_deluxe', chance = 10, min = 1, max = 1 },
    -- { name = 'gold_bar', chance = 16, min = 1, max = 1 },
    -- { name = 'dia_box', chance = 15, min = 1, max = 1 },
    -- { name = 'money', chance = 45, min = 1000, max = 10000 },
    -- { name = 'phone', chance = 80, min = 1, max = 1 },
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.ShopLocation =  {x = -268.03, y = 235.14, z = 90.57}

-- Shop blip
Config.ShopBlipText = "Shop - Sælg hæglerivare"
Config.ShopBlipColor = 2
Config.ShopBlipSprite = 272

-- Opening hours
Config.EnableOpeningHours = false -- Enable opening hours? If disabled you can always open the Shop.
Config.OpenHour = 9 -- From what hour should the Shop be open?
Config.CloseHour = 18 -- From what hour should the Shop be closed?