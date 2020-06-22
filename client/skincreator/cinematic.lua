--RegisterCommand("anim", function()
--    StartCreatorEndCinematic()
--end)


function StartCreatorEndCinematic()
    SkipLogo()
    DoScreenFadeOut(1000)
    local blockControls = true
    TriggerEvent("rF:HudToogle")
    DisplayRadar(false)
    PlayUrl("cin_music", "https://www.youtube.com/watch?v=F1Vx-9TUyzA", 0.2, false)

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
            for v in EnumeratePeds() do
                if v ~= pPed then
                    SetEntityAlpha(v, 0, 0)
                    SetEntityNoCollisionEntity(pPed, v, false)
                    NetworkConcealPlayer(NetworkGetPlayerIndexFromPed(v), true, 1)
                end
            end
        end
        for v in EnumeratePeds() do
            if v ~= pPed then
                ResetEntityAlpha(v)
                SetEntityNoCollisionEntity(v, pPed, true)
                NetworkConcealPlayer(NetworkGetPlayerIndexFromPed(v), false, 1)
            end
        end
    end)
    
    while not IsScreenFadedOut() do Wait(3000) end
    Wait(2000)
    NetworkOverrideClockTime(18, 00, 0)
    SetOverrideWeather("EXTRASUNNY")
    SetEntityCoordsNoOffset(pPed, 389.0, -356.2, 48.0, 0.0, 0.0, 0.0)
    SetEntityHeading(pPed, 272.0)

    -- Default
    local cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    local cam1 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    

    local pos = GetOffsetFromEntityInWorldCoords(pPed, 1.0, 1.0, -1.0)
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, 0.7)

    SetCamActive(cam1, 1)
    SetCamCoord(cam1, pos.x, pos.y, pos.z)
    SetCamFov(cam1, 75.0)
    PointCamAtCoord(cam1, posLook.x, posLook.y, posLook.z)

    RenderScriptCams(1, 1, 0, 0, 0)
    TaskStartScenarioInPlace(pPed, "CODE_HUMAN_CROSS_ROAD_WAIT", -1, 0)
    DoScreenFadeIn(1500)

    -- Cam 2
    local pos = GetOffsetFromEntityInWorldCoords(pPed, -1.0, 1.0, 1.2)
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, 0.0, 0.0, 0.7)

    SetCamActive(cam2, 1)
    SetCamCoord(cam2, pos.x, pos.y, pos.z)
    SetCamFov(cam2, 20.0)
    PointCamAtCoord(cam2, posLook.x, posLook.y, posLook.z)
    SetCamActiveWithInterp(cam2, cam1, 12000, 1, 1)
    Wait(11500)


    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(1) end

    local pos = vector3(406.3, -371.9, 48.1)
    SetCamCoord(cam2, pos.x, pos.y, pos.z)
    PointCamAtEntity(cam2, pPed, 1.0, 1.0, 1.0, 0)
    SetCamFov(cam2, 15.0)
    ClearPedTasks(pPed)
    TaskGoToCoordAnyMeans(pPed, 399.3, -376.2, 46.9, 1.0, 0, 0, 786603, 0)
    
    DoScreenFadeIn(500)

    
    Wait(7000)
    local pos = vector3(421.8, -346.1, 55.2)
    SetCamCoord(cam2, pos.x, pos.y, pos.z)
    PointCamAtEntity(cam2, pPed, 1.0, 1.0, 1.0, 0)
    SetCamFov(cam2, 35.0)

    RenderScriptCams(0, 1, 12000, 0, 0)
    Wait(11000)
    blockControls = false
    TriggerEvent("rF:HudToogle")
    DisplayRadar(true)
    local vol = 1.0
    while vol > 0.0 do
        vol = getVolume("cin_music") - 0.02
        setVolume("cin_music", vol)
        Wait(500)
    end
    Destroy("cin_music")
end