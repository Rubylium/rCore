local allowedJobs = {
    ["police"] = true,
    ["sheriff"] = true,
}

RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(token, target, cuff, freeze)
    if not exports.rFramework:CheckToken(token, source, "CuffPlayer") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to use CuffPlayer with job "..job, 5)
    end
    TriggerClientEvent("core:CuffPlayer", target, cuff, freeze)
end)

RegisterNetEvent("core:EscortPlayer")
AddEventHandler("core:EscortPlayer", function(token, target)
    if not exports.rFramework:CheckToken(token, source, "EscortPlayer") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to use EscortPlayer with job "..job, 5)
    end
    TriggerClientEvent("core:EscortPlayer", target, source)
end)


RegisterNetEvent("core:PutInVeh")
AddEventHandler("core:PutInVeh", function(token, target)
    if not exports.rFramework:CheckToken(token, source, "PutInVeh") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to put in veh with job "..job, 5)
    end
    TriggerClientEvent("core:PutInVeh", target)
end)

RegisterNetEvent("core:PutOutVeh")
AddEventHandler("core:PutOutVeh", function(token, target)
    if not exports.rFramework:CheckToken(token, source, "PutOutVeh") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to put out veh with job "..job, 5)
    end
    TriggerClientEvent("core:PutOutVeh", target)
end)


RegisterNetEvent("core:AskForIdentity")
AddEventHandler("core:AskForIdentity", function(token, id)
    if not exports.rFramework:CheckToken(token, source, "AskForIdentity") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to ask id with job "..job, 5)
    end
    TriggerClientEvent("core:AskForIdentity", id, source)
end)

RegisterNetEvent("core:SendRadioCall")
AddEventHandler("core:SendRadioCall", function(token, job, code, label, pos, prenom, nom)
    if not exports.rFramework:CheckToken(token, source, "SendRadioCall") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to send radio call with job "..job, 5)
    end
    local PlayersInJobs = GetActivePlayersFromJob(job)
    for k,v in pairs(PlayersInJobs) do
        if pos then
            TriggerClientEvent("core:SendRadioCall", v.id, source, code, label, GetEntityCoords(GetPlayerPed(source)), prenom, nom)
        else
            TriggerClientEvent("core:SendRadioCall", v.id, source, code, label, pos, prenom, nom)
        end
    end
end)