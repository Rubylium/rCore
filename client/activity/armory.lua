
ArmoryData =  {}


function ArmoryData:LoadArmoryData()
    local open = false
    local ArmoryCam = nil
    local prop = nil

    for k,v in pairs(self.a.zone) do

        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, 556)
        SetBlipScale(blip, 0.35)
        SetBlipColour(blip, 49)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Ammunation - Armurie civil")
        EndTextCommandSetBlipName(blip)

        rUtils.RegisterActionZone({
            pos = vector3(v.pos),
            action = function()
                OpenArmoryMenu()
            end,
        })
    end

    local weaponsInDisplay = self.a.weapons
    local Selected = {}

    RMenu.Add('core', 'armory', RageUI.CreateMenu("Armurie", "~b~Armurie publique", nil, nil, "shopui_title_gr_gunmod", "shopui_title_gr_gunmod"))
    RMenu:Get('core', 'armory').Closed = function()
        open = false
        RenderScriptCams(0, 1, 1000, 0, 0)
        SetCamActive(ArmoryCam, false)
        DeleteEntity(prop)
    end

    RMenu.Add('core', 'armory_watch', RageUI.CreateSubMenu(RMenu:Get('core', 'armory'), "Regarder l'arme", "~b~Armurie publique", nil, nil, "shopui_title_gr_gunmod", "shopui_title_gr_gunmod"))
    RMenu:Get('core', 'armory_watch').Closed = function()
        RenderScriptCams(0, 1, 1000, 0, 0)
        DeleteEntity(prop)
    end


    function OpenArmoryMenu()
        RageUI.Visible(RMenu:Get('core', 'armory'), not RageUI.Visible(RMenu:Get('core', 'armory')))
        open = true

        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'armory'), true, true, true, function()
                    for k,v in pairs(weaponsInDisplay) do
                        if not v.vip then
                            RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→ ~c~"..v.price.."~w~$" }, true, function(_,_,s)
                                if s then
                                    Selected.price = v.price
                                    Selected.label = v.label
                                    Selected.item = v.item
                                    local oCoords = GetOffsetFromEntityInWorldCoords(pPed, self.a.oCoords[1], self.a.oCoords[2], self.a.oCoords[3])
                                    local CoordToPoint = GetOffsetFromEntityInWorldCoords(pPed, self.a.CoordToPoint[1], self.a.CoordToPoint[2], self.a.CoordToPoint[3])
                                    ArmoryCam = CreateCam(self.a.camType, 0)
                                    SetCamActive(ArmoryCam, 1)
                                    SetCamCoord(ArmoryCam, CoordToPoint)
                                    SetCamFov(ArmoryCam, self.a.fov)

                                    rUtils.LoadModel(GetHashKey(v.prop))
                                    prop = CreateObject_(GetHashKey(v.prop), oCoords, false, true, false)
                                    FreezeEntityPosition(prop, true)

                                    PointCamAtEntity(ArmoryCam, prop, 0, 0, 0, 1)
                                    RenderScriptCams(1, 1, 1000, 0, 0)
                                end
                            end, RMenu:Get('core', 'armory_watch')) 
                        else
                            RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→ ~c~"..v.price.."~w~$" }, pVip ~= 0, function(_,_,s)
                                if s then
                                    Selected.price = v.price
                                    Selected.label = v.label
                                    Selected.item = v.item
                                    local oCoords = GetOffsetFromEntityInWorldCoords(pPed, self.a.oCoords[1], self.a.oCoords[2], self.a.oCoords[3])
                                    local CoordToPoint = GetOffsetFromEntityInWorldCoords(pPed, self.a.CoordToPoint[1], self.a.CoordToPoint[2], self.a.CoordToPoint[3])
                                    ArmoryCam = CreateCam(self.a.camType, 0)
                                    SetCamActive(ArmoryCam, 1)
                                    SetCamCoord(ArmoryCam, CoordToPoint)
                                    SetCamFov(ArmoryCam, self.a.fov)

                                    rUtils.LoadModel(GetHashKey(v.prop))
                                    prop = CreateObject_(GetHashKey(v.prop), oCoords, false, true, false)
                                    FreezeEntityPosition(prop, true)

                                    PointCamAtEntity(ArmoryCam, prop, 0, 0, 0, 1)
                                    RenderScriptCams(1, 1, 1000, 0, 0)
                                end
                            end, RMenu:Get('core', 'armory_watch')) 
                        end
                    end
                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('core', 'armory_watch'), true, true, true, function()
                    RageUI.ButtonWithStyle("Acheter une/un "..Selected.label, nil, { RightLabel = "→ ~c~"..Selected.price.."~w~$" }, true, function(_,_,s)
                        if s then
                            TriggerServerEvent(events.BuyIf, token, Selected.item, 1, Selected.price, GetItemId(Selected.item))
                            RenderScriptCams(0, 1, 1000, 0, 0)
                            DeleteEntity(prop)
                        end
                    end, RMenu:Get('core', 'armory'))
                    RageUI.Button("~r~Retour", nil, true, function(_,_,s)
                        if s then
                            RenderScriptCams(0, 1, 1000, 0, 0)
                            DeleteEntity(prop)
                        end
                    end, RMenu:Get('core', 'armory'))
                end, function()
                end)

            end
        end)
    end
end