fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Dolaji Scripts'
description 'RedM Radial Menu'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/main.lua'
}

ui_page 'index.html'
files {
    'index.html',
}

escrow_ignore {
    'config.lua',
    'README.md',
}

lua54 'yes'