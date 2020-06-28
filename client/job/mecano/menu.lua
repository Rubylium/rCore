local open = false

function InitMecanoActionMenu()

    RMenu.Add('core', 'mecano_main', RageUI.CreateMenu("", "~b~Ménu action mécano", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'vehAction', RageUI.CreateSubMenu(RMenu:Get('core', 'mecano_main'), "", "~b~Ménu action mécano", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'animation', RageUI.CreateSubMenu(RMenu:Get('core', 'mecano_main'), "", "~b~Ménu action mécano", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu:Get('core', 'mecano_main').Closed = function()
        open = false
    end
    
    
    local DoorStatus = {
        capot = false,
        coffre = false,
    }
    
    function OpenMecanoActionMenu()
        RageUI.Visible(RMenu:Get('core', 'mecano_main'), not RageUI.Visible(RMenu:Get('core', 'mecano_main')))
        open = true
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'mecano_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end) 

                    RageUI.ButtonWithStyle("Action sur véhicule", nil, { RightLabel = "→→→" }, true, function()
                    end, RMenu:Get('core', 'vehAction'))

                    RageUI.ButtonWithStyle("Animation", nil, { RightLabel = "→→→" }, true, function()
                    end, RMenu:Get('core', 'animation'))

                    RageUI.ButtonWithStyle("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end)

                   --RageUI.ButtonWithStyle("Annoncé mécano ouvert", nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                   --    if Selected then
                   --        TriggerServerEvent('AnnounceMecanoOuvert')
                   --    end
                   --end)

                   --RageUI.ButtonWithStyle("Annoncé mécano fermer", nil, { RightBadge = RageUI.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                   --    if Selected then
                   --        TriggerServerEvent('AnnounceMecanoFerme')
                   --    end
                   --end)

                end, function()
                    ---Panels
                end)


                RageUI.IsVisible(RMenu:Get('core', 'vehAction'), true, true, true, function()

                    RageUI.ButtonWithStyle("Réparer le véhicule", "Permet de réparer le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                            TriggerServerEvent(events.repair, token, VehToNet(veh), ServerID)
                        end
                    end)

                    RageUI.ButtonWithStyle("Nettoyer le véhicule", "Permet de réparer le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            CleanVeh()
                        end
                    end)

                    RageUI.ButtonWithStyle("Mettre le véhicule en fourrière", "Permet de Mettre le véhicule le plus proche en fourrière.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            TriggerServerEvent(events.DelEntity, token, VehToNet(veh))
                        end
                    end)

                    RageUI.ButtonWithStyle("Ouvrir le véhicule", "Permet d'ouvrir le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            OpenVehicle()
                        end
                    end)

                    RageUI.ButtonWithStyle("Ouvrir/Fermer le capot", "Action sur le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                            TriggerServerEvent(events.Opensomething, token, VehToNet(veh), ServerID, 4, not DoorStatus.capot)
                            DoorStatus.capot = not DoorStatus.capot
                        end
                    end)

                    RageUI.ButtonWithStyle("Ouvrir/Fermer le coffre", "Action sur le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                            TriggerServerEvent(events.Opensomething, token, VehToNet(veh), ServerID, 5, not DoorStatus.coffre)
                            DoorStatus.coffre = not DoorStatus.coffre
                        end
                    end)


                end, function()
                    ---Panels
                
                end)

                RageUI.IsVisible(RMenu:Get('core', 'animation'), true, true, true, function()
                    for k,v in pairs(animations) do
                        RageUI.ButtonWithStyle(v.nom, "Effectue l'animation ~g~"..v.command, {}, true, function(Hovered, Active, Selected)
                            if Selected then
                                ExecuteCommand(v.command)
                            end
                        end)
                    end

                end, function()
                    ---Panels
                
                end)

            end
        end)
    end
    
    
    function OpenVehicle()
        TaskStartScenarioInPlace(GetPlayerPed(-1), 'WORLD_HUMAN_WELDING', 0, true)
        Wait(10*1000)
        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
        local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
        TriggerServerEvent(events.OpenVeh, token, ServerID, VehToNet(veh))
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
    
    
    function CleanVeh()
        TaskStartScenarioInPlace(GetPlayerPed(-1), 'WORLD_HUMAN_MAID_CLEAN', 0, true)
        Citizen.Wait(10000)
        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
        local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
        TriggerServerEvent(events.OpenVeh, token, ServerID, VehToNet(veh))
        ClearPedTasksImmediately(GetPlayerPed(-1))
        rUtils.Notif("~g~Action terminé.")
    end
    


end

function ClosetVehWithDisplay()
    local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
    local vCoords = GetEntityCoords(veh)
    DrawMarker(2, vCoords.x, vCoords.y, vCoords.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
end