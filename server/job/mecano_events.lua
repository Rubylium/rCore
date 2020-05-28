RegisterNetEvent("core:Repair")
AddEventHandler("core:Repair", function(token, veh, id)
    if not exports.rFramework:CheckToken(token, source, "Repair") then return end
    TriggerClientEvent("core:Repair", id, veh)
end)


RegisterNetEvent("core:OpenSomething")
AddEventHandler("core:OpenSomething", function(token, veh, id, door, status)
    if not exports.rFramework:CheckToken(token, source, "OpenSomething") then return end
    TriggerClientEvent("core:OpenSomething", id, veh, door, status)
end)


RegisterNetEvent("core:OpenVehicle")
AddEventHandler("core:OpenVehicle", function(token, id, veh)
    if not exports.rFramework:CheckToken(token, source, "OpenVehicle") then return end
    TriggerClientEvent("core:OpenVehicle", id, veh)
end)

RegisterNetEvent("core:CleanVehicle")
AddEventHandler("core:CleanVehicle", function(token, id, veh)
    if not exports.rFramework:CheckToken(token, source, "CleanVehicle") then return end
    TriggerClientEvent("core:CleanVehicle", id, veh)
end)

RegisterNetEvent("core:SetCoordsVeh")
AddEventHandler("core:SetCoordsVeh", function(token, id, veh, coords)
    if not exports.rFramework:CheckToken(token, source, "SetCoordsVeh") then return end
    TriggerClientEvent("core:SetCoordsVeh", id, veh, coords)
end)