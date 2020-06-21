
pKeys = {}


RegisterNetEvent("core:RefreshKeys")
AddEventHandler("core:RefreshKeys", function(keys)
    pKeys = keys
    RageUI.Popup({message = "Vos clés de véhicules ont été mis à jours."})
end)

Citizen.CreateThread(function()
    Wait(5000)
    exports.rFramework:TriggerServerCallback('core:GetKeysBack', function(keys)
        pKeys = keys
    end, token)
end)


function OpenOrCloseVeh()
    local veh = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
    local plate = GetVehicleNumberPlateText(veh)
    if pKeys[plate] ~= nil then
        local target = rUtils.EntityOwner(veh)
        TriggerServerEvent(events.CloseVeh, token, target, VehToNet(veh))
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
        SetVehicleDoorsLocked(vehicle, 0)
    end
end)