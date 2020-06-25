

function InitPossibleCrimes()
    local PublicAreaZOnes = {
        {pos = vector3(262.8476, -823.7618, 29.43782),dst = 25.2, type = "police"}, -- crucial
        {pos = vector3(281.6292, -973.142, 29.8706),dst = 25.2, type = "police"}, -- pizza
        {pos = vector3(44.25684, -1004.422, 29.28696),dst = 25.2, type = "police"}, -- hotdog
        {pos = vector3(148.6184, -1040.26, 29.37776),dst = 15.2, type = "police"}, -- flecca place cube
        {pos = vector3(-61.43016, -1285.018, 30.9051),dst = 25.2, type = "police"}, -- salle de sport
        {pos = vector3(348.2102, -1410.106, 32.51068),dst = 50.2, type = "police"}, -- Hopital
        {pos = vector3(-89.51302, -1805.996, 26.46106),dst = 50.2, type = "police"}, -- mecano
        {pos = vector3(377.3756, -830.0686, 29.30268),dst = 50.2, type = "police"}, -- bestbuds
        {pos = vector3(-1123.598, -1441.2, 5.22833),dst = 50.2, type = "police"}, -- heaters
    }

    local allowedJobs = {
        ["police"] = true,
        ["sheriff"] = true,
    }

    function GetCoordsNames(coords)
        local streetName,_ = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
		return GetStreetNameFromHashKey(streetName)
    end

    Citizen.CreateThread(function()
        while true do
            local pCoords = GetEntityCoords(pPed)
            for k,v in pairs(PublicAreaZOnes) do
                local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
                if dst <= v.dst then
                    if IsPedArmed(pPed, 7) then
                        if allowedJobs[pJob] == nil then
                            TriggerServerEvent(events.SendLspdCall, token, pCoords, GetCoordsNames(pCoords), v.type)
                        end
                        -- Notif 
                        Wait(60*1000) -- monter à 30
                    end
                end
            end
            Wait(1500)
        end
    end)
end


RegisterNetEvent("core:GetLspdCall")
AddEventHandler("core:GetLspdCall", function(_type, _data, _length, _coords)
    PlayUrl("radio", "https://www.youtube.com/watch?v=9CLCEcpo9jE", 1.0, false)
    Wait(1400)
    SendNUIMessage({lspdNotif = true, style = _type, info = _data, length = _length})
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(_coords)
        SetBlipSprite(blip, 110)
        SetBlipScale(blip, 0.65)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, math.random(1,84))


        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_data["code"])
        EndTextCommandSetBlipName(blip)

        Wait(60*1000)
        RemoveBlip(blip)
    end)
end)    