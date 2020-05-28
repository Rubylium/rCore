

function LoadPoliceData()
    local LspdCloths = {
        {
            name = "Tenue LSPD Homme",
            cloth = {
                ["tshirt_1"] = 56,
                ["tshirt_2"] = 1,
                ["torso_1"] = 102,
                ["torso_2"] = 0,
                ["pants_1"] = 52,
                ["pants_2"] = 1,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 30,
                ["chain_1"] = 6,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["bags_1"] = 0,
                ["arms_2"] = 0,
                ["decals_1"] = 0,
                ["ears_1"] = -1,
                ["chain_2"] = 0,
                ["ears_2"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["helmet_2"] = 0,
                ["mask_1"] = 0,
                ["watches_2"] = 0,
                ["helmet_1"] = -1,
            },
        },
        {
            name = "Tenue LSPD Femme",
            cloth = {
                ["tshirt_1"] = 51,
                ["tshirt_2"] = 0,
                ["torso_1"] = 84,
                ["torso_2"] = 0,
                ["pants_1"] = 61,
                ["pants_2"] = 0,
                ["shoes_1"] = 24,
                ["shoes_2"] = 0,
                ["arms"] = 44,
                ["chain_1"] = 6,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["bags_1"] = 0,
                ["arms_2"] = 0,
                ["decals_1"] = 0,
                ["ears_1"] = -1,
                ["chain_2"] = 0,
                ["ears_2"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["helmet_2"] = 0,
                ["mask_1"] = 0,
                ["watches_2"] = 0,
                ["helmet_1"] = -1,
            },
        },
    }

    rUtils.RegisterClothZone({
        pos = vector3(-1098.269, -831.6808, 14.28278),
        cloths = LspdCloths
    })


    rUtils.RegisterGarageZone({
        pos = vector3(-1077.151, -857.4, 5.0),
        spawns = {
            {pos = vector3(-1052.552, -846.5878, 4.43216),heading = 216.08404541016,},
            {pos = vector3(-1047.697, -846.5561, 4.432549),heading = 217.1958770752,},
            {pos = vector3(-1039.836, -855.3243, 4.443726),heading = 56.36937713623,},
            {pos = vector3(-1042.467, -858.2819, 4.450675),heading = 58.252021789551,},
            {pos = vector3(-1045.338, -861.4882, 4.481732),heading = 58.001258850098,},
            {pos = vector3(-1048.484, -864.561, 4.571898),heading = 59.926246643066,},
            {pos = vector3(-1051.888, -866.9875, 4.687532),heading = 58.566833496094,},
            {pos = vector3(-1069.624, -878.1849, 4.410971),heading = 31.558645248413,},
            {pos = vector3(-1073.018, -880.007, 4.328514),heading = 28.419841766357,},
            {pos = vector3(-1076.364, -881.9647, 4.247827),heading = 28.69091796875,},
            {pos = vector3(-1079.562, -884.1489, 4.165996),heading = 31.136232376099,},
        },
        vehs = {
            {spawn = "cvpi", nom = "2011 CVPI"},
            {spawn = "16exp", nom = "2016 Explorer"},
            {spawn = "tau", nom = "2016 Taurus"},
            {spawn = "18charger", nom = "2018 Charger"},
            {spawn = "camaro", nom = "2019 Camaro"},
            {spawn = "19hoe", nom = "2019 Tahoe"},
        },
    })


    rUtils.RegisterActionZone({
        pos = vector3(-1087.789, -813.3109, 11.03693),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(-1102.956, -829.2413, 14.28279),
        action = function()
            OpenPoliceArmorie()
        end,
    })


    RMenu.Add('core', 'lspd_main', RageUI.CreateMenu("POLICE", "~b~Menu action LSPD"))
    RMenu:Get('core', 'lspd_main').Closed = function()
        open = false
    end
    RMenu.Add('core', 'lspd_fouille', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_main'), "Fouille", "~b~Fouille"))
    RMenu:Get('core', 'lspd_fouille').Closed = function()end

    local TargetInv = {}
    local TargetWeight = 0
    local TargetMoney = 0
    local TargetBlackMoney = 0
    local TargetID = 0
    function OpenPoliceActionMenu()
        if open then return end
        open = true
        RageUI.Visible(RMenu:Get('core', 'lspd_main'), not RageUI.Visible(RMenu:Get('core', 'lspd_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'lspd_fouille'), true, true, true, function()
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

                RageUI.IsVisible(RMenu:Get('core', 'lspd_main'), true, true, true, function()

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
                    end, RMenu:Get('core', 'lspd_fouille'))

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
            item = "pistoletlspd",
            grade = 2,
        },
        {
            name = "Fusils d'assault LSPD",
            item = "m4",
            grade = 3,
        },
    }

    RMenu.Add('core', 'lspd_armorie', RageUI.CreateMenu("POLICE", "~b~Menu action LSPD"))
    RMenu:Get('core', 'lspd_armorie').Closed = function()
        open = false
    end

    function OpenPoliceArmorie()
        open = true
        TriggerServerEvent("rF:GetPlayerInventory")
        RageUI.Visible(RMenu:Get('core', 'lspd_armorie'), not RageUI.Visible(RMenu:Get('core', 'lspd_armorie')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'lspd_armorie'), true, true, true, function()
                    RageUI.ButtonWithStyle("Déposer ses armes de services.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            for k,v in pairs(pInventory) do
                                if v.name == "matraque" or v.name == "tazer" or v.name == "pistoletlspd" or v.name == "m4" then
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


                end, function()
                    ---Panels
                end)


            end
        end)
    end

end