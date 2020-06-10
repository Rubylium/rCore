MineData = {}
 
function MineData:LoadMineData()
    local working = false
    local open = false

    RMenu.Add('core', self.m.npcName, RageUI.CreateMenu(self.m.npcDisplay, "~b~Chef de chantier"))
    RMenu:Get('core', self.m.npcName).Closed = function()
        open = false
        KillNpcCam()
    end


    function OpenMineMenu(npc, offset, camOffset)
        local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
        NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(NPC_CAM, 1)
        SetCamCoord(NPC_CAM, oCoords)
        SetCamFov(NPC_CAM, 55.0)
        PointCamAtCoord(NPC_CAM, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)
        TriggerServerEvent("rF:GetPlayerInventory", token)
        Wait(1000)
        RageUI.Visible(RMenu:Get('core', self.m.npcName), not RageUI.Visible(RMenu:Get('core', self.m.npcName)))
        open = true
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(RMenu:Get('core', self.m.npcName), true, true, true, function()
                    RageUI.Button("Commencer à travailler", nil, not working, function(_,_,s)
                        if s then 
                            working = true
                            self:StartMineWork()
                        end
                    end)
                    RageUI.Button("Stopper le travail", nil, working, function(_,_,s)
                        if s then 
                            working = false
                        end
                    end)
        
                end, function()
                end)
    
    
                Wait(1)
            end
        end)
    end

    local props = self.m.props

    function MineData:StartMineWork()
        Citizen.CreateThread(function()
            while working do
                local r = math.random(-15,15)
                local obj = props[math.random(1,#props)]
                local pos = vector3(self.m.pos.x+r, self.m.pos.y-r, self.m.pos.z)
                rUtils.LoadModel(obj)
                local obj = CreateObject_(GetHashKey(obj), pos, 1, 1, false)
                PlaceObjectOnGroundProperly(obj)
                FreezeEntityPosition(obj, true)
                local oCoords = GetEntityCoords(obj)
                local dst = #(oCoords - GetEntityCoords(pPed))
                while dst >= 2.0 do
                    DrawMarker(1, oCoords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 15.0, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    oCoords = GetEntityCoords(obj)
                    dst = #(oCoords - GetEntityCoords(pPed))


                    if not working then TriggerServerEvent("DeleteEntityTable", token, {ObjToNet(obj)}) return end
                    Wait(1)
                end

                if not working then TriggerServerEvent("DeleteEntityTable", token, {ObjToNet(obj)}) return end
                local pickaxe = CreateObject_(GetHashKey(self.m.pickaxe), 0, 0, 0, true, true, true) 
                AttachEntityToEntity(pickaxe, pPed, GetPedBoneIndex(pPed, 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
                rUtils.PlayAnim(self.m.dict, self.m.anim, 1, 8.0, 8.0)
                InAction = true
                if Mine < 100 then
                    Wait(10*1000)
                else
                    Wait(5*1000)
                end

                InAction = false
                CheckMinerSucces()
                ClearPedTasks(pPed)
                TriggerServerEvent("DeleteEntityTable", token, {ObjToNet(obj), ObjToNet(pickaxe)})
                TriggerServerEvent("rF:AddMoney", token, self.m.earning + rUtils.GetVipBonus(self.m.earning))

                if not working then TriggerServerEvent("DeleteEntityTable", token, {ObjToNet(obj), ObjToNet(pickaxe)}) return end

            end
        end)
    end
end