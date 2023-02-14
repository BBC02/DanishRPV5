fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'jaymenu.lua',
	'config.lua',
	'client.lua',
	'cynatic_overlays.xml',
	'shop_tatto.meta'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

file 'AllTattoos.json'
