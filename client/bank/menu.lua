local open = false
RMenu.Add('core', 'atm', RageUI.CreateMenu("", "~b~Menu ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
    KillBankCam()
    open = false
end

RMenu.Add('core', 'atm_deposer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_deposer').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
end
RMenu.Add('core', 'atm_retirer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_retirer').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
end
RMenu.Add('core', 'transaction', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'transaction').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
end

function OpenATM()
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
    RageUI.Visible(RMenu:Get('core', 'atm'), true)
    open = true 
    while open do
        Wait(1)
        RageUI.IsVisible(RMenu:Get('core', 'atm'), true, true, true, function()
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            RageUI.Button("Déposer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_deposer'))
            RageUI.Button("Retirer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_retirer'))
            RageUI.Button("Liste des transactions", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'transaction'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_deposer'), true, true, true, function()
            RageUI.Separator("Poche: ~b~"..rUtils.Math.GroupDigits(pMoney).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Déposer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        if v <= pMoney then
                            PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                            TriggerServerEvent("rF:MoveMoneyToBank", token, v)
                            TriggerServerEvent("rF:GetPlayerAccounts", token)
                            AddBankTransaction("Dépot de ~g~"..v.."~w~$")
                        end
                    end
                end)
            end
            RageUI.Button("Montant personnalisé", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then
                    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                    local montant = BankCustomAmount()
                    if montant ~= 0 and montant ~= nil then
                        if montant <= pMoney then
                            TriggerServerEvent("rF:MoveMoneyToBank", token, montant)
                            TriggerServerEvent("rF:GetPlayerAccounts", token)
                            PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                            AddBankTransaction("Dépot de ~g~"..montant.."~w~$")
                        end
                    end
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_retirer'), true, true, true, function()
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Retirer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                        TriggerServerEvent("rF:MoveMoneyFromBankToPlayer", token, v)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                        AddBankTransaction("Retrait de ~r~"..v.."~w~$")
                    end
                end)
            end
            RageUI.Button("Montant personnalisé", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then
                    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                    local montant = BankCustomAmount()
                    if montant ~= 0 and montant ~= nil then
                        TriggerServerEvent("rF:MoveMoneyFromBankToPlayer", token, montant)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                        PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                        AddBankTransaction("Retrait de ~r~"..montant.."~w~$")
                    end
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'transaction'), true, true, true, function()
            RageUI.Button("Clear les transactions", nil, {}, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)ClearTransaction() end
            end)
            if #bankTransaction == 0 then
                RageUI.Button("Aucune transaction", nil, {}, true, function(_,_,s)
                    if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
                end)
            else

            end
            for k,v in pairs(bankTransaction) do
                RageUI.Button(v, nil, {}, true, function(_,_,s)
                    if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)end
                end)
            end
        end, function()
        end)
    end
end


function BankCustomAmount()
    local montant = nil
    AddTextEntry("BANK_CUSTOM_AMOUNT", "Entrez le montant")
    DisplayOnscreenKeyboard(1, "BANK_CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        montant = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(montant)
end