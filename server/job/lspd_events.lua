RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(token, target, cuff, freeze)
    if not exports.rFramework:CheckToken(token, source, "CuffPlayer") then return end
    TriggerClientEvent("core:CuffPlayer", target, cuff, freeze)
end)

RegisterNetEvent("core:EscortPlayer")
AddEventHandler("core:EscortPlayer", function(token, target)
    if not exports.rFramework:CheckToken(token, source, "EscortPlayer") then return end
    TriggerClientEvent("core:EscortPlayer", target, source)
end)