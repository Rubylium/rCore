Calls = {}

RegisterNetEvent("core:RegisterCall")
AddEventHandler("core:RegisterCall", function(_job, _msg)
    local CallID = math.random(10,9999)
    local _pos = GetEntityCoords(GetPlayerPed(source))
    Calls[CallID] = {target = source, pos = pos, job = _job, msg = _msg, taken = false}
    local PlayersInJobs = GetActivePlayersFromJob(_job)
    for k,v in pairs(PlayersInJobs) do
        TriggerClientEvent("core:SendCall", v.id, CallID, _msg, _job)
    end


end)


RegisterNetEvent("core:TakeCall")
AddEventHandler("core:TakeCall", function(callid)
    if Calls[callid] ~= nil then
        if  Calls[callid].taken == false then
            Calls[callid].taken = true
            local dst = #(GetEntityCoords(GetPlayerPed(Calls[callid].target)) - GetEntityCoords(GetPlayerPed(source))) -- Use Z
            TriggerClientEvent("core:CallTaken", source, dst)
            TriggerClientEvent("core:CallTakenTarget", Calls[callid].target,  dst, Calls[callid].job)
        else
            TriggerClientEvent("rF:notification", source, "~r~L'appel à déja été pris!")
        end
    end
end)