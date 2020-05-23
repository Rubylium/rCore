

 
function LoadEmsData()
    local open = false


    rUtils.RegisterGarageZone({
        pos = vector3(388.43, -1437.7, 29.43),
        spawns = {
            {pos = vector3(398.1, -1428.7, 28.8), heading = 227.5 },
            {pos = vector3(401.09, -1425.8, 28.8), heading = 227.5 },
            {pos = vector3(404.8, -1424.1, 29.2), heading = 227.5 },
        },
        vehs = {
            {spawn = "ambulance", nom = "Ambulance"},
            {spawn = "lguard", nom = "Vehicule de surveillance de plage."},
        },
    })

    

    rUtils.RegisterActionZone({
        pos = vector3(360.5, -1425.9, 32.5),
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

    RMenu.Add('core', 'ems_main', RageUI.CreateMenu("EMS", "~b~Ménu action EMS"))
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

                    RageUI.Button("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end)

                    RageUI.Button("Soigner la personne la plus proche", nil, {}, true, function(Hovered, Active, Selected)
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
                            TriggerServerEvent("core:ResetDeathStatus", targetID)
                            StillWant = false
                        end
                        Wait(0)
                    end
                end)
            else
                RageUI.Popup({message = "La personne n'a pas besoin de soin."})
            end
        end, targetID) 
    else
        RageUI.Popup({message = "Aucune personne proche."})
    end
end