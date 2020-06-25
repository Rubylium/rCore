RegisterNetEvent("core:SendFacture")
AddEventHandler("core:SendFacture", function(token, target, IsSocietyBill, society, raison, montant)
    if not exports.rFramework:CheckToken(token, source, "SendFacture") then return end
    TriggerClientEvent("core:GetFacture", target, IsSocietyBill, society, raison, montant, source)
end)

RegisterNetEvent("core:CantPayFacture")
AddEventHandler("core:CantPayFacture", function(token, target, montant)
    if not exports.rFramework:CheckToken(token, source, "CantPayFacture") then return end
    TriggerClientEvent("rF:notification", target, "La personne à essayé de payer la facture de ~g~"..montant.."~w~$ mais n'avais pas assez.")
end)

RegisterNetEvent("core:CancelFacture")
AddEventHandler("core:CancelFacture", function(token, target, montant)
    if not exports.rFramework:CheckToken(token, source, "CancelFacture") then return end
    TriggerClientEvent("rF:notification", target, "La personne à refuser de payer la facture de ~g~"..montant.."~w~$.")
end)


RegisterNetEvent("core:PayFacture")
AddEventHandler("core:PayFacture", function(token, target, montant)
    if not exports.rFramework:CheckToken(token, source, "PayFacture") then return end
    TriggerClientEvent("rF:notification", target, "La personne à payer la facture de ~g~"..montant.."~w~$.")
end)

RegisterNetEvent("core:PayFactureSociety")
AddEventHandler("core:PayFactureSociety", function(token, target, montant)
    if not exports.rFramework:CheckToken(token, source, "PayFactureSociety") then return end
    TriggerClientEvent("rF:notification", target, "La personne à payer la facture de société de ~g~"..montant.."~w~$.")
end)



RegisterNetEvent("core:ChangeDoorStatus")
AddEventHandler("core:ChangeDoorStatus", function(token, players, pos, model, heading, status)
    if not exports.rFramework:CheckToken(token, source, "core:ChangeDoorStatus") then return end
    for k,v in pairs(players) do
        TriggerClientEvent("core:ChangeDoorStatus", v, pos, model, heading, status)
    end
end)


RegisterNetEvent("core:ChangeDoubleDoorStatus")
AddEventHandler("core:ChangeDoubleDoorStatus", function(token, players, door1, door2, status)
    if not exports.rFramework:CheckToken(token, source, "core:ChangeDoubleDoorStatus") then return end
    for k,v in pairs(players) do
        TriggerClientEvent("core:ChangeDoubleDoorStatus", v, door1, door2, status)
    end
end)


local LockedSup = {}

function StartSupTimer(id)
    local id = id
    Citizen.CreateThread(function()
        LockedSup[id] = {}
        LockedSup[id].check = false
        Wait(30*60*1000)
        LockedSup[id] = nil
    end)
end

RegisterNetEvent("core:CheckIfCanStartSup")
AddEventHandler("core:CheckIfCanStartSup", function(token, id, streetName, job)
    if not exports.rFramework:CheckToken(token, source, "core:CheckIfCanStartSup") then return end
    if LockedSup[id] == nil then
        if #GetActivePlayersFromJob(job) >= 3 then
            exports.rFramework:SendLog("["..source.."] "..GetPlayerName(source).." à lancer une braquage de superette avec "..#GetActivePlayersFromJob(job).." policer.", "superette")
            TriggerClientEvent("core:GetSupStatus", source, true)
            for k,v in pairs(GetActivePlayersFromJob(job)) do
                data = {["code"] = '10-31', ["name"] = 'Une alarme de superette vient de sonner, 10-32 vue sur les lieux. Intervention requise.', ["loc"] = streetName}
                length = 3500
                TriggerClientEvent("core:GetLspdCall", v.id, type, data, length, GetEntityCoords(GetPlayerPed(source)))
            end
            StartSupTimer(id)
        else
            TriggerClientEvent("core:GetSupStatus", source, false)
        end
    elseif LockedSup[id].check == false then
        TriggerClientEvent("core:GetSupStatus", source, false)
    else
        if #GetActivePlayersFromJob(job) >= 3 then
            exports.rFramework:SendLog("["..source.."] "..GetPlayerName(source).." à lancer une braquage de superette avec "..#GetActivePlayersFromJob(job).." policer.", "superette")
            TriggerClientEvent("core:GetSupStatus", source, true)
            for k,v in pairs(GetActivePlayersFromJob(job)) do
                data = {["code"] = '10-31', ["name"] = 'Une alarme de superette vient de sonner, 10-32 vue sur les lieux. Intervention requise.', ["loc"] = streetName}
                length = 3500
                TriggerClientEvent("core:GetLspdCall", v.id, type, data, length, GetEntityCoords(GetPlayerPed(source)))
            end
            StartSupTimer(id)
        else
            TriggerClientEvent("core:GetSupStatus", source, false)
        end
    end
end)