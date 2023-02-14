fx_version 'adamant'
lua54 'yes'
game 'gta5'

author 'HHFW' -- Discord: https://discord.gg/s7fcdW5adR
description 'hh_cmd'
version '2.0'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'config.lua',
	'client/client.lua',
	'client/utils.lua'
}

dependency 'es_extended'