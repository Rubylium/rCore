
RegisterNetEvent("core:OpenVehHood")
AddEventHandler("core:OpenVehHood", function(net, status)
    local entity = NetworkGetEntityFromNetworkId(net)
    local owner = NetworkGetEntityOwner(entity)
    TriggerClientEvent("core:OpenVehHood", owner, net, status)
end)