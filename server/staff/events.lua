

RegisterNetEvent("core:pList")
AddEventHandler("core:pList", function(token)
    if exports.rFramework:CheckToken(token, source, "core:pList") then
        local players = GetPlayers()
        local pCallback = {}
        for k,v in pairs(players) do
           -- pCallback[v] = {id = v, name = GetPlayerName(v)}
            print(v, GetPlayerName(v))
            table.insert(pCallback, {id = v, name = GetPlayerName(v)})
        end
        --table.sort(pCallback)
        TriggerClientEvent("core:pList", source, pCallback)
    end
end)


RegisterNetEvent("core:SendMsgToPlayer")
AddEventHandler("core:SendMsgToPlayer", function(token, id, msg)
    if exports.rFramework:CheckToken(token, source, "core:SendMsgToPlayer") then
        TriggerClientEvent("rF:notification", id, "~r~Message du staff "..GetPlayerName(source).."\n~w~"..msg)
    end
end) 


RegisterNetEvent("core:GotoPlayer")
AddEventHandler("core:GotoPlayer", function(token, id)
    if exports.rFramework:CheckToken(token, source, "core:GotoPlayer") then
        local coords = GetEntityCoords(GetPlayerPed(id))
        TriggerClientEvent("core:ChangepCoords", source, coords)
    end
end)


RegisterNetEvent("core:BringPlayer")
AddEventHandler("core:BringPlayer", function(token, id)
    if exports.rFramework:CheckToken(token, source, "core:GotoPlayer") then
        local coords = GetEntityCoords(GetPlayerPed(source))
        TriggerClientEvent("core:ChangepCoords", id, coords)
    end
end)

RegisterNetEvent("core:ClearAreaFromObjects")
AddEventHandler("core:ClearAreaFromObjects", function(token, coords, players)
    if exports.rFramework:CheckToken(token, source, "core:ClearAreaFromObjects") then
        for k,v in pairs(players) do
            TriggerClientEvent("core:ClearAreaFromObjects", v, coords)
        end
    end
end)