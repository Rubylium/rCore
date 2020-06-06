

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

end