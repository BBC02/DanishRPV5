fx_version 'adamant'

game 'gta5'

ui_page 'html/lockpick.html'

server_scripts{
    'server/main.lua',
    'server/callback.lua',
    'server/functions/*.lua',
    'server/functions/*.js',
    'server/functions/features/*.lua'
}

client_scripts{
    'client/main.lua',
    'client/callback.lua',
    'client/functions/*.lua',
    'client/functions/*.js'
}

files{
    'html/barrel.png',
    'html/bullet.png',
    'html/lockpick.html',
    'html/lockpick.png',
    'import.lua'
}
