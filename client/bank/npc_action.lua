RMenu.Add('core', 'getCard', RageUI.CreateMenu("", "~b~Menu ATM de votre personnage", nil, nil, "root_cause", "shopui_title_fleecabank"))
RMenu:Get('core', 'getCard').Closed = function()
    PlaySoundFrontend(-1, "PIN_ButtonWithStyle", "ATM_SOUNDS", 1)
    KillNpcCam()
end


function OpenBankDialog(npc, offset, camOffset)
    local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
    local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
    NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamActive(NPC_CAM, 1)
    SetCamCoord(NPC_CAM, oCoords)
    SetCamFov(NPC_CAM, 55.0)
    PointCamAtCoord(NPC_CAM, CoordToPoint)
    RenderScriptCams(1, 1, 1000, 0, 0)
    Wait(1000)
    RageUI.Visible(RMenu:Get('core', 'getCard'), true)
end


Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'getCard'), true, true, true, function()
            open = true
            RageUI.Separator("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$")
            RageUI.ButtonWithStyle("Récupèrer votre carte bancaire", "Vous n'avez pas de carte bancaire ? C'est ici que vous l'a récupèrer.", {}, true, function(_,_,s)
                if s then 
                    TriggerServerEvent(events.AddIf, token, "CB", 1)
                end
            end)

        end, function()
        end)

        if open then
            Wait(1)
        else
            Wait(250)
        end
    end
end)