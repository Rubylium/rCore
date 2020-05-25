local open = false
RMenu.Add('core', 'job_cloth', RageUI.CreateMenu("Magasin vètement", "~b~Géstion des vétement de votre personnage."))
RMenu:Get('core', 'job_cloth').Closed = function()
    open = false
end


function OpenClothShop(cloths)
    RageUI.Visible(RMenu:Get('core', 'job_cloth'), not RageUI.Visible(RMenu:Get('core', 'job_cloth')))

    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'job_cloth'), true, true, true, function()

                for k,v in pairs(cloths)
                    RageUI.Button(v.name, nil, { RightLabel = "→→" }, true, function()
                    end)
                end


            end, function()
            end)

        end
    end)

end