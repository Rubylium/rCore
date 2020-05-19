
RegisterNetEvent("core:ShowIdentityCardToOther")
AddEventHandler("core:ShowIdentityCardToOther", function(target, net, Prenom, Nom, Age, Job)
    TriggerClientEvent("core:ShowIdentityCardToOther", target, net, source, Prenom, Nom, Age, Job)
end)