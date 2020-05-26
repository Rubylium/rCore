--template = {
--    {
--        pos = vector3(243.6, 226.25, 106.2),
--        action = function()
--            OpenBankDialog()
--        end,
--    },
--}


clothZone = {}
Citizen.CreateThread(function()
    while true do
        local NearZone = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(clothZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < 10.0 then
                NearZone = true
                DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                if dst < 2.0 then
                    RageUI.Text({message="Appuyer sur E pour intérargir."})
                    if IsControlJustReleased(1, 38) then
                        OpenClothZoneMenu(v.cloths)
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