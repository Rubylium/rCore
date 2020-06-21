local open = false
RMenu.Add('core', 'atm', RageUI.CreateMenu("", "~b~Menu ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm').Closed = function()
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
    KillBankCam()
    open = false
end

RMenu.Add('core', 'atm_deposer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_deposer').Closed = function()
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
end
RMenu.Add('core', 'atm_retirer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_retirer').Closed = function()
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
end
RMenu.Add('core', 'transaction', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'transaction').Closed = function()
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
end

function OpenATM()
    if open then return end
    TriggerServerEvent(events.GetAccs, token)
    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
    RageUI.Visible(RMenu:Get('core', 'atm'), true)
    open = true 
    while open do
        Wait(1)
        RageUI.IsVisible(RMenu:Get('core', 'atm'), true, true, true, function()
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            RageUI.ButtonWithStyle("Déposer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_deposer'))
            RageUI.ButtonWithStyle("Retirer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_retirer'))
            RageUI.ButtonWithStyle("Liste des transactions", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'transaction'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_deposer'), true, true, true, function()
            RageUI.Separator("Poche: ~b~"..rUtils.Math.GroupDigits(pMoney).."$")
            for k,v in pairs(bank_template) do
                RageUI.ButtonWithStyle("Déposer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        if v <= pMoney then
                            PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
                            TriggerServerEvent(events.mTOb, token, v)
                            TriggerServerEvent(events.GetAccs, token)
                            AddBankTransaction("Dépot de ~g~"..v.."~w~$")
                        end
                    end
                end)
            end
            RageUI.ButtonWithStyle("Montant personnalisé", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then
                    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
                    local montant = BankCustomAmount()
                    if montant ~= 0 and montant ~= nil then
                        if montant <= pMoney then
                            TriggerServerEvent(events.mTOb, token, montant)
                            TriggerServerEvent(events.GetAccs, token)
                            PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
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
                RageUI.ButtonWithStyle("Retirer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
                        TriggerServerEvent(events.bTOm, token, v)
                        TriggerServerEvent(events.GetAccs, token)
                        AddBankTransaction("Retrait de ~r~"..v.."~w~$")
                    end
                end)
            end
            RageUI.ButtonWithStyle("Montant personnalisé", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then
                    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
                    local montant = BankCustomAmount()
                    if montant ~= 0 and montant ~= nil then
                        TriggerServerEvent(events.bTOm, token, montant)
                        TriggerServerEvent(events.GetAccs, token)
                        PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
                        AddBankTransaction("Retrait de ~r~"..montant.."~w~$")
                    end
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'transaction'), true, true, true, function()
            RageUI.ButtonWithStyle("Clear les transactions", nil, {}, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)ClearTransaction() end
            end)
            if #bankTransaction == 0 then
                RageUI.ButtonWithStyle("Aucune transaction", nil, {}, true, function(_,_,s)
                    if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1) end
                end)
            else

            end
            for k,v in pairs(bankTransaction) do
                RageUI.ButtonWithStyle(v, nil, {}, true, function(_,_,s)
                    if s then PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)end
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