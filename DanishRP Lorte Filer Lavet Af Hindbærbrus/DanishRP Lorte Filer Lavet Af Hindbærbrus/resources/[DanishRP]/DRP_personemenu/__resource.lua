resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_scripts {
	'@NativeUI/NativeUI.lua',

	'config.lua',
    'gui.lua',
    'menu.lua',
    'livery.lua',
    'extra.lua',
    'functions.lua',
    'en.lua',
    'handsup.lua',
    'test.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'server.lua'
}