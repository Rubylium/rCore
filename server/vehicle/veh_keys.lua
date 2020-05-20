
local VehKeys = {}

RegisterNetEvent("core:CallBackReady")
AddEventHandler("core:CallBackReady", function()
    DeployCb()
end)

function DeployCb()
    exports.rFramework:RegisterServerCallback('core:AddKeyIfNotAlreadyHave', function(source, cb, plate)
        local ids = GetPlayerIdentifier(source, 0)
        if VehKeys[ids] == nil then
            VehKeys[ids] = {}
            VehKeys[ids].keys = {}
            VehKeys[ids].keys[plate] = true
            print("^2KEYS: ^7Added key "..plate.." for user "..ids)
            cb(true)
        else
            print("^2KEYS: ^7Could not give key for "..plate.." the user "..ids.." already have them.")
            cb(false)
        end
    end)


    exports.rFramework:RegisterServerCallback('core:GiveKeyToTarget', function(source, cb, plate, target)
        local ids = GetPlayerIdentifier(target, 0)
        if VehKeys[ids] == nil then
            VehKeys[ids] = {}
            VehKeys[ids].keys = {}
            VehKeys[ids].keys[plate] = true
            print("^2KEYS: ^7Added key "..plate.." for user "..ids)
            TriggerClientEvent("core:RefreshKeys", target)
            cb(true)
        else
            print("^2KEYS: ^7Could not give key for "..plate.." the user "..ids.." already have them.")
            cb(false)
        end
    end)
    
    
    exports.rFramework:RegisterServerCallback('core:GetKeysBack', function(source, cb, things)
        local ids = GetPlayerIdentifier(source, 0)
        if VehKeys[ids] == nil then
            cb({})
            return
        else
            cb(VehKeys[ids].keys)
            return
        end
        cb({})
    end)
end


-- Events

RegisterNetEvent("core:CloseVeh")
AddEventHandler("core:CloseVeh", function(target, veh)
    TriggerClientEvent("core:CloseVeh", target, veh)
end)