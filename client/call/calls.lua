
local takeCall = 38
local DontWantCall = 73
RegisterNetEvent("core:SendCall")
AddEventHandler("core:SendCall", function(id, msg, job)
    rUtils.Notif("~b~Appel "..job.." reçu !\n~o~Message: ~g~"..msg)
    rUtils.ImportantNotif("Prendre: ~g~E\n~w~Refuser: ~r~X")
    local oldTime = GetGameTimer()
    local TooLate = true

    Citizen.CreateThread(function()
        while TooLate do
            if oldTime + 10000 < GetGameTimer() then
                oldTime = GetGameTimer()
                TooLate = false
            end

            if IsControlJustReleased(1, takeCall) then
                TriggerServerEvent(events.CallTake, token, id)
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
AddEventHandler("core:CallTaken", function(dst, pos)
    rUtils.Notif("L'appel à été pris !\nDistance: ~g~"..rUtils.Math.Round(dst, 0).."m")
    local blip = AddBlipForCoord(pos)
    SetBlipScale(blip, 0.65)
    SetBlipColour(blip, 32)
    SetBlipSprite(blip, 365)
    SetBlipRoute(blip, true)
    Wait(2000)
    local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), pos, true)
    while dst > 10.0 do
        dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), pos, true)
        Wait(1000)
    end
    RemoveBlip(blip)
    rUtils.Notif("Vous êtes arrivé sur place.")
end)


RegisterNetEvent("core:CallTakenTarget")
AddEventHandler("core:CallTakenTarget", function(dst, job)
    rUtils.Notif("L'appel à été pris part un "..job.."!\nDistance: ~o~"..rUtils.Math.Round(dst, 0).."m")
end)



RegisterNetEvent("core:SendMsgToJob")
AddEventHandler("core:SendMsgToJob", function(data)
    local message = data.message
    local job = data.number
    if message == nil then
        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 200)
        while UpdateOnscreenKeyboard() == 0 do
            DisableAllControlActions(0)
            Wait(0)
        end
        if GetOnscreenKeyboardResult() then
            message = GetOnscreenKeyboardResult()
        end
    end
    if message ~= nil and message ~= "" then
        message = "["..GetPlayerServerId(GetPlayerIndex()).."] "..message
        TriggerServerEvent(events.RegCall, token, job, message)  
    end
    rUtils.Notif("Votre message à été envoyé.")
end)