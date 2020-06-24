
RegisterNetEvent("core:UseMedikit")
AddEventHandler("core:UseMedikit", function()
    local target, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
    if dst < 3.0 then
        local targetID = GetPlayerServerId(target)
        exports.rFramework:TriggerServerCallback('core:CheckPlayerDeathStatus', function(status)
            if status == 1 then
                RageUI.Popup({message = "Vous commencez à soigner la personne.\nLes soins vont duré 30 secondes."})
                TaskStartScenarioInPlace(pPed, "CODE_HUMAN_MEDIC_KNEEL", -1, true)
                local oldTime = GetGameTimer()
                local StillWant = true

                Citizen.CreateThread(function()
                    while StillWant do
                        RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
                        if IsControlPressed(1, 73) then
                            StillWant = false
                            ClearPedTasks(GetPlayerPed(-1))
                        end
                        Wait(1)
                    end
                end)
            
                Citizen.CreateThread(function()
                    while StillWant do
                        if oldTime + 30000 < GetGameTimer() then
                            oldTime = GetGameTimer()
                            ClearPedTasks(pPed)
                            TriggerServerEvent(events.ResetDeath, token, targetID)
                            StillWant = false
                            TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("medikit"), 1)
                        end
                        Wait(0)
                    end
                end)
                
            elseif status == 2 then
                RageUI.Popup({message = "La personne à besoin d'un médecin."})
            else
                RageUI.Popup({message = "La personne n'a pas besoin de soin."})
            end
        end, targetID) 
    else
        RageUI.Popup({message = "Aucune personne proche."})
    end
end) 