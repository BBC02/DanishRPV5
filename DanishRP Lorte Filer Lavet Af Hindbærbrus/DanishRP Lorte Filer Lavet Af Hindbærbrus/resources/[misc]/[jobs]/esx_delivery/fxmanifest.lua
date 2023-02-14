fx_version 'cerulean'

game 'gta5'

author 'Luke - https://www.github.com/lukewastakenn'
version '1.0.1'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/EntityZone.lua',
    'config.lua',
    'client/client.lua',
}

server_scripts {
    'config.lua',
    'server/server.lua',
}

server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'