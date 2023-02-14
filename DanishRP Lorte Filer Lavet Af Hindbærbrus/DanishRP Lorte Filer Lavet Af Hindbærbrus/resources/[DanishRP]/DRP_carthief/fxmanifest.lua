fx_version 'cerulean'
games { 'gta5' }

version '1.0.0'
lua54 'yes'

escrow_ignore {
    'config.lua',  -- Only ignore one file
  }

server_scripts {
    '@es_extended/locale.lua',
	'config.lua',
	'server/main.lua',
	'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua',
	'locales/en.lua'
}

dependency 'es_extended'

server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'
