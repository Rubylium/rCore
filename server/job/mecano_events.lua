RegisterNetEvent("core:Repair")
AddEventHandler("core:Repair", function(veh, id)
    TriggerClientEvent("core:Repair", id, veh)
end)


RegisterNetEvent("core:OpenSomething")
AddEventHandler("core:OpenSomething", function(veh, id, door, status)
    TriggerClientEvent("core:OpenSomething", id, veh, door, status)
end)


RegisterNetEvent("core:OpenVehicle")
AddEventHandler("core:OpenVehicle", function(id, veh)
    TriggerClientEvent("core:OpenVehicle", id, veh)
end)

RegisterNetEvent("core:CleanVehicle")
AddEventHandler("core:CleanVehicle", function(id, veh)
    TriggerClientEvent("core:CleanVehicle", id, veh)
end)

RegisterNetEvent("core:SetCoordsVeh")
AddEventHandler("core:SetCoordsVeh", function(id, veh, coords)
    TriggerClientEvent("core:SetCoordsVeh", id, veh, coords)
end)