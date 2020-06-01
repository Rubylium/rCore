
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
}



Citizen.CreateThread(function()
    for k,v in pairs(blips) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, v.icon)
        SetBlipScale(blip, v.size)
        SetBlipColour(blip, v.color)
        SetBlipAsShortRange(blip, true)

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