RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(target, cuff, freeze)
    TriggerClientEvent("core:CuffPlayer", target, cuff, freeze)
end)

RegisterNetEvent("core:EscortPlayer")
AddEventHandler("core:EscortPlayer", function(target)
    TriggerClientEvent("core:EscortPlayer", target, source)
end)