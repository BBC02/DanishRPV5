fx_version 'adamant'
games { 'gta5' }

author 'DanishRP - FuTTiiZ'
description 'SRP Ulovlige Aktiviteter'
version '1.0.0'

ui_page {
    'dist/index.html'
}

client_scripts {
    '@PolyZone/client.lua',
    'config.lua',
    'client/main.lua',
    'client/illegalActivity.lua',
    'client/weaponShop.lua',
    'client/utils.lua',
    'client/minigames/*.lua',
    'client/jobs/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
    'server/weaponShop.lua',
    'server/utils.lua',
    'server/jobs/*.lua',
}

escrow_ignore {
    'config.lua',
}

files {
    'dist/index.html',
    'dist/css/*.css',
    'dist/font/*.ttf',
    'dist/*.css',
    'dist/js/*.js',
    'dist/js/*.js.map',
    'dist/img/*.png',
    'dist/img/*.jpg',
    'dist/img/*.gif',
    'dist/bck/*.png',
    'dist/bck/*.jpg',
    'dist/bck/*.gif',
    'dist/voltlab/*.png',
    'dist/voltlab/*.jpg',
    'dist/voltlab/*.gif',
}
