RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(target, cuff, freeze)
    TriggerClientEvent("core:CuffPlayer", target, cuff, freeze)
end)