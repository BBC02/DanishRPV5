return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		}
	},

	['oxygen_mask'] = {
		label = 'oxygen mask',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hammer'] = {
		label = 'hammer',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 500000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Vand',
		weight = 500,
		client = {
			status = { thirst = 500000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Du drak en vand'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Skudsikker Vest',
		weight = 25000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['accesscard'] = {
		label = 'access card',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['akkasse'] = {
		label = 'ak-47 kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['alive_chicken'] = {
		label = 'living chicken',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['ammo'] = {
		label = 'skud',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['blowpipe'] = {
		label = 'blowtorch',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['bracelet'] = {
		label = 'bracelet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['bread'] = {
		label = 'bread',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cannabis'] = {
		label = 'cannabis',
		weight = 0.3,
		stack = true,
		close = true,
		description = nil
	},

	['carokit'] = {
		label = 'body kit',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['carotool'] = {
		label = 'tools',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['cheapwatch'] = {
		label = 'cheap watch',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['clip_box'] = {
		label = 'box clip',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['clip_drum'] = {
		label = 'drum clip',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['clip_extended'] = {
		label = 'Udviget Magasin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['clothe'] = {
		label = 'cloth',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cocaine_cut'] = {
		label = 'cut cocaine',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cocaine_packaged'] = {
		label = 'packaged cocaine',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cocaine_uncut'] = {
		label = 'uncut cocaine',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['coca_leaf'] = {
		label = 'kokainblade',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['coke'] = {
		label = 'kokain',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['coke_packed'] = {
		label = 'pakket kokain',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['copper'] = {
		label = 'copper',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cutted_wood'] = {
		label = 'cut wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cut_money'] = {
		label = 'counterfeit cash - cut',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['dbkasse'] = {
		label = 'double shotgun kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['deaglekasse'] = {
		label = 'deagle kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['diamond'] = {
		label = 'diamond',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['drill'] = {
		label = 'drill',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['essence'] = {
		label = 'gas',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fabric'] = {
		label = 'fabric',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fish'] = {
		label = 'fish',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fixkit'] = {
		label = 'repair kit',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['fixtool'] = {
		label = 'repair tools',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['flashlight'] = {
		label = 'Våben Lygte',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['foundwallet'] = {
		label = 'wallet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['gazbottle'] = {
		label = 'gas bottle',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['gold'] = {
		label = 'gold',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['goldbar'] = {
		label = 'gold bar',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['goldwatch'] = {
		label = 'gold watch',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['grip'] = {
		label = 'grip',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['gusenbergkasse'] = {
		label = 'gusenberg kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hackerdevice'] = {
		label = 'hacker device',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hacking_laptop'] = {
		label = 'hacking laptop',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hammerwirecutter'] = {
		label = 'hammer and wire cutter',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['heroin'] = {
		label = 'kanyler',
		weight = 0.3,
		stack = true,
		close = true,
		description = nil
	},

	['heroin_packed'] = {
		label = 'pakket heroin',
		weight = 0.3,
		stack = true,
		close = true,
		description = nil
	},

	['housepick'] = {
		label = 'lockpick',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['iron'] = {
		label = 'iron',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['keys_master_key'] = {
		label = 'master key',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['keys_master_key_single_use'] = {
		label = 'master key (single use)',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['keys_missionrow_pd_front'] = {
		label = 'mission row pd key (front)',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['lockpickv2'] = {
		label = 'lockpick (v2)',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['luxary_finish'] = {
		label = 'luxary finish',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['marijuana'] = {
		label = 'marijuana',
		weight = 0.3,
		stack = true,
		close = true,
		description = nil
	},

	['medikit'] = {
		label = 'medikit',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['mensboxers'] = {
		label = 'mens boxers',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['meth'] = {
		label = 'meth',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['meth_packaged'] = {
		label = 'packaged meth',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['meth_raw'] = {
		label = 'raw meth',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['mobilephone'] = {
		label = 'mobile phone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['necklace'] = {
		label = 'necklace',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_chicken'] = {
		label = 'chicken fillet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_plank'] = {
		label = 'packaged wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['painkillers'] = {
		label = 'painkillers',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol'] = {
		label = 'oil',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol_raffin'] = {
		label = 'processed oil',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pistolkasse'] = {
		label = '9mm kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['poppyresin'] = {
		label = 'valmuer',
		weight = 0.3,
		stack = true,
		close = true,
		description = nil
	},

	['pumpkasse'] = {
		label = 'pump kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rarebook'] = {
		label = 'rare book',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rarecoin'] = {
		label = 'rare coin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['revolverkasse'] = {
		label = 'revolver kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rolexwatch'] = {
		label = 'rolex watch',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['sawedoffkasse'] = {
		label = 'sawedoff shotgun kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['scope'] = {
		label = 'Sigte',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['scope_advanced'] = {
		label = 'advanced scope',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['scorpionkasse'] = {
		label = 'scorpion kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['bulletproofvest'] = {
		label = 'skudsikkervest (100%)',
		weight = 20000,
		stack = true,
		close = true,
		description = nil
	},

	['bulletproofvest_25'] = {
		label = 'skudsikkervest (25%)',
		weight = 5000,
		stack = true,
		close = true,
		description = nil
	},

	['bulletproofvest_50'] = {
		label = 'skudsikkervest (50%)',
		weight = 10000,
		stack = true,
		close = true,
		description = nil
	},

	['bulletproofvest_75'] = {
		label = 'skudsikkervest (75%)',
		weight = 15000,
		stack = true,
		close = true,
		description = nil
	},

	['slaughtered_chicken'] = {
		label = 'slaughtered chicken',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['snskasse'] = {
		label = 'sns kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['sorted_money'] = {
		label = 'counterfeit cash - sorted',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['stone'] = {
		label = 'stone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['suppressor'] = {
		label = 'Lyddæmper',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['tablet'] = {
		label = 'tablet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['teckasse'] = {
		label = 'tec-9 kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['thermite'] = {
		label = 'thermite',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['uzikasse'] = {
		label = 'uzi kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['vintagekasse'] = {
		label = 'vintage kasse',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['washed_stone'] = {
		label = 'washed stone',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_autoshotgun'] = {
		label = 'auto shotgun',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_compactlauncher'] = {
		label = 'compact launcher',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_digiscanner'] = {
		label = 'digiscanner',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_garbagebag'] = {
		label = 'garbage bag',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_railgun'] = {
		label = 'rail gun',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_grenadelauncher'] = {
		label = 'gernade launcher',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_handcuffs'] = {
		label = 'handcuffs',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_hominglauncher'] = {
		label = 'homing launcher',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_stinger'] = {
		label = 'stinger',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_minigun'] = {
		label = 'minigun',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weddingring'] = {
		label = 'wedding ring',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weed'] = {
		label = 'weed',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['weed_packaged'] = {
		label = 'packaged weed',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weed_untrimmed'] = {
		label = 'untrimmed weed',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['womanspants'] = {
		label = 'womans pants',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wood'] = {
		label = 'wood',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wool'] = {
		label = 'wool',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['yusuf'] = {
		label = 'weapon skin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['ziptie'] = {
		label = 'strips',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_rpg'] = {
		label = 'rpg',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['microsmg'] = {
		label = 'micro smg kasse',
		weight = 7500,
		stack = true,
		close = true,
		description = nil
	},

	['mini'] = {
		label = 'micro smg kasse',
		weight = 7500,
		stack = true,
		close = true,
		description = nil
	},

	['minismg'] = {
		label = 'scorpion kasse',
		weight = 7500,
		stack = true,
		close = true,
		description = nil
	},

	['tec'] = {
		label = 'tec-9 kasse',
		weight = 6000,
		stack = true,
		close = true,
		description = nil
	},

	['vintage'] = {
		label = 'vintage pistol kasse',
		weight = 5000,
		stack = true,
		close = true,
		description = nil
	},

	['revolver'] = {
		label = 'revolver kasse',
		weight = 8000,
		stack = true,
		close = true,
		description = nil
	},

	['deagle'] = {
		label = 'pistol 50. kasse',
		weight = 7500,
		stack = true,
		close = true,
		description = nil
	},

	['ak'] = {
		label = 'ak-47 kasse',
		weight = 10000,
		stack = true,
		close = true,
		description = nil
	},

	['pistol'] = {
		label = 'pistol 9mm kasse',
		weight = 5000,
		stack = true,
		close = true,
		description = nil
	},

	['diamant'] = {
		label = 'diamant',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['skrabelod'] = {
		label = 'skrabelod',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['outfitbag'] = {
		label = 'outfit bag',
		weight = 4,
		stack = true,
		close = true,
		description = nil
	},

	['svampe'] = {
		label = 'svampe',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['guldkaede'] = {
		label = 'guldkæde',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['guldring'] = {
		label = 'guldring',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['gucci'] = {
		label = 'gucci',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['c4'] = {
		label = 'c4',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rolex'] = {
		label = 'rolex',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['skudsikkervest100'] = {
		label = 'skudsikkervest (100%)',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['skudsikkervest25'] = {
		label = 'skudsikkervest (25%)',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['skudsikkervest50'] = {
		label = 'skudsikkervest (50%)',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['skudsikkervest75'] = {
		label = 'skudsikkervest (75%)',
		weight = 0,
		stack = true,
		close = true,
		description = nil
	},

	['black_phone'] = {
		label = 'black phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['blue_phone'] = {
		label = 'blue phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['classic_phone'] = {
		label = 'classic phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_black_phone'] = {
		label = 'wet black phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_blue_phone'] = {
		label = 'wet blue phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_classic_phone'] = {
		label = 'wet classic phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_gold_phone'] = {
		label = 'wet gold phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_greenlight_phone'] = {
		label = 'wet green light phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_green_phone'] = {
		label = 'wet green phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['phone_module'] = {
		label = 'phone module',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_purple_phone'] = {
		label = 'wet purple phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_red_phone'] = {
		label = 'wet red phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_white_phone'] = {
		label = 'wet white phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['white_phone'] = {
		label = 'white phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['purple_phone'] = {
		label = 'purple phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['red_phone'] = {
		label = 'red phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['gold_phone'] = {
		label = 'gold phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['greenlight_phone'] = {
		label = 'green light phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['green_phone'] = {
		label = 'green phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['wet_pink_phone'] = {
		label = 'wet pink phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['pink_phone'] = {
		label = 'pink phone',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['phone_hack'] = {
		label = 'phone hack',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},
}