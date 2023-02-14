fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Sell man'
author 'Grisen'
version '3.1.0'

escrow_ignore {
    'config.lua'
}

server_scripts {
    'server.lua',
    'config.lua'
}

client_scripts {
    'client/*',
    'config.lua'
}