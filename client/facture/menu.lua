RMenu.Add('core', 'facture_cree', RageUI.CreateMenu("", "~b~FACTURE", nil, nil, "root_cause", "shopui_title_fleecabank"))

RMenu.Add('core', 'facture_voir', RageUI.CreateMenu("", "~b~FACTURE", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'facture_voir').Closable = false

local IsSocietyBill = false
local society = nil
local raison = nil
local montant = nil
local sourceID = nil

function OpenBillCreation()
    IsSocietyBill = false
    society = nil
    raison = nil
    montant = nil
    RageUI.Visible(RMenu:Get('core', 'facture_cree'), true)
end

RegisterNetEvent("core:GetFacture")
AddEventHandler("core:GetFacture", function(_IsSocietyBill, _society, _raison, _montant, _sourceID)
    IsSocietyBill = _IsSocietyBill
    society = _society
    raison = _raison
    montant = _montant
    sourceID = _sourceID
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    RageUI.Visible(RMenu:Get('core', 'facture_voir'), true)
end)


Citizen.CreateThread(function()
    while true do
        local open = false

        RageUI.IsVisible(RMenu:Get('core', 'facture_cree'), true, true, true, function()
            open = true

            RageUI.Checkbox("Facture de société ?", nil, IsSocietyBill, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                IsSocietyBill = Checked;
            end)

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
                    if raison ~= nil and montant ~= nil then
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        print(cSid)
                        TriggerServerEvent("core:SendFacture", token, cSid, IsSocietyBill, pJob, raison, montant)
                        RageUI.CloseAll()
                    end
                end
                if h then
                    rUtils.DisplayClosetPlayer()
                end
            end)

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'facture_voir'), true, true, true, function()
            open = true

            if IsSocietyBill then
                RageUI.Separator("Facture: ~b~"..society)
            end

            RageUI.Separator("Raison: "..raison)
            RageUI.Separator("Montant: ~g~"..montant.."~w~$")

            RageUI.ButtonWithStyle("~g~Payer la facture", nil, {}, true, function(_,h,s)
                if s then 
                    if pMoney > montant then
                        if not IsSocietyBill then
                            TriggerServerEvent("rF:GiveMoneyToPlayer", token, sourceID, montant)
                            TriggerServerEvent("core:PayFacture", token, sourceID, montant)
                            RageUI.CloseAll()
                        else
                            print(society, montant)
                            TriggerServerEvent("rF:PaySociety", token, society, montant)
                            TriggerServerEvent("core:PayFactureSociety", token, sourceID, montant)
                            RageUI.CloseAll()
                        end
                    else
                        TriggerServerEvent("core:CantPayFacture", token, sourceID, montant)
                        RageUI.CloseAll()
                    end
                end
            end)
            RageUI.ButtonWithStyle("~r~Refuser la facture", nil, {}, true, function(_,h,s)
                if s then 
                    if raison ~= nil and montant ~= nil then
                        TriggerServerEvent("core:CancelFacture", token, sourceID, montant)
                        RageUI.CloseAll()
                    end
                end
            end)

        end, function()
        end)

        if not open then
            Wait(550)
        else
            Wait(1)
        end
    end
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