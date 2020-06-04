local sit = false
local man = GetHashKey("mp_m_freemode_01")
local women = GetHashKey("mp_f_freemode_01")

local chairs = {
    {pos = vector3(-623.175, 235.4071, 81.88158),heading = 57.824649810791,},
    {pos = vector3(-625.7764, 235.6264, 81.88157),heading = 308.61547851563,},
    {pos = vector3(-624.5609, 234.6641, 81.88157),heading = 0.20733994245529,},
    {pos = vector3(-618.9364, 232.4076, 81.88166),heading = 139.29676818848,},
    {pos = vector3(-620.1995, 230.6741, 81.88166),heading = 322.59674072266,},
    {pos = vector3(-630.8769, 224.9647, 86.32696),heading = 82.598945617676,},
    {pos = vector3(-631.1496, 223.7401, 86.32697),heading = 74.875335693359,},
    {pos = vector3(-632.0007, 223.203, 86.32687),heading = 358.69549560547,},
    {pos = vector3(-633.2534, 223.2018, 86.32664),heading = 2.0190942287445,},
}


Citizen.CreateThread(function()
    while true do
        local NearChair = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(chairs) do
            local dst = #(v.pos - pCoords)
            if dst < 2 then
                if not sit then
                    DrawMarker(20, v.pos.x, v.pos.y, v.pos.z-0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 140, 213, 237, 80, 0, 1, 2, 0, nil, nil, 0)
                end
                NearChair = true
                if dst <= 1.0 then
                    if not sit then
                        DrawTxt(v.pos, "Appuyer sur [E] pour vous asseoir")
                        if IsControlJustReleased(1, 38) then
                            sit = true
                            if not IsEntityAtCoord(pPed, v.pos, 0.1, 0.1, 0.1, false, true, 0) then
                                local try = 0
                                TaskGoStraightToCoord(pPed, v.pos, 1.0, 20000, v.heading, 0.1)
                                while not IsEntityAtCoord(pPed, v.pos, 0.1, 0.1, 0.1, false, true, 0) do
                                    Citizen.Wait(2000)
                                    try = try + 1
                                    if try > 3 then break end
                                end
                            end

                            Wait(200)
                            if GetEntityModel(pPed) == man then
                                rUtils.PlayAnim("timetable@ron@ig_3_couch", "base", 1)
                            elseif GetEntityModel(pPed) == women then
                                rUtils.PlayAnim("timetable@reunited@ig_10", "base_amanda", 1)
                            else
                                rUtils.PlayAnim("timetable@ron@ig_3_couch", "base", 1)
                            end
                        end
                    end

                    if IsControlJustReleased(1, 73) then
                        ClearPedTasks(pPed)
                        sit = false
                    end
                    break
                end
            end
        end

        if NearChair then
            Wait(1)
        else
            Wait(1000)
        end
    end
end)