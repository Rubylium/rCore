

function InitTeleportZone(zones)
    local zone = zones
    

    Citizen.CreateThread(function()
        while true do
            local pCoords = GetEntityCoords(pPed)
            local InTeleport = false
            for k,v in pairs(zone) do
                local dst = #(pCoords - v.from)
                if dst <= 1.5 then
                    InTeleport = true
                    rUtils.ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour "..v.label)
                    if IsControlJustReleased(1, 38) then
                        SetEntityCoordsNoOffset(pPed, v.to, 0.0, 0.0, 0.0)
                        FreezeEntityPosition(pPed, true)
                        Wait(2000)
                        FreezeEntityPosition(pPed, false)
                        SetEntityCoordsNoOffset(pPed, v.to, 0.0, 0.0, 0.0)
                    end
                end
            end

            if InTeleport then
                Wait(1)
            else
                Wait(500)
            end
        end
    end)
end