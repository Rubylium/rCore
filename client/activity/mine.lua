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
        TriggerServerEvent(events.GetInv, token)
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
                            exports.rFramework:ReloadPlayerCloth()
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

    local mineCloths = {
        homme = {
            {
                name = "Mine homme",
                cloth = {
                    ["tshirt_1"] = 89,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 238,
                    ["torso_2"] = 4,
                    ["pants_1"] = 98,
                    ["pants_2"] = 6,
                    ["shoes_1"] = 71,
                    ["shoes_2"] = 4,
                    ["arms"] = 51,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 25,
                    ["helmet_2"] = 1,
                    ["chain_1"] = -1,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["watches_2"] = 0,
                    ["decals_1"] = 0,
                    ["bags_1"] = 0,
                },
            },
        },
        femme = {
            {
                name = "Mine femme",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 226,
                    ["torso_2"] = 19,
                    ["pants_1"] = 101,
                    ["pants_2"] = 6,
                    ["shoes_1"] = 74,
                    ["shoes_2"] = 4,
                    ["arms"] = 50,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 53,
                    ["helmet_2"] = 1,
                    ["chain_1"] = -1,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["watches_2"] = 0,
                    ["decals_1"] = 0,
                    ["bags_1"] = 0,
                },
            },  
        }
    }

    function MineData:StartMineWork() 

        if GetEntityModel(pPed) == GetHashKey("mp_m_freemode_01") then
            for k,i in pairs(mineCloths.homme[1].cloth) do
                TriggerEvent("skinchanger:change", k, i)
            end
        elseif GetEntityModel(pPed) == GetHashKey("mp_f_freemode_01") then
            for k,i in pairs(mineCloths.femme[1].cloth) do
                TriggerEvent("skinchanger:change", k, i)
            end
        end

        Citizen.CreateThread(function()
            while working do
                local r = math.random(-15,15)
                local obj = props[math.random(1,#props)]
                local pos = vector3(self.m.pos.x+math.random(-15,15), self.m.pos.y+math.random(-15,15), self.m.pos.z)
                rUtils.LoadModel(GetHashKey(obj))
                local obj = CreateObject_(GetHashKey(obj), pos, 1, 1, false)
                PlaceObjectOnGroundProperly(obj)
                FreezeEntityPosition(obj, true)
                local oCoords = GetEntityCoords(obj)
                local dst = #(oCoords - GetEntityCoords(pPed))
                while dst >= 2.0 do
                    DrawMarker(1, oCoords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 15.0, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    oCoords = GetEntityCoords(obj)
                    dst = #(oCoords - GetEntityCoords(pPed))


                    if not working then TriggerServerEvent(events.DelEntityTable, token, {ObjToNet(obj)}) return end
                    Wait(1)
                end

                if not working then TriggerServerEvent(events.DelEntityTable, token, {ObjToNet(obj)}) return end
                local pickaxe = CreateObject_(GetHashKey(self.m.pickaxe), 0, 0, 0, true, true, true) 
                AttachEntityToEntity(pickaxe, pPed, GetPedBoneIndex(pPed, 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
                rUtils.PlayAnim(self.m.dict, self.m.anim, 1, 8.0, 8.0)
                InAction = true
                if Mine < 100 then
                    Wait(10*1000)
                else
                    Wait(8*1000)
                end

                InAction = false
                CheckMinerSucces()
                ClearPedTasks(pPed) 
                TriggerServerEvent(events.DelEntityTable, token, {ObjToNet(obj), ObjToNet(pickaxe)})

                if self.m.earning + rUtils.GetVipBonus(self.m.earning) < 100 then
                    if pVip ~= 0 then
                        TriggerServerEvent(events.giveMoney, token, self.m.earning + rUtils.GetVipBonus(self.m.earning))
                    else
                        TriggerServerEvent(events.giveMoney, token, self.m.earning)
                    end
                end

                if not working then TriggerServerEvent(events.DelEntityTable, token, {ObjToNet(obj), ObjToNet(pickaxe)}) return end

            end
            
        end)
    end
end