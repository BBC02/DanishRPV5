fx_version 'cerulean'
games { 'gta5' }

author 'DanishRP - nig & FuTTiiZ'
description 'SRP Clothing'
version '1.0.0'

ui_page {
    'nui/index.html'
}

shared_scripts {
    "config.lua"
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}

dependencies {
	'input'
}
  
data_file 'TATTOO_SHOP_DLC_FILE' 'shop_tattoo.meta'
data_file 'PED_OVERLAY_FILE' 'srp_overlays.xml'

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
	'shop_tattoo.meta',
	'srp_overlays.xml',
}