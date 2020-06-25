


rUtils.RegisterActionZone({
    pos = vector3(-229.2476, -1377.696, 31.25822),
    action = function(data)
        StartPermis(data)
    end,
    Texte = "Passer le permis pour 500$ ~b~[E]"
})

local points = {
    {pos = vector3(-234.2566, -1418.866, 31.06162),passed = false},
    {pos = vector3(-267.207, -1273.872, 30.16998),passed = false},
    {pos = vector3(-264.7886, -1162.824, 22.85104),passed = false},
    {pos = vector3(-123.1358, -1137.34, 25.56744),passed = false},
    {pos = vector3(-29.13216, -971.1202, 29.17668),passed = false},
    {pos = vector3(76.13904, -999.9942, 29.16304),passed = false},
    {pos = vector3(57.88992, -1114.152, 29.20938),passed = false},
    {pos = vector3(68.51726, -1340.766, 29.07416),passed = false},
    {pos = vector3(-73.76828, -1364.13, 29.23444),passed = false},
    {pos = vector3(-192.5198, -1385.056, 30.978),passed = false},
    {pos = vector3(-214.2184, -1398.296, 31.08996),passed = false},
}


function StartPermis()
    if pInventory["Permis de conduire"] ~= nil then rUtils.ImportantNotif("Tu à déja ton permis!") return end
    local error = 0
    rUtils.LoadModel(GetHashKey("blista"))
    if not rUtils.IsSpawnPointClear(vector3(-233.2896, -1391.168, 31.25822), 5.0) then rUtils.ImportantNotif("Point de spawn bloqué") return end
    
    TriggerServerEvent(events.rmvMoney, token, 500)

    rUtils.SpawnVehicle(GetHashKey("blista"), vector3(-233.2896, -1391.168, 31.25822), 180.0, nil, function(veh)
       TaskWarpPedIntoVehicle(pPed, veh, -1) 
       SetVehicleNumberPlateText(veh, "PERMIS"..math.random(1,9))
    end)

    for i = 1,#points do
        local coords = points[i].pos
        local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), coords, true)
        local blip = AddBlipForCoord(coords)
        SetBlipRoute(blip, true)
        while dst > 2.0 do
            dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), coords, true)
            DrawMarker(1, coords.x, coords.y, coords.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 0, 255, 0, 150, 1, 0, 2, 0, nil, nil, 0)
            local speed = GetEntitySpeed(pPed)
            if speed * 3.6 > 80.0 then
                error = error + 1
                rUtils.ImportantNotif("~r~+ 1 Erreur ! Surveille ta vitesse !\nErreur: "..error.."/5")
                Wait(2000)
            end

            if error >= 5 then
                break
            end
            Wait(1)
        end
        RemoveBlip(blip)
        if error > 5 then
            TriggerServerEvent(events.DelEntity, token, VehToNet(GetVehiclePedIsIn(pPed, false)))
            SetEntityCoordsNoOffset(pPed, -233.2896, -1391.168, 31.25822, 0.0, 0.0, 0.0)
            break
        end
    end

    if error < 5 then
        rUtils.ImportantNotif("Bravo tu à eu ton permis!")
        TriggerServerEvent(events.give, token, "permisConduire", 1, GetItemId("permisConduire"))
    else

        rUtils.ImportantNotif("Mmh, trop d'erreur, essaye de nouveau!")
    end
    TriggerServerEvent(events.DelEntity, token, VehToNet(GetVehiclePedIsIn(pPed, false)))
end