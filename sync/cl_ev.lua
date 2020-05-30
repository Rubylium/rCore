
local ev = {
    "ambulancier:selfRespawn",
    "bank:transfer",
    "esx_ambulancejob:revive",
    "esx-qalle-jail:openJailMenu",
    "esx_jailer:wysylandoo",
    "esx_society:openBossMenu",
    "esx:spawnVehicle",
    "esx_status:set",
    "HCheat:TempDisableDetection",
    "UnJP"
}



Citizen.CreateThread(function()
    for k,v in pairs(ev) do
        RegisterNetEvent(v)
        AddEventHandler(v, function()
            TriggerServerEvent("cortana:AddLog", 4, v, 5)
        end)
    end
end)