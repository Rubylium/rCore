
function LoadDrusillaData()
    self = JobsData.drusilla

    rUtils.RegisterGarageZone({
        pos = vector3(297.5036, -962.8582, 29.418),
        spawns = {
            {pos = vector3(300.1928, -958.6212, 28.90388),heading = 267.90734863282,},
            {pos = vector3(307.4758, -958.7778, 28.86922),heading = 269.46911621094,},
            {pos = vector3(315.5272, -959.0318, 28.90494),heading = 269.35095214844,},
        },
        vehs = {
            {spawn = "burrito3", nom = "Van de transport"},
            {spawn = "faggio3", nom = "Scooter"},
        },
    })


    rUtils.RegisterActionZone({
        pos = vector3(277.2076, -977.1232, 29.87126),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(273.9544, -975.2388, 29.86874),
        action = function()
            OpenDrusillasCraftMenu()
        end,
    })


    RMenu.Add('core', 'drusilla_main', RageUI.CreateMenu("Drusilla's", "~b~Menu action Drusilla"))
    RMenu:Get('core', 'drusilla_main').Closed = function()
        open = false
    end

    function OpenDrusillasActionMenu()
        open = true
        RageUI.Visible(RMenu:Get('core', 'drusilla_main'), not RageUI.Visible(RMenu:Get('core', 'drusilla_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'drusilla_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end)

                    RageUI.ButtonWithStyle("lancer une mission de livraison", "Au moins 1 ~b~Pizza simple~s~ est requis.", {}, pInventory[self.mission.item] ~= nil, function(Hovered, Active, Selected)
                        if Selected then
                            NpcJobMissions:StartJobMission(self.mission)
                        end
                    end) 

                    RageUI.ButtonWithStyle("Donner une facture", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            OpenBillCreation()
                        end
                    end)

                end, function()
                end)
            end
        end)
    end


    RMenu.Add('core', 'drusilla_craft', RageUI.CreateMenu("Drusilla's", "~b~Menu cuisine Drusilla's"))
    RMenu:Get('core', 'drusilla_craft').Closed = function()
        open = false
    end

    function OpenDrusillasCraftMenu()
        open = true
        RageUI.Visible(RMenu:Get('core', 'drusilla_craft'), not RageUI.Visible(RMenu:Get('core', 'drusilla_craft')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'drusilla_craft'), false, false, false, function()
                    for k,v in pairs(self.craft) do
                        RageUI.Button(v.nom, v.desc, true, function(Hovered, Active, Selected)
                            if Selected then
                                RageUI.CloseAll()
                                open = false
                                CraftSomething(v.nom)
                            end
                        end)
                    end

                end, function()
                end)
            end
        end)
    end


    function CraftSomething(name)
        local rec
        for k,v in pairs(self.craft) do
            if name == v.nom then
                rec = v
                break
            end
        end

        local missing = false
        for k,v in pairs(rec.ingredient) do
            if pInventory[v.label] ~= nil then
                if pInventory[v.label].count < v.count then
                    rUtils.ImportantNotif("Il te manque un ingrédient: ~o~"..v.label)
                    missing = true
                end
            else
                missing = true
                rUtils.ImportantNotif("Il te manque un ingrédient: ~o~"..v.label)
            end
        end
        if missing then return end
        InAction = true
        rUtils.ImportantNotif("Vous commencez à cuisiner une/un "..name)
        TaskStartScenarioInPlace(pPed, "PROP_HUMAN_BBQ", -1, true)
        Wait(5000)
        for i = 1, #rec.ingredient do
            TriggerServerEvent(events.remove, token, rec.ingredient[i].label, rec.ingredient[i].count)
            Wait(3000)
        end
        TriggerServerEvent(events.give, token, rec.itemName, 1, GetItemId(rec.itemName))
        rUtils.ImportantNotif("Vous avez cuisiner une/un "..name)
        InAction = false
        ClearPedTasks(pPed)
    end

end