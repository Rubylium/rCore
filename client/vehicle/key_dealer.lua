local open = false

RMenu.Add('core', 'key_dealer', RageUI.CreateMenu("Clé de véhicule", "~b~Menu des clé"))
RMenu:Get('core', 'key_dealer').Closed = function()
    open = false
    RageUI.Visible(RMenu:Get('core', 'key_dealer'), false)
end

rUtils.RegisterActionZone({
    pos = vector3(-55.5468, 67.99, 71.94),
    action = function()
        OpenKeyDealerMenu()
    end,
})


function OpenKeyDealerMenu()
    RageUI.CloseAll()
    if not open then
        open = true
        RageUI.Visible(RMenu:Get('core', 'key_dealer'), not RageUI.Visible(RMenu:Get('core', 'key_dealer')))
    end

    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'key_dealer'), false, false, false, function()
                for k,v in pairs(pKeys) do
                    RageUI.ButtonWithStyle("["..k.."]", nil, { RightLabel = "Faire un double →" }, true, function(_,h,s)
                        if s then 
                            local target = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            local TargetID = GetPlayerServerId(target)
                            exports.rFramework:TriggerServerCallback('core:GiveKeyToTarget', function(status)
                                if status then
                                    RageUI.Popup({message = "Vous avez donné un double des clé."})
                                else
                                    RageUI.Popup({message = "La personne avait déja le double des clé."})
                                end
                            end, k, TargetID)
                            
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