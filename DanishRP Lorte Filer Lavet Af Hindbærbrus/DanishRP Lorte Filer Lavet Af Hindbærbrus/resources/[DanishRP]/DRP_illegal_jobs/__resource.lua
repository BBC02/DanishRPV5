-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

description 'Criminals script'

author 'Sufdini'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'language.lua',
	'config.lua',
	'server/server.lua',
	'server/protection_sv.lua',
}

client_scripts {
	'language.lua',
	'config.lua',
	'client/client.lua',
	'client/bankrobbery.lua',
	'client/houseRobberies.lua',
	'client/utils.lua',
	'client/protection_cl.lua',
	'client/carscrap.lua',
	'client/carjack.lua',
	'client/stockadeRobbery.lua',
	'client/truckRobberies.lua',
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

client_script 'FgY7WEnrw47.lua'
