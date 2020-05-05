RMenu.Add('core', 'atm', RageUI.CreateMenu("", "~b~Menu ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))

RMenu.Add('core', 'atm_deposer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu.Add('core', 'atm_retirer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))

function OpenATM()
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    RageUI.Visible(RMenu:Get('core', 'atm'), not RageUI.Visible(RMenu:Get('core', 'atm')))
end


Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'atm'), true, true, true, function()
            open = true
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            RageUI.Button("Déposer", nil, { RightLabel = "→→→" }, true, function()
            end, RMenu:Get('core', 'atm_deposer'))
            RageUI.Button("Retirer", nil, { RightLabel = "→→→" }, true, function()
            end, RMenu:Get('core', 'atm_retirer'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_deposer'), true, true, true, function()
            open = true
            RageUI.Separator("Poche: ~b~"..rUtils.Math.GroupDigits(pMoney).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Déposer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        TriggerServerEvent("rF:MoveMoneyToBank", token, v)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                    end
                end)
            end
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_retirer'), true, true, true, function()
            open = true
            RageUI.Separator("Poche: ~b~"..rUtils.Math.GroupDigits(pMoney).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Retirer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        TriggerServerEvent("rF:MoveMoneyFromBankToPlayer", token, v)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                    end
                end)
            end
        end, function()
        end)

        if open then
            Wait(1)
        else
            Wait(100)
        end
    end
end)