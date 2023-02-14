fx_version 'cerulean'
game 'gta5'

description 'Drugsystem til Getix'
author 'Grisen'
version '3.1.0'

server_scripts {
    'server.lua',
    'config.lua'
}

client_scripts {
    'client/*',
    'config.lua'
}
client_script "@esx_drugmoney/acloader.lua"