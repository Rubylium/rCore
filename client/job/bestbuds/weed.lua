
WeedData = {}

RegisterNetEvent("core:PlantWeed")
AddEventHandler("core:PlantWeed", function()
    StartWeed()
end)

function WeedData:LoadWeedData()
    local openeded = false
    local WeedProps = nil
    local ActualProp = nil
    local plante = self.w.plante
    local count = 0.0
    local Deleting = false

    RMenu.Add('core', 'weed_prepar', RageUI.CreateMenu("Weed", "~g~Préparation weed"))
    RMenu:Get('core', 'weed_prepar').Closed = function()
        opened = false
        TriggerServerEvent(events.DelEntity, token, WeedProps)
    end

    RMenu.Add('core', 'weed_trait', RageUI.CreateMenu("Weed ", "~g~Préparation weed"))
    RMenu:Get('core', 'weed_trait').Closed = function()
        opened = false
    end

    RMenu.Add('core', 'weed_ShopSeed', RageUI.CreateMenu("Weed shop", "~g~Achats de graine"))
    RMenu:Get('core', 'weed_ShopSeed').Closed = function()
        opened = false
        KillNpcCam()
    end
    
    function openedWeedSeedShop(npc, offset, camOffset)
        if pJob ~= "bestbuds" then rUtils.Notif("Hein ? T'es qui ? Dégage je parle pas aux inconnus.") return end
        local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
        NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(NPC_CAM, 1)
        SetCamCoord(NPC_CAM, oCoords)
        SetCamFov(NPC_CAM, 55.0)
        PointCamAtCoord(NPC_CAM, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)


        opened = true
        RageUI.Visible(RMenu:Get('core', 'weed_ShopSeed'), not RageUI.Visible(RMenu:Get('core', 'weed_ShopSeed')))
        Citizen.CreateThread(function()
            while opened do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'weed_ShopSeed'), false, false, false, function()
                    RageUI.ButtonWithStyle("Acheté des graine de chanvre", nil, {RightLabel = "~g~0.5$"}, true, function(_,_,s)
                        if s then 
                            local amount = CustomAmount()
                            if amount ~= nil and amount > 0 then
                                if pMoney >= 0.5 * amount then
                                    TriggerServerEvent(events.BuyIf, token, "weedseed", amount, 0.5 * amount, GetItemId("weedseed"))
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
                rUtils.LoadModel(GetHashKey(ActualProp))
                local oCoords = GetOffsetFromEntityInWorldCoords(pPed, self.w.spawnOffset[1], self.w.spawnOffset[2], self.w.spawnOffset[3])
                local prop = CreateObject_(GetHashKey(ActualProp), oCoords, true, true, false)
                PlaceObjectOnGroundProperly(prop)
                FreezeEntityPosition(prop, true)
                WeedProps = ObjToNet(prop)
            else
                if GetWeedProp() ~= ActualProp then
                    print(ActualProp, GetWeedProp())
                    TriggerServerEvent(events.DelEntity, token, WeedProps) 
                    Deleting = true
                    while DoesEntityExist(WeedProps) do Wait(100) end
                    Wait(250)
                    ActualProp = GetWeedProp()
                    Deleting = false
                    rUtils.LoadModel(GetHashKey(ActualProp))
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


    local AllowedZone = {
        {pos = vector3(1789.342, 4627.376, 27.58788),heading = 251.13150024414,},
        {pos = vector3(1808.994, 4636.35, 28.54272),heading = 93.968544006348,},
        {pos = vector3(2126.652, 2366.134, 87.37476),heading = 70.501258850098,},
        {pos = vector3(1038.57, -1979.514, 21.56048),heading = 357.28033447266,},
        {pos = vector3(379.2724, -812.334, 29.84974),heading = 302.26950073242,},
    }
    
    function IsZoneAllowed()
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(AllowedZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst <= 30.0 then
                return true
            end
        end
        return false
    end
    
    function StartWeed()
        if not IsZoneAllowed() then
            rUtils.ImportantNotif("Tu ne peu pas faire pousser ici")
            return
        end

        TaskStartScenarioInPlace(pPed, self.w.scenario, -1, true)
        SetInventoryOpen()
        TriggerServerEvent(events.remove, token, self.w.item, 1)
        RageUI.Visible(RMenu:Get('core', 'weed_prepar'), true)
        opened = true
        plante = self.w.plante
        count = 0.0
        ActualProp = nil
        Deleting = false

        CheckProp()

        Citizen.CreateThread(function()
            while opened do
                Wait(1)
                local co = GetEntityCoords(NetToObj(WeedProps))
                DrawText3D(vector3(co.x, co.y, co.z+1.5), "Etats de la plante: ~g~"..plante.."/100")
            end
        end)
        Citizen.CreateThread(function()
            while opened do
                Wait(1000)
                CheckProp()
                plante = tonumber(plante + math.random(1,5))
                local r = math.random(1,10)
                if r >= 9 then
                    local pressed = false
                    while not pressed do
                        local co = GetEntityCoords(NetToObj(WeedProps))
                        DrawText3D(vector3(co.x, co.y, co.z+1.4), "Appuyer sur ~b~[E]~s~ pour mettre de l'eau")
                        if IsControlJustReleased(1, 38) then
                            pressed = true
                        end
                        Wait(1)
                    end
                end
                if plante >= 100 then
                    opened = false
                end
            end 

            TriggerServerEvent(events.give, token, self.w.item2, 3, GetItemId(self.w.item2))
            ClearPedTasks(pPed)
            Wait(500)
            TriggerServerEvent(events.DelEntity, token, WeedProps)
        end)
    end


    rUtils.RegisterActionZone({
        pos = vector3(382.4778, -816.5658, 29.30418),
        action = function()
            openedTraitWeed()
        end,
    })

    local Traitment = {}

    function openedTraitWeed()
        if opened then 
            RageUI.CloseAll() 
            opened = false 
            RageUI.Visible(RMenu:Get('core', 'weed_trait'), false) 
            Wait(100)
        end
        local Trating = false
        opened = true
        Traitment = {}
        RageUI.Visible(RMenu:Get('core', 'weed_trait'), true)
        Citizen.CreateThread(function()
            while opened do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'weed_trait'), false, false, false, function()
                    if not Trating then
                        RageUI.Button("Préparer: ~b~"..self.w.item2Label, "2 Weed non traité requis", pInventory[self.w.item2Label] ~= nil, function(_,_,s)
                            if s then 
                                if pInventory[self.w.item2Label].count >= 2 then
                                    StartTrait(self.w.itemFinal)
                                    Trating = true
                                    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem(self.w.item2), 2)
                                end
                            end
                        end)
                        RageUI.Button("Préparer: ~b~"..self.w.prep1label, "2 Weed non traité requis", pInventory[self.w.prep1label] ~= nil, function(_,_,s)
                            if s then 
                                if pInventory[self.w.prep1label].count >= 2 then
                                    StartTrait(self.w.prep1item)
                                    Trating = true
                                    TriggerServerEvent(events.remove, token, GetFirstLabelFromItem(self.w.prep1item), 2)
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


    function StartTrait(item)
        Citizen.CreateThread(function()
            local clicked = 0
            local supposed = 0
            while opened do
                
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
                    opened = false
                end
                Wait(self.w.TraitWait)
            end

            if clicked > supposed / 2 then
                rUtils.Notif("Traitement réussi!")
                TriggerServerEvent(events.give, token, item, 1, GetItemId(item))
            else
                rUtils.ImportantNotif("~r~Traitement échoué!~w~\n"..clicked.."/"..supposed)
            end
        end)
    end
end