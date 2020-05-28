RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(token, target, cuff, freeze)
    if not exports.rFramework:CheckToken(token, source) then return end
    TriggerClientEvent("core:CuffPlayer", target, cuff, freeze)
end)