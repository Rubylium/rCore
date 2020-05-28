
RegisterNetEvent("core:ShowIdentityCardToOther")
AddEventHandler("core:ShowIdentityCardToOther", function(token, target, net, Prenom, Nom, Age, Job)
    if not exports.rFramework:CheckToken(token, source, "ShowIdentityCardToOther") then return end
    TriggerClientEvent("core:ShowIdentityCardToOther", target, net, source, Prenom, Nom, Age, Job)
end)