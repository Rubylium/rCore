local soif = 50
local faim = 50
local needToEat = false
RegisterNetEvent("rF:UpdateStatus")
AddEventHandler("rF:UpdateStatus", function(_soif, _faim)
    soif = _soif
    faim = _faim
end)



Citizen.CreateThread(function()
    while true do
        if soif < 30 then
            rUtils.ImportantNotif("~r~Attention\n~w~Tu semble avoir soif ...")
        end

        if faim < 30 then
            rUtils.ImportantNotif("~r~Attention\n~w~Tu semble avoir faim ...")
        end


        if faim < 10 or soif < 10 then
            rUtils.ImportantNotif("~r~Attention\n~w~Tu as trop faim ou soif pour courir ...")
            needToEat = true
        else
            needToEat = false
        end

        if not NeedToEat then
            Wait(15*1000)
        else
            Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        if needToEat then
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 22, true)
        end

        if not needToEat then
            Wait(3*1000)
        else
            Wait(1)
        end
    end
end)