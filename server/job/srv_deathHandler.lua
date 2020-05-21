local DeathStatus = {}

RegisterNetEvent("core:CallBackReady")
AddEventHandler("core:CallBackReady", function()
    exports.rFramework:RegisterServerCallback('core:CheckPlayerDeathStatus', function(source, cb, target)
        if DeathStatus[target] ~= nil then
            cb(DeathStatus[target].NeedMedic)
        else
            cb(0)
        end
    end)
end)


RegisterNetEvent("core:ResetDeathStatus")
AddEventHandler("core:ResetDeathStatus", function(target)
    if DeathStatus[target] ~= nil then
        DeathStatus[target] = {id = target, NeedMedic = 0}
        TriggerClientEvent("core:ResetDeathStatus", target)
    end
end)


RegisterNetEvent("core:SetPlayerDeathStatus")
AddEventHandler("core:SetPlayerDeathStatus", function(status)
    if status then
        DeathStatus[source] = {id = source, NeedMedic = 2}
    else
        DeathStatus[source] = {id = source, NeedMedic = 1}
    end
end)