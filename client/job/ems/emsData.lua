

 
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

                end, function()
                    ---Panels
                end)


            end
        end)
    end    

end