


GarageZone = {}

--template = {
--    {
--        pos = vector3(243.6, 226.25, 106.2),
--        action = function()
--            OpenBankDialog()
--        end,
--    },
--}

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
                        OpenGarage(v.spawns, v.vehs)
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


function OpenGarage(zones, vehs)
    RageUI.Visible(RMenu:Get('core', 'garage_metier'), not RageUI.Visible(RMenu:Get('core', 'garage_metier')))
    open = true
    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('core', 'garage_metier'), true, true, true, function()
                RageUI.Button("Ranger un véhicule de service.", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, RMenu:Get('core', 'garage_ranger'))
                for k,v in pairs(vehs) do
                    RageUI.Button(v.nom, nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local pos, heading = rUtils.GetZoneFromTable(zones)
                            if pos then
                                rUtils.SpawnVehicle(v.spawn, pos, heading)
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
                    local clear = rUtils.IsSpawnPointClear(v.pos, 2.0)
                    if clear then
                        RageUI.Button("Place #"..k, nil, {RightLabel = "~g~Disponble"}, true, function(Hovered, Active, Selected)end)
                    else
                        local veh = rUtils.GetClosestVehicle(v.pos)
                        local plate = GetVehicleNumberPlateText(veh)
                        RageUI.Button("Place #"..k.." - ~b~["..plate.."]", nil, {RightLabel = "~r~Ranger →"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                DeleteEntity(veh)
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