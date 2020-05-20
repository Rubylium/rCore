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
    --'@rFramework/client/callback.lua',
    "client/*.lua",
    "client/player_menu/*.lua",
    "client/bank/*.lua",
    "client/247shops/*.lua",
    "client/facture/*.lua",
    "client/society/*.lua",
    "client/skincreator/*.lua",
    "client/vehicle/*.lua",
    "client/actionMe/*.lua",
    "client/weapons/*.lua",

    -- jobs
    "client/job/mecano/*.lua",
    "client/job/ems/*.lua",

    -- Audio
    "client/API/client/*.lua",
}

exports {
    "ResetDeathStatus",
    "OpenVehicleChest",
    "OpenOrCloseVeh",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    --'@rFramework/server/core/callback.lua',
    "server/*.lua",
    "server/job/*.lua",
    "server/vehicle/*.lua",
    "server/actionMe/*.lua",
}

dependencies {
    'mysql-async',
    'rFramework',
}
