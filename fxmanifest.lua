fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

description 'egl_stuck'
author 'Eagle'
version '1.0.0'

shared_scripts {
    'locales/*.lua',
    'config.lua',
}

client_scripts {
    'locales/fr.lua',
    'locales/en.lua',
    'config.lua',
    'client.lua',
}

server_scripts {
    'locales/fr.lua',
    'locales/en.lua',
    'config.lua',
    'server.lua',
}