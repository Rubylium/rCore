
RegisterNetEvent("core:OpenVehHood")
AddEventHandler("core:OpenVehHood", function(token, net, status)
    if not exports.rFramework:CheckToken(token, source, "OpenVehHood") then return end
    local entity = NetworkGetEntityFromNetworkId(net)
    local owner = NetworkGetEntityOwner(entity)
    TriggerClientEvent("core:OpenVehHood", owner, net, status)
end)