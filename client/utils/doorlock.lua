

local doords = {
    {
        double = true,
        job = {"police", "sherrif"},
        pos = {
            {pos = vector3(-440.81521606445, 6007.4604492188,31.871360778809), model = -2023754432, heading = 135.43254089355,},
            {pos = vector3(-442.65530395508, 6009.2998046875,31.871360778809), model = -2023754432, heading = 315.50006103516,},
        }   
    },

    {
        double = true,
        job = {"police", "sherrif"},
        pos = {
            {pos = vector3(-442.85778808594, 6010.9580078125,31.865228652954), model = -2023754432, heading = 44.56713104248,},
            {pos = vector3(-441.01849365234, 6012.794921875,31.865228652954), model = -2023754432, heading = 225.32643127441,},
        }
    },

    {
        double = false,
        job = {"police", "sherrif"},
        pos = vector3(-437.04159545898, 6003.7045898438,31.868148803711),
        model = 749848321,
        heading = 135.00007629395,
    },
}

local DoorCache = {}

RegisterNetEvent("core:ChangeDoorStatus")
AddEventHandler("core:ChangeDoorStatus", function(pos, model, heading, status)
    local obj = GetClosestObjectOfType(pos, 2.0, model, false, false, false)
    FreezeEntityPosition(obj, status)
    SetEntityHeading(obj, heading)
    if DoorCache[obj] == nil then DoorCache[obj] = {} end
    DoorCache[obj].status = status
end)

RegisterNetEvent("core:ChangeDoubleDoorStatus")
AddEventHandler("core:ChangeDoubleDoorStatus", function(door1, door2, status)
    local obj = GetClosestObjectOfType(door1.pos, 2.0, door1.model, false, false, false)
    FreezeEntityPosition(obj, status)
    SetEntityHeading(obj, door1.heading)
    if DoorCache[obj] == nil then DoorCache[obj] = {} end
    DoorCache[obj].status = status

    local obj = GetClosestObjectOfType(door2.pos, 2.0, door2.model, false, false, false)
    FreezeEntityPosition(obj, status)
    SetEntityHeading(obj, door2.heading)
    if DoorCache[obj] == nil then DoorCache[obj] = {} end
    DoorCache[obj].status = status
end)


Citizen.CreateThread(function()
    while true do
        Wait(1500)
        for _,v in pairs(doords) do
            if not v.double then
                local obj = GetClosestObjectOfType(v.pos, 2.0, v.model, false, false, false)
                if not obj then break end
                if DoorCache[obj] == nil then
                    DoorCache[obj] = {}
                    DoorCache[obj].status = true
                    FreezeEntityPosition(obj, true)
                end
            else
                local obj = GetClosestObjectOfType(v.pos[1].pos, 2.0, v.pos[1].model, false, false, false)
                if not obj then break end
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
end)


Citizen.CreateThread(function()
    while true do
        local nearDoor = false
        for _,v in pairs(doords) do
            if not v.double then
                local dst = #(GetEntityCoords(pPed) - v.pos)
                if dst <= 2.5 then
                    nearDoor = true
                    local obj = GetClosestObjectOfType(v.pos, 2.0, v.model, false, false, false)
                    if DoorCache[obj] ~= nil then
                        DrawTxt(GetEntityCoords(obj), "Appuyer sur E pour ouvrir la porte.")
                    else
                        DrawTxt(GetEntityCoords(obj), "Appuyer sur E pour fermer la porte.")
                    end
                    if IsControlJustReleased(1, 38) then
                        if DoorCache[obj].status == true then
                            local player = rUtils.GetPlayersInScope()
                            TriggerServerEvent("core:ChangeDoorStatus", token, player, v.pos, v.model, v.heading, false)
                        else
                            local player = rUtils.GetPlayersInScope()
                            TriggerServerEvent("core:ChangeDoorStatus", token, player, v.pos, v.model, v.heading, true)
                        end
                    end


                    break
                end
            else

                local dst = #(GetEntityCoords(pPed) - v.pos[1].pos)
                if dst <= 2.5 then
                    nearDoor = true
                    local obj = GetClosestObjectOfType(v.pos[1].pos, 2.0, v.pos[1].model, false, false, false)
                    if DoorCache[obj] ~= nil then
                        DrawTxt(GetEntityCoords(obj), "Appuyer sur E pour ouvrir les portes.")
                    else
                        DrawTxt(GetEntityCoords(obj), "Appuyer sur E pour fermer les portes.")
                    end
                    if IsControlJustReleased(1, 38) then
                        if DoorCache[obj].status == true then
                            local player = rUtils.GetPlayersInScope()
                            TriggerServerEvent("core:ChangeDoubleDoorStatus", token, player, v.pos[1], v.pos[2], false)
                        else
                            local player = rUtils.GetPlayersInScope()
                            TriggerServerEvent("core:ChangeDoubleDoorStatus", token, player, v.pos[1], v.pos[2], true)
                        end
                    end


                    break
                end
            end

                
        end

        if nearDoor then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)