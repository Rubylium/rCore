

function EatSomething()
    Citizen.CreateThread(function()
        rUtils.PlayAnim('mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 8.0, -8.0)
        Citizen.Wait(3000)
        ClearPedSecondaryTask(pPed)
    end)
end


function Drink()
    Citizen.CreateThread(function()
        rUtils.PlayAnim('mp_player_intdrink', 'loop_bottle', 49, 1.0, -1.0, 1, 2000)
        Citizen.Wait(3000)
        ClearPedSecondaryTask(pPed)
    end)
end


RegisterNetEvent("core:DringCoka")
AddEventHandler("core:DringCoka", function()
    TriggerEvent("rF:AddThirst", 15)
    Drink()
end)

RegisterNetEvent("core:EatPizza")
AddEventHandler("core:EatPizza", function()
    TriggerEvent("rF:AddHunger", 50)
    EatSomething()
end)