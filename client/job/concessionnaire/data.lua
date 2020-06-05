function LoadConcessData()
    local vehicle = {
        {
            nom = "Compacts",
            vehs = {
                {vehs= "blista", prix=3000},
                {vehs= "brioso", prix=3000},
                {vehs= "dilettante", prix=3000},
                {vehs= "issi2", prix=3000},
                {vehs= "issi3", prix=3000},
                {vehs= "issi4", prix=3000},
                {vehs= "issi5", prix=3000},
                {vehs= "issi6", prix=3000},
                {vehs= "panto", prix=2000},
                {vehs= "prairie", prix=3000},
                {vehs= "rhapsody", prix=3000},
            },
        },
        {
            nom = "Coupes",
            vehs = {
                {vehs= "cogcabrio", prix=4000},
                {vehs= "exemplar", prix=4000},
                {vehs= "f620", prix=4000},
                {vehs= "felon", prix=4000},
                {vehs= "felon2", prix=4000},
                {vehs= "jackal", prix=4000},
                {vehs= "oracle", prix=4000},
                {vehs= "oracle2", prix=4000},
                {vehs= "sentinel", prix=4000},
                {vehs= "sentinel2", prix=5000},
                {vehs= "windsor", prix=5000},
                {vehs= "windsor2", prix=6000},
                {vehs= "zion", prix=5000},
                {vehs= "zion2", prix=5000},
            },
        },
        {
            nom = "Muscle",
            vehs = {
                {vehs= "blade", prix=4000},
                {vehs= "buccaneer", prix=5000},
                {vehs= "buccaneer2", prix=6000},
                {vehs= "chino", prix=5000},
                {vehs= "chino2", prix=5000},
                {vehs= "clique", prix=5000},
                {vehs= "coquette3", prix=5000},
                {vehs= "deviant", prix=5000},
                {vehs= "dominator", prix=5000},
                {vehs= "dominator2", prix=5000},
                {vehs= "dominator3", prix=5000},
                {vehs= "dukes", prix=5000},
                {vehs= "faction", prix=5000},
                {vehs= "faction2", prix=5000},
                {vehs= "faction3", prix=5000},
                {vehs= "ellie", prix=5000},
                {vehs= "gauntlet", prix=5000},
                {vehs= "gauntlet2", prix=5000},
                {vehs= "hermes", prix=5000},
                {vehs= "hotknife", prix=5000},
                {vehs= "hustler", prix=5000},
                {vehs= "impaler", prix=5000},
                {vehs= "impaler2", prix=5000},
                {vehs= "impaler3", prix=5000},
                {vehs= "impaler4", prix=5000},
                {vehs= "imperator", prix=5000},
                {vehs= "imperator2", prix=5000},
                {vehs= "imperator3", prix=5000},
                {vehs= "lurcher", prix=5000},
                {vehs= "moonbeam", prix=5000},
                {vehs= "moonbeam2", prix=5000},
                {vehs= "phoenix", prix=5000},
                {vehs= "picador", prix=1500},
                {vehs= "ratloader", prix=5000},
                {vehs= "ratloader2", prix=5000},
                {vehs= "ruiner", prix=5000},
                {vehs= "sabregt", prix=5000},
                {vehs= "sabregt2", prix=5000},
                {vehs= "slamvan", prix=5000},
                {vehs= "slamvan2", prix=5000},
                {vehs= "slamvan3", prix=5000},
                {vehs= "slamvan4", prix=5000},
                {vehs= "slamvan5", prix=5000},
                {vehs= "slamvan6", prix=5000},
                {vehs= "stalion", prix=5000},
                {vehs= "stalion2", prix=5000},
                {vehs= "tampa", prix=5000},
                {vehs= "tulip", prix=5000},
                {vehs= "vamos", prix=5000},
                {vehs= "vigero", prix=5000},
                {vehs= "virgo", prix=5000},
                {vehs= "virgo2", prix=5000},
                {vehs= "virgo3", prix=5000},
                {vehs= "voodoo", prix=5000},
                {vehs= "voodoo2", prix=5000},
                {vehs= "yosemite", prix=5000},
            },
        },
        {
            nom = "Off-Road",
            vehs = {
                {vehs= "bfinjection", prix=10000},
                {vehs= "bifta", prix=10000},
                {vehs= "blazer", prix=10000},
                {vehs= "blazer2", prix=10000},
                {vehs= "blazer3", prix=10000},
                {vehs= "blazer4", prix=10000},
                {vehs= "blazer5", prix=10000},
                {vehs= "bodhi2", prix=10000},
                {vehs= "brawler", prix=10000},
                {vehs= "bruiser", prix=10000},
                {vehs= "bruiser2", prix=10000},
                {vehs= "bruiser3", prix=10000},
                {vehs= "brutus", prix=10000},
                {vehs= "brutus2", prix=10000},
                {vehs= "brutus3", prix=10000},
                {vehs= "dloader", prix=10000},
                {vehs= "dubsta3", prix=10000},
                {vehs= "dune", prix=10000},
                {vehs= "dune3", prix=10000},
                {vehs= "freecrawler", prix=10000},
                {vehs= "kalahari", prix=10000},
                {vehs= "kamacho", prix=10000},
                {vehs= "marshall", prix=10000},
                {vehs= "mesa3", prix=10000},
                {vehs= "rancherxl", prix=10000},
                {vehs= "rebel", prix=10000},
                {vehs= "rebel2", prix=10000},
                {vehs= "riata", prix=10000},
                {vehs= "sandking", prix=10000},
                {vehs= "sandking2", prix=10000},
                {vehs= "trophytruck", prix=10000},
                {vehs= "trophytruck2", prix=10000},
            },
        },
        {
            nom = "SUVs",
            vehs = {
                {vehs= "baller", prix=10000},
                {vehs= "baller2", prix=10000},
                {vehs= "baller3", prix=10000},
                {vehs= "baller4", prix=10000},
                {vehs= "bjxl", prix=10000},
                {vehs= "cavalcade", prix=10000},
                {vehs= "cavalcade2", prix=10000},
                {vehs= "contender", prix=10000},
                {vehs= "dubsta", prix=10000},
                {vehs= "dubsta2", prix=10000},
                {vehs= "fq2", prix=10000},
                {vehs= "granger", prix=10000},
                {vehs= "gresley", prix=10000},
                {vehs= "habanero", prix=10000},
                {vehs= "huntley", prix=10000},
                {vehs= "landstalker", prix=10000},
                {vehs= "mesa", prix=10000},
                {vehs= "patriot", prix=10000},
                {vehs= "radi", prix=10000},
                {vehs= "rocoto", prix=10000},
                {vehs= "seminole", prix=10000},
                {vehs= "serrano", prix=10000},
                {vehs= "toros", prix=10000},
                {vehs= "xls", prix=10000},
            },
        },
        {
            nom = "Sedans",
            vehs = {
                {vehs= "asea", prix=10000},
                {vehs= "asterope", prix=10000},
                {vehs= "cog55", prix=10000},
                {vehs= "cognoscenti", prix=10000},
                {vehs= "emperor", prix=10000},
                {vehs= "emperor2", prix=10000},
                {vehs= "fugitive", prix=10000},
                {vehs= "glendale", prix=10000},
                {vehs= "ingot", prix=10000},
                {vehs= "intruder", prix=10000},
                {vehs= "premier", prix=10000},
                {vehs= "primo", prix=10000},
                {vehs= "primo2", prix=10000},
                {vehs= "regina", prix=10000},
                {vehs= "romero", prix=10000},
                {vehs= "stafford", prix=10000},
                {vehs= "stanier", prix=10000},
                {vehs= "stratum", prix=10000},
                {vehs= "stretch", prix=10000},
                {vehs= "superd", prix=10000},
                {vehs= "surge", prix=10000},
                {vehs= "tailgater", prix=10000},
                {vehs= "warrener", prix=10000},
                {vehs= "washington", prix=10000},
            },
        },
        {
            nom = "Sports",
            vehs = {
                {vehs= "alpha", prix=10000},
                {vehs= "banshee", prix=20000},
                {vehs= "bestiagts", prix=15000},
                {vehs= "blista2", prix=10000},
                {vehs= "blista3", prix=10000},
                {vehs= "buffalo", prix=10000},
                {vehs= "buffalo2", prix=10000},
                {vehs= "buffalo3", prix=10000},
                {vehs= "carbonizzare", prix=10000},
                {vehs= "comet2", prix=20000},
                {vehs= "comet3", prix=20000},
                {vehs= "comet4", prix=20000},
                {vehs= "comet5", prix=20000},
                {vehs= "coquette", prix=20000},
                {vehs= "deveste", prix=20000},
                {vehs= "elegy", prix=20000},
                {vehs= "elegy2", prix=20000},
                {vehs= "feltzer2", prix=20000},
                {vehs= "flashgt", prix=20000},
                {vehs= "furoregt", prix=20000},
                {vehs= "fusilade", prix=20000},
                {vehs= "futo", prix=20000},
                {vehs= "gb200", prix=20000},
                {vehs= "hotring", prix=20000},
                {vehs= "italigto", prix=20000},
                {vehs= "jester", prix=20000},
                {vehs= "jester2", prix=22000},
                {vehs= "jester3", prix=22000},
                {vehs= "khamelion", prix=20000},
                {vehs= "kuruma", prix=20000},
                {vehs= "lynx", prix=20000},
                {vehs= "massacro", prix=20000},
                {vehs= "massacro2", prix=20000},
                {vehs= "neon", prix=20000},
                {vehs= "ninef", prix=20000},
                {vehs= "ninef2", prix=20000},
                {vehs= "omnis", prix=20000},
                {vehs= "pariah", prix=20000},
                {vehs= "penumbra", prix=20000},
                {vehs= "raiden", prix=20000},
                {vehs= "rapidgt", prix=20000},
                {vehs= "rapidgt2", prix=20000},
                {vehs= "raptor", prix=10000},
                {vehs= "revolter", prix=20000},
                {vehs= "ruston", prix=20000},
                {vehs= "schafter2", prix=20000},
                {vehs= "schafter3", prix=20000},
                {vehs= "schafter4", prix=20000},
                {vehs= "schafter5", prix=20000},
                {vehs= "schafter6", prix=20000},
                {vehs= "schlagen", prix=20000},
                {vehs= "schwarzer", prix=20000},
                {vehs= "sentinel3", prix=20000},
                {vehs= "seven70", prix=20000},
                {vehs= "specter", prix=20000},
                {vehs= "specter2", prix=20000},
                {vehs= "streiter", prix=20000},
                {vehs= "sultan", prix=20000},
                {vehs= "tampa2", prix=20000},
                {vehs= "tropos", prix=20000},
                {vehs= "verlierer2", prix=20000},

            },
        },
        {
            nom = "Sports Classic",
            vehs = {
                {vehs= "ardent", prix=30000},
                {vehs= "btype", prix=20000},
                {vehs= "btype2", prix=20000},
                {vehs= "btype3", prix=20000},
                {vehs= "casco", prix=20000},
                {vehs= "cheetah2", prix=20000},
                {vehs= "coquette2", prix=20000},
                {vehs= "fagaloa", prix=20000},
                {vehs= "feltzer3", prix=20000},
                {vehs= "gt500", prix=20000},
                {vehs= "infernus2", prix=20000},
                {vehs= "jb700", prix=20000},
                {vehs= "mamba", prix=20000},
                {vehs= "manana", prix=20000},
                {vehs= "michelli", prix=20000},
                {vehs= "monroe", prix=20000},
                {vehs= "peyote", prix=20000},
                {vehs= "pigalle", prix=20000},
                {vehs= "rapidgt3", prix=20000},
                {vehs= "retinue", prix=20000},
                {vehs= "savestra", prix=20000},
                {vehs= "stinger", prix=20000},
                {vehs= "stingergt", prix=20000},
                {vehs= "stromberg", prix=11000},
                {vehs= "swinger", prix=11000},
                {vehs= "torero", prix=11000},
                {vehs= "tornado", prix=11000},
                {vehs= "tornado2", prix=11000},
                {vehs= "tornado3", prix=11000},
                {vehs= "tornado4", prix=11000},
                {vehs= "tornado5", prix=11000},
                {vehs= "tornado6", prix=11000},
                {vehs= "turismo2", prix=11000},
                {vehs= "viseris", prix=1000},
                {vehs= "z190", prix=101000},
                {vehs= "ztype", prix=10000},
                {vehs= "cheburek", prix=10000},
            },
        },
        {
            nom = "Super",
            vehs = {
                {vehs= "adder", prix=100000},
                {vehs= "autarch", prix=100000},
                {vehs= "banshee2", prix=100000},
                {vehs= "bullet", prix=100000},
                {vehs= "cheetah", prix=100000},
                {vehs= "cyclone", prix=100000},
                {vehs= "entity2", prix=100000},
                {vehs= "entityxf", prix=100000},
                {vehs= "fmj", prix=100000},
                {vehs= "gp1", prix=100000},
                {vehs= "infernus", prix=100000},
                {vehs= "italigtb", prix=100000},
                {vehs= "italigtb2", prix=100000},
                {vehs= "le7b", prix=100000},
                {vehs= "nero", prix=100000},
                {vehs= "nero2", prix=100000},
                {vehs= "osiris", prix=100000},
                {vehs= "penetrator", prix=100000},
                {vehs= "pfister811", prix=100000},
                {vehs= "prototipo", prix=100000},
                {vehs= "reaper", prix=100000},
                {vehs= "sc1", prix=100000},
                {vehs= "sheava", prix=100000},
                {vehs= "sultanrs", prix=100000},
                {vehs= "t20", prix=100000},
                {vehs= "taipan", prix=100000},
                {vehs= "tempesta", prix=100000},
                {vehs= "tezeract", prix=100000},
                {vehs= "turismor", prix=100000},
                {vehs= "tyrant", prix=100000},
                {vehs= "tyrus", prix=100000},
                {vehs= "vacca", prix=100000},
                {vehs= "vagner", prix=100000},
                {vehs= "vigilante", prix=100000},
                {vehs= "visione", prix=100000},
                {vehs= "voltic", prix=100000},
                {vehs= "xa21", prix=100000},
                {vehs= "zentorno", prix=100000},
            },
        },
        {
            nom = "Vans",
            vehs = {
                {vehs= "bison", prix=15000},
                {vehs= "bison2", prix=15000},
                {vehs= "bison3", prix=15000},
                {vehs= "bobcatxl", prix=15000},
                {vehs= "boxville", prix=15000},
                {vehs= "boxville2", prix=15000},
                {vehs= "boxville3", prix=15000},
                {vehs= "boxville4", prix=15000},
                {vehs= "burrito", prix=15000},
                {vehs= "burrito2", prix=15000},
                {vehs= "burrito3", prix=15000},
                {vehs= "burrito4", prix=15000},
                {vehs= "burrito5", prix=15000},
                {vehs= "gburrito", prix=15000},
                {vehs= "gburrito2", prix=15000},
                {vehs= "journey", prix=15000},
                {vehs= "minivan", prix=15000},
                {vehs= "minivan2", prix=15000},
                {vehs= "paradise", prix=1000},
                {vehs= "pony", prix=15000},
                {vehs= "pony2", prix=15000},
                {vehs= "rumpo", prix=15000},
                {vehs= "rumpo2", prix=15000},
                {vehs= "rumpo3", prix=15000},
                {vehs= "speedo", prix=15000},
                {vehs= "speedo2", prix=15000},
                {vehs= "speedo4", prix=15000},
                {vehs= "surfer", prix=15000},
                {vehs= "surfer2", prix=15000},
                {vehs= "taco", prix=15000},
                {vehs= "youga", prix=15000},
                {vehs= "youga2", prix=15000},

            },
        },
        {
            nom = "Donation",
            vehs = {


            },
        },
        {
            nom = "Helico",
            vehs = {
                {vehs= "supervolito", prix=1},
                {vehs= "supervolito2", prix=1},
                {vehs= "swift", prix=1},
                {vehs= "swift2", prix=1},
                {vehs= "volatus", prix=1},
                {vehs= "havok", prix=1},
            },
        },
    }


    rUtils.RegisterActionZone({
        pos = vector3(-53.04, 73.4, 71.9),
        action = function()
            OpenConcessmenu()
        end,
    })


    local vehs_avalaible = {}
    local local_veh = {
        props = nil,
        entity = nil,
        model = nil,
    }
    
    local global_veh = {
        props = nil,
        entity = nil,
    }
    
    local NearPlayer = {}
    
    
    local open = false
    RMenu.Add('core', 'concess', RageUI.CreateMenu("", "~b~achat de véhicule"), nil, nil, "root_cause", "shopui_title_legendarymotorsport")
    RMenu:Get('core', "concess").Closed = function()
        DeleteVehicle(local_veh.entity)
        local_veh.model = nil
        SetEntityCoords(GetPlayerPed(-1), -53.04, 73.4, 71.9, 0.0, 0.0, 0.0, 0)
        open = false
    end
    
    
    
    Citizen.CreateThread(function()
        for k,v in pairs(vehicle) do
            RMenu.Add('core', v.nom, RageUI.CreateSubMenu(RMenu:Get('core', 'concess'), "", "~b~concess "..v.nom, nil, nil, "root_cause", "shopui_title_legendarymotorsport"))
            RMenu:Get('core', v.nom).EnableMouse = false
            RMenu:Get('core', v.nom).Closed = function()
                local_veh.model = nil
                DeleteVehicle(local_veh.entity)
                SetEntityCoords(GetPlayerPed(-1), -53.04, 73.4, 71.9, 0.0, 0.0, 0.0, 0)
            end
        end
    
        RMenu.Add('core', "avalaible", RageUI.CreateSubMenu(RMenu:Get('core', 'concess'), "", "~b~Véhicule disponible à la vente", nil, nil, "root_cause", "shopui_title_legendarymotorsport"))
        RMenu:Get('core', "avalaible").EnableMouse = false
        RMenu:Get('core', "avalaible").Closed = function()
            --DeleteVehicle(local_veh.entity)
            local_veh.model = nil
            SetEntityCoords(GetPlayerPed(-1), -53.04, 73.4, 71.9, 0.0, 0.0, 0.0, 0)
        end
    
        RMenu.Add('core', "infoVeh", RageUI.CreateSubMenu(RMenu:Get('core', 'avalaible'), "", "~b~information du véhicule", nil, nil, "root_cause", "shopui_title_legendarymotorsport"))
        RMenu:Get('core', "infoVeh").EnableMouse = false
        RMenu:Get('core', "infoVeh").Closed = function()
            local_veh.model = nil
        end
    end)
    
    
    
    
    
    function OpenConcessmenu()
        if open then return end
        RageUI.Visible(RMenu:Get('core', 'concess'), not RageUI.Visible(RMenu:Get('core', 'concess')))
        open = true
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'concess'), true, true, false, function()
                
                    RageUI.ButtonWithStyle("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end) 

                
                    RageUI.ButtonWithStyle("Véhicule prêt à la vente.", nil, { RightLabel = "→→→" }, true, function()
                    end, RMenu:Get('core', "avalaible"))
                
                    for k,v in pairs(vehicle) do
                        RageUI.ButtonWithStyle(v.nom, nil, { RightLabel = "→→→" }, true, function()
                        end, RMenu:Get('core', v.nom))
                    end
                
                end, function()
                end)
            
                RageUI.IsVisible(RMenu:Get('core', "avalaible"), true, true, false, function()
                    for _,v in pairs(vehs_avalaible) do
                        local displaytext = GetDisplayNameFromVehicleModel(v.model)
                        local veh_name = GetLabelText(displaytext)
                    
                        RageUI.ButtonWithStyle(veh_name, "", {}, true, function(Hovered, Active, Selected)
                            if Active then
                                if local_veh.model ~= v.model then
                                    DeleteVehicle(local_veh.entity)
                                    CreateLocalVeh(v.model, v)
                                end
                            end
                            if Selected then
                            
                                DeleteVehicle(local_veh.entity)
                                SetEntityCoords(GetPlayerPed(-1), -53.04, 73.4, 71.9, 0.0, 0.0, 0.0, 0)
                                GetNearPlayers()
                            end
                        end, RMenu:Get('core', "infoVeh"))
                    end
                end, function()
                end)
            
                RageUI.IsVisible(RMenu:Get('core', "infoVeh"), true, true, false, function()
                    local displaytext = GetDisplayNameFromVehicleModel(local_veh.model)
                    local veh_name = GetLabelText(displaytext)
                    RageUI.ButtonWithStyle("Nom du véhicule: "..veh_name, "", {}, true, function(Hovered, Active, Selected)
                    end)
                    RageUI.ButtonWithStyle("Plaque: ~b~["..local_veh.props.plate.."]", "", {}, true, function(Hovered, Active, Selected)
                    end)
                    for k,v in pairs(NearPlayer) do
                        local pPed = GetPlayerPed(v)
                        local pCoords = GetEntityCoords(pPed)
                        RageUI.ButtonWithStyle("Attribuer le véhicule à: "..GetPlayerName(v), "", {}, true, function(Hovered, Active, Selected)
                            if Active then
                                DrawMarker(20, pCoords.x, pCoords.y, pCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
                            end
                            if Selected then
                                local id = GetPlayerServerId(v)
                                local props = local_veh.props
                                local props_final, plate = CreateVeh(props)
                                TriggerServerEvent(events.AddVeh, token, id, displaytext, plate, props_final)
                                for n,i in pairs(vehs_avalaible) do
                                    if local_veh.props.plate == i.plate then
                                        table.remove(vehs_avalaible, n)
                                    end
                                end
                                DeleteVehicle(local_veh.entity)
                            end
                        end)
                    end
                end, function()
                end)
            
                for k,v in pairs(vehicle) do
                    RageUI.IsVisible(RMenu:Get('core', v.nom), true, true, false, function()
                        for _,i in pairs(v.vehs) do
                            local displaytext = GetDisplayNameFromVehicleModel(i.vehs)
                            local veh_name = GetLabelText(displaytext)
                            RageUI.ButtonWithStyle(veh_name, "", { RightLabel = "~g~"..GroupDigits(i.prix).."$" }, true, function(Hovered, Active, Selected)
                                if Active then
                                    if local_veh.model ~= GetHashKey(i.vehs) then

                                        DeleteVehicle(local_veh.entity)
                                        CreateLocalVeh(GetHashKey(i.vehs))
                                    end
                                end
                                if (Selected) then
                                    local props = rUtils.GetVehicleProperties(local_veh.entity)
                                    table.insert(vehs_avalaible, props)
                                    rUtils.Notif("Véhicule '"..veh_name.."' ajouté à la liste.")
                                end
                            end)
                        end
                    end, function()
                    end)
                end
            end
        end)
    end
    
    
    function GetNearPlayers()
        NearPlayer = {}
        local players = GetActivePlayers()
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(players) do
            local oCoords = GetEntityCoords(GetPlayerPed(v))
            local dst = GetDistanceBetweenCoords(pCoords, oCoords, true)
            if dst <= 15.0 then
                table.insert(NearPlayer, v)
            end
        end
    end
    
    
    function CreateLocalVeh(model, props)
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(1) end
    
        local veh = CreateVehicle(model, -75.51985, 74.62209, 71.37163, 255.0, true, true)
        SetVehicleOnGroundProperly(veh)
        FreezeEntityPosition(veh, 1)
        if props then
            rUtils.SetVehicleProperties(veh, props)
        end
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        local_veh.entity = veh
        local_veh.model = model
        local_veh.props = rUtils.GetVehicleProperties(veh)
        SetModelAsNoLongerNeeded(model)
    end
    
    
    function CreateVeh(props)
        RequestModel(props.model)
        while not HasModelLoaded(props.model) do Wait(1) end
    
        local veh = CreateVehicle(props.model, -75.51985, 74.62209, 71.37163, 255.0, true, true)
        SetVehicleOnGroundProperly(veh)
        if props then
            rUtils.SetVehicleProperties(veh, props)
        end
        rUtils.Notif("Création de la plaque en cours ...")
        local plate = ""
        exports.rFramework:TriggerServerCallback(events.GenPlate, function(_plate)
            plate = _plate
            rUtils.Notif("Plaque ["..plate.."] crée!")
            SetVehicleNumberPlateText(veh, plate)
            
        end, token)    
        while plate == "" do Wait(1000) end
        return rUtils.GetVehicleProperties(veh), plate
    end
    
    
    
    GroupDigits = function(value)
        local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')
    
        return left..(num:reverse():gsub('(%d%d%d)','%1' .. " "):reverse())..right
    end


end