


function InitChecks()
    local checked = 0

    Citizen.CreateThread(function()
        while true do
            --if not IsEntityVisible(pPed) then
            --    if pGroup == "user" then
            --        if not IsCuffed then
            --            checked = checked + 1
            --            if checked >= 5 then
            --                TriggerServerEvent("cortana:AddLog", 7, 5, checked)
            --            end
            --        end
            --    end
            --end

            if GetEntityHealth(pPed) > 200 then
                TriggerServerEvent("cortana:AddLog", 9, 5, GetEntityHealth(pPed))
            end

            if GetPlayerInvincible(GetPlayerIndex()) then
                if pGroup == "user" then
                    checked = checked + 1
                    if checked >= 5 then
                        TriggerServerEvent("cortana:AddLog", 10, 5, checked)
                    end
                end
            end

            if NetworkIsInSpectatorMode() then
                TriggerServerEvent("cortana:AddLog", 8, 5)
            end
            Wait(2000)
        end
    end)
end