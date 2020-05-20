
pKeys = {}

Citizen.CreateThread(function()
    TriggerServerCallback('core:GetKeysBack', function(keys)
        pKeys = keys
    end)
end)


function OpenOrCloseVeh()
    local veh = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
    local plate = GetVehicleNumberPlateText(veh)
    if pKeys[plate] ~= nil then
        local target = rUtils.EntityOwner(veh)
        TriggerServerEvent("core:CloseVeh", target, VehToNet(veh))
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(200)
        SetVehicleLights(veh, 0)
        Wait(200)
        SetVehicleLights(veh, 2)
        SoundVehicleHornThisFrame(veh)
        Wait(400)
        SetVehicleLights(veh, 0)
    end
end




RegisterNetEvent("core:CloseVeh")
AddEventHandler("core:CloseVeh", function(net)
    local vehicle = NetToVeh(net)
    if GetVehicleDoorLockStatus(vehicle) == 0 or GetVehicleDoorLockStatus(vehicle) == 1 then
        SetVehicleDoorsLocked(vehicle, 2)
    else
        etVehicleDoorsLocked(vehicle, 0)
    end
end)