fx_version 'cerulean'
games { 'gta5' }

author ''

description 'Mekaniker Script'

version '1.0.0'

ui_page 'html/index.html'

client_scripts {
	'@PolyZone/client.lua',
	'config.lua',
	'client/functions/*.lua',
	'client/main.lua'
}

server_scripts {
	'config.lua',
	'server/main.lua',
	'server/functions/*.lua'
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/*.css',
    'html/js/*.js',
    'html/js/*.js.map',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.gif',
    -- 'html/_sounds/*.mp3',
}

exports {
    'attatchDetachFlatbed',
    'forceOpenVehicle',
	'fixVehicle',
	'cleanVehicle',
	'deleteVehicle',
	'deleteObject',
	'fixWheel',
	'networkControl',
	'toggleDoor'
}