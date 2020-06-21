--template = {
--    {
--        pos = vector3(243.6, 226.25, 106.2),
--        action = function()
--            OpenBankDialog()
--        end,
--    },
--}



Citizen.CreateThread(function()
    while true do
        local NearZone = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(ActionZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if v.zAxe ~= nil then
                dst = GetDistanceBetweenCoords(pCoords, v.pos, false)
            end
            if dst < 10.0 then
                NearZone = true
                DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                if dst < 2.0 then
                    if not InAction then
                        if v.Texte == nil then
                            RageUI.Text({message="Appuyer sur E pour intérargir."})
                        else
                            RageUI.Text({message=v.Texte})
                        end
                        if IsControlJustReleased(1, 38) then
                            v.action(v.data)
                        end
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