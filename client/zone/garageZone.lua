


GarageZone = {}

RMenu.Add('core', 'garage_metier', RageUI.CreateMenu("Garage", "~b~Ménu garage"))
RMenu.Add('core', 'garage_ranger', RageUI.CreateSubMenu(RMenu:Get('core', 'garage_metier'), "Garage"))
RMenu:Get('core', 'garage_metier').Closed = function()
    open = false
end

Citizen.CreateThread(function()
    while true do
        local NearZone = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(GarageZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < 10.0 then
                NearZone = true
                DrawMarker(36, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                if dst < 2.0 then
                    RageUI.Text({message="Appuyer sur E pour ouvrir le garage."})
                    if IsControlJustReleased(1, 38) then
                        OpenGarage(v.spawns, v.vehs, v.check)
                    end
                    break
                end
            end
        end


        if not NearZone then
            Wait(500)
        else
            Wait(1)
        end
    end
end)


function OpenGarage(zones, vehs, dstCheck)
    RageUI.Visible(RMenu:Get('core', 'garage_metier'), not RageUI.Visible(RMenu:Get('core', 'garage_metier')))
    open = true
    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('core', 'garage_metier'), true, true, true, function()
                RageUI.ButtonWithStyle("Ranger un véhicule de service.", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, RMenu:Get('core', 'garage_ranger'))
                for k,v in pairs(vehs) do
                    RageUI.ButtonWithStyle(v.nom, nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local pos, heading = rUtils.GetZoneFromTable(zones)
                            if pos then
                                rUtils.SpawnVehicle(GetHashKey(v.spawn), pos, heading, _, function(veh)
                                    for i = 1,9 do
                                        SetVehicleExtra(veh, i, false)
                                    end
                                    SetVehicleLivery(veh, 0)
                                    exports.rFramework:TriggerServerCallback('core:AddKeyIfNotAlreadyHave', function(status)
                                        if status then
                                            RageUI.Popup({message = "Vous avez sortie les clé de votre véhicule."})
                                            exports.rFramework:TriggerServerCallback('core:GetKeysBack', function(keys)
                                                pKeys = keys
                                            end, token)
                                        else
                                            RageUI.Popup({message = "Vous avez déja les clé de se véhicule."})
                                        end
                                    end, GetVehicleNumberPlateText(veh))
                                end)

                            else
                                RageUI.Popup({message = "~r~Action impossible~w~\nAucun point de sortie disponible."})
                            end
                        end
                    end)
                end
            
            end, function()
                ---Panels
            end)

            RageUI.IsVisible(RMenu:Get('core', 'garage_ranger'), true, true, true, function()
                for k,v in pairs(zones) do
                    local clear = rUtils.IsSpawnPointClear(v.pos, dstCheck or 2.0)
                    if clear then
                        RageUI.ButtonWithStyle("Place #"..k, nil, {RightLabel = "~g~Disponble"}, true, function(Hovered, Active, Selected)
                            if Active then
                                DrawMarker(43, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 150, 0, 0, 2, 0, nil, nil, 0)
                            end
                        end)
                    else
                        local veh = rUtils.GetClosestVehicle(v.pos)
                        local plate = GetVehicleNumberPlateText(veh)
                        RageUI.ButtonWithStyle("Place #"..k.." - ~b~["..plate.."] "..GetDisplayNameFromVehicleModel(GetEntityModel(veh)), nil, {RightLabel = "~r~Ranger →"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                TriggerServerEvent(events.DelEntity, token, VehToNet(veh))
                            end
                            if Active then
                                DrawMarker(43, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 150, 0, 0, 2, 0, nil, nil, 0)
                            end
                        end)
                    end
                end
            
            end, function()
                ---Panels
            end)
            Wait(1)
        end
    end)
end