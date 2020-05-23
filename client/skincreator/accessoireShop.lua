local ShopZone = {
    vector3(-1124.4, -1443.8, 5.22),
}

for k,v in pairs(ShopZone) do
    rUtils.RegisterActionZone({
        pos = v,
        action = function()
            OpenAccessoireShop()
        end,
    })
end

local open = false
RMenu.Add('core', 'accesShop', RageUI.CreateMenu("Magasin vètement", "~b~Géstion des vétement de votre personnage."))
RMenu:Get('core', 'accesShop').Closed = function()
    exports.rFramework:ReloadPlayerCloth()
    KillCreatorCam()
    open = false
end;

local acce = {}
local masks = nil
function GetAccessoireValues()
    local accessorie = {
		{price = 6,label = "Chaine", 				item = "chain_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 7) - 1,								min = 0,},
		{price = 35,label = "Sac", 					item = "bags_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5) - 1,								min = 0,},
		{price = 13,label = "Casque", 				item = "helmet_1", 		max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 0) - 1,							min = -1,},
		{price = 20,label = "Lunettes", 			item = "glasses_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1) - 1,							min = 0,},
		{price = 15,label = "Montre", 				item = "watches_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 6) - 1,							min = -1,},
		{price = 9,label = "Bracelet", 				item = "bracelets_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 7) - 1,							min = -1,},
		{price = 13,label = "Accessoire oreilles", 	item = "ears_1", 		max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1) - 1,							min = -1,},
		{price = 24,label = "Masque", 				item = "mask_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1) - 1,								min = 0,},
        {price = 3,label = "Variante masque",o="mask_1",item = "mask_2",c=1,max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 1, GetPedTextureVariation(GetPlayerPed(-1), 1)) - 1,			min = 0,},
        --{label = "gilet pare-balle 1", 		item = "bproof_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) - 1,								min = 0,},
		--{label = "gilet pare-balle 2", 		item = "bproof_2", 		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 9, GetPedTextureVariation(GetPlayerPed(-1), 9)) - 1,			min = 0,},
    }
    if masks == nil then
        masks = LoadResourceFile(GetCurrentResourceName(), 'client/skincreator/mask.json')
        masks = json.decode(masks)
        masks = masks[1]

        for i = 0, 5600 do
            if masks[tostring(i)] ~= nil then
                if masks[tostring(i)][tostring(0)].GXT ~= "NO_LABEL" then
                    masks[tostring(i)][tostring(0)].label = GetLabelText(masks[tostring(i)][tostring(0)].GXT)
                else
                    masks[tostring(i)][tostring(0)].label = "Inconnu"
                end
                masks[tostring(i)][tostring(0)].Localized = nil
                print(masks[tostring(i)][tostring(0)].label)
            end
        end
    end
    acce = accessorie
end

Citizen.CreateThread(function()
    GetAccessoireValues()
    for k,v in pairs(acce) do
        RMenu.Add('core', v.item.."1", RageUI.CreateSubMenu(RMenu:Get('core', 'accesShop'), "Création personnage", "~b~Géstion des vétement de votre personnage."))
        RMenu:Get('core', v.item.."1").Closed = function()
            exports.rFramework:ReloadPlayerCloth()
            SwitchCam(true, "default")
            PlayRandomClothAnim()
        end
    end
end)


function OpenAccessoireShop()
    RageUI.Visible(RMenu:Get('core', 'accesShop'), not RageUI.Visible(RMenu:Get('core', 'accesShop')))
    CreateCreatorCam()
    OpenAccessoireShopThread()
    GetAccessoireValues()
end


function OpenAccessoireShopThread()
    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'accesShop'), true, true, true, function()
                for k,v in pairs(acce) do
                    RageUI.Button(v.label, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            SwitchCam(false, v.item)
                            ClearPedTasks(GetPlayerPed(-1))
                        end
                    end, RMenu:Get('core', v.item.."1"))
                end

            end, function()
            end)

            for k,v in pairs(acce) do
                RageUI.IsVisible(RMenu:Get('core', v.item.."1"), true, true, true, function()
                    RageUI.Button("Faire tourner son personnage.", nil, {}, true, function(_,_,s)
                        if s then
                            ClearPedTasks(GetPlayerPed(-1))
                            local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -5.0, 0.0)
                            TaskTurnPedToFaceCoord(GetPlayerPed(-1), coords, 3000)
                        end
                    end)
                    if v.item == "mask_1" then
                        for i = v.min, v.max do
                            if NotSpamming[k] == nil then NotSpamming[k] = i end

                            RageUI.Button("["..i.."] "..masks[tostring(i)][tostring(0)].label, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                               if s then
                                   TriggerEvent("skinchanger:change", v.item, i)
                                   TriggerEvent("rF:SaveSkin", v.item, i)
                                   TriggerServerEvent("rF:RemoveMoney", token, v.price)
                               end
                               if h then
                                   if NotSpamming[k] ~= i then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       NotSpamming[k] = i
                                   end
                               end
                            end) 
                        end
                    elseif v.item == "mask_2" then

                        local value = exports.rFramework:GetKeyValue(v.o)
                        for i = v.min, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1 do
                            if NotSpamming[k] == nil then NotSpamming[k] = i end
                            RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                               if s then
                                   TriggerEvent("skinchanger:change", v.item, i)
                                   TriggerEvent("rF:SaveSkin", v.item, i)
                                   TriggerServerEvent("rF:RemoveMoney", token, v.price)
                               end
                               if h then
                                    if NotSpamming[k] ~= i then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       NotSpamming[k] = i
                                    end
                               end
                            end) 
                        end

                    else
                        for i = v.min, v.max do
                            if NotSpamming[k] == nil then NotSpamming[k] = i end
                            RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                               if s then
                                   TriggerEvent("skinchanger:change", v.item, i)
                                   TriggerEvent("rF:SaveSkin", v.item, i)
                                   TriggerServerEvent("rF:RemoveMoney", token, v.price)
                               end
                               if h then
                                   if NotSpamming[k] ~= i then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       NotSpamming[k] = i
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
