
local takeCall = 246
local DontWantCall = 73
RegisterNetEvent("core:SendCall")
AddEventHandler("core:SendCall", function(id, msg, job)
    rUtils.Notif("~b~Appel "..job.." reçu !\n~o~Message: ~g~"..msg.."~w~\nPrendre: ~g~Y\n~w~Refuser: ~r~X")
    local oldTime = GetGameTimer()
    local TooLate = true

    Citizen.CreateThread(function()
        while TooLate do
            if oldTime + 10000 < GetGameTimer() then
                oldTime = GetGameTimer()
                TooLate = false
            end

            if IsControlJustReleased(1, takeCall) then
                TriggerServerEvent("core:TakeCall", id)
                return
            end

            if IsControlJustReleased(1, DontWantCall) then
                rUtils.Notif("Appel refusé.")
                return
            end
    
            Wait(0)
        end
    end)

end)


RegisterNetEvent("core:CallTaken")
AddEventHandler("core:CallTaken", function(pos)
    local dst = GetDistanceBetweenCoords(pos, GetEntityCoords(pPed), true)
    rUtils.Notif("L'appel à été pris !\nDistance: "..rUtils.Round(dst, 0))

end)


RegisterNetEvent("core:CallTakenTarget")
AddEventHandler("core:CallTakenTarget", function(coords)
    local dst = GetDistanceBetweenCoords(coords, GetEntityCoords(pPed), true)
    rUtils.Notif("L'appel à été pris !\nDistance: "..rUtils.Round(dst, 0))
end)
