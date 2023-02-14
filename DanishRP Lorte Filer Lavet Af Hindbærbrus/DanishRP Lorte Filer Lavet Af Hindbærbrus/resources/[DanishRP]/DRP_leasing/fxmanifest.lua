fx_version 'adamant'
game 'gta5'


version '1.2.0'

lua54 'yes'

client_script {

    '@PolyZone/client.lua',
    "config.lua",
    "client/main.lua",
  }
  
server_script {
  "@mysql-async/lib/MySQL.lua",
  "config.lua",
  "server/main.lua",
}

escrow_ignore {
    'config.lua',  -- Only ignore one file
    'README.txt'
  }