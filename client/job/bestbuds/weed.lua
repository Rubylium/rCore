
WeedData = {}

RegisterNetEvent("core:PlantWeed")
AddEventHandler("core:PlantWeed", function()
    StartWeed()
end)

function WeedData:LoadWeedData()
    local open = false
    local WeedProps = nil
    local ActualProp = nil
    local plante = self.w.plante
    local count = 0.0
    local Deleting = false

    RMenu.Add('core', 'weed_prepa', RageUI.CreateMenu("Weed", "~g~Préparation weed"))
    RMenu:Get('core', 'weed_prepa').Closed = function()
        open = false
        TriggerServerEvent("DeleteEntity", token, WeedProps)
    end

    RMenu.Add('core', 'weed_trait', RageUI.CreateMenu("Weed", "~g~Préparation weed"))
    RMenu:Get('core', 'weed_trait').Closed = function()
        open = false
    end

    RMenu.Add('core', 'weed_ShopSeed', RageUI.CreateMenu("Weed shop", "~g~Achats de graine"))
    RMenu:Get('core', 'weed_ShopSeed').Closed = function()
        open = false
        KillNpcCam()
    end
    
    function OpenWeedSeedShop(npc, offset, camOffset)
        if pJob ~= "bestbuds" then rUtils.Notif("Hein ? T'es qui ? Dégage je parle pas aux inconnus.") return end
        local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
        NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(NPC_CAM, 1)
        SetCamCoord(NPC_CAM, oCoords)
        SetCamFov(NPC_CAM, 55.0)
        PointCamAtCoord(NPC_CAM, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)


        open = true
        RageUI.Visible(RMenu:Get('core', 'weed_ShopSeed'), not RageUI.Visible(RMenu:Get('core', 'weed_ShopSeed')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'weed_ShopSeed'), false, false, false, function()
                    RageUI.ButtonWithStyle("Acheté des graine de chanvre", nil, {RightLabel = "~g~2$"}, true, function(_,_,s)
                        if s then 
                            local amount = CustomAmount()
                            if amount ~= nil and amount > 0 then
                                if pMoney >= 2 * amount then
                                    TriggerServerEvent(events.BuyIf, token, "weedseed", amount, 2 * amount)
                                end
                            end
                        end
                    end)
                end, function()
                end)  
            end
        end)
    end

    function CheckProp()
        if Deleting then return end
        Citizen.CreateThread(function()
            if WeedProps == nil then
                ActualProp = GetWeedProp()
                rUtils.LoadModel(ActualProp)
                local oCoords = GetOffsetFromEntityInWorldCoords(pPed, self.w.spawnOffset[1], self.w.spawnOffset[2], self.w.spawnOffset[3])
                local prop = CreateObject_(GetHashKey(ActualProp), oCoords, true, true, false)
                PlaceObjectOnGroundProperly(prop)
                FreezeEntityPosition(prop, true)
                WeedProps = ObjToNet(prop)
            else
                if GetWeedProp() ~= ActualProp then
                    print(ActualProp, GetWeedProp())
                    TriggerServerEvent("DeleteEntity", token, WeedProps)
                    Deleting = true
                    while DoesEntityExist(WeedProps) do Wait(100) end
                    Wait(250)
                    ActualProp = GetWeedProp()
                    Deleting = false
                    rUtils.LoadModel(ActualProp)
                    local oCoords = GetOffsetFromEntityInWorldCoords(pPed, self.w.spawnOffset[1], self.w.spawnOffset[2], self.w.spawnOffset[3])
                    local prop = CreateObject_(GetHashKey(ActualProp), oCoords.x, oCoords.y, oCoords.z-1, true, true, false)
                    PlaceObjectOnGroundProperly(prop)
                    FreezeEntityPosition(prop, true)
                    WeedProps = ObjToNet(prop)
                end
            end
            PlaceObjectOnGroundProperly(NetToObj(WeedProps))
        end)
    end


    function GetWeedProp()
        if plante >= 90 then
            return self.w.props[90]
        elseif plante >= 80 then
            return self.w.props[80]
        elseif plante >= 70 then
            return self.w.props[70]
        elseif plante >= 60 then
            return self.w.props[60]
        elseif plante >= 50 then
            return self.w.props[50]
        elseif plante >= 40 then
            return self.w.props[40]
        else
            return self.w.props[30]
        end
    end
    
    
    function StartWeed()
        TaskStartScenarioInPlace(pPed, self.w.scenario, -1, true)
        RageUI.CloseAll()
        TriggerServerEvent(events.remove, token, self.w.item, 1)
        RageUI.Visible(RMenu:Get('core', 'weed_prepa'), not RageUI.Visible(RMenu:Get('core', 'weed_prepa')))
        open = true
        plante = self.w.plante
        count = 0.0
        ActualProp = nil
        Deleting = false

        CheckProp()
        Citizen.CreateThread(function()
            while open do
                Wait(1000)
                CheckProp()
                plante = plante - math.random(1,8)
                count = count + 0.05
                if count > 1 then
                    open = false
                end
                if plante <= 5 then
                    open = false
                end
            end


            if plante > 90 then
                TriggerServerEvent(events.give, token, self.w.item2, 3)
            elseif plante < 90 and plante > 70 then
                TriggerServerEvent(events.give, token, self.w.item2, 2)
            elseif plante < 70 and plante > 60 then
                TriggerServerEvent(events.give, token, self.w.item2, 1)
            else
                rUtils.Notif("Tu as raté ta plante, tu n'as rien eu.")
            end
            ClearPedTasks(pPed)
            Wait(500)
            TriggerServerEvent("DeleteEntity", token, WeedProps)
        end)

        Citizen.CreateThread(function()
            while open do
                Wait(1)
                if plante > 100 then
                    RageUI.IsVisible(RMenu:Get('core', 'weed_prepa'), false, false, false, function()
                        RageUI.SliderProgress("État de la plante", plante, 100.0, "", { ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255}, ProgressColor = {R = 255, G = 0, B = 0, A = 255} }, true, function(active,_, sel, prog)
                            if IsControlPressed(1, 22) then
                                plante = plante + self.w.add
                            end
                        end)
                        RageUI.Separator("État: "..rUtils.Math.Round(plante).."/100")

                        RageUI.StatisticPanel(count, "Temps", 1)

                    end, function()
                    end)
                elseif plante > 80 then
                    RageUI.IsVisible(RMenu:Get('core', 'weed_prepa'), false, false, false, function()
                        RageUI.SliderProgress("État de la plante", plante, 100.0, "", { ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255}, ProgressColor = {R = 54, G = 230, B = 34, A = 255} }, true, function(active,_, sel, prog)
                            if IsControlPressed(1, 22) then
                                plante = plante + self.w.add
                            end
                        end)
                        RageUI.Separator("État: "..rUtils.Math.Round(plante).."/100")

                        RageUI.StatisticPanel(count, "Temps", 1)

                    end, function()
                    end)
                elseif plante > 70 then
                    RageUI.IsVisible(RMenu:Get('core', 'weed_prepa'), false, false, false, function()
                        RageUI.SliderProgress("État de la plante", plante, 100.0, "", { ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255}, ProgressColor = {R = 245, G = 185, B = 66, A = 255} }, true, function(active,_, sel, prog)
                            if IsControlPressed(1, 22) then
                                plante = plante + self.w.add
                            end
                        end)
                        RageUI.Separator("État: "..rUtils.Math.Round(plante).."/100")

                        RageUI.StatisticPanel(count, "Temps", 1)

                    end, function()
                    end)
                elseif plante > 60 then
                    RageUI.IsVisible(RMenu:Get('core', 'weed_prepa'), false, false, false, function()
                        RageUI.SliderProgress("État de la plante", plante, 100.0, "", { ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255}, ProgressColor = {R = 245, G = 105, B = 66, A = 255} }, true, function(active,_, sel, prog)
                            if IsControlPressed(1, 22) then
                                plante = plante + self.w.add
                            end
                        end)
                        RageUI.Separator("État: "..rUtils.Math.Round(plante).."/100")

                        RageUI.StatisticPanel(count, "Temps", 1)

                    end, function()
                    end)
                else
                    RageUI.IsVisible(RMenu:Get('core', 'weed_prepa'), false, false, false, function()
                        RageUI.SliderProgress("État de la plante", plante, 100.0, "", { ProgressBackgroundColor = {R = 0, G = 0, B = 0, A = 255}, ProgressColor = {R = 255, G = 0, B = 0, A = 255} }, true, function(active,_, sel, prog)
                            if IsControlPressed(1, 22) then
                                plante = plante + self.w.add
                            end
                        end)
                        RageUI.Separator("État: "..rUtils.Math.Round(plante).."/100")

                        RageUI.StatisticPanel(count, "Temps", 1)

                    end, function()
                    end)
                end

            end
        end)

    end

    rUtils.RegisterActionZone({
        pos = vector3(382.4778, -816.5658, 29.30418),
        action = function()
            OpenTraitWeed()
        end,
    })

    local Traitment = {}

    function OpenTraitWeed()
        if open then 
            RageUI.CloseAll() 
            open = false 
            RageUI.Visible(RMenu:Get('core', 'weed_trait'), false) 
            Wait(100)
        end
        local Trating = false
        open = true
        Traitment = {}
        RageUI.Visible(RMenu:Get('core', 'weed_trait'), true)
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'weed_trait'), false, false, false, function()
                    if not Trating then
                        RageUI.Button("Commencer le traitement.", "5 Weed non traité requis", pInventory[self.w.item2Label] ~= nil, function(_,_,s)
                            if s then 
                                if pInventory[self.w.item2Label].count >= 5 then

                                    StartTrait()
                                    Trating = true
                                    TriggerServerEvent(events.remove, token, self.w.item2Label, 5)
                                end
                            end
                        end)
                    else
                        for k,v in pairs(Traitment) do
                            if v.clickable then
                                if not v.clicked then
                                    RageUI.Button("~g~Clique!", nil, true, function(_,_,s)
                                        if s then 
                                            Traitment[k].clicked = true
                                        end
                                    end)
                                else
                                    RageUI.Button("", nil, false, function(_,_,s)
                                    end)
                                end
                            else
                                RageUI.Button("", nil, false, function(_,_,s)
                                end)
                            end
                        end
                    end
                end, function()
                end)  
            end
        end)
    end


    function StartTrait()
        Citizen.CreateThread(function()
            local clicked = 0
            local supposed = 0
            while open do
                
                for k,v in pairs(Traitment) do
                    if v.clickable then
                        supposed = supposed + 1
                        if v.clicked then
                            clicked = clicked + 1
                        end
                    end
                end

                Traitment = {}
                for i = 1, 5 do
                    local r = math.random(1,10)
                    if r > 6 then
                        table.insert(Traitment, {clickable = true, clicked = false})
                    else
                        table.insert(Traitment, {clickable = false, clicked = false})
                    end
                end

                if supposed >= 20 then
                    open = false
                end
                Wait(self.w.TraitWait)
            end

            if clicked > supposed / 2 then
                rUtils.Notif("Traitement réussi!")
                print(self.w.itemFinal)
                TriggerServerEvent(events.give, token, self.w.itemFinal, 1)
            else
                rUtils.ImportantNotif("~r~Traitement échoué!~w~\n"..clicked.."/"..supposed)
            end
        end)
    end
end