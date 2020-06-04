local allowedJobs = {
    ["police"] = true,
    ["sheriff"] = true,
}

RegisterNetEvent("core:DoTig")
AddEventHandler("core:DoTig", function(token, sID, count, tigeAction)
    if not exports.rFramework:CheckToken(token, source, "core:DoTig") then return end
    local job = exports.rFramework:GetPlayerJob(source)
    if allowedJobs[job] == nil then
        exports.rFramework:AddPlayerLog(source, "Try to use core:DoTig with job "..job, 5)
    end

    TriggerClientEvent("core:DoTig", sID, count, tigeAction)
end)