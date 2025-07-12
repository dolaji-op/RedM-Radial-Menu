fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'BLN Scripts'
description 'Native Wheel Menu for RedM'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/dataview.lua',
    'client/main.lua'
}

ui_page 'index.html'
files {
    'index.html',
}

lua54 'yes'