
function LoadhotdogData()
    self = JobsData.hotdog

    rUtils.RegisterGarageZone({
        pos = vector3(40.61954, -1012.122, 29.48662),
        spawns = {
            {pos = vector3(30.94924, -1024.028, 28.77808),heading = 251.17947387696,},
            {pos = vector3(30.43486, -1026.876, 28.77922),heading = 248.54376220704,},
            {pos = vector3(29.24332, -1029.372, 28.77452),heading = 253.64556884766,},
            {pos = vector3(27.98272, -1031.886, 28.72484),heading = 251.11715698242,},
        },
        vehs = {
            {spawn = "burrito3", nom = "Van de transport"},
        },
    })


    rUtils.RegisterActionZone({
        pos = vector3(44.15768, -1008.486, 29.28728),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(41.11484, -1007.242, 29.28666),
        action = function()
            OpenhotdogsCraftMenu()
        end,
    })


    RMenu.Add('core', 'hotdog_main', RageUI.CreateMenu("hotdog's", "~b~Menu action hotdog"))
    RMenu:Get('core', 'hotdog_main').Closed = function()
        open = false
    end

    function OpenhotdogsActionMenu()
        open = true
        RageUI.Visible(RMenu:Get('core', 'hotdog_main'), not RageUI.Visible(RMenu:Get('core', 'hotdog_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'hotdog_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end)

                    RageUI.ButtonWithStyle("lancer une mission de livraison", "Au moins 1 ~b~".. self.mission.item .."~s~ est requis.", {}, pInventory[self.mission.item] ~= nil, function(Hovered, Active, Selected)
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


    RMenu.Add('core', 'hotdog_craft', RageUI.CreateMenu("hotdog's", "~b~Menu cuisine hotdog's"))
    RMenu:Get('core', 'hotdog_craft').Closed = function()
        open = false
    end

    function OpenhotdogsCraftMenu()
        open = true
        RageUI.Visible(RMenu:Get('core', 'hotdog_craft'), not RageUI.Visible(RMenu:Get('core', 'hotdog_craft')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'hotdog_craft'), false, false, false, function()
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