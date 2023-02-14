fx_version "adamant"

game "gta5"

client_scripts {
    "config.lua",
    "client/main.lua",
    "client/wrapper.lua",
}

server_scripts {
    "config.lua",
    "server/main.lua",
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/wrapper.js',
	'html/js/app.js',
}