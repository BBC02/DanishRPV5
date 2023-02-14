Config = {

	MaxJobs = 7, -- Maximum amount of jobs avalable for every player (Only applies to jobs that are auto savable)
	AllowAutoJobSavining = true, -- When the script detects a new job it will add it to your jobs Ex. You get police job and it saves that job (if maximum not reached) to your job list
	
	OpenJobUIKey = '', -- The key used to open the UI (Leave blank if you do not want to use key)
	OpenJobUICommand = '', -- Command used to open the UI (MUST NOT BE BLANK!!)
	
	--Set up blip info (https://docs.fivem.net/docs/game-references/blips/)
	--BLIPS FOR MANAGEMENT LOCATIONS
	BlipSprite = 457,
	BlipColor = 3,
	BlipText = 'Job Managment',
	
	--BLIPS FOR JOB CENTERS
	BlipCenterSprite = 498,
	BlipCenterColor = 3,
	BlipCenterText = 'Job Center',
	
	MarkerSprite = 27,
	MarkerColor = {66, 135, 245},
	MarkerSize = 1.5,
	
	LocationsJobCenters = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
		--{coords = vector3(-261.82537841797,-965.21392822266,31.22407531738), blip = true}
	},
	
	
	LocationsToChangeJobs = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
		--{coords = vector3(-267.58975219727,-958.55718994141,31.22312927246), blip = false},
		--{coords = vector3(-1559.0853,-571.0024,108.5230), blip = false},
		--{coords = vector3(466.12969970703,-1021.2487792969,28.086708068848), blip = false},
		--{coords = vector3(290.0437,-1165.4377,29.3023), blip = false},
		--{coords = vector3(-30.9427,-1109.7432,26.4223), blip = false},
		--{coords = vector3(-311.0972, -136.3757, 39.0095), blip = false},
		--{coords = vector3(544.0761, -200.9284, 54.4932), blip = false},
		--{coords = vector3(-802.3531, -200.5452, 37.1501), blip = false},
	},
	
	OffdutyForEveryone = false, -- Everyone can go into offduty job
	JobsThatCanUseOffduty = { -- Jobs that can use offduty if option above is false
		'police',
		'ambulance',
		'cardealer',
		'sjlaw',
		'lsc',
		'realestateagent',
		'revisor',
		'redline',
		'mecano',
		'g4s'
	},
	
	DefaultJobsInJobCenter = { -- Jobs that can be added by going to the job center. For icons use https://fontawesome.com/
		
		{job = 'garbage', label = "Skraldemand", icon = "fas fa-trash", description = "Du samler skrald ind, måske er du heldig og finde noget?"},
		{job = 'mail', label = "Postnord", icon = "fas fa-envelope", description = "Kan du levere posten hurtigere end de andre?"},
		{job = 'taxi', label = "Taxa", icon = "fas fa-taxi", description = "Fragt folk frem og tilbage, de mangler dig!"},
	
	},
	
	DefaultJobs = { -- Jobs that will be added in menu by default and wont be removable
		
		{job = 'unemployed', grade = 0}
	},
	
	Text = {
	
		['cant_offduty'] = 'Du kan ikke gå af arbejde!',
		['open_ui_hologram'] = '[~b~E~w~] Åben Job muligheder',
		['open_jobcenter_ui_hologram'] = '[~b~E~w~] Åben Job Center',
		['wrong_usage'] = 'Forkert command',
		['job_added'] = 'Job tilføjet!'
	
	}
		
	
	}
	
	-- Only change if you know what are you doing!
	function SendTextMessage(msg)
	
			SetNotificationTextEntry('STRING')
			AddTextComponentString(msg)
			DrawNotification(0,1)
	
			--EXAMPLE USED IN VIDEO
			--exports['mythic_notify']:SendAlert('error', msg)
	
	end