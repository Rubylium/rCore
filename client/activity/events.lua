local inActivity = false

local activity = {
    [1] = {label = "Chasse aux trésors!", desc = "Diriges-toi sur place et cherche un trésor caché pour avoir une récompense!"},
    [2] = {label = "Cours de rue!", desc = "Envie de rouler à fond contre d'autre types ? Viens à la course de rue!"},
}



RegisterNetEvent("core:StopActivity")
AddEventHandler("core:StopActivity", function()
    inActivity = false
end)


RegisterNetEvent("core:StartActivity")
AddEventHandler("core:StartActivity", function(num, zone)
    rUtils.ImportantNotif("~b~évenement!\n~s~"..activity[num].label)
    rUtils.ImportantNotif(activity[num].desc)
    if num == 1 then
        StartTresorHunt(zone)
    elseif num == 2 then

    end
end)



function StartTresorHunt(zone)
    local tresorZone = vector3(zone.x + math.random(-100,100), zone.y + math.random(-100,100), zone.z)
    local catched = false
    inActivity = true

    local blip = AddBlipForCoord(zone)
    SetBlipSprite(blip, 161)
    SetBlipColour(blip, 67)
    SetBlipScale(blip, 0.70)


    local pCoords = GetEntityCoords(pPed)
    local dst = #(pCoords - zone)
    while dst > 200 do
        local pCoords = GetEntityCoords(pPed)
        dst = #(pCoords - zone)

        if not inActivity then 
            RemoveBlip(blip)
            return 
        end
        Wait(1000)
    end

    rUtils.ImportantNotif("Tu es dans la zone de recherche! Cherche les caisses remplies de trésors!")
    PlayUrl("event", "https://www.youtube.com/watch?v=mU138JcjXCg", 0.1, false)
    rUtils.LoadModel(GetHashKey("ba_prop_batle_crates_mule"))
    local obj = CreateObject(GetHashKey("ba_prop_batle_crates_mule"), tresorZone, 0, 1, 0)
    PlaceObjectOnGroundProperly(obj)

    while dst > 1.5 do
        PlaceObjectOnGroundProperly(obj)
        local pCoords = GetEntityCoords(pPed)
        dst = #(pCoords.xy - tresorZone.xy)  

        PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 1)
        if not inActivity then 
            rUtils.ImportantNotif("Terminé! tu n'as pas trouvé les trésors ! Essaye une prochaine fois!")
            Destroy("event")
            RemoveBlip(blip)
            DeleteEntity(obj)
            return 
        end
        Wait(dst + 100)
    end

    DeleteEntity(obj)
    RemoveBlip(blip)
    Destroy("event")
    rUtils.ImportantNotif("Terminé! tu as trouvé les trésors !")
    TriggerServerEvent("core:WinEvent", token, 1)
end