local maxMoney = 6000
avalaibleBraquo = {}


RegisterNetEvent("core:GetSupStatus")
AddEventHandler("core:GetSupStatus", function(status)
    if not status then
        rUtils.ImportantNotif("Tu ne peux pas braquer ici pour l'instant ....")
    else
        maxMoney = 6000
        StartBraquo()
    end
end)


function FoundNearestSup()
    if not IsPedArmed(pPed, 7) then rUtils.ImportantNotif("Apu rigole en te voyant essayer de braquer sans arme.") return end

    local pCoords = GetEntityCoords(pPed)
    local NearestDst = 999999
    local Nearest = 0
    for k,v in pairs(avalaibleBraquo) do
        local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
        if dst < NearestDst then
            NearestDst = dst
            Nearest = k
        end
    end
    TriggerServerEvent(events.StartSup, token, Nearest)

end


function StartBraquo()
    SetAudioFlag("LoadMPData", true)
    local braquo = GetEntityCoords(pPed)
    Citizen.CreateThread(function()
        rUtils.ImportantNotif("Tu commences le braquage, tiens 1m avant de commencer à gagner de l'argent!")
        for i = 1,60 do
            Wait(1000)
            local pCoords = GetEntityCoords(pPed)
            local dst = GetDistanceBetweenCoords(braquo, pCoords, true)
            if dst > 9.0 then
                rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                return
            end
        end

        while maxMoney >= 0 do
            local money = math.random(50,100)
            rUtils.ImportantNotif("~g~+ "..money)
            TriggerServerEvent(events.GiveDirty, token, money)
            PlaySoundFrontend(-1, "LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)

            local pCoords = GetEntityCoords(pPed)
            local dst = GetDistanceBetweenCoords(braquo, pCoords, true)
            if dst > 9.0 then
                rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                return
            end
            Wait(3000)
        end

        rUtils.ImportantNotif("Braquage terminé, la caisse est vide!")
    end)
end