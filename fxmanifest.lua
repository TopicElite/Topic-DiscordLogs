fx_version 'cerulean'
game { 'gta5' }
lua54 'yes'

version '1.0.1'
description 'Commands Logs'  
author 'TopicElite#0070'

escrow_ignore {
    'locales/*.lua',
    'config.lua',
    'README.md',
    'esx_drugs/*',
    'es_extended/*'
}

shared_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'locales/*.lua',
}

server_scripts {
    'server/server.main.lua',
    'server/server.custom.lua',
} 

client_scripts {
    'client/client.main.lua',
}
