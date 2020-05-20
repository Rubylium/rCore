
function StartCreatorEndCinematic()
    PlayRandomClothAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(1) end

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


    RenderScriptCams(0, 1, 7500, 0, 0)

    DoScreenFadeIn(500)
    Wait(7000)
    ClearPedTasks(pPed)
end

