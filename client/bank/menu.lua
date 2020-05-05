RMenu.Add('core', 'atm', RageUI.CreateMenu("", "~b~Menu ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
    KillBankCam()
end

RMenu.Add('core', 'atm_deposer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_deposer').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
end
RMenu.Add('core', 'atm_retirer', RageUI.CreateSubMenu(RMenu:Get('core', 'atm'), "", "~b~ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'atm_retirer').Closed = function()
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
end

function OpenATM()
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
    RageUI.Visible(RMenu:Get('core', 'atm'), not RageUI.Visible(RMenu:Get('core', 'atm')))
end


Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'atm'), true, true, true, function()
            open = true
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            RageUI.Button("Déposer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_deposer'))
            RageUI.Button("Retirer", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1) end
            end, RMenu:Get('core', 'atm_retirer'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_deposer'), true, true, true, function()
            open = true
            RageUI.Separator("Poche: ~b~"..rUtils.Math.GroupDigits(pMoney).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Déposer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                        TriggerServerEvent("rF:MoveMoneyToBank", token, v)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                    end
                end)
            end
            RageUI.Button("Montant personnalisé", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                if s then
                    PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                    local montant = BankCustomAmount()
                    if montant ~= 0 and montant ~= nil then
                        TriggerServerEvent("rF:MoveMoneyToBank", token, montant)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
                        PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                    end
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'atm_retirer'), true, true, true, function()
            open = true
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            for k,v in pairs(bank_template) do
                RageUI.Button("Retirer "..rUtils.Math.GroupDigits(v).."$", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then
                        PlaySoundFrontend(-1, "PIN_BUTTON", "ATM_SOUNDS", 1)
                        TriggerServerEvent("rF:MoveMoneyFromBankToPlayer", token, v)
                        TriggerServerEvent("rF:GetPlayerAccounts", token)
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
                    end
                end
            end)
        end, function()
        end)

        if open then
            Wait(1)
        else
            Wait(100)
        end
    end
end)


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