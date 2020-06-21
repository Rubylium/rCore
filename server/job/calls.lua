Calls = {}

RegisterNetEvent("core:RegisterCall")
AddEventHandler("core:RegisterCall", function(token, _job, _msg)
    local source = source
    if exports.rFramework:CheckToken(token, source) then
        local CallID = math.random(10,9999)
        local _pos = GetEntityCoords(GetPlayerPed(source))
        Calls[CallID] = {target = source, pos = pos, job = _job, msg = _msg, taken = false}
        local PlayersInJobs = GetActivePlayersFromJob(_job)
        if _job ~= "staff" then
            for k,v in pairs(PlayersInJobs) do
                TriggerClientEvent("core:SendCall", v.id, CallID, _msg, _job)
            end
        else
            for k,v in pairs(PlayersInJobs) do
                TriggerClientEvent("core:GetReport", v.id, _msg, source)
            end
        end
    end

end)


RegisterNetEvent("core:TakeCall")
AddEventHandler("core:TakeCall", function(token, callid)
    if exports.rFramework:CheckToken(token, source) then
        if Calls[callid] ~= nil then
            if Calls[callid].taken == false then
                Calls[callid].taken = true
                local dst = #(GetEntityCoords(GetPlayerPed(Calls[callid].target)) - GetEntityCoords(GetPlayerPed(source))) -- Use Z
                TriggerClientEvent("core:CallTaken", source, dst, GetEntityCoords(GetPlayerPed(Calls[callid].target)))
                TriggerClientEvent("core:CallTakenTarget", Calls[callid].target, dst, Calls[callid].job)
            else
                if Calls[callid].job == "police" then
                    local dst = #(GetEntityCoords(GetPlayerPed(Calls[callid].target)) - GetEntityCoords(GetPlayerPed(source))) -- Use Z
                    TriggerClientEvent("core:CallTaken", source, dst, GetEntityCoords(GetPlayerPed(Calls[callid].target)))
                else
                    TriggerClientEvent("rF:notification", source, "~r~L'appel à déja été pris!")
                end
            end
        end
    end
end)



RegisterNetEvent("core:GetLspdCall")
AddEventHandler("core:GetLspdCall", function(token, coords, streetName, type)
    if exports.rFramework:CheckToken(token, source) then
        local PlayersInJobs = GetActivePlayersFromJob(type)
        for k,v in pairs(PlayersInJobs) do
            data = {["code"] = '10-32', ["name"] = 'Personne armé dans un lieu publique', ["loc"] = streetName}
            length = 3500
            TriggerClientEvent("core:GetLspdCall", v.id, type, data, length, coords)
        end
    end
end)