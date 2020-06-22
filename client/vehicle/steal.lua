

function InitStealVeh()

    local allowed = {
        ["police"] = true,
        ["medecin"] = true,
        ["sheriff"] = true,
    }
    Citizen.CreateThread(function()
        while true do
            if IsPedInAnyPoliceVehicle(pPed) then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(pPed, false), -1) == pPed then
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