
local VehProps = {}
local MenuOuvert = false

local Upgrades = {}
local Comsetics = {}

function LoadMecanoData()
    RMenu.Add('lscustom', 'main', RageUI.CreateMenu("", "~b~RAGEUI lscustom", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu:Get('lscustom', 'main').Closed = function()
        local pPed = GetPlayerPed(-1)
        local pVeh = GetVehiclePedIsIn(pPed, 0)
        rUtils.SetVehicleProperties(pVeh, VehProps)
        SetVehicleEngineOn(pVeh, 1, 0, 0)
        FreezeEntityPosition(pVeh, 0)
        MenuOuvert = false
    end

    RMenu.Add('lscustom', 'cosmetic', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'main'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'upgrade', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'main'), "", "~b~Custom interne du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'option', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'main'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'peinture', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'main'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'Choixcouleur', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'peinture'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'couleur', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'Choixcouleur'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('lscustom', 'neon', RageUI.CreateSubMenu(RMenu:Get('lscustom', 'peinture'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    InitMenu()
    InitMecanoZones()
end

function InitMenu()
    Citizen.CreateThread(function()
        for k,v in ipairs(Interne) do
            RMenu.Add('lscustom', v.name, RageUI.CreateSubMenu(RMenu:Get('lscustom', 'upgrade'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('lscustom', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(Externe) do
            RMenu.Add('lscustom', v.name, RageUI.CreateSubMenu(RMenu:Get('lscustom', 'cosmetic'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('lscustom', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(weels) do
            RMenu.Add('lscustom', v.name, RageUI.CreateSubMenu(RMenu:Get('lscustom', 'Roue'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('lscustom', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(Colors) do
            RMenu.Add('lscustom', v.value, RageUI.CreateSubMenu(RMenu:Get('lscustom', 'Choixcouleur'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('lscustom', v.value).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        LoadMenu()
    end)


    function UpdateVehProps()
        local pPed = GetPlayerPed(-1)
        local pVeh = GetVehiclePedIsIn(pPed, 0)
        VehProps = rUtils.GetVehicleProperties(pVeh)
    end


    function OpenCustomMenu()
        UpdateVehProps()
        if not MenuOuvert then
            MenuOuvert = true
            RageUI.Visible(RMenu:Get('lscustom', 'main'), not RageUI.Visible(RMenu:Get('lscustom', 'main')))
            local pPed = GetPlayerPed(-1)
            local pVeh = GetVehiclePedIsIn(pPed, 0)
            SetVehicleEngineOn(pVeh, 0, 0, 1)
            FreezeEntityPosition(pVeh, 1)
        end

    end

    local PaintType = nil
    function LoadMenu()
        Citizen.CreateThread(function()
            while true do
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
         --     RageUI.IsVisible(menu, header, glare, instructional, items, panels)
                RageUI.IsVisible(RMenu:Get('lscustom', 'main'), true, true, true, function()
                    --- Items
                    RageUI.Button("Changement externe", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('lscustom', 'cosmetic'))

                    RageUI.Button("Changement interne", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('lscustom', 'upgrade'))

                    RageUI.Button("options du véhicule", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) SetVehicleEngineOn(pVeh, 1, 1, 0) end
                    end, RMenu:Get('lscustom', 'option'))

                    RageUI.Button("Repeindre le véhicule", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('lscustom', 'peinture'))


                end, function()
                end)


                RageUI.IsVisible(RMenu:Get('lscustom', 'cosmetic'), true, true, true, function()
                    for k,v in ipairs(Externe) do

                        RageUI.Button(v.name, nil, { RightLabel = "→→→" }, true, function()
                        end, RMenu:Get('lscustom', v.name))

                    end

                end, function()
                end)



                RageUI.IsVisible(RMenu:Get('lscustom', 'upgrade'), true, true, true, function()
                    for k,v in ipairs(Interne) do

                        RageUI.Button(v.name, nil, { RightLabel = "→→→" }, true, function()
                        end, RMenu:Get('lscustom', v.name))

                    end

                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('lscustom', 'option'), true, true, true, function()
                    RageUI.Button("Phares xenon ~g~ON", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modXenon = true})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.Button("Phares xenon ~r~OFF", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modXenon = false})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.Separator("Teinte des vitres")
                    for i=  1,5 do
                        local vitre = GetWindowName(i)
                        RageUI.Button(vitre, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {windowTint = i})
                                UpdateVehProps()
                            end
                        end)
                    end
                    RageUI.Separator("Plaque de couleur")
                    for i = 0,4 do
                        local plaque = GetPlatesName(i)
                        RageUI.Button(plaque, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {plateIndex = i})
                                UpdateVehProps()
                            end
                        end)
                    end
                    RageUI.Separator("Fumer des pneus")
                    RageUI.Button("Fumer de couleur ~g~ON", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modSmokeEnabled = true})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.Button("Fumer de couleur ~r~OFF", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modSmokeEnabled = false})
                            UpdateVehProps()
                        end
                    end)
                    local couleur = GetNeons()
                    for _,i in pairs(couleur) do
                        RageUI.Button(i.label, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {tyreSmokeColor = {i.r, i.g, i.b}})
                                UpdateVehProps()
                            end
                        end)
                    end

                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('lscustom', 'peinture'), true, true, true, function()

                    RageUI.Button("Changer des reflets", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 1
                        end
                    end, RMenu:Get('lscustom', "Choixcouleur"))

                    RageUI.Button("Changer la couleur primaire", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 2
                        end
                    end, RMenu:Get('lscustom', "Choixcouleur"))

                    RageUI.Button("Changer la couleur secondaire", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 3
                        end
                    end, RMenu:Get('lscustom', "Choixcouleur"))

                    RageUI.Button("Changer la couleur des jantes", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 4
                        end
                    end, RMenu:Get('lscustom', "Choixcouleur"))

                    RageUI.Button("Géstion des néons", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 4
                        end
                    end, RMenu:Get('lscustom', "neon"))


                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('lscustom', "neon"), true, true, true, function()

                    local pPed = GetPlayerPed(-1)
                    local pVeh = GetVehiclePedIsIn(pPed, 0)
                    local neons = GetNeons()
                    SetVehicleEngineOn(pVeh, 1, 1, 0)

                    RageUI.Checkbox("Activé les néon", "Activer ou non les néons du véhicule", IsVehicleNeonLightEnabled(pVeh, 2), { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        if (Active) then
                            if IsVehicleNeonLightEnabled(pVeh, 2) then
                                for i = 0,3 do
                                    SetVehicleNeonLightEnabled(pVeh, i, 0)
                                    UpdateVehProps()
                                end
                            else
                                for i = 0,3 do
                                    SetVehicleNeonLightEnabled(pVeh, i, 1)
                                    UpdateVehProps()
                                end
                            end
                        end
                    end)
                    for k,v in ipairs(neons) do
                        RageUI.Button(v.label, nil, { }, true, function(_,a,s)
                            if a then
                                SetVehicleNeonLightsColour(pVeh, v.r, v.g, v.b)
                            end
                            if s then
                                SetVehicleNeonLightsColour(pVeh, v.r, v.g, v.b)
                                UpdateVehProps()
                            end
                        end)
                    end
                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('lscustom', "Choixcouleur"), true, true, true, function()
                    for k,v in ipairs(Colors) do
                        RageUI.Button(v.label, nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        end, RMenu:Get('lscustom', v.value))
                    end
                end, function()
                end)


                for k,v in ipairs(Colors) do
                    RageUI.IsVisible(RMenu:Get('lscustom', v.value), true, true, true, function()
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)
                        local colors = GetColors(v.value)
                        for _,i in pairs(colors) do
                            RageUI.Button(i.label, nil, { }, true, function(_,a,s)
                                if a then
                                    if PaintType == 1 then
                                        rUtils.SetVehicleProperties(pVeh, {pearlescentColor = i.index})
                                    elseif PaintType == 2 then
                                        rUtils.SetVehicleProperties(pVeh, {color1 = i.index})
                                    elseif PaintType == 3 then
                                        rUtils.SetVehicleProperties(pVeh, {color2 = i.index})
                                    elseif PaintType == 4 then
                                        rUtils.SetVehicleProperties(pVeh, {wheelColor = i.index})
                                    end
                                end
                                if s then
                                    if PaintType == 1 then
                                        rUtils.SetVehicleProperties(pVeh, {pearlescentColor = i.index})
                                        UpdateVehProps()
                                    elseif PaintType == 2 then
                                        rUtils.SetVehicleProperties(pVeh, {color1 = i.index})
                                        UpdateVehProps()
                                    elseif PaintType == 3 then
                                        rUtils.SetVehicleProperties(pVeh, {color2 = i.index})
                                        UpdateVehProps()
                                    elseif PaintType == 4 then
                                        rUtils.SetVehicleProperties(pVeh, {wheelColor = i.index})
                                        UpdateVehProps()
                                    end
                                end
                            end)

                        end
                    end, function()
                    end)

                end



                for k,v in ipairs(Externe) do
                    RageUI.IsVisible(RMenu:Get('lscustom', v.name), true, true, true, function()
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)
                        local num = GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)
                        local installed = GetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)

                        if v.modType == 36 or v.modType == 37 or v.modType == 38 or v.modType == 39 or v.modType == 40 or v.modType == 41 or v.modType == 42 or v.modType == 45 then
                            for i = 0,10 do
                                SetVehicleDoorOpen(pVeh, i, false)
                            end
                        else
                            SetVehicleDoorsShut(pVeh, false)
                        end

                        if v.modType == 23 then
                            for _, j in pairs(weels) do
                                RageUI.Button(j.name, nil, { RightLabel = "→→→" }, true, function(_,_,s)
                                    if s then SetVehicleWheelType(pVeh, j.type) end
                                end, RMenu:Get('lscustom', j.name))
                            end
                        end

                        RageUI.Button("Stock", nil, {}, true, function(_,Active,Selected)
                            if Selected then
                                SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, -1, 0)
                                UpdateVehProps()
                            end
                            if Active then
                                SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, -1, 0)
                            end
                        end)

                        for i = 0, num-1 do 
                            local modName = GetModTextLabel(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i)

                            if v.modType == 14 then
                                RageUI.Button(GetHornName(i), nil, {}, true, function(_,Active,Selected)
                                    if Selected then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                        UpdateVehProps()
                                    end
                                    if Active then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                    end
                                end)
                            elseif v.modType == 48 then
                                RageUI.Button(GetLabelText(modName), nil, {}, true, function(_,Active,Selected)
                                    if Selected then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 48, i, 0)
                                        SetVehicleLivery(vehicle, i)
                                        RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                        rUtils.SetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), 0), {modLivery = i})
                                        UpdateVehProps()
                                    end
                                    if Active then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 48, i, 0)
                                        SetVehicleLivery(vehicle, i)
                                    end
                                end)
                            elseif v.modType == 23 then
                                break
                            else
                                if installed == i then
                                    RageUI.Button(GetLabelText(modName), nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_,Active,Selected)
                                        if Selected then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                            RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                            UpdateVehProps()
                                        end
                                        if Active then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        end
                                    end)
                                else
                                    RageUI.Button(GetLabelText(modName), nil, {}, true, function(_,Active,Selected)
                                        if Selected then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                            RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                            UpdateVehProps()
                                        end
                                        if Active then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        end
                                    end)
                                end
                            end


                        end

                    end, function()
                    end)
                end


                for k,v in ipairs(weels) do
                    RageUI.IsVisible(RMenu:Get('lscustom', v.name), true, true, true, function()
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)
                        SetVehicleWheelType(pVeh, v.type)
                        local num = GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23)

                        for i = 0, num-1 do
                            local modName = GetModTextLabel(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23, i)
                            RageUI.Button(GetLabelText(modName), nil, {}, true, function(_,Active,Selected)
                                if Selected then
                                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23, i, 0)
                                    RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                    UpdateVehProps()
                                end
                                if Active then
                                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23, i, 0)
                                end
                            end)
                        end

                    end, function()
                    end)
                end

                for k,v in ipairs(Interne) do
                    RageUI.IsVisible(RMenu:Get('lscustom', v.name), true, true, true, function()
                        local num = GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)
                        local installed = GetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)

                        if v.modType == 17 then
                            RageUI.Button("Turbo", nil, {}, true, function(_,Active,Selected)
                                if Selected then
                                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 17, 1)
                                    rUtils.SetVehicleProperties(pVeh, {modTurbo = true})
                                    RageUI.Popup({message = "Turbo installé"})
                                    UpdateVehProps()
                                end
                            end)
                        end

                        for i = 0, num-1 do 
                            if installed == i then
                                RageUI.Button(v.name.." - "..i+1, nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_,Active,Selected)
                                    if Selected then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                        UpdateVehProps()
                                    end
                                end)
                            else
                                RageUI.Button(v.name.." - "..i+1, nil, {}, true, function(_,Active,Selected)
                                    if Selected then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                        UpdateVehProps()
                                    end
                                end)
                            end
                        end

                    end, function()
                    end)
                end
            end
        end)
    end
end



