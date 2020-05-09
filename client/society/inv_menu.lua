

RMenu.Add('core', 'society_inv', RageUI.CreateMenu("Inventaire Société", "~b~Géstion des stocks"))
RMenu.Add('core', 'society_inv_player', RageUI.CreateSubMenu(RMenu:Get('core', 'society_inv'), "Iventaire Société"))
RMenu.Add('core', 'society_inv_inv', RageUI.CreateSubMenu(RMenu:Get('core', 'society_inv'), "Iventaire Société"))


function OpenSocietyInvMenu()
    RageUI.Visible(RMenu:Get('core', 'society_inv'), true)
end


Citizen.CreateThread(function()
    while true do
        local open = false

        RageUI.IsVisible(RMenu:Get('core', 'society_inv'), true, true, true, function()
            open = true
            RageUI.Separator("Géstion société: ~b~"..pJob.."")
            RageUI.Button("Déposer des objets", nil, { RightLabel = "→" }, true, function(_,_,s)
                if s then
                    TriggerServerEvent("rF:GetPlayerInventory")
                end
            end, RMenu:Get('core', 'society_inv_player'))

            RageUI.Button("Prendre des objets", nil, { RightLabel = "→" }, true, function(_,_,s)
                if s then
                    TriggerServerEvent("rF:GetSocietyInfos", token, pJob)
                end
            end, RMenu:Get('core', 'society_inv_inv'))
        end)

        RageUI.IsVisible(RMenu:Get('core', 'society_inv_player'), true, true, true, function()
            open = true
            RageUI.Separator("Géstion société: ~b~"..pJob.."")
            for k,v in pairs(pInventory) do
                if v.olabel == v.label then
                    RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            local amount = CustomAmount()
                            if amount <= v.count then
                                TriggerServerEvent("rF:TransferItemFromInvToSociety", token, pJob, v.name, v.label, v.olabel, amount)
                                TriggerServerEvent("rF:GetPlayerInventory")
                                RageUI.Visible(RMenu:Get('core', 'society_inv_player'), true)
                            end
                        end
                    end)
                else
                    RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            local amount = CustomAmount()
                            if amount <= v.count then
                                TriggerServerEvent("rF:TransferItemFromInvToSociety", token, pJob, v.name, v.label, v.olabel, amount)
                                TriggerServerEvent("rF:GetPlayerInventory")
                                RageUI.Visible(RMenu:Get('core', 'society_inv_player'), true)
                            end
                        end
                    end)
                end
            end
        end)

        RageUI.IsVisible(RMenu:Get('core', 'society_inv_inv'), true, true, true, function()
            open = true
            RageUI.Separator("Géstion société: ~b~"..pJob.."")
            for k,v in pairs(pSocietyTable.inventory) do
                RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local amount = CustomAmount()
                        if amount <= v.count then
                            TriggerServerEvent("rF:TransferItemFromSocietyToInv", token, pJob, v.name, v.label, v.olabel, amount)
                            TriggerServerEvent("rF:GetSocietyInfos", token, pJob)
                            RageUI.Visible(RMenu:Get('core', 'society_inv_inv'), true)
                        end
                    end
                end)
            end
        end)


        if open then
            Wait(1)
        else
            Wait(250)
        end
    end
end)