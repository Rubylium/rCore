


RegisterNetEvent("core:Repair")
AddEventHandler("core:Repair", function(net)
    local veh = NetworkGetEntityFromNetworkId(net)
    SetVehicleFixed(veh)
    SetVehicleDeformationFixed(veh)
    SetVehicleDirtLevel(veh, 0.0)
    SetVehicleEngineHealth(veh, 1000.0)
end)


RegisterNetEvent("core:OpenSomething")
AddEventHandler("core:OpenSomething", function(net, door, openOrClose)
    local veh = NetworkGetEntityFromNetworkId(net)
    if openOrClose then
        SetVehicleDoorOpen(veh, door, 0, 0)
    else
        SetVehicleDoorShut(veh, door, 0)
    end
end)


RegisterNetEvent("core:OpenVehicle")
AddEventHandler("core:OpenVehicle", function(net)
    local veh = NetworkGetEntityFromNetworkId(net)
    SetVehicleDoorsLocked(veh, 1)
    SetVehicleDoorsLockedForAllPlayers(veh, false)
end)


RegisterNetEvent("core:CleanVehicle")
AddEventHandler("core:CleanVehicle", function(net)
    local veh = NetworkGetEntityFromNetworkId(net)
    SetVehicleDirtLevel(veh, 0)
end)