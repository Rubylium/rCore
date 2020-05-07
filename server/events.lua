RegisterNetEvent("core:SendFacture")
AddEventHandler("core:SendFacture", function(target, IsSocietyBill, society, raison, montant)
    TriggerClientEvent("core:GetFacture", target, IsSocietyBill, society, raison, montant, source)
end)

RegisterNetEvent("core:CantPayFacture")
AddEventHandler("core:CantPayFacture", function(target, montant)
    TriggerClientEvent("rF:notification", target, "La personne à essayé de payer la facture de ~g~"..montant.."~w~$ mais n'avais pas assez.")
end)

RegisterNetEvent("core:CancelFacture")
AddEventHandler("core:CancelFacture", function(target, montant)
    TriggerClientEvent("rF:notification", target, "La personne à refuser de payer la facture de ~g~"..montant.."~w~$.")
end)


RegisterNetEvent("core:PayFacture")
AddEventHandler("core:PayFacture", function(target, montant)
    TriggerClientEvent("rF:notification", target, "La personne à payer la facture de ~g~"..montant.."~w~$.")
end)

RegisterNetEvent("core:PayFactureSociety")
AddEventHandler("core:PayFactureSociety", function(target, montant)
    TriggerClientEvent("rF:notification", target, "La personne à payer la facture de société de ~g~"..montant.."~w~$.")
end)