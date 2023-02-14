--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'drpv2_lib'
author       'Linden'
version      '2.7.0'
license      'LGPL-3.0-or-later'
repository   'https://github.com/overextended/ox_lib'
description  'A library of shared functions to utilise in other resources.'

--[[ Manifest ]]--
dependencies {
	'/server:5104',
    '/onesync',
}

files {
    'init.lua',
}

shared_script 'resource/main.lua'

client_scripts {
    'resource/**/client.lua',
    'resource/**/client/*.lua'
}

