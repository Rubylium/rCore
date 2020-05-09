 
function InitMecanoGarage()

    rUtils.RegisterActionZone({
        pos = vector3(-175.0, -1289.13, 31.29),
        action = function()
            OpenMecanoGarage()
        end,
    })

    local PointDeSortie = {
        {pos = vector3(-187.9, -1290.517, 30.62), heading = 266.71 },
        {pos = vector3(-187.0, -1284.5, 30.59), heading = 270.15 },
    }

    local vehs = {
        {spawn = "blista", nom = "Vehicle de déplacement"}
    }

    RMenu.Add('core', 'mecano_garage', RageUI.CreateMenu("", "~b~Ménu garage mécano"))

    function OpenMecanoGarage()
        RageUI.Visible(RMenu:Get('core', 'mecano_garage'), not RageUI.Visible(RMenu:Get('core', 'mecano_garage')))
    end

    Citizen.CreateThread(function()
        while true do
            local open = false
            RageUI.IsVisible(RMenu:Get('core', 'mecano_garage'), true, true, true, function()
                open = true
            
                for k,v in pairs(vehs) do
                    RageUI.Button(v.nom, nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local pos, heading = rUtils.GetZoneFromTable(PointDeSortie)
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

            if not open then 
                Wait(250)
            else
                Wait(1)
            end
        end
    end)

end