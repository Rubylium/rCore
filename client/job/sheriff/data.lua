

function LoadSheriffData()
    local sheriffCloths = {
        {
            name = "Tenue sheriff junior homme",
            cloth = {
                ["tshirt_1"] = 38,
                ["tshirt_2"] = 0,
                ["torso_1"] = 94,
                ["torso_2"] = 0,
                ["pants_1"] = 87,
                ["pants_2"] = 7,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 19,
                ["arms_2"] = 0,
                ["helmet_1"] = 13,
                ["helmet_2"] = 0,
                ["chain_1"] = 3,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 121,
                ["ears_2"] = 0,
                ["mask_1"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
        {
            name = "Tenue sheriff junior femme",
            cloth = {
                ["tshirt_1"] = 27,
                ["tshirt_2"] = 0,
                ["torso_1"] = 85,
                ["torso_1"] = 0,
                ["pants_1"] = 90,
                ["pants_2"] = 3,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 31,
                ["arms_2"] = 0,
                ["helmet_1"] = 13,
                ["helmet_2"] = 0,
                ["chain_1"] = 3,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 0,
                ["ears_2"] = 0,
                ["mask_1"] = 121,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
        {
            name = "Tenue sheriff junior-confirmé femme",
            cloth = {
                ["tshirt_1"] = 8,
                ["tshirt_2"] = 0,
                ["torso_1"] = 185,
                ["torso_2"] = 5,
                ["pants_1"] = 90,
                ["pants_2"] = 7,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 31,
                ["arms_2"] = 0,
                ["helmet_1"] = 13,
                ["helmet_2"] = 1,
                ["chain_1"] = 3,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 0,
                ["ears_2"] = 0,
                ["mask_1"] = 121,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
        {
            name = "Tenue sheriff caporal femme",
            cloth = {
                ["tshirt_1"] = 19,
                ["tshirt_2"] = 2,
                ["torso_1"] = 91,
                ["torso_2"] = 4,
                ["pants_1"] = 90,
                ["pants_2"] = 7,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 31,
                ["arms_2"] = 0,
                ["helmet_1"] = 32,
                ["helmet_2"] = 2,
                ["chain_1"] = 3,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 0,
                ["ears_2"] = 0,
                ["mask_1"] = 121,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
        {
            name = "Tenue sheriff MAJOR femme",
            cloth = {
                ["tshirt_1"] = 152,
                ["tshirt_2"] = 0,
                ["torso_1"] = 85,
                ["torso_2"] = 1,
                ["pants_1"] = 90,
                ["pants_2"] = 6,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 31,
                ["arms_2"] = 0,
                ["helmet_1"] = 13,
                ["helmet_2"] = 3,
                ["chain_1"] = 0,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 0,
                ["ears_2"] = 0,
                ["mask_1"] = 121,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
        {
            name = "Tenue sheriff SOUS-SHERIFF femme",
            cloth = {
                ["tshirt_1"] = 9,
                ["tshirt_2"] = 0,
                ["torso_1"] = 103,
                ["torso_2"] = 1,
                ["pants_1"] = 61,
                ["pants_2"] = 1,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 23,
                ["arms_2"] = 1,
                ["helmet_1"] = 32,
                ["helmet_2"] = 1,
                ["chain_1"] = 0,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = 0,
                ["ears_2"] = 0,
                ["mask_1"] = 121,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 41,
            },
        },
    }

    rUtils.RegisterClothZone({
        pos = vector3(-453.1807, 6013.426, 31.71638),
        cloths = sheriffCloths
    })


    rUtils.RegisterGarageZone({
        pos = vector3(-460.6692, 6014.975, 31.4901),
        spawns = {
            {pos = vector3(-482.9036, 6024.854, 30.66642),heading = 224.11457824707,},
            {pos = vector3(-479.5625, 6028.273, 30.66619),heading = 222.79969787598,},
            {pos = vector3(-476.2423, 6031.915, 30.66615),heading = 223.1188659668,},
            {pos = vector3(-472.6884, 6035.741, 30.66575),heading = 223.09126281738,},
            {pos = vector3(-468.7123, 6038.225, 30.66587),heading = 226.24041748047,},
        },
        vehs = {
            {spawn = "leo5", nom = "SUV #1"},
            {spawn = "leo2", nom = "SUV #2"},
            {spawn = "leo3", nom = "SUV #3"},
            {spawn = "leo7", nom = "SUV #4"},
            {spawn = "leo8", nom = "SUV #5"},
            {spawn = "leo1", nom = "SEDAN #1"},
            {spawn = "leo4", nom = "SEDAN #2"},
            {spawn = "leo6", nom = "SEDAN #3"},
        },
    })


    rUtils.RegisterActionZone({
        pos = vector3(-438.7426, 6010.567, 27.98562),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(-437.4343, 6000.777, 31.71609),
        action = function()
            OpenSheriffArmorie()
        end,
    })


    RMenu.Add('core', 'sheriff_main', RageUI.CreateMenu("Sheriff", "~b~Menu action sheriff"))
    RMenu:Get('core', 'sheriff_main').Closed = function()
        open = false
    end
    RMenu.Add('core', 'sheriff_fouille', RageUI.CreateSubMenu(RMenu:Get('core', 'sheriff_main'), "Fouille", "~b~Fouille"))
    RMenu:Get('core', 'sheriff_fouille').Closed = function()end

    local TargetInv = {}
    local TargetWeight = 0
    local TargetMoney = 0
    local TargetBlackMoney = 0
    local TargetID = 0
    function OpenSheriffActionMenu()
        if open then return end
        open = true
        RageUI.Visible(RMenu:Get('core', 'sheriff_main'), not RageUI.Visible(RMenu:Get('core', 'sheriff_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'sheriff_fouille'), true, true, true, function()
                    RageUI.ButtonWithStyle("Argent de poche: ~g~"..TargetMoney+TargetBlackMoney.."~w~$", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            
                        end
                    end)
                    RageUI.Separator("Poids: "..TargetWeight.."/50.0")
                    for k,v in pairs(TargetInv) do
                        RageUI.ButtonWithStyle(v.olabel.." ~g~("..v.count..")", nil, { }, true, function(Hovered, Active, Selected)
                            if Selected then
                                local amount = CustomAmount()
                                if amount ~= nil and amount ~= 0 and amount <= v.count then
                                    TriggerServerEvent("rF:TransferItemIfTargetCanHoldItReverse", token, TargetID, v.name, amount, v.label, v.count)
                                    if v.count - amount <= 0 then
                                        TargetInv[k] = nil
                                    else
                                        TargetInv[k].count = TargetInv[k].count - amount
                                    end
                                end
                            end
                        end) 
                    end

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'sheriff_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent("core:SetServiceStatus", token, pJob)
                        end
                    end) 

                    RageUI.ButtonWithStyle("Donner une amende", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end)

                    RageUI.ButtonWithStyle("Escorter la personne", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent("core:EscortPlayer", token, sID)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                    RageUI.ButtonWithStyle("Fouiller la personne", nil, {}, true, function(_,h,s)
                        if s then 
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local target = GetPlayerServerId(closet)
                                exports.rFramework:TriggerServerCallback('rF:GetOtherPlayerData', function(inv, weight, money, black)
                                    TargetInv = inv
                                    TargetWeight = weight
                                    TargetMoney = money
                                    TargetBlackMoney = black
                                    TargetID = target
                                end, target)
                            else
                                rUtils.Notif("Aucun joueur proche.")
                            end
                        end
                        if h then
                            rUtils.DisplayClosetPlayer()
                        end
                    end, RMenu:Get('core', 'sheriff_fouille'))

                    RageUI.ButtonWithStyle("Menotter la personne", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent("core:CuffPlayer", token, sID, true, true)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 1.0, 1.0, nil, 3000)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)


                    RageUI.ButtonWithStyle("Menotter la personne (Laisser bouger)", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent("core:CuffPlayer", token, sID, true, false)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 1.0, 1.0, nil, 3000)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer les menottes", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent("core:CuffPlayer", token, sID, false, false)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 100.0, nil, nil, 5800)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                end, function()
                    ---Panels
                end)


            end
        end)
    end 


    local weapons = {
        {
            name = "Matraque",
            item = "matraque",
            grade = 0,
        },
        {
            name = "Tazer",
            item = "tazer",
            grade = 0,
        },
        {
            name = "Arme de poing",
            item = "pistoletsheriff",
            grade = 2,
        },
        {
            name = "Fusils d'assault sheriff",
            item = "m4",
            grade = 3,
        },
    }

    local gilet = {
        {label = "gilet pare-balle 1", item = "bproof_1", max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) - 1,								min = 0,},
        {label = "Variante gilet", o="bproof_1",c=9, item = "bproof_2", max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 9, GetPedTextureVariation(GetPlayerPed(-1), 9)) - 1,			min = 0,},
    }

    RMenu.Add('core', 'sheriff_armorie', RageUI.CreateMenu("Sheriff", "~b~Menu action sheriff"))
    RMenu:Get('core', 'sheriff_armorie').Closed = function()
        open = false
    end

    for k,v in pairs(gilet) do
        RMenu.Add('core', v.item.."1", RageUI.CreateSubMenu(RMenu:Get('core', 'sheriff_armorie'), "Création personnage", "~b~Géstion des vétement de votre personnage."))
        RMenu:Get('core', v.item.."1").Closed = function()
        end
    end

    local NotSpamming = {}

    function OpenSheriffArmorie()
        open = true
        TriggerServerEvent("rF:GetPlayerInventory", token)
        RageUI.Visible(RMenu:Get('core', 'sheriff_armorie'), not RageUI.Visible(RMenu:Get('core', 'sheriff_armorie')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'sheriff_armorie'), true, true, true, function()
                    RageUI.ButtonWithStyle("Déposer ses armes de services.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            for k,v in pairs(pInventory) do
                                if v.name == "matraque" or v.name == "tazer" or v.name == "pistoletsheriff" or v.name == "m4" then
                                    TriggerServerEvent("rF:RemoveItem", token, v.label, v.count)
                                end
                            end
                        end
                    end)

                    for k,v in pairs(weapons) do
                        RageUI.ButtonWithStyle(v.name, nil, { }, v.grade <= pJob_Grade, function(Hovered, Active, Selected)
                            if Selected then
                                TriggerServerEvent("rF:AddItemIfNotAlreadyHave", token, v.item, 1)
                            end
                        end)
                    end

                    for k,v in pairs(gilet) do
                        RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        end, RMenu:Get('core', v.item.."1"))
                    end


                end, function()
                    ---Panels
                end)

                for k,v in pairs(gilet) do
                    RageUI.IsVisible(RMenu:Get('core', v.item.."1"), true, true, true, function()

                        if v.item == "bproof_1" then
                            for i = v.min, v.max do
                                if NotSpamming[k] == nil then NotSpamming[k] = i end
    
                                RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ équiper " }, not usingVipPed, function(_,h,s)
                                   if s then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       SetPedArmour(pPed, 100.0)
                                   end
                                   if h then
                                       if NotSpamming[k] ~= i then
                                           TriggerEvent("skinchanger:change", v.item, i)
                                           TriggerEvent("skinchanger:change", v.o, 0)
                                           NotSpamming[k] = i
                                       end
                                   end
                                end) 
                            end
                        elseif v.item == "bproof_2" then
    
                            local value = exports.rFramework:GetKeyValue(v.o)
                            for i = v.min, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1 do
                                if NotSpamming[k] == nil then NotSpamming[k] = i end
                                RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ équiper " }, not usingVipPed, function(_,h,s)
                                   if s then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                   end
                                   if h then
                                        if NotSpamming[k] ~= i then
                                           TriggerEvent("skinchanger:change", v.item, i)
                                           NotSpamming[k] = i
                                        end
                                   end
                                end) 
                            end
                        end
    
                    end, function()
                        ---Panels
                    end)
                end


            end
        end)
    end

end


RMenu.Add('core', 'sheriff_tige', RageUI.CreateMenu("SHERIFF", "~b~Traveaux forcé SHERIFF"))
local tige = {
    {
        titre = "Petits travaux forcés",
        count = 10,
    },
    {
        titre = "travaux forcés",
        count = 25,
    },
    {
        titre = "Long travaux forcés",
        count = 50,
    },
}

local tigeAction = {
    zone = {
        {pos = vector3(2044.531, 3196.209, 45.18649),heading = 44.096755981445,},
        {pos = vector3(2061.594, 3191.172, 45.18649),heading = 267.79046630859,},
        {pos = vector3(2062.081, 3178.18, 45.16893),heading = 219.8528137207,},
        {pos = vector3(2058.373, 3170.067, 45.36525),heading = 235.52456665039,},
        {pos = vector3(2050.669, 3172.832, 45.16896),heading = 126.92813110352,},
        {pos = vector3(2041.207, 3189.751, 45.16899),heading = 81.374366760254,},
        {pos = vector3(2052.152, 3190.305, 45.18661),heading = 283.36517333984,},
        {pos = vector3(2057.809, 3196.577, 45.18649),heading = 331.67346191406,},
    },
    action = {
        men = {
            "WORLD_HUMAN_JANITOR",
            "WORLD_HUMAN_BUM_WASH",
        },
        women = {
            "WORLD_HUMAN_JANITOR",
        }
    },
    pos = vector3(2050.911, 3184.834, 45.16852),
    cloths = {
        men = {
            ["tshirt_1"] = 15,
            ["tshirt_2"] = 0,
            ["torso_1"] = 153,
            ["torso_2"] = 0,
            ["pants_1"] = 36,
            ["pants_2"] = 0,
            ["shoes_1"] = 27,
            ["shoes_2"] = 0,
            ["arms"] = 72,
            ["arms_2"] = 0,
            ["helmet_1"] = 25,
            ["helmet_2"] = 0,
            ["chain_1"] = 0,
            ["chain_2"] = 0,
            ["bracelets_1"] = -1,
            ["bracelets_2"] = 0,
            ["ears_1"] = -1,
            ["ears_2"] = 0,
            ["mask_1"] = 0,
            ["mask_2"] = 0,
            ["watches_1"] = -1,
            ["watches_2"] = 0,
            ["decals_1"] = 0,
            ["bags_1"] = 0,
            ["bproof_1"] = 3,
            ["bproof_2"] = 0,
        },
        women = {
            ["tshirt_1"] = 16,
            ["tshirt_2"] = 0,
            ["torso_1"] = 150,
            ["torso_2"] = 0,
            ["pants_1"] = 35,
            ["pants_2"] = 0,
            ["shoes_1"] = 26,
            ["shoes_2"] = 0,
            ["arms"] = 73,
            ["arms_2"] = 0,
            ["helmet_1"] = 53,
            ["helmet_2"] = 0,
            ["chain_1"] = 0,
            ["chain_2"] = 0,
            ["bracelets_1"] = -1,
            ["bracelets_2"] = 0,
            ["ears_1"] = -1,
            ["ears_2"] = 0,
            ["mask_1"] = 0,
            ["mask_2"] = 0,
            ["watches_1"] = -1,
            ["watches_2"] = 0,
            ["decals_1"] = 0,
            ["bags_1"] = 0,
            ["bproof_1"] = 5,
            ["bproof_2"] = 0,
        }
    }
}

function OpenTigeSheriffMenu()
    if pJob ~= "sheriff" then RageUI.Popup({message = "Désolé, je ne parle qu'avec des agents du BCSO."}) return end
    open = true
    RageUI.Visible(RMenu:Get('core', 'sheriff_tige'), not RageUI.Visible(RMenu:Get('core', 'sheriff_tige')))
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'sheriff_tige'), true, true, true, function()
                for k,v in pairs(tige) do
                    RageUI.Button(v.titre, "Met la personne la plus proche en "..v.titre, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer()
                            if dst ~= nil and dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent("core:DoTig", token, sID, v.count, tigeAction)
                                --TriggerServerEvent("core:DoTig", token, GetPlayerServerId(GetPlayerIndex()), v.count, tigeAction)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)
                end

            end, function()
                ---Panels
            end)

            

        end
    end)
end