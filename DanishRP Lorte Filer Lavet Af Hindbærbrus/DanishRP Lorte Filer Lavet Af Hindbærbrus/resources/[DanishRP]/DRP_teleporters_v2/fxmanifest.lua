fx_version 'adamant'

game 'gta5'

client_scripts {
	'config.lua',
	'client/ipl.lua',
	'client/qtarget.lua',
	'client/main.lua'
}

server_scripts {
	'@pmc-instance/instance.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'
