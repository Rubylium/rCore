






do
    local sportsZone = {
        {
            pos = vector3(-62.67578, -1282.695, 30.90511),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-61.01798, -1289.204, 30.9051),
        },
        {
            pos = vector3(-61.08241, -1278.538, 30.90511),
            heading = 176.945556,
            scenario = "WORLD_HUMAN_PUSH_UPS",
            stat = "Stamina",
            add = 0.12,
            label = "MP0_STAMINA",
            anim = true,
            anim_ = "idle_d",
            dict = "amb@world_human_push_ups@male@idle_a",
            respawn = vector3(-61.01798, -1289.204, 30.9051),
        },
        {
            pos = vector3(-59.0868, -1285.316, 30.90509),
            heading = 352.70718,
            scenario = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
            tp = true,
            stat = "Strength",
            add = 0.10,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-61.01798, -1289.204, 30.9051),
        },


        {
            pos = vector3(-1199.824, -1571.408, 4.60957),
            heading = 37.746078491,
            scenario = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
            tp = true,
            stat = "Strength",
            add = 0.10,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
        {
            pos = vector3(-1204.948, -1564.142, 4.609482),
            heading = 213.989105,
            scenario = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
            tp = true,
            stat = "Strength",
            add = 0.10,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },


        {
            pos = vector3(-1197.422, -1566.428, 4.619752),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
        {
            pos = vector3(-1208.992, -1559.206, 4.60844),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
        {
            pos = vector3(-1210.486, -1561.294, 4.607992),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
        {
            pos = vector3(-1202.542, -1573.024, 4.60799),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
        {
            pos = vector3(-1198.312, -1573.678, 4.610016),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
            anim = false,
            respawn = vector3(-1203.232, -1570.356, 4.60799),
        },
    }


    for k,v in pairs(sportsZone) do
        if not v.anim then
            rUtils.RegisterActionZone({
                pos = vector3(v.pos),
                data = {
                    heading = v.heading,
                    scenario = v.scenario,
                    pos = v.pos,
                    tp = v.tp,
                    stat = v.stat,
                    add = v.add,
                    label = v.label,
                    anim = false,
                    respawn = v.respawn,
                },
                action = function(data)
                    StartSportAction(data)
                end,
            })
        else
            rUtils.RegisterActionZone({
                pos = vector3(v.pos),
                data = {
                    heading = v.heading,
                    scenario = v.scenario,
                    pos = v.pos,
                    tp = v.tp,
                    stat = v.stat,
                    add = v.add,
                    label = v.label,
                    anim = true,
                    anim_ = v.anim_,
                    dict = v.dict,
                    respawn = v.respawn,
                },
                action = function(data)
                    StartSportAction(data)
                end,
            })
        end

    end
end



function StartSportAction(data)
    local oldTime = GetGameTimer()
    local StillWant = true

    if data.tp ~= nil then
        local p, dst = rUtils.GetClosestPlayer(data.pos)
        if p ~= nil then 
            if dst <= 0.6 and GetPlayerPed(p) ~= pPed then 
                rUtils.Notif("Quelqu'un est déja en train de faire du sport ici.") 
                return 
            end
        end
       --SetEntityCoordsNoOffset(pPed, data.pos, 0.0, 0.0, 0.0)
       --SetEntityHeading(pPed, data.heading)

        if not IsEntityAtCoord(pPed, data.pos, 0.1, 0.1, 0.1, false, true, 0) then
            TaskGoStraightToCoord(pPed, data.pos, 1.0, 20000, data.heading, 0.1)
            while not IsEntityAtCoord(pPed, data.pos, 0.1, 0.1, 0.1, false, true, 0) do
                Citizen.Wait(2000)
            end
        end
        Wait(1000)
    end
    InAction = true
    if not data.anim then
        TaskStartScenarioInPlace(pPed, data.scenario, 0, 1)
    else
        rUtils.PlayAnim(data.dict, data.anim_, 1)
    end
    Citizen.CreateThread(function()
        while StillWant do
            RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
            if IsControlPressed(1, 73) then
                
                InAction = false
                ClearPedTasksImmediately(pPed)
                --ClearPedTasks(pPed)
                UpdatePresence("default")
            end
            Wait(1)
        end
    end)

    Citizen.CreateThread(function()
        local count = 0
        while StillWant do
            Wait(500)
            if oldTime + 3500 < GetGameTimer() then
                oldTime = GetGameTimer()
                
                if not data.anim then
                    if not IsPedActiveInScenario(pPed) then
                        Wait(5000)
                        if not IsPedActiveInScenario(pPed) then
                            StillWant = false
                            UpdatePresence("default")
                        end
                    end
                else
                    if not IsEntityPlayingAnim(pPed, data.dict, data.anim_, 1) then
                        Wait(5000)
                        if not IsEntityPlayingAnim(pPed, data.dict, data.anim_, 1) then
                            StillWant = false
                            UpdatePresence("default")
                        end
                    end
                end
                count = count + 1
                UpdatePresence("sport")
                AddStat(data.stat, data.add, data.label)
                if count > 20 then
                    StillWant = false
                    rUtils.ImportantNotif("Tu as terminé ton exercice, change de machine.")
                    SetEntityCoordsNoOffset(pPed, data.respawn, 0.0, 0.0, 0.0)
                    UpdatePresence("default")
                end
            end
            Wait(0)
        end
        InAction = false
        ClearPedTasks(pPed)
    end)
end