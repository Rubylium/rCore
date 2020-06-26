

JobServices = {}

Citizen.CreateThread(function()
    for k,v in pairs(societyList) do
        JobServices[v.name] = {}
    end
    JobServices["staff"] = {}
    while true do
        for _,i in pairs(societyList) do
            for k,v in pairs(JobServices[i.name]) do
                if GetPlayerPing(v.id) == 0 then
                    --if JobServices[v.name] ~= nil then
                    --    JobServices[v.name][v.id] = nil
                    --end
                    RemoveFromActiveDuty(i.name, v.id)
                end
            end
        end
        Wait(60*1000)
    end
end)


RegisterNetEvent("core:SetServiceStatus")
AddEventHandler("core:SetServiceStatus", function(token, job)
    if not exports.rFramework:CheckToken(token, source, "SetServiceStatus") then return end
    if not IsIdActiveInJob(job, source) then
        --JobServices[job][source] = {id = source}
        table.insert(JobServices[job], {id = source})
        TriggerClientEvent("rF:notification", source, "~g~Prise de service.\n~w~Tu à pris ton service "..job.."!")
    else
        RemoveFromActiveDuty(job, source)
        TriggerClientEvent("rF:notification", source, "~r~Retrait de service.\n~w~Tu n'est plus en service "..job.."!")
    end
end)


function IsIdActiveInJob(job, id)
    for k,v in pairs(JobServices[job]) do
        if v.id == id then
            return true
        end
    end
    return false
end

function RemoveFromActiveDuty(job, id)
    for k,v in pairs(JobServices[job]) do
        if v.id == id then
            table.remove(JobServices[job], k)
        end
    end
end

function GetActivePlayersFromJob(job)
    if JobServices[job] ~= nil then
        return JobServices[job], #JobServices[job]
    else
        return {}
    end
end