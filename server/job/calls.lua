Calls = {}

RegisterNetEvent("core:RegisterCall")
AddEventHandler("core:RegisterCall", function(_job, _msg)
    local CallID = math.random(10,9999)
    local _pos = GetEntityCoords(GetPlayerPed(source))
    Calls[CallID] = {target = source, pos = pos, job = _job, msg = _msg, taken = false}
    local PlayersInJobs = GetActivePlayersFromJob(_job)
    for k,v in pairs(PlayersInJobs) do
        TriggerClientEvent("core:SendCall", v.id, CallID, _msg)
    end
end)


