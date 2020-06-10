

function LoadBestbudsData()
    local open = false

    RMenu.Add('core', 'bestbuds', RageUI.CreateMenu("BestBuds", "~b~BestBuds action", nil, nil, "shopui_title_sm_hangar", "shopui_title_sm_hangar"))
    RMenu:Get('core', "bestbuds").Closed = function()
        open = false
    end

    function OpenBestBudsMenu()
        if open then return end
        RageUI.Visible(RMenu:Get('core', 'bestbuds'), not RageUI.Visible(RMenu:Get('core', 'bestbuds')))
        open = true
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'bestbuds'), true, true, false, function()
                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end)

                    RageUI.ButtonWithStyle("lancer une mission de livraison", "Au moins 1 Canabis de bonne qualité est requis.", {}, pInventory["Canabis de bonne qualité"] ~= nil, function(Hovered, Active, Selected)
                        if Selected then
                            NpcJobMissions:StartJobMission(WeedData.w.mission)
                        end
                    end) 
                
                    RageUI.ButtonWithStyle("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end) 
                
                end, function()
                end)
            end
        end)
    end


    rUtils.RegisterGarageZone({
        pos = vector3(370.0815, -770.556, 29.29237),
        spawns = {
            {pos = vector3(372.8253, -767.0464, 29.07942),heading = 359.10217285156,},
            {pos = vector3(376.4875, -767.1799, 29.07999),heading = 358.537109375,},
            {pos = vector3(380.0474, -767.0067, 29.08117),heading = 0.31052368879318,},
            {pos = vector3(383.7681, -766.9051, 29.07995),heading = 0.9855198264122,},
            {pos = vector3(387.3107, -766.8745, 29.07901),heading = 359.54049682617,},
            {pos = vector3(390.9125, -766.5468, 29.079),heading = 1.0537354946136,},
        },
        vehs = {
            {spawn = "pony2", nom = "Van de transport"},
        },
    })

    rUtils.RegisterActionZone({
        pos = vector3(380.8317, -819.8174, 29.30261),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    local clothsWeed = {
        homme = {
            {
                name = "Tenue weed Homme",
                cloth = {
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 67,
                    ["torso_2"] = 0,
                    ["pants_1"] = 40,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 93,
                    ["chain_1"] = 45,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["bags_1"] = 0,
                    ["arms_2"] = 1,
                    ["decals_1"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 46,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["helmet_1"] = 57,
                    ["helmet_2"] = 0,
                    ["watches_2"] = 0,
                },
            },
        },
        femme = {
            ["tshirt_1"] = 17,
            ["tshirt_2"] = 0,
            ["torso_1"] = 61,
            ["torso_2"] = 0,
            ["decals_1"] = 0,
            ["decals_2"] = 0,
            ["arms"] = 88,
            ["arms_2"] = 0,
            ["pants_1"] = 40,
            ["pants_2"] = 0,
            ["shoes_1"] = 24,
            ["shoes_2"] = 0,
            ["mask_1"] = 46,
            ["mask_2"] = 0,
            ["bproof_1"] = 0,
            ["bproof_2"] = 0,
            ["chain_1"] = 32,
            ["chain_2"] = 0,
            ["helmet_1"] = -1,
            ["helmet_2"] = 0,
            ["bags_1"] = 0,
            ["glasses_1"] = -1,
            ["glasses_2"] = 0,
            ["bracelets_1"] = -1,
            ["bracelets_2"] = 0,
            ["ears_1"] = -1,
            ["ears_2"] = 0,
            ["watches_1"] = -1,
            ["watches_2"] = 0,
        }
    }

    rUtils.RegisterClothZone({
        pos = vector3(374.354, -816.814, 29.30338),
        cloths = clothsWeed
    })

end 