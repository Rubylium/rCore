local open = false
RMenu.Add('core', 'job_cloth', RageUI.CreateMenu("Véstiaire", "~b~Véstiaire de votre metier."))
RMenu:Get('core', 'job_cloth').Closed = function()
    open = false
end


function OpenClothZoneMenu(cloths)
    RageUI.Visible(RMenu:Get('core', 'job_cloth'), not RageUI.Visible(RMenu:Get('core', 'job_cloth')))

    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'job_cloth'), true, true, true, function()
                RageUI.Button("Tenue civil", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then
                        exports.rFramework:ReloadPlayerCloth()
                        PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
                    end
                end)
                for _,v in pairs(cloths) do
                    RageUI.Button(v.name, nil, { RightLabel = "→→" }, true, function(_,_,s)
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