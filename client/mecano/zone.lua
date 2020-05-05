
function InitMecanoZones()
    local CustomsZone = {
        {pos = vector3(-224.2049, -1331.089, 31.21607),heading = 89.92357635498,},
    	{pos = vector3(-224.1226, -1326.659, 31.21594),heading = 89.789016723633,},
    	{pos = vector3(-223.8729, -1323.304, 31.216),heading = 88.957015991211,},
    	{pos = vector3(-214.0572, -1318.32, 31.21612),heading = 88.359085083008,},
    	{pos = vector3(-198.8397, -1324.359, 31.45258),heading = 90.053497314453,},	
    	{pos = vector3(982.8882, -134.5795, 73.64906),heading = 124.78466033936,},
    }



    Citizen.CreateThread(function()
        while true do
            local NearZone = false
            if pJob == "mecano" then
                local pPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(pPed)
                for k,v in pairs(ZonesI) do
                    local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
                    if dst <= 10.0 then
                        NearZone = true
                        if dst <= 10.0 then
                            if IsControlJustReleased(1, 38) then
                                OpenCustomMenu()
                            end
                        end
                    end
                end
            end
            if NearZone then
                Wait(1)
            else
                Wait(150)
            end
        end
    end)
end