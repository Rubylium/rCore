local DeathStatus = {}

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(DeathStatus) do
            if GetPlayerPing(v.id) == 0 then
                table.remove(DeathStatus, k)
            end
        end
        Wait(60*60000)
    end
end)

CallBackReady = false
RegisterNetEvent("core:CallBackReady")
AddEventHandler("core:CallBackReady", function()
    CallBackReady = true
    exports.rFramework:RegisterServerCallback('core:CheckPlayerDeathStatus', function(source, cb, target)
        print(source, target, target2)
        if DeathStatus[target] ~= nil then
            print(target, DeathStatus[target].NeedMedic)
            cb(DeathStatus[target].NeedMedic)
        else
            print(target, 0)
            cb(0)
        end
    end)
end)


RegisterNetEvent("core:ResetDeathStatus")
AddEventHandler("core:ResetDeathStatus", function(token, target)
    if not exports.rFramework:CheckToken(token, source, "ResetDeathStatus") then return end
    if DeathStatus[target] ~= nil then
        DeathStatus[target] = {id = target, NeedMedic = 0}
        TriggerClientEvent("core:ResetDeathStatus", target)
        exports.rFramework:SetPlayerDeathStatus(target, false)
    end
end) 

RegisterNetEvent("core:DeathStatus")
AddEventHandler("core:DeathStatus", function(target)
    if DeathStatus[target] ~= nil then
        DeathStatus[target] = {id = target, NeedMedic = 0}
        exports.rFramework:SetPlayerDeathStatus(target, false)
    end
    TriggerClientEvent("core:ResetDeathStatus", target)
end)


RegisterNetEvent("core:SetPlayerDeathStatus")
AddEventHandler("core:SetPlayerDeathStatus", function(token, status)
    if not exports.rFramework:CheckToken(token, source, "SetPlayerDeathStatus") then return end
    exports.rFramework:SetPlayerDeathStatus(source, true)
    if status then
        DeathStatus[source] = {id = source, NeedMedic = 2}
    else
        DeathStatus[source] = {id = source, NeedMedic = 1}
    end
end)