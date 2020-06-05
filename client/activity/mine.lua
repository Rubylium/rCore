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

    end
end