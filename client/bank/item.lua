
RegisterNetEvent("core:UseCreditCard")
AddEventHandler("core:UseCreditCard", function()
    OpenAtmIfPossible()
end)



local ATMHash = {
    GetHashKey("prop_atm_01")
    GetHashKey("prop_atm_02")
    GetHashKey("prop_atm_03")
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
        OpenATM()
    end
end