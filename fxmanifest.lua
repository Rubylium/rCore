fx_version 'adamant'
games { 'gta5' };

ui_page "client/API/html/index.html"

files {
	"client/API/html/index.html",
	"client/API/html/scripts/listener.js",
	"client/API/html/scripts/SoundPlayer.js",
	"client/API/html/scripts/functions.js",
}


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",

    "src/components/*.lua",

    "src/menu/elements/*.lua",

    "src/menu/items/*.lua",

    "src/menu/panels/*.lua",

    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}


client_scripts {
    "client/*.lua",
    "client/player_menu/*.lua",
    "client/bank/*.lua",
    "client/247shops/*.lua",
    "client/facture/*.lua",
    "client/society/*.lua",
    "client/skincreator/*.lua",
    "client/vehicle/*.lua",

    -- jobs
    "client/mecano/*.lua",

    -- Audio
	"client/API/client/*.lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/*.lua",
    "server/job/*.lua",
    "server/vehicle/*.lua",
}

dependencies {
	'mysql-async'
}
