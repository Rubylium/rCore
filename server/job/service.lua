

JobServices = {}

Citizen.CreateThread(function()
    for k,v in pairs(societyList) do
        JobServices[v.name] = {}
    end
    while true do
        for _,i in pairs(societyList) do
            for k,v in pairs(JobServices[i.name]) do
                if GetPlayerPing(v.id) == 0 then
                    if JobServices[v.name] ~= nil then
                        JobServices[v.name][v.id] = nil
                    end
                end
            end
        end
        Wait(60*1000)
    end
end)


RegisterNetEvent("core:SetServiceStatus")
AddEventHandler("core:SetServiceStatus", function(token, job)
    if not exports.rFramework:CheckToken(token, source, "SetServiceStatus") then return end
    if JobServices[job][source] == nil then
        JobServices[job][source] = {id = source}
        TriggerClientEvent("rF:notification", source, "~g~Prise de service.\n~w~Tu à pris ton service "..job.."!")
    else
        JobServices[job][source] = nil
        TriggerClientEvent("rF:notification", source, "~r~Retrait de service.\n~w~Tu n'est plus en service "..job.."!")
    end
end)


function GetActivePlayersFromJob(job)
    if JobServices[job] ~= nil then
        return JobServices[job]
    else
        return {}
    end
end