local open = false
RMenu.Add('core', 'job_cloth', RageUI.CreateMenu("Véstiaire", "~b~Véstiaire de metier."))
RMenu:Get('core', 'job_cloth').Closed = function()
    open = false
end

RMenu.Add('core', "job_cloth_femme", RageUI.CreateSubMenu(RMenu:Get('core', 'job_cloth'), "Véstiaire", "~b~Véstiaire de metier."))
RMenu:Get('core', "job_cloth_femme").Closed = function()

end

RMenu.Add('core', "job_cloth_homme", RageUI.CreateSubMenu(RMenu:Get('core', 'job_cloth'), "Véstiaire", "~b~Véstiaire de metier."))
RMenu:Get('core', "job_cloth_homme").Closed = function()

end


function OpenClothZoneMenu(cloths)
    if open then return end
    RageUI.Visible(RMenu:Get('core', 'job_cloth'), not RageUI.Visible(RMenu:Get('core', 'job_cloth')))

    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'job_cloth'), true, true, true, function()
                RageUI.ButtonWithStyle("Tenue civil", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then
                        exports.rFramework:ReloadPlayerCloth()
                        PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
                    end
                end)

                RageUI.ButtonWithStyle("Tenues Homme", nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                end, RMenu:Get('core', 'job_cloth_homme'))
                RageUI.ButtonWithStyle("Tenues Femme", nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                end, RMenu:Get('core', 'job_cloth_femme'))

            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('core', 'job_cloth_femme'), true, true, true, function()
                for _,v in pairs(cloths.femme) do
                    RageUI.ButtonWithStyle(v.name, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            for k,i in pairs(v.cloth) do
                                TriggerEvent("skinchanger:change", k, i)
                            end
                            PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
                        end
                    end)
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('core', 'job_cloth_homme'), true, true, true, function()
                for _,v in pairs(cloths.homme) do
                    RageUI.ButtonWithStyle(v.name, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            for k,i in pairs(v.cloth) do
                                TriggerEvent("skinchanger:change", k, i)
                            end
                            PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
                        end
                    end)
                end
            end, function()
            end)

        end
    end)

end