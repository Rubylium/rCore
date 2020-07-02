RegisterNetEvent("core:SendFacture")
AddEventHandler("core:SendFacture", function(token, target, IsSocietyBill, society, raison, montant)
    if not exports.rFramework:CheckToken(token, source, "SendFacture") then return end
    TriggerClientEvent("core:GetFacture", target, IsSocietyBill, society, raison, montant, source)
    if IsSocietyBill then
        exports.rFramework:SendLog("Le joueur **["..source.."]** "..GetPlayerName(source).." à donner une facture de société "..society.." à **["..target.."]** "..GetPlayerName(target).." de **"..montant.."$** avec la raison: "..raison, "facture")
    else
        exports.rFramework:SendLog("Le joueur **["..source.."]** "..GetPlayerName(source).." à donner une facture à **["..target.."]** "..GetPlayerName(target).." de **"..montant.."$** avec la raison: "..raison, "facture")
    end
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
AddEventHandler("core:ChangeDoorStatus", function(token, players, pos, model, heading, status, id)
    if not exports.rFramework:CheckToken(token, source, "core:ChangeDoorStatus") then return end

    doords[id].status = status
    for k,v in pairs(players) do
        TriggerClientEvent("core:ChangeDoorStatus", v, pos, model, heading, status, id)
    end
end)


RegisterNetEvent("core:ChangeDoubleDoorStatus")
AddEventHandler("core:ChangeDoubleDoorStatus", function(token, players, door1, door2, status, id)
    if not exports.rFramework:CheckToken(token, source, "core:ChangeDoubleDoorStatus") then return end

    doords[id].status = status
    for k,v in pairs(players) do
        TriggerClientEvent("core:ChangeDoubleDoorStatus", v, door1, door2, status, id)
    end
end)


RegisterServerEvent('core:CarryPeople:sync')
AddEventHandler('core:CarryPeople:sync', function(token, target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
    if not exports.rFramework:CheckToken(token, source, "core:CarryPeople:sync") then return end
	TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('CarryPeople:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('core:CarryPeople:stop')
AddEventHandler('core:CarryPeople:stop', function(token, targetSrc)
    if not exports.rFramework:CheckToken(token, source, "core:CarryPeople:sync") then return end
	TriggerClientEvent('CarryPeople:cl_stop', targetSrc)
end)


local LockedSup = {}
local GlobalCooldown = false
function StartSupTimer(id)
    local id = id
    Citizen.CreateThread(function()
        LockedSup[id] = {}
        LockedSup[id].check = false
        Wait(60*60*1000)
        LockedSup[id] = nil
    end)
end


function StartGlobalCooldown()
    Citizen.CreateThread(function()
        GlobalCooldown = true
        Wait(30*60*1000)
        GlobalCooldown = false
    end)
end

RegisterNetEvent("core:CheckIfCanStartSup")
AddEventHandler("core:CheckIfCanStartSup", function(token, id, streetName, job)
    if GlobalCooldown then 
        TriggerClientEvent("core:GetSupStatus", source, false, "La caisse est vide.")
        return
    end
    if not exports.rFramework:CheckToken(token, source, "core:CheckIfCanStartSup") then return end
    local JobList, num = GetActivePlayersFromJob(job)
    if LockedSup[id] == nil then
        if num >= 5 then
            StartGlobalCooldown()
            exports.rFramework:SendLog("["..source.."] "..GetPlayerName(source).." à lancer un braquage de superette avec "..num.." policer.", "superette")
            TriggerClientEvent("core:GetSupStatus", source, true)
            for k,v in pairs(JobList) do
                data = {["code"] = '10-31', ["name"] = 'Une alarme de superette vient de sonner, 10-32 vue sur les lieux. Intervention requise.', ["loc"] = streetName}
                length = 60000
                TriggerClientEvent("core:GetLspdCall", v.id, type, data, length, GetEntityCoords(GetPlayerPed(source)))
            end
            StartSupTimer(id)
            return
        else
            TriggerClientEvent("core:GetSupStatus", source, false, job..": "..num.."/5")
            return
        end
    elseif LockedSup[id].check == false then
        TriggerClientEvent("core:GetSupStatus", source, false, "La caisse est vide.")
        return
    else
        if num >= 5 then
            StartGlobalCooldown()
            exports.rFramework:SendLog("["..source.."] "..GetPlayerName(source).." à lancer un braquage de superette avec "..num.." policer.", "superette")
            TriggerClientEvent("core:GetSupStatus", source, true)
            for k,v in pairs(JobList) do
                data = {["code"] = '10-31', ["name"] = 'Une alarme de superette vient de sonner, 10-32 vue sur les lieux. Intervention requise.', ["loc"] = streetName}
                length = 60000
                TriggerClientEvent("core:GetLspdCall", v.id, type, data, length, GetEntityCoords(GetPlayerPed(source)))
            end
            StartSupTimer(id)
            return
        else
            TriggerClientEvent("core:GetSupStatus", source, false, job..": "..num.."/5")
            return
        end
    end
end)