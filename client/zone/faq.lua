local open = false
RMenu.Add('core', 'faq', RageUI.CreateMenu("FAQ", "~b~Faq d'arriver sur le serveur"))
RMenu:Get('core', 'faq').Closed = function()
    KillNpcCam()
    open = false
end


function OpenFaqMenu(npc, offset, camOffset)
    local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
    local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
    NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamActive(NPC_CAM, 1)
    SetCamCoord(NPC_CAM, oCoords)
    SetCamFov(NPC_CAM, 55.0)
    PointCamAtCoord(NPC_CAM, CoordToPoint)
    RenderScriptCams(1, 1, 1000, 0, 0)
    Wait(1000)
    open = true
    RageUI.Visible(RMenu:Get('core', 'faq'), true)
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'faq'), true, true, true, function()

                RageUI.Separator("FAQ RedSide V6")

                RageUI.Button("Envie d'un petit véhicule ?", "Il est préférable de contacter un taxi, cependant tu peu sortir un vélo de poche depuis F5 -> Divers", true, function(_,_,s)
                end)

                RageUI.Button("Se faire de l'argent", "Pour commencer à te faire de l'argent, diriges-toi à la mine ou au LS livraison sur le docks ou encore auprès des restaurants qui recrutent.", true, function(_,_,s)
                end)

            end, function()
            end)
        end
    end)
end