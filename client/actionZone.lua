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
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(ActionZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < 10.0 then
                NearZone = true
                DrawMarker(25, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
                if dst < 2.0 then
                    RageUI.Text({message="Appuyer sur E pour intérargir."})
                    if IsControlJustReleased(1, 38) then
                        v.action()
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