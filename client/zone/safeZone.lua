

SafeZone = {
    {pos = vector3(389.9402, -356.1072, 48.02464),dst = 25.0,},
}
local EnteredSafeZone = false


Citizen.CreateThread(function()
    while true do
        local InSafeZone = false
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(SafeZone) do
            local dst = #(pCoords - v.pos)
            if dst <= v.dst then
                NetworkSetFriendlyFireOption(false)
                SetCanAttackFriendly(pPed, false, false)
                InSafeZone = true
                if not EnteredSafeZone then
                    EnteredSafeZone = true
                    print("^2Entered safe zone")
                end
                break
            end
        end
        if InSafeZone then
            Wait(1)
        else
            if EnteredSafeZone then
                NetworkSetFriendlyFireOption(true)
                SetCanAttackFriendly(pPed, true, true)
                EnteredSafeZone = false
                print("^1leaving safe zone !")
            end
            Wait(500)
        end
    end
end)