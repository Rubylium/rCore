

Citizen.CreateThread(function()
    while true do
        local NearZone = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(FarmZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < 10.0 then
                NearZone = true
                DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                if dst < 2.0 then
                    RageUI.Text({message="Appuyer sur E pour intérargir."})
                    if IsControlJustReleased(1, 38) then
                        if v.type == 1 then
                            StartRecolte(v.item)
                        elseif v.type == 2 then
                            StartTraits(v.oItem, v.iItem)
                        elseif v.type == 3 then
                            StartSell(v.item, v.price, v.clean)
                        end
                    end
                    break
                end
            end
        end


        if not NearZone then
            Wait(500)
        else
            Wait(1)
        end
    end
end)


local dict = "anim@mp_snowball"
local anim = "pickup_snowball"
local flag = 1
function StartRecolte(item)
    local oldTime = GetGameTimer()
    local StillWant = true

    Citizen.CreateThread(function()
        while StillWant do
            RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
            if IsControlPressed(1, 73) then
                StillWant = false
                ClearPedTasks(GetPlayerPed(-1))
            end
            Wait(1)
        end
    end)

    while StillWant do
        if oldTime + 3500 < GetGameTimer() then
            oldTime = GetGameTimer()
            if not IsEntityPlayingAnim(GetPlayerPed(-1), dict, anim, flag) then
                rUtils.PlayAnim(dict, anim, flag)
            end
            TriggerServerEvent(events.give, token, item, 1, GetItemId(item))
        end

        Wait(0)
    end
end


function StartTraits(oItem, iItem)
    local oldTime = GetGameTimer()
    local StillWant = true

    Citizen.CreateThread(function()
        while StillWant do
            RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
            if IsControlPressed(1, 73) then
                StillWant = false
                ClearPedTasks(GetPlayerPed(-1))
            end
            Wait(1)
        end
    end)

    while StillWant do
        if oldTime + 3500 < GetGameTimer() then
            oldTime = GetGameTimer()
            if not IsEntityPlayingAnim(GetPlayerPed(-1), dict, anim, flag) then
                rUtils.PlayAnim(dict, anim, flag)
            end
            TriggerServerEvent(events.Exhange, token, oItem, iItem)
        end

        Wait(0)
    end
end


function StartSell(item, price, clean)
    local oldTime = GetGameTimer()
    local StillWant = true

    Citizen.CreateThread(function()
        while StillWant do
            RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
            if IsControlPressed(1, 73) then
                StillWant = false
                ClearPedTasks(GetPlayerPed(-1))
            end
            Wait(1)
        end
    end)

    while StillWant do
        if oldTime + 3500 < GetGameTimer() then
            oldTime = GetGameTimer()
            if not IsEntityPlayingAnim(GetPlayerPed(-1), dict, anim, flag) then
                rUtils.PlayAnim(dict, anim, flag)
            end
            if clean then
                rUtils.ImportantNotif("~g~+"..price + rUtils.GetVipBonus(price).."$")
                TriggerServerEvent(events.sell, token, item, price + rUtils.GetVipBonus(price), 1, clean, GetItemId(item))
            else
                rUtils.ImportantNotif("~g~+"..price.."$\n~s~Source inconnue")
                TriggerServerEvent(events.sell, token, item, price, 1, clean, GetItemId(item))
            end
        end

        Wait(0)
    end
end