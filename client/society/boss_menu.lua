local open = false

RMenu.Add('core', 'boss_menu', RageUI.CreateMenu("Menu Patron", "~b~Menu action patron"))
RMenu.Add('core', 'boss_menu_promote', RageUI.CreateSubMenu(RMenu:Get('core', 'boss_menu'), "PROMOTION"))
RMenu:Get('core', 'boss_menu').Closed = function()
    open = false
end


local society = nil
local societyLabels = {} 
function OpenBossMenu(_society)
    society = _society
    TriggerServerEvent("rF:GetSocietyInfos", token, _society)
    RageUI.Visible(RMenu:Get('core', 'boss_menu'), true)
    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'boss_menu'), true, true, true, function()
                RageUI.Separator("Géstion société: ~b~"..society.."")
                RageUI.Separator("Compte de société: ~b~"..rUtils.Math.GroupDigits(pSocietyTable.money).."")
                RageUI.Button("Recruter la personne la plus proche", "Permet de recruter la personne la plus proche de vous.", {}, true, function(_,h,s)
                    if s then 
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        TriggerServerEvent("rF:ChangeOtherPlayerJob", token, cSid, pJob)
                    end
                    if h then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

                RageUI.Button("Virer la personne la plus proche", "Permet de virer la personne la plus proche de vous.", {}, true, function(_,h,s)
                    if s then 
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        TriggerServerEvent("rF:ResetPlayerJob", token, cSid)
                    end
                    if h then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

                RageUI.Button("Promouvoir la personne", nil, { RightLabel = "→" }, true, function(_,_,s)
                    if s then
                        societyLabels = GetSocietyLabels(society)
                    end
                end, RMenu:Get('core', 'boss_menu_promote'))

                RageUI.Button("Déposer de l'argent", nil, {}, true, function(_,_,s)
                    if s then 
                        local amount = BankCustomAmount()
                        if amount <= pMoney then
                            TriggerServerEvent("rF:PaySociety", token, pJob, amount)
                            TriggerServerEvent("rF:GetSocietyInfos", token, society) -- Refresh
                        end
                    end
                end)


                RageUI.Button("Retiré de l'argent", nil, {}, true, function(_,_,s)
                    if s then 
                        local amount = BankCustomAmount()
                        if amount <= pSocietyTable.money then
                            TriggerServerEvent("rF:TakeMoneyFromSociety", token, pJob, amount)
                            TriggerServerEvent("rF:GetSocietyInfos", token, society) -- Refresh
                        end
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'boss_menu_promote'), true, true, true, function()
                RageUI.Separator("Géstion société: ~b~"..society.."")

                for k,v in pairs(societyLabels) do
                    RageUI.Button("Promouvoir -> "..v.label, nil, {}, true, function(_,h,s)
                        if s then 
                            local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                            local cSid = GetPlayerServerId(ClosetPlayer)
                            TriggerServerEvent("rF:ChangePlayerJobGrade", token, cSid, k)
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