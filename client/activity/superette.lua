
local maxMoney = 5000
avalaibleBraquo = {}
local inBraquo = false

function InitBraquageSup()

    Citizen.CreateThread(function()
        for k,v in pairs(avalaibleBraquo) do
            rUtils.RegisterActionZone({
                pos = vector3(v.pos),
                action = function(data)
                    FoundNearestSup(data)
                end,
                Texte = "Commencer un braquage ~b~[E]"
            })
        end
    end)

    RegisterNetEvent("core:GetSupStatus")
    AddEventHandler("core:GetSupStatus", function(status, raison)
        if status == false then
            rUtils.ImportantNotif("Tu ne peux pas braquer ici pour l'instant ....\n"..raison)
        else
            maxMoney = math.random(500,2000)
            StartBraquo()
        end 
    end) 


    function FoundNearestSup()
        if inBraquo then return end
        if not IsPedArmed(pPed, 7) then rUtils.ImportantNotif("Apu rigole en te voyant essayer de braquer sans arme.") return end

        local pCoords = GetEntityCoords(pPed)
        local NearestDst = 999999
        local Nearest = 0
        local NearJob = ""
        for k,v in pairs(avalaibleBraquo) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < NearestDst then
                NearestDst = dst
                Nearest = k
                NearJob = v.job
            end
        end
        TriggerServerEvent(events.StartSup, token, Nearest, GetStreetNameFromHashKey(GetStreetNameAtCoord(pCoords.x, pCoords.y, pCoords.z)), NearJob)

    end


    function StartBraquo()
        inBraquo = true
        PlayUrl("SUPERETTE", "https://www.youtube.com/watch?v=Qo-7QLcgl18", 0.05, false)
        SetAudioFlag("LoadMPData", true)
        local braquo = GetEntityCoords(pPed)
        Citizen.CreateThread(function()
            rUtils.ImportantNotif("Tu commences le braquage, tiens 1m30s avant de commencer à gagner de l'argent!")
            for i = 1,90 do
                Wait(1000)
                local pCoords = GetEntityCoords(pPed)
                local dst = GetDistanceBetweenCoords(braquo, pCoords, true)
                if dst > 9.0 then
                    rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                    Destroy("SUPERETTE")
                    inBraquo = false
                    return
                end

                if pDeath then
                    rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                    Destroy("SUPERETTE")
                    inBraquo = false
                    return
                end
            end

            while maxMoney >= 0 do
                local money = math.random(50,100)
                maxMoney = maxMoney - money
                rUtils.ImportantNotif("~g~+ "..money.."$\n~s~Caisse: ~g~"..maxMoney.."$")
                TriggerServerEvent(events.GiveDirty, token, money)
                PlaySoundFrontend(-1, "LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)

                local pCoords = GetEntityCoords(pPed)
                local dst = GetDistanceBetweenCoords(braquo, pCoords, true)
                if dst > 9.0 then
                    rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                    Destroy("SUPERETTE")
                    inBraquo = false
                    return
                end

                if pDeath then
                    rUtils.ImportantNotif("Braquage annulé, tu est trop loin.")
                    Destroy("SUPERETTE")
                    inBraquo = false
                    return
                end
                Wait(3000)
            end

            inBraquo = false
            Destroy("SUPERETTE")
            rUtils.ImportantNotif("Braquage terminé, la caisse est vide!")
        end)
    end
end