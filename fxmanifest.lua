fx_version 'adamant'
games { 'gta5' };

ui_page "client/API/html/index.html"


files {
    "client/API/html/index.html",
    "client/API/html/*.css",
	"client/API/html/scripts/listener.js",
	"client/API/html/scripts/SoundPlayer.js",
    "client/API/html/scripts/functions.js",
    "client/API/html/diplayLogo.js",
    "client/API/html/toastr.min.js",
    "client/API/html/img/*.png",
}

client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",

    "src/client/components/*.lua",

    "src/client/menu/elements/*.lua",

    "src/client/menu/items/*.lua",

    "src/client/menu/panels/*.lua",

    "src/client/menu/windows/*.lua",

}


client_scripts {
    '@rFramework/client/cortana/check.lua',
    "sync/cl_ev.lua",
    "client/utils/*.lua",
    "client/zone/*.lua",
    "shared/*.lua",
    "client/*.lua",
    "client/player_menu/*.lua",
    "client/bank/*.lua",
    "client/247shops/*.lua",
    "client/facture/*.lua",
    "client/society/*.lua",
    "client/call/*.lua",
    "client/activity/*.lua",
    "client/hunger/*.lua",

    -- Skins datas
    "client/skincreator/mask.json",
    "client/skincreator/*.lua",
    
    "client/vehicle/*.lua",
    "client/actionMe/*.lua",
    "client/weapons/*.lua",

    -- jobs
    "client/job/mecano/*.lua",
    "client/job/ems/*.lua",
    "client/job/LSPD/*.lua",
    "client/job/concessionnaire/*.lua",
    "client/job/sheriff/*.lua",
    "client/job/bestbuds/*.lua",
    "client/job/drusillas/*.lua",
    "client/job/crucial/*.lua",
    "client/job/hotdogs/*.lua",

    -- Audio
    "client/API/client/*.lua",
}

exports {
    "ResetDeathStatus",
    "OpenVehicleChest",
    "OpenOrCloseVeh",
    "HaveItem",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    --'@rFramework/server/core/callback.lua',
    "shared/*.lua",
    "server/*.lua",
    "server/job/*.lua",
    "server/vehicle/*.lua",
    "server/actionMe/*.lua",

    "sync/srv_ev_spam.lua",
    "sync/srv_ev.lua",
    "sync/data.lua",
    "sync/stocks.lua",

    "server/staff/*.lua",
}

dependencies {
    'mysql-async',
}
