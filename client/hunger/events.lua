

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

function HealPlayer()
    TriggerEvent("rF:AddThirst", 100)
    TriggerEvent("rF:AddHunger", 100)
    SetEntityHealth(pPed, 200.0)
end

RegisterCommand("heal", function(source, args, rawCommand)
    if pGroup ~= "user" then
        HealPlayer()
    end
end, false)


RegisterNetEvent("core:DringWater")
AddEventHandler("core:DringWater", function()
    TriggerEvent("rF:AddThirst", 60)
    TriggerEvent("rF:RemoveHunger", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("eau"), 1) 
    Drink()
end)

RegisterNetEvent("core:DringCoka")
AddEventHandler("core:DringCoka", function()
    TriggerEvent("rF:AddThirst", 15)
    TriggerEvent("rF:RemoveHunger", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("coca"), 1)
    Drink()
end)

RegisterNetEvent("core:EatPizza")
AddEventHandler("core:EatPizza", function()
    TriggerEvent("rF:AddHunger", 50)
    TriggerEvent("rF:RemoveThirst", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("pizza"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatPizzaFromage")
AddEventHandler("core:EatPizzaFromage", function()
    TriggerEvent("rF:AddHunger", 60)
    TriggerEvent("rF:RemoveThirst", 20)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("pizzafromage"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatCafe")
AddEventHandler("core:EatCafe", function()
    TriggerEvent("rF:AddThirst", 40)
    TriggerEvent("rF:RemoveHunger", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("cafe"), 1)
    Drink()
end)

RegisterNetEvent("core:EatVin")
AddEventHandler("core:EatVin", function()
    TriggerEvent("rF:AddThirst", 30)
    TriggerEvent("rF:RemoveHunger", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("vin"), 1)
    Drink()
end)


RegisterNetEvent("core:EatTiramisu")
AddEventHandler("core:EatTiramisu", function()
    TriggerEvent("rF:AddHunger", 40)
    TriggerEvent("rF:RemoveThirst", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("tiramisu"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatPannacotta")
AddEventHandler("core:EatPannacotta", function()
    TriggerEvent("rF:AddHunger", 35)
    TriggerEvent("rF:RemoveThirst", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("pannacotta"), 1)
    EatSomething()
end)


RegisterNetEvent("core:EatChips")
AddEventHandler("core:EatChips", function()
    TriggerEvent("rF:AddHunger", 10)
    TriggerEvent("rF:RemoveThirst", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("chips"), 1)
    EatSomething()
end)


RegisterNetEvent("core:EatSandwichSimple")
AddEventHandler("core:EatSandwichSimple", function()
    TriggerEvent("rF:AddHunger", 40)
    TriggerEvent("rF:RemoveThirst", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("sandwich"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatSandwichPoulet")
AddEventHandler("core:EatSandwichPoulet", function()
    TriggerEvent("rF:AddHunger", 60)
    TriggerEvent("rF:RemoveThirst", 20)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("sandwich2"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatSandwichThon")
AddEventHandler("core:EatSandwichThon", function()
    TriggerEvent("rF:AddHunger", 50)
    TriggerEvent("rF:RemoveThirst", 15)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("sandwich3"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatSandwichVegan")
AddEventHandler("core:EatSandwichVegan", function()
    TriggerEvent("rF:AddHunger", 40)
    TriggerEvent("rF:RemoveThirst", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("sandwich4"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatSandwichSaucisson")
AddEventHandler("core:EatSandwichSaucisson", function()
    TriggerEvent("rF:AddHunger", 70)
    TriggerEvent("rF:RemoveThirst", 30)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("sandwich5"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatHotDog")
AddEventHandler("core:EatHotDog", function()
    TriggerEvent("rF:AddHunger", 50)
    TriggerEvent("rF:RemoveThirst", 5)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("hotdog"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatTacos")
AddEventHandler("core:EatTacos", function()
    TriggerEvent("rF:AddHunger", 60)
    TriggerEvent("rF:RemoveThirst", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("tacos"), 1)
    EatSomething()
end)

RegisterNetEvent("core:EatKebab")
AddEventHandler("core:EatKebab", function()
    TriggerEvent("rF:AddHunger", 70)
    TriggerEvent("rF:RemoveThirst", 15)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("kebab"), 1)
    EatSomething()
end)


RegisterNetEvent("core:EatPatte")
AddEventHandler("core:EatPatte", function()
    TriggerEvent("rF:AddHunger", 60)
    TriggerEvent("rF:RemoveThirst", 10)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("patteBolo"), 1)
    EatSomething()
end)


RegisterNetEvent("core:UseWeed")
AddEventHandler("core:UseWeed", function()
    PlayUrl("weed", "https://www.youtube.com/watch?v=zvEJu3VPE9A", 0.05, false)
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("weed2"), 1)
    StartScreenEffect("ChopVision", 0, 0)
    Wait(1*60000)
    Destroy("weed")
    StopScreenEffect("ChopVision")
end)


ShakeGameplayCam("DRUNK_SHAKE", 0.0)
StopScreenEffect("DrugsDrivingIn")

RegisterNetEvent("core:UseWeedOgKush")
AddEventHandler("core:UseWeedOgKush", function()
    RequestAnimSet("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP") do
      Citizen.Wait(1)
    end 

    PlayUrl("weed", "https://www.youtube.com/watch?v=BC_wA09fqeU", 0.10, false)
    while not isPlaying("weed") do Wait(1) end
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("ogkush"), 1)
    AnimpostfxPlay("DrugsDrivingIn", 0, 0)

    ShakeGameplayCam("DRUNK_SHAKE", 0.5)

    SetPedMovementClipset(PlayerPedId(), "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP", 1.0)
    RemoveAnimSet("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP")

    Wait(30*1000)
    SetGameplayEntityHint(pPed, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0)
    SetGameplayHintFov(400.0)
    ShakeGameplayCam("DRUNK_SHAKE", 5.0)
    Wait(60*1000)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)

    while getVolume("weed") > 0.0 do
        setVolume("weed", getVolume("weed") - 0.1)
        
        Wait(1000)
    end
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    Destroy("weed")
    StopScreenEffect("DrugsDrivingIn") 
end)


RegisterNetEvent("core:UseWeedWhiteWidow")
AddEventHandler("core:UseWeedWhiteWidow", function()
    RequestAnimSet("move_m@drunk@moderatedrunk")
    while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(1)
    end 

    PlayUrl("weed", "https://www.youtube.com/watch?v=31j4DIpgY9U", 0.15, false)
    while not isPlaying("weed") do Wait(1) end
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("whitewidow"), 1)
    AnimpostfxPlay("DrugsDrivingIn", 0, 0)

    ShakeGameplayCam("DRUNK_SHAKE", 0.5)

    SetPedMovementClipset(PlayerPedId(), "move_m@drunk@moderatedrunk", 0.2)
    RemoveAnimSet("move_m@drunk@moderatedrunk")

    Wait(31.5*1000)
    SetGameplayEntityHint(pPed, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0)
    SetGameplayHintFov(400.0)
    ShakeGameplayCam("DRUNK_SHAKE", 10.0)
    Wait(60*1000)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)

    while getVolume("weed") > 0.0 do
        setVolume("weed", getVolume("weed") - 0.1)
        
        Wait(1000)
    end
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    Destroy("weed")
    StopScreenEffect("DrugsDrivingIn")
end)


RegisterNetEvent("core:UseWeedAk47")
AddEventHandler("core:UseWeedAk47", function()
    RequestAnimSet("move_m@drunk@verydrunk")
    while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
      Citizen.Wait(1)
    end 

    PlayUrl("weed", "https://www.youtube.com/watch?v=OC7cNS0GINo", 0.25, false)
    while not isPlaying("weed") do Wait(1) end
    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem("weedak47"), 1)
    AnimpostfxPlay("DrugsDrivingIn", 0, 0)

    ShakeGameplayCam("DRUNK_SHAKE", 0.5)

    SetPedMovementClipset(PlayerPedId(), "move_m@drunk@verydrunk", 0.2)
    RemoveAnimSet("move_m@drunk@verydrunk")

    Wait(49*1000)
    SetGameplayEntityHint(pPed, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0)
    SetGameplayHintFov(400.0)
    for i = 1,60 do
        ShakeGameplayCam("DRUNK_SHAKE", math.random(10,100) + 0.1)
        Wait(1000)
    end

    while getVolume("weed") > 0.0 do
        setVolume("weed", getVolume("weed") - 0.1)
        Wait(1000)
    end
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    Destroy("weed")
    StopScreenEffect("DrugsDrivingIn")
end)