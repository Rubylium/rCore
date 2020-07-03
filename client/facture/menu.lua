local open = false
RMenu.Add('core', 'facture_cree', RageUI.CreateMenu("", "~b~FACTURE", nil, nil, "root_cause", "shopui_title_fleecabank"))

RMenu.Add('core', 'facture_voir', RageUI.CreateMenu("", "~b~FACTURE", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'facture_voir').Closable = false
RMenu:Get('core', 'facture_voir').Closed = function()
    open = false
end

local IsSocietyBill = false
local society = nil
local raison = nil
local montant = nil
local sourceID = nil

function OpenBillCreation()
    if open then open = false return end
    IsSocietyBill = false
    society = nil
    raison = nil
    montant = nil
    open = true
    RageUI.Visible(RMenu:Get('core', 'facture_cree'), true)
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'facture_cree'), true, true, true, function()
                open = true
    
                --RageUI.Checkbox("Facture de société ?", nil, IsSocietyBill, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                --    IsSocietyBill = Checked;
                --end, function()
                --    -- check
                --end, function()
                --    -- uncheck
                --end) 
    
                if IsSocietyBill then
                    RageUI.Separator("Facture: ~b~"..pJob.."")
                end
    
                RageUI.ButtonWithStyle("Raison", raison, { RightLabel = "→" }, true, function(_,_,s)
                    if s then 
                        raison = TextImput()
                    end
                end)
    
                if montant == nil then
                    RageUI.ButtonWithStyle("Montant", nil, { RightLabel = "→" }, true, function(_,_,s)
                        if s then 
                            montant = tonumber(TextImput())
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Montant", nil, { RightLabel = montant.."$" }, true, function(_,_,s)
                        if s then 
                            montant = tonumber(TextImput())
                        end
                    end)
                end
    
                RageUI.ButtonWithStyle("Donner la facture", nil, {}, true, function(_,h,s)
                    if s then 
                        if raison ~= nil and montant ~= nil and montant > 0 then
                            local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                            local cSid = GetPlayerServerId(ClosetPlayer)
                            TriggerServerEvent(events.giveFactue, token, cSid, true, pJob, raison, montant)
                            open = false
                            RageUI.CloseAll()
                        end
                    end
                    if h then
                        rUtils.DisplayClosetPlayer()
                    end
                end)
    
            end, function()
            end)

        end
    end)
end



function OpenBillPayMenu()
    if open then open = false return end
    RageUI.Visible(RMenu:Get('core', 'facture_voir'), true)
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'facture_voir'), true, true, true, function()

                if IsSocietyBill then
                    RageUI.Separator("Facture: ~b~"..society)
                end

                RageUI.Separator("Raison: "..raison)
                RageUI.Separator("Montant: ~g~"..montant.."~w~$")

                RageUI.ButtonWithStyle("~g~Payer la facture en liquide", nil, {}, true, function(_,h,s)
                    if s then 
                        if pMoney >= montant then 
                            if not IsSocietyBill then
                                TriggerServerEvent(events.GiveMtoPlayer, token, sourceID, montant)
                                TriggerServerEvent(events.facturePay, token, sourceID, montant)
                                open = false 
                                RageUI.CloseAll()
                            else
                                TriggerServerEvent(events.facturePaySociety, token, society, montant, false)
                                TriggerServerEvent(events.facturePaySociety2, token, sourceID, montant)
                                if society == "concessionnaire" or society == "mecano" then
                                    TriggerServerEvent(events.giveMtoPlayerId, token, montant * 0.01, sourceID)
                                else
                                    TriggerServerEvent(events.giveMtoPlayerId, token, montant / 2, sourceID)
                                end
                                open = false
                                RageUI.CloseAll()
                            end
                        else
                            TriggerServerEvent(events.cantPayFacture, token, sourceID, montant)
                            open = false
                            RageUI.CloseAll()
                        end
                    end
                end)
                RageUI.ButtonWithStyle("~g~Payer la facture avec CB", nil, {}, IsSocietyBill, function(_,h,s)
                    if s then 
                        if pBank >= montant then 
                            TriggerServerEvent(events.facturePaySociety, token, society, montant, true)
                            TriggerServerEvent(events.facturePaySociety2, token, sourceID, montant)
                            if society == "concessionnaire" or society == "mecano" then
                                TriggerServerEvent(events.giveMtoPlayerId, token, montant * 0.01, sourceID)
                            else
                                TriggerServerEvent(events.giveMtoPlayerId, token, montant / 2, sourceID)
                            end
                            open = false 
                            RageUI.CloseAll()
                        else
                            TriggerServerEvent(events.cantPayFacture, token, sourceID, montant)
                            open = false
                            RageUI.CloseAll()
                        end
                    end
                end)
                RageUI.ButtonWithStyle("~r~Refuser la facture", nil, {}, true, function(_,h,s)
                    if s then 
                        if raison ~= nil and montant ~= nil then
                            TriggerServerEvent(events.cancelFacture, token, sourceID, montant)
                            open = false
                            RageUI.CloseAll()
                        end
                    end
                end)

            end, function()
            end)
        end
    end)
end

RegisterNetEvent("core:GetFacture")
AddEventHandler("core:GetFacture", function(_IsSocietyBill, _society, _raison, _montant, _sourceID)
    open = false
    IsSocietyBill = _IsSocietyBill
    society = _society
    raison = _raison
    montant = _montant
    sourceID = _sourceID
    TriggerServerEvent(events.GetAccs, token)
    RageUI.Visible(RMenu:Get('core', 'facture_voir'), true)
    OpenBillPayMenu()
end)




function TextImput()
    local text = nil
    AddTextEntry("CUSTOM_TEXT", "")
    DisplayOnscreenKeyboard(1, "CUSTOM_TEXT", '', "", '', '', '', 150)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        text = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return text
end