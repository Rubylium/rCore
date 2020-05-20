
function StartCreatorEndCinematic()
    PlayRandomClothAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(1) end
    SetEntityCoordsNoOffset(pPed, 389.0, -356.2, 48.0, 0.0, 0.0, 0.0)

    -- Default
    local cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    local cam1 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)

    local pos = GetOffsetFromEntityInWorldCoords(pPed, 1.0, 1.0, -1.0)
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, 0.7)

    SetCamActive(cam1, 1)
    SetCamCoord(cam1, pos.x, pos.y, pos.z)
    SetCamFov(cam1, 65.0)
    PointCamAtCoord(cam1, posLook.x, posLook.y, posLook.z)

    RenderScriptCams(1, 1, 0, 0, 0)
    DoScreenFadeIn(500)

    -- Cam 2
    local pos = GetOffsetFromEntityInWorldCoords(pPed, -1.0, 1.0, 1.2)
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, 0.7)

    SetCamActive(cam2, 1)
    SetCamCoord(cam2, pos.x, pos.y, pos.z)
    SetCamFov(cam2, 20.0)
    PointCamAtCoord(cam2, posLook.x, posLook.y, posLook.z)
    SetCamActiveWithInterp(cam2, cam1, 10000, 1, 1)
    Wait(9500)

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(1) end

    local pos = GetOffsetFromEntityInWorldCoords(pPed, 5.0, -7.0, 1.0)
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, 0.7)
    SetCamCoord(cam2, pos.x, pos.y, pos.z)
    PointCamAtCoord(cam2, posLook.x, posLook.y, posLook.z)
    ClearPedTasks(pPed)
    TaskGoToCoordAnyMeans(pPed, 395.5, -367.9, 46.8, 1.0, 0, 0, 786603, 0)

    local blockControls = true
    RenderScriptCams(0, 1, 14000, 0, 0)
    DoScreenFadeIn(500)
    Citizen.CreateThread(function()
        while blockControls do
            DisableControlAction(1, 1, true)
            DisableControlAction(1, 2, true)
            DisableControlAction(1, 4, true)
            DisableControlAction(1, 6, true)
            DisableControlAction(1, 270, true)
            DisableControlAction(1, 271, true)
            DisableControlAction(1, 272, true)
            DisableControlAction(1, 273, true)
            DisableControlAction(1, 282, true)
            DisableControlAction(1, 283, true)
            DisableControlAction(1, 284, true)
            DisableControlAction(1, 285, true)
            DisableControlAction(1, 286, true)
            DisableControlAction(1, 290, true)
            DisableControlAction(1, 291, true)
            Wait(1)
        end
    end)
    Wait(14000)
    blockControls = false
end

