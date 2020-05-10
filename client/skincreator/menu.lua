RMenu.Add('core', 'skincreator', RageUI.CreateMenu("Création personnage", "~b~Menu de création de votre personnage."))
RMenu:Get('core', 'skincreator').Closable = false
RMenu:Get('core', 'skincreator').Closed = function()
    KillCreatorCam()
end;

RMenu.Add('core', 'skincreator_skin', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator'), "Création personnage", "~b~Menu de création de votre personnage."))
RMenu.Add('core', 'skincreator_identity', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator'), "Création personnage", "~b~Menu de création de votre personnage."))

for k,v in pairs(GetMaxVals()) do
    RMenu.Add('core', v.item, RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator_skin'), "Création personnage", "~b~Menu de création de votre personnage."))
    RMenu:Get('core', v.item).Closed = function()
        SwitchCam(true, "default")
    end;
end
RMenu.Add('core', 'skincreator_model', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator_skin'), "Création personnage", "~b~Menu de création de votre personnage."))



local values = {}
local peds = {}
function OpenCreatorMenu()
    values, peds = GetMaxVals()
    CreateCreatorCam()
    RageUI.Visible(RMenu:Get('core', 'skincreator'), true)
end



RegisterNetEvent("core:OpenIdentityCreator")
AddEventHandler("core:OpenIdentityCreator", function()
    OpenCreatorMenu()
end)


local NotSpamming = {}
local usingVipPed = false
Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'skincreator'), true, true, true, function()
            open = true
            RageUI.Button("Faire son identité", nil, { RightLabel = "→→" }, true, function()
            end, RMenu:Get('core', 'skincreator_identity'))

            RageUI.Button("Tenue manuel", nil, { RightLabel = "→→" }, not usingVipPed, function()
            end, RMenu:Get('core', 'skincreator_skin'))
            RageUI.Separator("")
            RageUI.Button("~g~Valider la création de votre personnage.", nil, { RightLabel = "→→" }, true, function(_,_,s)
                if s then
                    KillCreatorCam()
                    RageUI.CloseAll()
                end
            end)
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'skincreator_skin'), true, true, true, function()
            open = true
            RageUI.Button("Model", nil, { RightLabel = "→→" }, true, function()
            end, RMenu:Get('core', "skincreator_model"))
            for k,v in pairs(values) do
                RageUI.Button(v.label, nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                    if s then
                        SwitchCam(false, v.item)
                    end
                end, RMenu:Get('core', v.item))
            end
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'skincreator_model'), true, true, true, function()
            open = true
            for k,v in pairs(peds) do
                RageUI.Button(v.label, nil, { RightLabel = "→ Changer" }, true, function(_,h,s)
                    if s then
                        TriggerEvent("skinchanger:change", "sex", v.model)
                        TriggerEvent("rF:SaveSkin")
                        values = GetMaxVals()
                        if v.vip == true then
                            usingVipPed = true
                        else
                            usingVipPed = false
                        end
                    end
                    if h then
                        if NotSpamming[k] ~= k + 1000 then
                            TriggerEvent("skinchanger:change", "sex", v.model)
                            NotSpamming[k] = k + 1000
                        end
                    end
                end)  
            end
        end, function()
        end)

        for k,v in pairs(values) do
            RageUI.IsVisible(RMenu:Get('core', v.item), true, true, true, function()
                open = true
                for i = v.min, v.max do
                    if NotSpamming[k] == nil then NotSpamming[k] = i end
                    RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                        if s then
                            TriggerEvent("skinchanger:change", v.item, i)
                            TriggerEvent("rF:SaveSkin")
                        end
                        if h then
                            if NotSpamming[k] ~= i then
                                TriggerEvent("skinchanger:change", v.item, i)
                                NotSpamming[k] = i
                            end
                        end
                    end) 
                end

            end, function()
                
            end)
        end


        RageUI.IsVisible(RMenu:Get('core', "skincreator_identity"), true, true, true, function()
            open = true
            

        end, function()
            
        end)


        if open then
            Wait(1)
        else
            Wait(500)
        end
    end
end)