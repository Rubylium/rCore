
function InitMecanoZones()
    local CustomsZone = {
        {pos = vector3(-84.06826, -1803.636, 26.09134),heading = 138.48077392578,},
        {pos = vector3(-88.53483, -1798.885, 26.0913),heading = 135.5675201416,},
        {pos = vector3(-92.55481, -1794.807, 26.09085),heading = 140.65689086914,},
        {pos = vector3(-110.6301, -1798.798, 26.09102),heading = 51.760459899902,},
        {pos = vector3(-128.4648, -1791.165, 23.41063),heading = 49.869064331055,},
        {pos = vector3(-121.2186, -1783.444, 23.41041),heading = 52.964061737061,},
    }



    Citizen.CreateThread(function()
        while true do
            local NearZone = false
            if pJob == "mecano" then
                local pPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(pPed)
                if IsPedInAnyVehicle(pPed, 0) then
                    for k,v in pairs(CustomsZone) do
                        local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
                        if dst <= 5.0 then
                            NearZone = true
                            if dst <= 5.0 then
                                if IsControlJustReleased(1, 38) then
                                    OpenCustomMenu()
                                end
                            end
                        end
                    end
                end
            end
            if NearZone then
                Wait(1)
            else
                Wait(500)
            end
        end
    end)
end