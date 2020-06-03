






do
    local sportsZone = {
        {
            pos = vector3(-62.67578, -1282.695, 30.90511),
            heading = 255.8386,
            scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
            stat = "Strength",
            add = 0.05,
            label = "MP0_STRENGTH",
        },
        {
            pos = vector3(-61.08241, -1278.538, 30.90511),
            heading = 176.945556,
            scenario = "WORLD_HUMAN_PUSH_UPS",
            stat = "Stamina",
            add = 0.12,
            label = "MP0_STAMINA",
        },
        {
            pos = vector3(-59.0868, -1285.316, 30.90509),
            heading = 352.70718,
            scenario = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON",
            tp = true,
            stat = "Strength",
            add = 0.10,
            label = "MP0_STRENGTH",
        },
    }


    for k,v in pairs(sportsZone) do
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
            },
            action = function(data)
                StartSportAction(data)
            end,
        })
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
    TaskStartScenarioInPlace(pPed, data.scenario, 0, 1)
    Citizen.CreateThread(function()
        while StillWant do
            RageUI.Text({message = "Pour stopper l'action, Appuyer sur X"})
            if IsControlPressed(1, 73) then
                StillWant = false
                ClearPedTasksImmediately(pPed)
                --ClearPedTasks(pPed)
                UpdatePresence("default")
            end
            Wait(1)
        end
    end)

    Citizen.CreateThread(function()
        while StillWant do
            Wait(500)
            if oldTime + 3500 < GetGameTimer() then
                oldTime = GetGameTimer()
                if not IsPedActiveInScenario(pPed) then
                    Wait(5000)
                    if not IsPedActiveInScenario(pPed) then
                        print("Restarted")
                        TaskStartScenarioInPlace(pPed, data.scenario, 0, 1)
                    end
                end
                UpdatePresence("sport")
                AddStat(data.stat, data.add, data.label)
            end
            Wait(0)
        end
        ClearPedTasks(pPed)
    end)
end