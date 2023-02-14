fx_version      'adamant'
game            'gta5'

description 'ESX Skin'

version '1.0.1'

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/*.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'locales/*.lua',
	'client/main.lua'
}
