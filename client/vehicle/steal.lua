

function InitStealVeh()
    Citizen.CreateThread(function()
        while true do
            Wait(1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(pPed))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(pPed))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                end
                --local pedd = GetPedInVehicleSeat(veh, -1)
                --if pedd then
                --    SetPedCanBeDraggedOut(pedd, false)
                --end
            else
                Wait(50)
            end
        end
    end)

    local allowed = {
        ["police"] = true,
        ["medecin"] = true,
    }
    Citizen.CreateThread(function()
        while true do
            if IsPedInAnyPoliceVehicle(pPed) then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(pPed, false), -1) == pPed then
                    print(pJob, allowed[pJob])
                    if allowed[pJob] == nil then
                        rUtils.ImportantNotif("Un système de sécurité t'empêche de démarré")
                        SetVehicleUndriveable(GetVehiclePedIsIn(pPed, false), true)
                    else
                        SetVehicleUndriveable(GetVehiclePedIsIn(pPed, false), false)
                    end
                end
            end
            Wait(1500)
        end
    end)
end