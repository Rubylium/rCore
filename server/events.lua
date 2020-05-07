RegisterNetEvent("core:SendFacture")
AddEventHandler("core:SendFacture", function(target, IsSocietyBill, society, raison, montant)
    TriggerClientEvent("core:GetFacture", target, IsSocietyBill, society, raison, montant, source)
end)
