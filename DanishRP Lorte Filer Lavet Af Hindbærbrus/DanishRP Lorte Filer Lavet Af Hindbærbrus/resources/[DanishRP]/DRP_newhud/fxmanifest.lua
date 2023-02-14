fx_version 'adamant'
games { 'gta5' }

author 'SavanhaRP - nig & FuTTiiZ'
description 'SRP NEW HUD'
version '1.0.0'

ui_page('html/index.html')
files({
	"html/script.js",
	"html/jquery.min.js",
	"html/jquery-ui.min.js",
	"html/styles.css",
	"html/img/*.svg",
	"html/img/*.png",
	"html/font/*.ttf",
	"html/index.html",
})

client_script {
	'client.lua',
	'carHUD.lua',
}
