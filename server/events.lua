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


RegisterNetEvent("core:AttachVeh")
AddEventHandler("core:AttachVeh", function(token, target, ServerID, pVehLast, attach)
    if not exports.rFramework:CheckToken(token, source, "core:AttachVeh") then return end
    TriggerClientEvent('core:AttachVeh', ServerID, target, pVehLast, attach)
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




local EventStarted = false


local events = {
    [1] = {
        zones = {
            vector3(1398.204, 3057.338, 43.50012),
            vector3(996.319, 3163.868, 39.67824),
            vector3(394.4724, 3163.372, 52.30212),
            vector3(535.5374, 2929.966, 39.26488),
            vector3(24.03494, 3049.004, 40.50146),
            vector3(1209.924, 3458.056, 48.0141),
            vector3(1862.308, 3425.862, 45.84152),
            vector3(2257.948, 3543.404, 61.22238),
            vector3(2657.624, 4192.084, 48.61658),
            vector3(2614.678, 4554.16, 38.8365),
            vector3(-298.061, 3521.984, 110.0384),
            vector3(-1572.1, 3145.66, 38.2677),
            vector3(-2036.444, 1619.348, 256.5556),
        },
        price = 1200,
    },
}

RegisterCommand("startevent", function(source, args, rawCommand)
    local zone = events[1].zones[math.random(1,#events[1].zones)]
    TriggerClientEvent("core:StartActivity", -1, 1, zone)
end, false)

RegisterNetEvent("core:WinEvent")
AddEventHandler("core:WinEvent", function(token, type)
    exports.rFramework:_player_add_money(token, source, events[type].price)
    TriggerClientEvent("core:StopActivity", -1)
end)

--Citizen.CreateThread(function()
--    while true do
--        local r = math.random(1,2)
--        local zone = events[r].zones[math.random(1,#events[1].zones)]
--        TriggerClientEvent("core:StartActivity", -1, r, zone)
--        Wait(30*60*1000)
--    end
--end)