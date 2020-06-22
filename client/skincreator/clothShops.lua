local ShopZone = {
    vector3(-158.731, -297.06, 39.7),
    vector3(10.78, 6514.1, 31.8),
    vector3(124.3256, -218.8684, 54.55784),
    vector3(428.7264, -800.319, 29.49114),
    vector3(-1192.826, -772.0496, 17.32482),
}


Citizen.CreateThread(function()
    for k,v in pairs(ShopZone) do
        local blip = AddBlipForCoord(v)
        SetBlipSprite(blip, 366)
        SetBlipScale(blip, 0.50)
        SetBlipColour(blip, 17)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Magasin de vêtements")
        EndTextCommandSetBlipName(blip)
    end
end)

for k,v in pairs(ShopZone) do
    rUtils.RegisterActionZone({
        pos = v,
        action = function()
            OpenClothShop()
        end,
    })
end

local open = false
RMenu.Add('core', 'clothshop', RageUI.CreateMenu("Magasin vètement", "~b~Géstion des vétement de votre personnage."))
RMenu:Get('core', 'clothshop').Closed = function()
    exports.rFramework:ReloadPlayerCloth()
    KillCreatorCam()
    Destroy("clothshop_ambience")
    open = false
end;

RMenu.Add('core', "tenues_create", RageUI.CreateSubMenu(RMenu:Get('core', 'clothshop'), "Magasin vètement", "~b~Géstion des vétement de votre personnage."))
RMenu:Get('core', "tenues_create").Closed = function()
    exports.rFramework:ReloadPlayerCloth()
    PlayRandomClothAnim()
end;

RMenu.Add('core', "tenues", RageUI.CreateSubMenu(RMenu:Get('core', 'clothshop'), "Magasin vètement", "~b~Géstion des vétement de votre personnage."))
RMenu:Get('core', "tenues").Closed = function()
    exports.rFramework:ReloadPlayerCloth()
    PlayRandomClothAnim()
end;

local clothing = {}
function GetClothValues()
    local _clothing = {
        {price = 24,label = "t-Shirt", r = "tshirt_2", item = "tshirt_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8) - 1,								min = 0,},
        {price = 0,c = 8, o = "tshirt_1", label = "Couleur du t-Shirt", 		item = "tshirt_2", 			min = 0,},
        {price = 36,label = "Veste", 	r = "torso_2", item = "torso_1", 					max	= GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11) - 1,								min = 0,},
        {price = 0,c = 11, o = "torso_1", label = "Couleur de la veste", 	item = "torso_2", 		 		min = 0,},
        {price = 5,label = "calques 1", r = "decals_2", item = "decals_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10) - 1,								min = 0,},
        {price = 2,c = 10, o = "decals_1", label = "calques 2", 				item = "decals_2", 			min = 0,},
        {price = 12,label = "bras", r = "arms_2", item = "arms", 						max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3) - 1,								min = 0,},
        {price = 0,label = "Couleur des gants.", 		item = "arms_2", 					max = 10,																						min = 0,},
        {price = 15,label = "Pantalon", r = "pants_2", item = "pants_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4) - 1,								min = 0,},
        {price = 0,c = 4, o = "pants_1", label = "Variation du pantalon", 				item = "pants_2", 		 	min = 0,},
        {price = 18,label = "chaussures 1", r = "shoes_2", item = "shoes_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6) - 1,								min = 0,},
        {price = 0,c = 6, o = "shoes_1", label = "Style des chaussures", 	item = "shoes_2", 		 	min = 0,},
    }
    clothing = _clothing
end

Citizen.CreateThread(function()
    GetClothValues()
    for k,v in pairs(clothing) do
        RMenu.Add('core', v.item.."1", RageUI.CreateSubMenu(RMenu:Get('core', 'tenues_create'), "Création personnage", "~b~Géstion des vétement de votre personnage."))
        RMenu:Get('core', v.item.."1").Closed = function()
            exports.rFramework:ReloadPlayerCloth()
            SwitchCam(true, "default")
            PlayRandomClothAnim()
        end
    end
end)


function OpenClothShop()
    RageUI.Visible(RMenu:Get('core', 'clothshop'), not RageUI.Visible(RMenu:Get('core', 'clothshop')))
    CreateCreatorCam()
    OpenClothShopThread()
    PlayUrl("clothshop_ambience","https://www.youtube.com/watch?v=neV3EPgvZ3g", 0.02, false)
    GetClothValues()
end


function OpenClothShopThread()
    if open then return end
    Citizen.CreateThread(function()
        open = true
        while open do

            if IsControlJustReleased(1, 22) then
                ClearPedTasksImmediately(pPed)
                local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -5.0, 0.0)
                TaskTurnPedToFaceCoord(GetPlayerPed(-1), coords, 3000)
            end

            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'clothshop'), false, false, false, function()
                RageUI.ButtonWithStyle("Faire une nouvelle tenue", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'tenues_create'))

                RageUI.ButtonWithStyle("Voir vos tenues", nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                end, RMenu:Get('core', 'tenues'))

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'tenues_create'), false, false, false, function()
                RageUI.ButtonWithStyle("Enregistrer la tenue actuel.", nil, {}, true, function(_,_,s)
                    if s then
                        local name = CustomString()
                        if name ~= nil then
                            if pVip == 0 then
                                if #pClothing <= 5 then
                                    TriggerEvent("rF:SaveCloth", name)
                                    rUtils.Notif("~g~Tenue enregistrée")
                                else
                                    rUtils.Notif("~r~Action impossible\n~s~Tu possèdes trop de tenue (5)")
                                end
                            elseif pVip == 1 then
                                if #pClothing <= 10 then
                                    TriggerEvent("rF:SaveCloth", name)
                                    rUtils.Notif("~g~Tenue enregistrée")
                                else
                                    rUtils.Notif("~r~Action impossible\n~s~Tu possèdes trop de tenue (10)")
                                end
                            elseif pVip == 2 then
                                if #pClothing <= 15 then
                                    TriggerEvent("rF:SaveCloth", name)
                                    rUtils.Notif("~g~Tenue enregistrée")
                                else
                                    rUtils.Notif("~r~Action impossible\n~s~Tu possèdes trop de tenue (15)")
                                end
                            end
                        else
                            rUtils.Notif("~r~Action impossible\n~s~Le nom ne peut pas être vide")
                        end
                    end
                end)
                for k,v in pairs(clothing) do
                    RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            SwitchCam(false, v.item)
                        end
                    end, RMenu:Get('core', v.item.."1"))
                end

            end, function()
            end)

            for k,v in pairs(clothing) do
                RageUI.IsVisible(RMenu:Get('core', v.item.."1"), false, false, false, function()
                    RageUI.ButtonWithStyle("Faire tourner son personnage.", nil, {}, true, function(_,_,s)
                        if s then
                            ClearPedTasks(GetPlayerPed(-1))
                            local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -5.0, 0.0)
                            TaskTurnPedToFaceCoord(GetPlayerPed(-1), coords, 3000)
                        end
                    end)
                    if v.c ~= nil then
                        local value = exports.rFramework:GetKeyValue(v.o)
                        for i = v.min, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1 do
                            if NotSpamming[k] == nil then NotSpamming[k] = i end
                            RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                                if s then
                                    if pMoney > v.price then
                                        TriggerEvent("skinchanger:change", v.item, i)
                                        TriggerEvent("rF:SaveSkin", v.item, i)
                                        TriggerServerEvent(events.rmvMoney, token, v.price)
                                    else
                                        rUtils.Notif("tu n'as pas assez d'argent")
                                    end
                                end
                                if h then
                                    if NotSpamming[k] ~= i then
                                        TriggerEvent("skinchanger:change", v.item, i)
                                        TriggerEvent("skinchanger:change", "helmet_1", -1)
                                        TriggerEvent("skinchanger:change", "mask_1", 0)
                                       NotSpamming[k] = i
                                    end
                               end
                            end) 
                        end
                    else
                        for i = v.min, v.max do
                            if NotSpamming[k] == nil then NotSpamming[k] = i end
                            RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                                if s then
                                    if pMoney > v.price then
                                        TriggerEvent("skinchanger:change", v.item, i)
                                        TriggerEvent("rF:SaveSkin", v.item, i)
                                        TriggerServerEvent(events.rmvMoney, token, v.price)
                                    else
                                        rUtils.Notif("tu n'as pas assez d'argent")
                                    end
                                end
                               if h then
                                   if NotSpamming[k] ~= i then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       TriggerEvent("skinchanger:change", "helmet_1", -1)
                                        TriggerEvent("skinchanger:change", "mask_1", 0)
                                       NotSpamming[k] = i
                                   end
                               end
                            end) 
                        end
                    end
                end, function()

                end)
            end

            RageUI.IsVisible(RMenu:Get('core', 'tenues'), false, false, false, function()
                open = true
                for k,v in pairs(pClothing) do
                    RageUI.ButtonWithStyle(v.name, nil, { RightLabel = "Appliquer la tenue →" }, true, function(_,_,s)
                        if s then
                            TriggerEvent("skinchanger:loadClothesOnly", v.data)
                        end
                    end)
                end
            end, function()
            end)

        end
    end)
end