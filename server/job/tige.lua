local allowedJobs = {
    ["police"] = true,
    ["sheriff"] = true,
}


local InTig = {}

RegisterNetEvent("core:DoTig")
AddEventHandler("core:DoTig", function(token, sID, count, tigeAction)
    if not exports.rFramework:CheckToken(token, source, "core:DoTig") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to use core:DoTig with job "..job, 5)
    end
    table.insert(InTig, {id = GetLicense(sID), _count = count, action = tigeAction})
    TriggerClientEvent("core:DoTig", sID, count, tigeAction)
end)


RegisterNetEvent("core:EndTig")
AddEventHandler("core:EndTig", function(token)
    if not exports.rFramework:CheckToken(token, source, "core:EndTig") then return end
    local ids = GetLicense(source)
    for k,v in pairs(InTig) do
        if ids == v.id then
            table.remove(InTig, k)
        end
    end
end)


RegisterNetEvent("core:CheckTig")
AddEventHandler("core:CheckTig", function(token)
    if not exports.rFramework:CheckToken(token, source, "core:CheckTig") then return end
    local ids = GetLicense(source)
    for k,v in pairs(InTig) do
        if ids == v.id then
            TriggerClientEvent("core:DoTig", source, v._count + 5, v.action)
        end
    end
end)