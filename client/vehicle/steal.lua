

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
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            else
                Wait(50)
            end
        end
    end)
end