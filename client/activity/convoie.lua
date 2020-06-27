ConvoiData = {}


function ConvoiData:LoadConvoiData()
    local working = false
    local open = false

    RMenu.Add('core', self.c.npcName, RageUI.CreateMenu(self.c.npcDisplay, "~b~Chef de transport"))
    RMenu:Get('core', self.c.npcName).Closed = function()
        open = false
        KillNpcCam()
    end

    function OpenConvoiMenu(npc, offset, camOffset)
        local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
        NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(NPC_CAM, 1)
        SetCamCoord(NPC_CAM, oCoords)
        SetCamFov(NPC_CAM, 55.0)
        PointCamAtCoord(NPC_CAM, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)
        Wait(1000)
        RageUI.Visible(RMenu:Get('core', self.c.npcName), not RageUI.Visible(RMenu:Get('core', self.c.npcName)))
        open = true
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(RMenu:Get('core', self.c.npcName), true, true, true, function()
                    RageUI.Button("Commencer à travailler", nil, not working, function(_,_,s)
                        if s then 
                            working = true
                            KillNpcCam()
                            self:StartWork()
                            RageUI.CloseAll()
                            open = false
                            
                        end
                    end)
                    RageUI.Button("Stopper le travail", nil, working, function(_,_,s)
                        if s then 
                            working = false
                            self:StopWork()
                        end
                    end)
        
                end, function()
                end)
    
    
                Wait(1)
            end
        end)
    end

    local PossibleSpawn = self.c.spawn
    local Veh = nil
    function self:StopWork()
        TriggerServerEvent(events.DelEntity, token, Veh)
    end
    
    function self:StartWork()
        Citizen.CreateThread(function()
            local zone, heading = rUtils.GetZoneFromTable(PossibleSpawn)
            if zone ~= false then
                rUtils.SpawnVehicle(GetHashKey(self.c.veh), zone, heading, nil, function(veh)
                    TaskWarpPedIntoVehicle(pPed, veh, -1)
                    Veh = VehToNet(veh)
                end)

                local blip = AddBlipForCoord(self.c.PointArriver)
                SetBlipRoute(blip, true)
                local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), self.c.PointArriver, true)
                while dst > 50 do
                    dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), self.c.PointArriver, true)
                    RageUI.Text({
                        message = self.c.message,
                        time_display = 2100,
                    })

                    if not working then
                        RemoveBlip(blip)
                        return
                    end
                    Wait(30)
                end
                while dst > 2 do
                    dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), self.c.PointArriver, true)
                    DrawMarker(1, self.c.PointArriver, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 20.0, 0, 255, 0, 140, 0, 1, 2, 0, nil, nil, 0)
                    RageUI.Text({
                        message = self.c.message2,
                        time_display = 1,
                    })
                    if not working then
                        RemoveBlip(blip)
                        return
                    end
                    Wait(1)
                end

                if GetEntityModel(GetVehiclePedIsIn(pPed, true)) == GetHashKey("mule2") then
                    rUtils.ImportantNotif(self.c.FinalMessage .. self.c.earning + rUtils.GetVipBonus(self.c.earning).."$")
                    TriggerServerEvent(events.giveMoney, token, self.c.earning + rUtils.GetVipBonus(self.c.earning))
                    TriggerServerEvent(self.c.stocks, token)
                else
                    rUtils.ImportantNotif("Tu n'a rien eu car tu à oublié ton camion.")
                end

                SetBlipCoords(blip, -288.7522, -2661.436, 6.159536)
                SetBlipRoute(blip, true)
                local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), -288.7522, -2661.436, 6.159536, true)
                while dst > 50 do
                    dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), -288.7522, -2661.436, 6.159536, true)
                    RageUI.Text({
                        message = self.c.message3,
                        time_display = 2100,
                    })
                    if not working then
                        RemoveBlip(blip)
                        return
                    end
                    Wait(30)
                end

                RemoveBlip(blip)
            else
                rUtils.ImportantNotif("~r~Impossible de commencer\n~w~Aucune point de sortie libre.")
            end
        end)
    end

    local stocks = {}
    RegisterNetEvent("core:SendStocksToClient")
    AddEventHandler("core:SendStocksToClient", function(stock)
        stocks = stock
    end)

    RMenu.Add('core', "stocks", RageUI.CreateMenu("Stock", "~b~Liste des stock disponibles"))
    RMenu:Get('core', "stocks").Closed = function()
        open = false
    end

    local jobs = {
        ["drusilla"] = true,
        ["crucial"] = true,
        ["hotdogs"] = true,
    }
    function self:OpenStocksShop()
        if jobs[pJob] == nil then 
            rUtils.ImportantNotif("Désolé, tu ne travail dans un résto.") 
            return 
        end
        TriggerServerEvent(self.c.request, token)
        RageUI.Visible(RMenu:Get('core', "stocks"), not RageUI.Visible(RMenu:Get('core', "stocks")))
        open = true
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(RMenu:Get('core', "stocks"), false, false, false, function()
                    for k,v in pairs(stocks) do
                        RageUI.Button(v.label.." (~b~"..v.stock.."~s~)", nil, v.stock > 0, function(_,_,s)
                            if s then 
                                local amount = CustomAmount()
                                if amount ~= nil and amount <= v.stock then
                                    if pMoney >= amount * v.prix then
                                        TriggerServerEvent(events.BuyIf, token, v.item, amount, v.prix, GetItemId(v.item))
                                        TriggerServerEvent(self.c.addstocks, token, v.item, amount)
                                        stocks[k].stock =  stocks[k].stock - amount
                                    end
                                end
                            end
                        end)
                    end
        
                end, function()
                end)
    
    
                Wait(1)
            end
        end)
    end
end