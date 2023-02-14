fx_version 'adamant'

game 'gta5'

description 'Lel'

version 'legacy'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua',
	'config.lua',
	'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua',
	'locales/en.lua'
}

dependencies {
	'es_extended',
	
}