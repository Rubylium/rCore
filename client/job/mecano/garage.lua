 
function InitMecanoGarage()

    rUtils.RegisterActionZone({
        pos = vector3(-72.29856, -1831.298, 26.94192),
        action = function()
            OpenMecanoGarage()
        end,
    })

    local PointDeSortie = {
        {pos = vector3(-51.91622, -1849.206, 25.96384),heading = 319.05490112304,},
        {pos = vector3(-54.68558, -1847.056, 26.06774),heading = 320.70498657226,},
        {pos = vector3(-57.65594, -1844.994, 26.17956),heading = 319.84939575196,},
        {pos = vector3(-59.94758, -1842.738, 26.27342),heading = 319.0474243164,},
        {pos = vector3(-62.8511, -1840.458, 26.37832),heading = 318.3576965332,},
    }

    local vehs = {
        {spawn = "flatbed", nom = "flatbed"},
        {spawn = "dloader", nom = "Vieux SUV"},
        {spawn = "towtruck", nom = "Véhicule à remorquage"},
        {spawn = "towtruck2", nom = "Véhicule à remorquage 2"},
    }

    RMenu.Add('core', 'mecano_garage', RageUI.CreateMenu("Garage", "~b~Ménu garage mécano"))

    function OpenMecanoGarage()
        RageUI.Visible(RMenu:Get('core', 'mecano_garage'), not RageUI.Visible(RMenu:Get('core', 'mecano_garage')))
    end

    Citizen.CreateThread(function()
        while true do
            local open = false
            RageUI.IsVisible(RMenu:Get('core', 'mecano_garage'), true, true, true, function()
                open = true
            
                for k,v in pairs(vehs) do
                    RageUI.ButtonWithStyle(v.nom, nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local pos, heading = rUtils.GetZoneFromTable(PointDeSortie)
                            if pos then
                                rUtils.SpawnVehicle(GetHashKey(v.spawn), pos, heading)
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