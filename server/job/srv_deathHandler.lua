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

RegisterNetEvent("core:CallBackReady")
AddEventHandler("core:CallBackReady", function()
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
    end
end)


RegisterNetEvent("core:SetPlayerDeathStatus")
AddEventHandler("core:SetPlayerDeathStatus", function(token, status)
    if not exports.rFramework:CheckToken(token, source, "SetPlayerDeathStatus") then return end
    if status then
        DeathStatus[source] = {id = source, NeedMedic = 2}
    else
        DeathStatus[source] = {id = source, NeedMedic = 1}
    end
end)