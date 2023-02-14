resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

lua54        'yes'

ui_page 'html/index.html'

files {
	'html/*.*',
	'html/css/*.*',
	'html/js/*.*'
}

shared_scripts {
	'@ox_lib/init.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/server.lua',
}

client_scripts {
	'client/menu.lua',
	'config.lua',
	'client/client.lua',
}
