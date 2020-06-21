

RegisterNetEvent("core:GetReport")
AddEventHandler("core:GetReport", function(_msg, _id)
    print(_msg, _id)
    SendNUIMessage({report = true, msg = _msg, id = _id})
end)   


RegisterCommand("report", function(source, args, rawCommand)
    local reason = table.concat(args, " ",1)
    TriggerServerEvent(events.RegCall, token, "staff", reason)
    rUtils.ImportantNotif("Les reports avec très peu d'explication seront ignorés. Merci de resté poli dans vos demandes.")
end, false)