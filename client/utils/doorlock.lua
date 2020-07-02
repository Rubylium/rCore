

doords = {}
 
local DoorCache = {}

function InitDoorSync()
    Citizen.CreateThread(function()
        while true do
            Wait(15000)
            TriggerServerEvent(events.AskSyndDoors)
        end
    end)
end

RegisterNetEvent("core:SyncDoors")
AddEventHandler("core:SyncDoors", function(doors)
    doords = doors
end)

RegisterNetEvent("core:ChangeDoorStatus")
AddEventHandler("core:ChangeDoorStatus", function(pos, model, heading, status, id)
    local obj = GetClosestObjectOfType(pos, 2.0, model, false, false, false)
    FreezeEntityPosition(obj, status)
    SetEntityHeading(obj, heading)
    if DoorCache[obj] == nil then DoorCache[obj] = {} end
    DoorCache[obj].status = status
    doords[id].status = status
end)

RegisterNetEvent("core:ChangeDoubleDoorStatus")
AddEventHandler("core:ChangeDoubleDoorStatus", function(door1, door2, status, id)
    local obj = GetClosestObjectOfType(door1.pos, 2.0, door1.model, false, false, false)
    FreezeEntityPosition(obj, status)
    SetEntityHeading(obj, door1.heading)
    if DoorCache[obj] == nil then DoorCache[obj] = {} end
    DoorCache[obj].status = status

    local obj2 = GetClosestObjectOfType(door2.pos, 2.0, door2.model, false, false, false)
    FreezeEntityPosition(obj2, status)
    SetEntityHeading(obj2, door2.heading)
    if DoorCache[obj2] == nil then DoorCache[obj2] = {} end
    DoorCache[obj2].status = status
    doords[id].status = status
end)


Citizen.CreateThread(function()
    while true do
        Wait(1500)
        for _,v in pairs(doords) do
            if not v.double then
                local obj = GetClosestObjectOfType(v.pos.pos, 2.0, v.pos.model, false, false, false)
                if not obj then break end
                if v.status == false then
                    DoorCache[obj] = {}
                    DoorCache[obj].status = false
                    FreezeEntityPosition(obj, false)
                else
                    if DoorCache[obj] == nil then
                        DoorCache[obj] = {}
                        DoorCache[obj].status = true
                        FreezeEntityPosition(obj, true)
                    end
                end
            else
                local obj = GetClosestObjectOfType(v.pos[1].pos, 2.0, v.pos[1].model, false, false, false)
                if not obj then break end
                if v.status == false then
                    DoorCache[obj] = {}
                    DoorCache[obj].status = false
                    FreezeEntityPosition(obj, false)


                    local obj = GetClosestObjectOfType(v.pos[2].pos, 2.0, v.pos[2].model, false, false, false)
                    if not obj then break end
                    if DoorCache[obj] == nil then
                        DoorCache[obj] = {}
                        DoorCache[obj].status = false
                        FreezeEntityPosition(obj, false)
                    end


                else
                    if DoorCache[obj] == nil then
                        DoorCache[obj] = {}
                        DoorCache[obj].status = true
                        FreezeEntityPosition(obj, true)
                    end



                    local obj = GetClosestObjectOfType(v.pos[2].pos, 2.0, v.pos[2].model, false, false, false)
                    if not obj then break end
                    if DoorCache[obj] == nil then
                        DoorCache[obj] = {}
                        DoorCache[obj].status = true
                        FreezeEntityPosition(obj, true)
                    end
                end
            end
        end
    end
end)

local closetObj = nil
Citizen.CreateThread(function()
    while true do
        local nearDoor = false
        for k,v in pairs(doords) do
            if not v.double then
                local dst = #(GetEntityCoords(pPed) - v.pos.pos)
                if dst <= 1.5 then
                    nearDoor = true
                    if closetObj == nil then
                        closetObj = GetClosestObjectOfType(v.pos.pos, 2.0, v.pos.model, false, false, false)
                    end
                    if DoorCache[closetObj] == nil then break end
                    if DoorCache[closetObj].status ~= true then
                        DrawTxt(GetEntityCoords(closetObj), "Appuyer sur E pour ~r~fermer la porte.")
                    else
                        DrawTxt(GetEntityCoords(closetObj), "Appuyer sur E pour ~g~ouvrir la porte.")
                    end
                    if IsControlJustReleased(1, 38) then
                        if v.job[pJob] ~= nil then
                            if DoorCache[closetObj].status == true then
                                local player = rUtils.GetPlayersInScope()
                                TriggerServerEvent(events.DoorStatus, token, player, v.pos.pos, v.pos.model, v.pos.heading, false, k)
                            else
                                local player = rUtils.GetPlayersInScope()
                                TriggerServerEvent(events.DoorStatus, token, player, v.pos.pos, v.pos.model, v.pos.heading, true, k)
                            end
                        end
                    end


                    break
                end
            else

                local dst = #(GetEntityCoords(pPed) - v.pos[1].pos)
                if dst <= 2.5 then
                    nearDoor = true
                    if closetObj == nil then
                        closetObj = GetClosestObjectOfType(v.pos[1].pos, 2.0, v.pos[1].model, false, false, false)
                    end
                    if DoorCache[closetObj] == nil then break end
                    if DoorCache[closetObj].status ~= true then
                        DrawTxt(GetEntityCoords(closetObj), "Appuyer sur E pour ~r~fermer les portes.")
                    else
                        DrawTxt(GetEntityCoords(closetObj), "Appuyer sur E pour ~g~ouvrir les portes.")
                    end
                    if IsControlJustReleased(1, 38) then
                        if v.job[pJob] ~= nil then
                            if DoorCache[closetObj].status == true then
                                local player = rUtils.GetPlayersInScope()
                                TriggerServerEvent(events.DoubleDoorStatus, token, player, v.pos[1], v.pos[2], false, k)
                            else
                                local player = rUtils.GetPlayersInScope()
                                TriggerServerEvent(events.DoubleDoorStatus, token, player, v.pos[1], v.pos[2], true, k)
                            end
                        end
                    end


                    break
                end
            end

                
        end

        if nearDoor then
            Wait(3)
        else
            closetObj = nil
            Wait(750)
        end
    end
end)