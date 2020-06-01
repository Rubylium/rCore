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
    TriggerClientEvent('rF:addMoney', target, montant)
    TriggerClientEvent('rF:rmvMoney', source, montant)
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