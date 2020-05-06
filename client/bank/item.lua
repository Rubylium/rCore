
RegisterNetEvent("core:UseCreditCard")
AddEventHandler("core:UseCreditCard", function()
    OpenAtmIfPossible()
end)


local BankCam = nil
local ATMHash = {
    GetHashKey("prop_atm_01"),
    GetHashKey("prop_atm_02"),
    GetHashKey("prop_atm_03"),
    GetHashKey("prop_fleeca_atm"),
}
function OpenAtmIfPossible()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    for k,v in pairs(ATMHash) do
        obj = rUtils.GetClosestObject(pCoords, 3.0, v)
        if obj then
            break
        end
    end
    if not obj then
        rUtils.Notif("Aucun ATM Proche.")
    else
        local oCoords = GetOffsetFromEntityInWorldCoords(obj, 0.0, -0.6, 1.2)
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(obj, 0.0, 0.0, 1.0)
        BankCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(BankCam, 1)
        SetCamCoord(BankCam, oCoords)
        SetCamFov(BankCam, 55.0)
        PointCamAtCoord(BankCam, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)
        TaskTurnPedToFaceEntity(pPed, obj, 2500)
        Wait(1000)
        OpenATM()
    end
end


function KillBankCam()
    RenderScriptCams(0, 1, 1000, 0, 0)
    Wait(1000)
    SetCamActive(BankCam, 0)
    BankCam = nil
end