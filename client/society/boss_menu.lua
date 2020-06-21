local open = false

RMenu.Add('core', 'boss_menu', RageUI.CreateMenu("Menu Patron", "~b~Menu action patron"))
RMenu.Add('core', 'boss_menu_promote', RageUI.CreateSubMenu(RMenu:Get('core', 'boss_menu'), "PROMOTION"))
RMenu:Get('core', 'boss_menu_promote').Closed = function()end
RMenu:Get('core', 'boss_menu').Closed = function()
    open = false
end


local society = nil
local societyLabels = {} 
function OpenBossMenu(_society)
    society = _society
    TriggerServerEvent(events.GetSocInfo, token, _society)
    RageUI.Visible(RMenu:Get('core', 'boss_menu'), true)
    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'boss_menu'), true, true, true, function()
                RageUI.Separator("Géstion société: ~b~"..society.."")
                RageUI.Separator("Compte de société: ~b~"..rUtils.Math.GroupDigits(pSocietyTable.money).."")
                RageUI.ButtonWithStyle("Recruter la personne la plus proche", "Permet de recruter la personne la plus proche de vous.", {}, true, function(_,h,s)
                    if s then 
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        TriggerServerEvent(events.changeJob, token, cSid, pJob)
                    end
                    if h then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

                RageUI.ButtonWithStyle("Virer la personne la plus proche", "Permet de virer la personne la plus proche de vous.", {}, true, function(_,h,s)
                    if s then 
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        TriggerServerEvent(events.resetJob, token, cSid)
                    end
                    if h then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

                RageUI.ButtonWithStyle("Promouvoir la personne", nil, { RightLabel = "→" }, true, function(_,_,s)
                    if s then
                        societyLabels = GetSocietyLabels(society)
                    end
                end, RMenu:Get('core', 'boss_menu_promote'))

                RageUI.ButtonWithStyle("Déposer de l'argent", nil, {}, true, function(_,_,s)
                    if s then 
                        local amount = BankCustomAmount()
                        if amount <= pMoney then
                            TriggerServerEvent(events.facturePaySociety, token, pJob, amount)
                            TriggerServerEvent(events.GetSocInfo, token, society) -- Refresh
                        end
                    end
                end)


                RageUI.ButtonWithStyle("Retiré de l'argent", nil, {}, true, function(_,_,s)
                    if s then 
                        local amount = BankCustomAmount()
                        if amount <= pSocietyTable.money then
                            TriggerServerEvent(events.takeMFromSoc, token, pJob, amount)
                            TriggerServerEvent(events.GetSocInfo, token, society) -- Refresh
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Blanchir de l'argent", "Permet de déposé de l'argent sale qui sera convertie en argent propre (50%). ~r~Attention, le fisc surveille!", {}, true, function(_,_,s)
                    if s then 
                        local amount = BankCustomAmount()
                        if amount <= pDirty then
                            TriggerServerEvent(events.washM, token, society, amount)
                            pDirty = pDirty - amount
                            TriggerServerEvent(events.GetSocInfo, token, society) -- Refresh
                        end
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'boss_menu_promote'), true, true, true, function()
                RageUI.Separator("Géstion société: ~b~"..society.."")

                for k,v in pairs(societyLabels) do
                    RageUI.ButtonWithStyle("Promouvoir -> "..v.label, nil, {}, true, function(_,h,s)
                        if s then 
                            local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                            local cSid = GetPlayerServerId(ClosetPlayer)
                            TriggerServerEvent(events.ChangePGrade, token, cSid, k)
                        end
                        if h then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)
                end

            end, function()
            end)
        end
    end)
end