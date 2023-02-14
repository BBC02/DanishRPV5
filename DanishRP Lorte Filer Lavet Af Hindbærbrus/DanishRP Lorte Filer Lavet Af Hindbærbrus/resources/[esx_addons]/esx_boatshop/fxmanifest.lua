fx_version 'adamant'

game 'gta5'

description 'ESX Vehicle Shop'

version '1.1.0'

server_scripts {
    '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/utils.lua',
	'client/main.lua',
    'client/demo.lua'
}

dependency 'es_extended'

export 'GeneratePlate'
export 'IsPlateTaken'
