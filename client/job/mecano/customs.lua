
local VehProps = {}
local MenuOuvert = false

local Upgrades = {}
local Comsetics = {}

function LoadMecanoData()
    RMenu.Add('core', 'lscustom', RageUI.CreateMenu("", "~b~LSCUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu:Get('core', 'lscustom').Closed = function()
        local pPed = GetPlayerPed(-1)
        local pVeh = GetVehiclePedIsIn(pPed, 0)
        rUtils.SetVehicleProperties(pVeh, VehProps)
        SetVehicleEngineOn(pVeh, 1, 0, 0)
        FreezeEntityPosition(pVeh, 0)
        MenuOuvert = false
    end

    RMenu.Add('core', 'cosmetic', RageUI.CreateSubMenu(RMenu:Get('core', 'lscustom'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'upgrade', RageUI.CreateSubMenu(RMenu:Get('core', 'lscustom'), "", "~b~Custom interne du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'option', RageUI.CreateSubMenu(RMenu:Get('core', 'lscustom'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'peinture', RageUI.CreateSubMenu(RMenu:Get('core', 'lscustom'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'Choixcouleur', RageUI.CreateSubMenu(RMenu:Get('core', 'peinture'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'couleur', RageUI.CreateSubMenu(RMenu:Get('core', 'Choixcouleur'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
    RMenu.Add('core', 'neon', RageUI.CreateSubMenu(RMenu:Get('core', 'peinture'), "", "~b~Custom visuel du véhicule", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
     
    InitMenu()
    InitMecanoZones()
    InitMecanoActionMenu()
    InitMecanoGarage()

    rUtils.RegisterActionZone({
        pos = vector3(-108.0746, -1799.85, 21.77481),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterFarmZone({
        pos = vector3(-551.6, -1695.06, 19.21),
        type = 1,
        item = "metal",
    })

    rUtils.RegisterFarmZone({
        pos = vector3(1103.005, -2003.993, 29.43),
        type = 2,
        oItem = "metal",
        iItem = "metal2",
    })

    rUtils.RegisterFarmZone({
        pos = vector3(678.1, -2728.8, 6.003),
        type = 3,
        item = "metal2",
        price = 16,
    })
end

function InitMenu()
    Citizen.CreateThread(function()
        for k,v in ipairs(Interne) do
            RMenu.Add('core', v.name, RageUI.CreateSubMenu(RMenu:Get('core', 'upgrade'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('core', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(Externe) do
            RMenu.Add('core', v.name, RageUI.CreateSubMenu(RMenu:Get('core', 'cosmetic'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('core', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(weels) do
            RMenu.Add('core', v.name, RageUI.CreateSubMenu(RMenu:Get('core', 'Roue'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('core', v.name).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

        for k,v in ipairs(Colors) do
            RMenu.Add('core', v.value, RageUI.CreateSubMenu(RMenu:Get('core', 'Choixcouleur'), "", "~b~LS CUSTOMS", nil, nil, "shopui_title_carmod", "shopui_title_carmod"))
            RMenu:Get('core', v.value).Closed = function()
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                rUtils.SetVehicleProperties(pVeh, VehProps)
                SetVehicleDoorsShut(pVeh, false)
                SetVehicleEngineOn(pVeh, 0, 1, 1)
            end
        end

    end)


    function UpdateVehProps()
        local pPed = GetPlayerPed(-1)
        local pVeh = GetVehiclePedIsIn(pPed, 0)
        VehProps = rUtils.GetVehicleProperties(pVeh)
    end

    priceByClass = {
        [0] = {multi = 1.5}, -- 0 Compacts
        [1] = {multi = 1.3}, -- 1 Sedans
        [2] = {multi = 2.3}, -- 2 SUVs
        [3] = {multi = 2.4}, -- 3 Coupes
        [4] = {multi = 1.7}, -- 4 Muscle
        [5] = {multi = 2.8}, -- 5 Sports Classics
        [6] = {multi = 3.5}, -- 6 Sports
        [7] = {multi = 4.5}, -- 7 Super
        [8] = {multi = 1}, -- 8 Motorcycles
        [9] = {multi = 1.6}, -- 9 Off-Road
        [10] = {multi = 1.8}, -- 10 Industrial
        [11] = {multi = 1.2}, -- 11 Utility
        [12] = {multi = 2.3}, -- 12 Vans
        [13] = {multi = 0}, -- 13 Cycles
        [14] = {multi = 500}, -- 14 Boats
        [15] = {multi = 30}, -- 15 Helicopters
        [16] = {multi = 1500}, -- 16 Planes
        [17] = {multi = 1.6}, -- 17 Service
        [18] = {multi = 1.9}, -- 18 Emergency
        [19] = {multi = 1.9}, -- 19 Military
        [20] = {multi = 1.9}, -- 20 Commercial
    
    }

    function GetPrice(price)
        local pVeh = GetVehiclePedIsIn(pPed, 0)
        local pClass = GetVehicleClass(pVeh)
        local multi = priceByClass[pClass].multi
        return price * multi
    end

    function OpenCustomMenu()
        UpdateVehProps()
        if not MenuOuvert then
            MenuOuvert = true
            TriggerServerEvent(events.GetSocInfo, token, pJob)
            RageUI.Visible(RMenu:Get('core', 'lscustom'), true)
            local pPed = GetPlayerPed(-1)
            local pVeh = GetVehiclePedIsIn(pPed, 0)
            SetVehicleEngineOn(pVeh, 0, 0, 1)
            FreezeEntityPosition(pVeh, 1)
            LoadMecanoCustomMenu()
        end

    end

    local PaintType = nil
    function LoadMecanoCustomMenu()
        MenuOuvert = true
        Citizen.CreateThread(function()
            while MenuOuvert do
                Wait(1)
                local pPed = GetPlayerPed(-1)
                local pVeh = GetVehiclePedIsIn(pPed, 0)
                RageUI.IsVisible(RMenu:Get('core', 'lscustom'), true, true, true, function()
                    RageUI.ButtonWithStyle("Changement externe", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('core', 'cosmetic'))

                    RageUI.ButtonWithStyle("Changement interne", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('core', 'upgrade'))

                    RageUI.ButtonWithStyle("options du véhicule", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) SetVehicleEngineOn(pVeh, 1, 1, 0) end
                    end, RMenu:Get('core', 'option'))

                    RageUI.ButtonWithStyle("Repeindre le véhicule", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then SetVehicleModKit(pVeh, 0) end
                    end, RMenu:Get('core', 'peinture'))


                end, function()
                end)


                RageUI.IsVisible(RMenu:Get('core', 'cosmetic'), true, true, true, function()
                    for k,v in ipairs(Externe) do

                        RageUI.ButtonWithStyle(v.name, nil, { RightLabel = "→→→" }, true, function()
                        end, RMenu:Get('core', v.name))

                    end

                end, function()
                end)



                RageUI.IsVisible(RMenu:Get('core', 'upgrade'), true, true, true, function()
                    for k,v in ipairs(Interne) do

                        RageUI.ButtonWithStyle(v.name, nil, { RightLabel = "→→→" }, true, function()
                        end, RMenu:Get('core', v.name))

                    end

                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('core', 'option'), true, true, true, function()
                    RageUI.ButtonWithStyle("Phares xenon ~g~ON", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modXenon = true})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.ButtonWithStyle("Phares xenon ~r~OFF", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modXenon = false})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.Separator("Teinte des vitres")
                    for i=  1,5 do
                        local vitre = GetWindowName(i)
                        RageUI.ButtonWithStyle(vitre, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {windowTint = i})
                                UpdateVehProps()
                            end
                        end)
                    end
                    RageUI.Separator("Plaque de couleur")
                    for i = 0,4 do
                        local plaque = GetPlatesName(i)
                        RageUI.ButtonWithStyle(plaque, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {plateIndex = i})
                                UpdateVehProps()
                            end
                        end)
                    end
                    RageUI.Separator("Fumer des pneus")
                    RageUI.ButtonWithStyle("Fumer de couleur ~g~ON", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modSmokeEnabled = true})
                            UpdateVehProps()
                        end
                    end)
                    RageUI.ButtonWithStyle("Fumer de couleur ~r~OFF", nil, {}, true, function(_,_,selected)
                        if selected then
                            rUtils.SetVehicleProperties(pVeh, {modSmokeEnabled = false})
                            UpdateVehProps()
                        end
                    end)
                    local couleur = GetNeons()
                    for _,i in pairs(couleur) do
                        RageUI.ButtonWithStyle(i.label, nil, {}, true, function(_,_,selected)
                            if selected then
                                rUtils.SetVehicleProperties(pVeh, {tyreSmokeColor = {i.r, i.g, i.b}})
                                UpdateVehProps()
                            end
                        end)
                    end

                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('core', 'peinture'), true, true, true, function()
                    RageUI.ButtonWithStyle("Changer des reflets", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 1
                        end
                    end, RMenu:Get('core', "Choixcouleur"))

                    RageUI.ButtonWithStyle("Changer la couleur primaire", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 2
                        end
                    end, RMenu:Get('core', "Choixcouleur"))

                    RageUI.ButtonWithStyle("Changer la couleur secondaire", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 3
                        end
                    end, RMenu:Get('core', "Choixcouleur"))

                    RageUI.ButtonWithStyle("Changer la couleur des jantes", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 4
                        end
                    end, RMenu:Get('core', "Choixcouleur"))

                    RageUI.ButtonWithStyle("Géstion des néons", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        if s then
                            PaintType = 4
                        end
                    end, RMenu:Get('core', "neon"))


                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('core', "neon"), true, true, true, function()
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
                    end, function()
                        -- check
                    end, function()
                        -- uncheck
                    end) 
                    for k,v in ipairs(neons) do
                        RageUI.ButtonWithStyle(v.label, nil, { }, true, function(_,a,s)
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

                RageUI.IsVisible(RMenu:Get('core', "Choixcouleur"), true, true, true, function()
                    for k,v in ipairs(Colors) do
                        RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→→→" }, true, function(_,_,s)
                        end, RMenu:Get('core', v.value))
                    end
                end, function()
                end)


                for k,v in ipairs(Colors) do
                    RageUI.IsVisible(RMenu:Get('core', v.value), true, true, true, function()
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)
                        local colors = GetColors(v.value)
                        for _,i in pairs(colors) do
                            RageUI.ButtonWithStyle(i.label, nil, { }, true, function(_,a,s)
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
                    RageUI.IsVisible(RMenu:Get('core', v.name), true, true, true, function()
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
                                RageUI.ButtonWithStyle(j.name, nil, { RightLabel = "→→→" }, true, function(_,_,s)
                                    if s then SetVehicleWheelType(pVeh, j.type) end
                                end, RMenu:Get('core', j.name))
                            end
                        end

                        RageUI.ButtonWithStyle("Stock", nil, {}, true, function(_,Active,Selected)
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
                                RageUI.ButtonWithStyle(GetHornName(i), nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                    if Selected then
                                        if GetPrice(v.basePrice) <= pSocietyTable.money then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                            RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                            UpdateVehProps()
                                            pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                            TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                        else
                                            rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                        end
                                    end
                                    if Active then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                    end
                                end)
                            elseif v.modType == 48 then
                                RageUI.ButtonWithStyle(GetLabelText(modName), nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                    if Selected then
                                        if GetPrice(v.basePrice) <= pSocietyTable.money then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 48, i, 0)
                                            SetVehicleLivery(vehicle, i)
                                            RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                            rUtils.SetVehicleProperties(GetVehiclePedIsIn(GetPlayerPed(-1), 0), {modLivery = i})
                                            UpdateVehProps()
                                            pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                            TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                        else
                                            rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                        end
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
                                    RageUI.ButtonWithStyle(GetLabelText(modName), nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                        if Selected then
                                            if GetPrice(v.basePrice) <= pSocietyTable.money then
                                                SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                                RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                                UpdateVehProps()
                                                pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                                TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                            else
                                                rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                            end
                                        end
                                        if Active then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        end
                                    end)
                                else
                                    RageUI.ButtonWithStyle(GetLabelText(modName), nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                        if Selected then
                                            if GetPrice(v.basePrice) <= pSocietyTable.money then
                                                SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                                RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                                UpdateVehProps()
                                                pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                                TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                            else
                                                rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                            end
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
                    RageUI.IsVisible(RMenu:Get('core', v.name), true, true, true, function()
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)
                        SetVehicleWheelType(pVeh, v.type)
                        local num = GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23)

                        for i = 0, num-1 do
                            local modName = GetModTextLabel(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 23, i)
                            RageUI.ButtonWithStyle(GetLabelText(modName), nil, {}, true, function(_,Active,Selected)
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
                    RageUI.IsVisible(RMenu:Get('core', v.name), true, true, true, function()
                        local num = GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)
                        local installed = GetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType)
                        local pPed = GetPlayerPed(-1)
                        local pVeh = GetVehiclePedIsIn(pPed, 0)

                        if v.modType == 17 then
                            RageUI.ButtonWithStyle("Turbo", nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                if Selected then
                                    if GetPrice(v.basePrice) <= pSocietyTable.money then
                                        ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 17, 1)
                                        rUtils.SetVehicleProperties(pVeh, {modTurbo = true})
                                        RageUI.Popup({message = "Turbo installé"})
                                        UpdateVehProps()
                                        pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                        TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                    else
                                        rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                    end
                                end
                            end)
                        end

                        for i = 0, num-1 do 
                            if installed == i then
                                RageUI.ButtonWithStyle(v.name.." - "..i+1, nil, { RightBadge = RageUI.BadgeStyle.Tick }, true, function(_,Active,Selected)
                                    if Selected then
                                        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                        RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                        UpdateVehProps()
                                    end
                                end)
                            else
                                RageUI.ButtonWithStyle(v.name.." - "..i+1, nil, { RightLabel = "~g~"..GetPrice(v.basePrice).."$" }, true, function(_,Active,Selected)
                                    if Selected then
                                        if GetPrice(v.basePrice) <= pSocietyTable.money then
                                            SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), 0), v.modType, i, 0)
                                            RageUI.Popup({message = v.name.." "..tostring(i+1).." installé"})
                                            UpdateVehProps()
                                            pSocietyTable.money = pSocietyTable.money - GetPrice(v.basePrice)
                                            TriggerServerEvent(events.RmvSocMoney, token, pJob, GetPrice(v.basePrice))
                                        else
                                            rUtils.ImportantNotif("La société n'a pas assez d'argent.")
                                        end
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



