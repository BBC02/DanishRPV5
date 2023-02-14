--------------------------------
------- Created by Lund -------
-------------------------------- 

Config = {

	MarkerSprite = 27, -- drawmarker https://docs.fivem.net/docs/game-references/markers/
	MarkerColor = {250, 0, 0}, -- hex farven på drawmarkeren
	MarkerSize = 1.1, -- størelsen på drawmarkeren
	
	BossMenuL = {
	
		{coords = vector3(4488.53457641602,-9783.14971923828,80.689594268799), job = "police"}
	
		--EXAMPLE
		-- {coords = vector3(coords), job = "rank"} -- husk , efter ellers duer det ikke
	},
	
	
	BossMenuU = {
		['boss'] = {canWithdraw = true, canDeposit = true, canHire = true, canRank = true, canFire = true}, -- skift til false / true hvis du vil disabel noget eller fjerne noget, (false) fjerner, (true) tilføjer 
	},
	
	
	-- texten til SendTextMessage
	
	Text = {
		['promoted'] = 'Du er blevet forfremmet',
		['promoted_other'] = 'Du er blevet forfremmet til et andet job!',
		['fired'] = 'Du er blevet fyret',
		['fired_other'] = 'Du er blevet fyret',
		['hired'] = 'Du er blevet ansat',
		['bossmenu_hologram'] = '[~r~E~w~] Åbn Boss Menu',
		['action_success'] = 'Handling vellykket',
		['action_unsuccessful'] = 'Handling mislykket',
		['cant_access_bossmenu'] = 'Du kan ikke få adgang til bossmenuen',
		['insufficent_balance'] = 'Insufficent balance',
	
	}
	}
	
	-- skift ved egen sikkerhed -- hjælper ikke hvis du fucker noget op, og ikke ved hvordan du fixer det efter
	function SendTextMessage()
	
			
			
            ESX.ShowNotification(msg)
			
	
			--EXAMPLE 
			--exports['mythic_notify']:SendAlert('error', msg)
	
	end

	Config.DiscordWebHook = {
		Webhook = "https://discord.com/api/webhooks/974393360217432094/qf-sDh6Ufw2n8fQfsMwLZS4yRtACmkxde9NWnsQncvp0nupGnwtx8l2WJl0hAaCKaK-S", -- discord webhook 
		Color = "4355573", -- skal være Decimal nummer - tag farven her fra https://convertingcolors.com/hex-color-4275F5.html?search=4275f5
		Head = "Lund",
	
		SetRank = { 
			Forfremet = "Er lige blevet forfremet",
			HasSetRank = "har lige forfremet en anden spiller",
		},

		Fire = { 
			HasFire = "Er lige blevet forfremet",
			HasBinFired = "har lige Fyret en Anden fra",
		},
 
		Hire = { 
			HiredANew = "har lige Andsat en ny til ",
		},

	}
