fx_version 'cerulean'
games { 'gta5' }

author 'DanishRP - BenZoN & Stausi'
description 'DRP Teams'
version '1.0.0'

ui_page {
    'nui/index.html'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}

shared_scripts {
    "config.lua"
}

dependencies {
	'input'
}

files {
    'nui/index.html',
    'nui/css/*.css',
    'nui/font/*.ttf',
    'nui/*.css',
    'nui/js/*.js',
    'nui/js/*.js.map',
    'nui/img/*.png',
    'nui/img/*.jpg',
    'nui/img/*.gif',
}
