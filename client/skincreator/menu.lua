local values = {}
local peds = {}
local corps = {}
local accessorie = {}
local FaceCustom = {}
values, peds, corps, accessorie, FaceCustom = GetMaxVals()

RMenu.Add('core', 'skincreator', RageUI.CreateMenu("Création personnage", "~b~Menu de création de votre personnage."))
RMenu:Get('core', 'skincreator').Closable = false
RMenu:Get('core', 'skincreator').Closed = function()
    KillCreatorCam()
end;

RMenu.Add('core', 'skincreator_skin', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator'), "Création personnage", "~b~Menu de création de votre personnage."))

RMenu.Add('core', 'skincreator_face', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator'), "Création personnage", "~b~Menu de création de votre personnage."))
RMenu:Get('core', 'skincreator_face').Closed = function()
    SwitchCam(true, "default")
    values, peds, corps, accessorie, FaceCustom = GetMaxVals()
end;

RMenu.Add('core', 'skincreator_identity', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator'), "Création personnage", "~b~Menu de création de votre personnage."))

for k,v in pairs(GetMaxVals()) do
    RMenu.Add('core', v.item, RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator_skin'), "Création personnage", "~b~Menu de création de votre personnage."))
    RMenu:Get('core', v.item).Closed = function()
        SwitchCam(true, "default")
        PlayRandomClothAnim()
        values, peds, corps, accessorie, FaceCustom = GetMaxVals()
    end;
end

for k,v in pairs(FaceCustom) do
    RMenu.Add('core', v.item, RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator_face'), "Création personnage", "~b~Menu de création de votre personnage."))
    RMenu:Get('core', v.item).Closed = function()
        SwitchCam(true, "default_face")
        PlayRandomClothAnim()
        values, peds, corps, accessorie, FaceCustom = GetMaxVals()
    end;
end

RMenu.Add('core', 'skincreator_model', RageUI.CreateSubMenu(RMenu:Get('core', 'skincreator_skin'), "Création personnage", "~b~Menu de création de votre personnage."))




local Identity = {
    nom = nil,
    prenom = nil,
    age = nil,
}
function OpenCreatorMenu()
    TriggerEvent("skinchanger:change", "sex", "mp_m_freemode_01")
    values, peds, corps, accessorie, FaceCustom = GetMaxVals()
    CreateCreatorCam()
    CreatorMenuThread()
    RageUI.Visible(RMenu:Get('core', 'skincreator'), true)
    PlayUrl("creatorMusic","https://www.youtube.com/watch?v=EwMjazrwPak",0.1, false)
end



RegisterNetEvent("core:OpenIdentityCreator")
AddEventHandler("core:OpenIdentityCreator", function()
    OpenCreatorMenu()
    PlayRandomClothAnim()
end)


NotSpamming = {}
local usingVipPed = false
function CreatorMenuThread()
    local DisplayMenu = true
    Citizen.CreateThread(function()
        while DisplayMenu do
            local open = false
            RageUI.IsVisible(RMenu:Get('core', 'skincreator'), true, true, true, function()
                open = true
                RageUI.Button("Faire son identité", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'skincreator_identity'))

                RageUI.Button("Personalisation du visage", nil, { RightLabel = "→→" }, true, function(_,_,s)
                end, RMenu:Get('core', 'skincreator_face'))

                RageUI.Button("Personalisation de la tenue", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'skincreator_skin'))
                RageUI.Separator("")
                RageUI.Button("~g~Valider la création de votre personnage.", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then
                        if Identity.prenom == nil or Identity.nom == nil or Identity.age == nil then
                            RageUI.Popup({message = "~r~Action impossible\n~w~Certains champs n'ont pas été remplie."})
                            return
                        end
                        TriggerServerEvent("rF:ChangePlayerIdentity", Identity)
                        KillCreatorCam()
                        RageUI.CloseAll()
                        DisplayMenu = false
                        Destroy("creatorMusic")
                        StartCreatorEndCinematic()
                    end
                end)
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'skincreator_face'), true, true, true, function()
                open = true
                for k,v in pairs(FaceCustom) do
                    RageUI.Button(v.label, nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                        if s then
                            ClearPedTasks(GetPlayerPed(-1))
                            SwitchCam(false, v.item)
                        end
                    end, RMenu:Get('core', v.item))
                end
            end, function()
            end)

            for k,v in pairs(FaceCustom) do
                RageUI.IsVisible(RMenu:Get('core', v.item), true, true, true, function()
                    open = true
                    for i = v.min, v.max do
                        if NotSpamming[k] == nil then NotSpamming[k] = i end
                        RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                            if s then
                                TriggerEvent("skinchanger:change", v.item, i)
                                TriggerEvent("rF:SaveSkin")
                                values, peds, corps, accessorie, FaceCustom = GetMaxVals()
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

            RageUI.IsVisible(RMenu:Get('core', 'skincreator_skin'), true, true, true, function()
                open = true
                RageUI.Button("Model", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', "skincreator_model"))
                for k,v in pairs(values) do
                    RageUI.Button(v.label, nil, { RightLabel = "→→" }, not usingVipPed, function(_,_,s)
                        if s then
                            SwitchCam(false, v.item)
                            PlayRandomClothAnim()
                            values, peds, corps, accessorie, FaceCustom = GetMaxVals()
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
                            values, peds, corps, accessorie, FaceCustom = GetMaxVals()
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
                    if v.c ~= nil then
                        local value = exports.rFramework:GetKeyValue(v.o)
                        for i = v.min, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1 do
                            print(value, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1)
                            if NotSpamming[k] == nil then NotSpamming[k] = i end
                            RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                               if s then
                                   TriggerEvent("skinchanger:change", v.item, i)
                                   TriggerEvent("rF:SaveSkin")
                                   values, peds, corps, accessorie, FaceCustom = GetMaxVals()
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
                            RageUI.Button(v.label.." "..i, nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                               if s then
                                   TriggerEvent("skinchanger:change", v.item, i)
                                   TriggerEvent("rF:SaveSkin")
                                   values, peds, corps, accessorie, FaceCustom = GetMaxVals()
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


            RageUI.IsVisible(RMenu:Get('core', "skincreator_identity"), true, true, true, function()
                open = true
                if Identity.prenom == nil then
                    RageUI.Button("Prénom: ", nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                        if s then
                            local prenom = CustomString()
                            if prenom ~= nil and prenom ~= "" then
                                Identity.prenom = tostring(prenom)
                            end
                        end
                    end) 
                else
                    RageUI.Button("Prénom: ", nil, { RightLabel = "~g~"..Identity.prenom }, not usingVipPed, function(_,h,s)
                        if s then
                            local prenom = CustomString()
                            if prenom ~= nil and prenom ~= "" then
                                Identity.prenom = tostring(prenom)
                            end
                        end
                    end) 
                end

                if Identity.nom == nil then
                    RageUI.Button("Nom: ", nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                        if s then
                            local nom = CustomString()
                            if nom ~= nil and nom ~= "" then
                                Identity.nom = tostring(nom)
                            end
                        end
                    end) 
                else
                    RageUI.Button("Nom: ", nil, { RightLabel = "~g~"..Identity.nom }, not usingVipPed, function(_,h,s)
                        if s then
                            local nom = CustomString()
                            if nom ~= nil and nom ~= "" then
                                Identity.nom = tostring(nom)
                            end
                        end
                    end) 
                end

                if Identity.age == nil then
                    RageUI.Button("Age: ", nil, { RightLabel = "→ Changer" }, not usingVipPed, function(_,h,s)
                        if s then
                            local age = tonumber(CustomString())
                            if age ~= nil and age ~= "" then
                                if age > 15 and age < 80 then
                                    Identity.age = tostring(age)
                                else
                                    RageUI.Popup({message = "~r~Action impossible.\n~w~Merci d'entrer un age réaliste."})
                                end
                            end
                        end
                    end) 
                else
                    RageUI.Button("Age: ", nil, { RightLabel = "~g~"..Identity.age }, not usingVipPed, function(_,h,s)
                        if s then
                            local age = tonumber(CustomString())
                            if age ~= nil and age ~= "" then
                                if age > 15 and age < 80 then
                                    Identity.age = tostring(age)
                                else
                                    RageUI.Popup({message = "~r~Action impossible.\n~w~Merci d'entrer un age réaliste."})
                                end
                            end
                        end
                    end) 
                end

            end, function()

            end)


            if open then
                Wait(1)
            else
                Wait(500)
            end
        end
    end)
end


function CustomString()
    local txt = nil
    AddTextEntry("CREATOR_TXT", "Entrez votre texte.")
    DisplayOnscreenKeyboard(1, "CREATOR_TXT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        txt = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return txt
end