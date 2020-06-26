

 
function LoadEmsData()
    local open = false

    local EmsCloths = {
        homme = {
            {
                name = "Tenue EMS Homme 1 ",
                cloth = {
                    ["tshirt_1"] = 19,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 74,
                    ["torso_2"] = 6,
                    ["pants_1"] = 24,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 7,
                    ["shoes_2"] = 0,
                    ["arms"] = 85,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 30,
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
                },
            },
            {
                name = "Tenue EMS Homme 2",
                cloth = {
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 250,
                    ["torso_2"] = 0,
                    ["pants_1"] = 24,
                    ["pants_2"] = 5,
                    ["shoes_1"] = 7,
                    ["shoes_2"] = 0,
                    ["arms"] = 85,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 30,
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
                },
            },
            {
                name = "Tenue EMS Homme 3",
                cloth = {
                    ["tshirt_1"] = 31,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 142,
                    ["torso_2"] = 2,
                    ["pants_1"] = 24,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 7,
                    ["shoes_2"] = 0,
                    ["arms"] = 93,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 30,
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
                },
            },
        },
        femme = {
            {
                name = "Tenue EMS Femme 1",
                cloth = {
                    ["tshirt_1"] = 18,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 25,
                    ["torso_2"] = 6,
                    ["pants_1"] = 23,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 10,
                    ["shoes_2"] = 1,
                    ["arms"] = 109,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 14,
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
                },
            },
            {
                name = "Tenue EMS Femme 1",
                cloth = {
                    ["tshirt_1"] = 13,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 258,
                    ["torso_2"] = 0,
                    ["pants_1"] = 23,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 10,
                    ["shoes_2"] = 1,
                    ["arms"] = 109,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 14,
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
                },
            },
            {
                name = "Tenue EMS Femme 1",
                cloth = {
                    ["tshirt_1"] = 38,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 139,
                    ["torso_2"] = 2,
                    ["pants_1"] = 23,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 4,
                    ["shoes_2"] = 1,
                    ["arms"] = 109,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 14,
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
                },
            },
        },
    }

    rUtils.RegisterClothZone({
        pos = vector3(357.10, -1423.5, 32.5),
        cloths = EmsCloths
    })

    rUtils.RegisterClothZone({
        pos = vector3(1839.425, 3689.417, 34.26999),
        cloths = EmsCloths
    })

    rUtils.RegisterGarageZone({
        pos = vector3(388.43, -1437.7, 29.43),
        spawns = {
            {pos = vector3(398.1, -1428.7, 28.8), heading = 227.5 },
            {pos = vector3(401.09, -1425.8, 28.8), heading = 227.5 },
            {pos = vector3(404.8, -1424.1, 29.2), heading = 227.5 },
        },
        vehs = {
            {spawn = "ambulance", nom = "Ambulance"},
            {spawn = "amr_tahoe", nom = "Tahoe"},
            {spawn = "amr_explorer", nom = "Ford explorer"},
        },
    })

    rUtils.RegisterGarageZone({
        pos = vector3(1836.345, 3668.639, 33.67728),
        spawns = {
            {pos = vector3(1835.307, 3664.604, 33.39608),heading = 207.92176818848,},
            {pos = vector3(1832.136, 3662.375, 33.48361),heading = 209.99505615234,},
            {pos = vector3(1828.572, 3660.38, 33.55021),heading = 211.38792419434,},
            {pos = vector3(1826.096, 3658.378, 33.64085),heading = 208.03826904297,},
            {pos = vector3(1822.809, 3656.311, 33.73044),heading = 210.90557861328,},
            {pos = vector3(1819.472, 3654.985, 33.78831),heading = 210.78768920898,},
        },
        vehs = {
            {spawn = "ambulance", nom = "Ambulance"},
            {spawn = "amr_tahoe", nom = "Tahoe"},
            {spawn = "amr_explorer", nom = "Ford explorer"},
        },
    })

    

    rUtils.RegisterActionZone({
        pos = vector3(360.5, -1425.9, 32.5),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(1822.56, 3676.507, 34.27003),
        action = function()
            OpenSocietyInvMenu()
        end,
    })


    rUtils.RegisterFarmZone({
        pos = vector3(1138.8, -1597.5, 34.7),
        type = 1,
        item = "medicament1",
    })

    rUtils.RegisterFarmZone({
        pos = vector3(374.0, -1442.2, 29.43),
        type = 2,
        oItem = "medicament1",
        iItem = "medikit",
    })

    RMenu.Add('core', 'ems_main', RageUI.CreateMenu("EMS", "~b~Menu action EMS"))
    RMenu:Get('core', 'ems_main').Closed = function()
        open = false
    end


    function OpenEmsActionMenu()
        open = true
        RageUI.Visible(RMenu:Get('core', 'ems_main'), not RageUI.Visible(RMenu:Get('core', 'ems_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'ems_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end)

                    RageUI.ButtonWithStyle("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end)

                    RageUI.ButtonWithStyle("Soigner la personne la plus proche", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            HelpPlayer()
                        end
                    end)

                end, function()
                    ---Panels
                end)


            end
        end)
    end  
    

end



function HelpPlayer()
    local target, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
    if dst < 3.0 then
        local targetID = GetPlayerServerId(target)
        exports.rFramework:TriggerServerCallback('core:CheckPlayerDeathStatus', function(status)
            if status == 1 or status == 2 then
                RageUI.Popup({message = "Vous commencez à soigner la personne.\nLes soins vont duré 30 secondes."})
                TaskStartScenarioInPlace(pPed, "CODE_HUMAN_MEDIC_KNEEL", -1, true)
                local oldTime = GetGameTimer()
                local StillWant = true

                Citizen.CreateThread(function()
                    while StillWant do
                        RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
                        if IsControlPressed(1, 73) then
                            StillWant = false
                            ClearPedTasks(GetPlayerPed(-1))
                        end
                        Wait(1)
                    end
                end)
            
                Citizen.CreateThread(function()
                    while StillWant do
                        if oldTime + 30000 < GetGameTimer() then
                            oldTime = GetGameTimer()
                            ClearPedTasks(pPed)
                            TriggerServerEvent(events.ResetDeath, token, targetID)
                            TriggerServerEvent(events.giveMoney, token, 100.0)
                            StillWant = false
                        end
                        Wait(0)
                    end
                end)
            else
                if GetEntityHealth(target) == 200 then
                    RageUI.Popup({message = "La personne n'a pas besoin de soin."})
                else
                    TaskStartScenarioInPlace(pPed, "CODE_HUMAN_MEDIC_KNEEL", -1, true)
                    Wait(5000)
                    ClearPedTasks(pPed)
                    TriggerServerEvent(events.ResetDeath, token, targetID)
                end
            end
        end, targetID) 
    else
        RageUI.Popup({message = "Aucune personne proche."})
    end
end