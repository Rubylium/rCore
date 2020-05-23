CreatorCam = nil
cam2 = nil

function CreateCreatorCam()
    Citizen.CreateThread(function()
        local pPed = GetPlayerPed(-1)
        local offset = GetCamOffset("default")
        local pos = GetOffsetFromEntityInWorldCoords(pPed, offset.cam[1], offset.cam[2], offset.cam[3])
        local posLook = GetOffsetFromEntityInWorldCoords(pPed, offset.lookAt[1], offset.lookAt[2], offset.lookAt[3])

        CreatorCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        
        SetCamActive(CreatorCam, 1)
        SetCamCoord(CreatorCam, pos.x, pos.y, pos.z)
        SetCamFov(CreatorCam, offset.fov)
        PointCamAtCoord(CreatorCam, posLook.x, posLook.y, posLook.z)

        RenderScriptCams(1, 1, 1000, 0, 0)
        
        PlayRandomClothAnim()
    end)
end


function SwitchCam(backto, type)
    if not DoesCamExist(cam2) then cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0) end
    Citizen.CreateThread(function()
        local pPed = GetPlayerPed(-1)
        local offset = GetCamOffset(type)
        local pos = GetOffsetFromEntityInWorldCoords(pPed, offset.cam[1], offset.cam[2], offset.cam[3])
        local posLook = GetOffsetFromEntityInWorldCoords(pPed, offset.lookAt[1], offset.lookAt[2], offset.lookAt[3])

        if backto then
            SetCamActive(CreatorCam, 1)

            SetCamCoord(CreatorCam, pos.x, pos.y, pos.z)
            SetCamFov(CreatorCam, offset.fov)
            PointCamAtCoord(CreatorCam, posLook.x, posLook.y, posLook.z)
            SetCamActiveWithInterp(CreatorCam, cam2, 1000, 1, 1)
            Wait(1000)
            
        else
            SetCamActive(cam2, 1)

            SetCamCoord(cam2, pos.x, pos.y, pos.z)
            SetCamFov(cam2, offset.fov)
            PointCamAtCoord(cam2, posLook.x, posLook.y, posLook.z)
            SetCamDofMaxNearInFocusDistance(cam2, 1.0)
            SetCamDofStrength(cam2, 500.0)
            SetCamDofFocalLengthMultiplier(cam2, 500.0)
            SetCamActiveWithInterp(cam2, CreatorCam, 1000, 1, 1)
            Wait(1000)
        end
    end)
end

function KillCreatorCam()
    RenderScriptCams(0, 1, 1000, 0, 0)
    SetCamActive(CreatCam, 0)
    SetCamActive(cam2, 0)
    ClearPedTasks(GetPlayerPed(-1))
end