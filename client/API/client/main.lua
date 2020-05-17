local NearZone = false

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        if not NearZone then
            Wait(2500)
        else
            Wait(50)
        end
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        SendNUIMessage({
            status = "position",
            x = pos.x,
            y = pos.y,
            z = pos.z
        })
    end
end) 


MusicZone = {
    {
        name = "bar_ambience",
        link = "https://www.youtube.com/watch?v=ZcThrAU9yLk",
        dst = 15.0,
        pos = vector3(281.4, -973.0, 29.87),
        max = 0.2,
    },
    {
        name = "police_radio",
        link = "https://www.youtube.com/watch?v=eqnq5XF3CJ0",
        dst = 15.0,
        pos = vector3(440.81, -977.01, 30.68),
        max = 0.1,
    },
}

Citizen.CreateThread(function()
    Wait(2000)
    while true do
        NearZone = false
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(MusicZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < v.dst then
                NearZone = true
                if not soundExists(v.name) then
                    if not isPlaying(v.name) then
                        print("Started playing music")
                        PlayUrlPos(v.name, v.link, v.max, v.pos, false)
                        setVolumeMax(v.name, v.max)
                        break
                    end
                else
                    if not isPlaying(v.name) then
                        print("Started playing music again")
                        Resume(v.name)
                        break
                    end
                end
            else
                if isPlaying(v.name) then
                    print("Stopped music")
                    Pause(v.name)
                    break
                end
            end

        end


        if not NearZone then
            Wait(1000)
        else
            Wait(150)
        end
    end
end)