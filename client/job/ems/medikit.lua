
RegisterNetEvent("core:UseMedikit")
AddEventHandler("core:UseMedikit", function()
    local target, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
    if dst < 3.0 then
        local targetID = GetPlayerServerId(target)
        exports.rFramework:TriggerServerCallback('core:CheckPlayerDeathStatus', function(status)
            if status == 1 then
                RageUI.Popup({message = "Vous commencez à soigner la personne.\nLes soins vont duré 30 secondes."})
                TaskStartScenarioInPlace(pPed, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", -1, true)
                Wait(30*1000)
                ClearPedTasks(pPed)
                TriggerServerEvent("core:ResetDeathStatus", targetID)
            elseif status == 2 then
                RageUI.Popup({message = "La personne à besoin d'un médecin."})
            else
                RageUI.Popup({message = "La personne n'a pas besoin de soin."})
            end
        end, TargetID)
    else
        RageUI.Popup({message = "Aucune personne proche."})
    end
end)