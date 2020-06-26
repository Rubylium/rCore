
global_blips = {}
local blips = {
    {
        name = "Banque central",
        icon = 500,
        size = 0.65,
        color = 43,
        pos = vector3(230.9, 214.5, 105.8),
        sub = {
            title = "Banque Central",
            text = "Besoin d'ouvrir un compte bancaire ou de récupérer sa carte ? C'est ici que ça se passe.",
            infuence = "~r~Puissante",
        },
    },
    {
        name = "Sprit Sides West",
        icon = 409,
        size = 0.55,
        color = 75,
        pos = vector3(-429.6, 252.98, 82.0),
        sub = {
            title = "Sprit Sides West - Comedy club",
            text = "Besoin d'une salle pour un soir où juste envie de venir rigoler un coup dans une ambiance qui vous fera oublié la réalité ? Sprit side West est l'endroit pour vous! Attention, tenu correct exigé.",
            infuence = "~e~Faible",
        },
    },
    {
        name = "Bean Machine",
        icon = 128,
        size = 0.55,
        color = 21,
        pos = vector3(-625.54, 236.03, 81.88),
        sub = {
            title = "Bean Machine - Café",
            text = "L'équivalent du célèbre Starbucks, Beam Machine vous propose un espace de détente agréable et des boissons pour vous faire oublier votre journée de travail.",
            infuence = "~b~Moyenne",
        },
    },
    {
        name = "Haters",
        icon = 590,
        size = 0.55,
        color = 47,
        pos = vector3(-1122.4, -1440.1, 5.2),
        sub = {
            title = "Haters - Accessoire",
            text = "Haters, le meilleur magasin d'accessoire branché de LS. Envie d'un masque, lunette, casquette ? Viens chez Haters!",
            infuence = "~b~Moyenne",
        },
    },
    {
        name = "Drusilla's",
        icon = 128,
        size = 0.55,
        color = 2,
        pos = vector3(280.6, -973.9, 29.8),
        sub = {
            title = "Drusilla's - Resto",
            text = "Drusilla's c'est avant tout de la cuisine italienne ! Envie de manger des plats typiques d'Italie ? Ne cherchez pas plus loin!",
            infuence = "~b~Moyenne",
        },
    },
    {
        name = "Crucial Fix",
        icon = 128,
        size = 0.55,
        color = 47,
        pos = vector3(271.19, -827.5, 29.4),
        sub = {
            title = "Crucial Fix - Resto",
            text = "Crucial Fix est un petit resto pour se prendre un café / sandwich tranquillement.",
            infuence = "~b~Moyenne",
        },
    },
    {
        name = "LS Medical Center",
        icon = 113,
        size = 0.55,
        color = 2,
        pos = vector3(342.2, -1397.6, 32.50),
        sub = {
            title = "LS Medical Center",
            text = "le LS-MC est un bâtiment d'état servant d'hôpital, si vous avez une blessure c'est ici qu'il faut se rendre !",
            infuence = "~b~Moyenne",
        },
    },
    {
        name = "LS Customs",
        icon = 446,
        size = 0.55,
        color = 70,
        pos = vector3(-90.2, -1805.3, 26.8),
        sub = {
            title = "LS Customs",
            text = "Los Santos Customs, l'endroit pour tuner et réparer t'es caisse !",
            infuence = "~o~Forte",
        },
    },
    {
        name = "Serrurier",
        icon = 186,
        size = 0.45,
        color = 47,
        pos = vector3(-55.5468, 67.99, 71.94),
        sub = nil,
    },
    {
        name = "BC Hunting",
        icon = 141,
        size = 0.55,
        color = 1,
        pos = vector3(-1492.906, 4981.843, 62.7697),
        sub = {
            title = "BC Hunting",
            text = "BC Hunting, envie de chasser du gibier ? C'est ici!",
            infuence = "~o~Moyenne",
        },
    },
    {
        name = "LS Boxing",
        icon = 311,
        size = 0.55,
        color = 26,
        pos = vector3(-45.2563, -1288.039, 29.20022),
        sub = {
            title = "LS Boxing",
            text = "LS Boxing, envie de faire du sport ? C'est ici!",
            infuence = "~o~Faible",
        },
    },
    {
        name = "LS Sports",
        icon = 311,
        size = 0.55,
        color = 26,
        pos = vector3(-1202.162, -1566.84, 4.611064),
        sub = nil
    },

    {
        name = "Hopital - Sandy Shores",
        icon = 105,
        size = 0.55,
        color = 22,
        pos = vector3(1838.333, 3673.234, 34.27672),
        sub = nil
    },

    {
        name = "BCSO - Sandy Shores",
        icon = 60,
        size = 0.55,
        color = 16,
        pos = vector3(1855.319, 3683.259, 34.2677),
        sub = nil
    },

    {
        name = "BCSO - Paleto Bae",
        icon = 60,
        size = 0.55,
        color = 16,
        pos = vector3(-437.698, 6018.625, 31.49011),
        sub = nil
    },


    {
        name = "Pioneers - Radio / Studio",
        icon = 136,
        size = 0.55,
        color = 22,
        pos = vector3(733.1663, 2523.786, 73.22391),
        sub = nil
    },

    {
        name = "Mine",
        icon = 318,
        size = 0.55,
        color = 81,
        pos = vector3(2964.189, 2754.525, 43.26157),
        sub = nil
    },

    {
        name = "BestBuds - WeedShop",
        icon = 140,
        size = 0.55,
        color = 2,
        pos = vector3(378.6788, -833.3737, 29.29167),
        sub = nil
    },

    {
        name = "LSPD - Central Vespucci",
        icon = 60,
        size = 0.55,
        color = 26,
        pos = vector3(-1089.879, -832.0179, 10.66909),
        sub = nil
    },

    {
        name = "Fédéral",
        icon = 189,
        size = 0.55,
        color = 13,
        pos = vector3(1846.169, 2586.78, 45.67201),
        sub = nil
    },

    {
        name = "LS - Livraison",
        icon = 616,
        size = 0.55,
        color = 13,
        pos = vector3(-290.038, -2661.688, 6.15907),
        sub = nil
    },

    {
        name = "BC - Stocks",
        icon = 616,
        size = 0.55,
        color = 13,
        pos = vector3(2689.816, 3461.326, 56.2292),
        sub = nil
    },

    {
        name = "Concessionnaire",
        icon = 225,
        size = 0.55,
        color = 13,
        pos = vector3(-70.64532, 61.85994, 71.88428),
        sub = nil
    },

    {
        name = "Chihuahua HotDogs",
        icon = 128,
        size = 0.55,
        color = 51,
        pos = vector3(46.72568, -999.01, 29.34878),
        sub = {
            title = "Chihuahua HotDogs",
            text = "Chihuahua HotDogs, c'est avant tout un fast fast-food avec bonne ambiance depuis '82 ! ",
            infuence = "~o~Faible",
        },
    },

    {
        name = "Auto-école",
        icon = 225,
        size = 0.50,
        color = 13,
        pos = vector3(-228.7958, -1379.18, 31.22428),
        sub = nil
    },

    {
        name = "Fourrière",
        icon = 642,
        size = 0.50,
        color = 47,
        pos = vector3(487.227, -1309.152, 29.25486),
        sub = nil
    },
    {
        name = "Fourrière",
        icon = 642,
        size = 0.50,
        color = 47,
        pos = vector3(1645.304, 3807.474, 35.27508),
        sub = nil
    },
    {
        name = "Fourrière",
        icon = 642,
        size = 0.50,
        color = 47,
        pos = vector3(-198.9714, 6267.282, 32.40396),
        sub = nil
    },

    {
        name = "Chantier",
        icon = 478,
        size = 0.50,
        color = 81,
        pos = vector3(84.73204, -390.227, 41.06246),
        sub = nil
    },
    
}



Citizen.CreateThread(function()
    for k,v in pairs(blips) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, v.icon)
        SetBlipScale(blip, v.size)
        SetBlipColour(blip, v.color)
        SetBlipAsShortRange(blip, true)
        SetBlipCategory(blip, 8)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
        if v.sub ~= nil then
            exports.rui:SetBlipInfoTitle(blip, v.sub.title, false)
            exports.rui:AddBlipInfoName(blip, "Influence", v.sub.infuence)
            exports.rui:AddBlipInfoHeader(blip, "")
            exports.rui:AddBlipInfoText(blip, v.sub.text)
        end
        table.insert(global_blips, blip)
    end
end)