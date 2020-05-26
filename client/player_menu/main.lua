local open = false
RMenu.Add('core', 'main', RageUI.CreateMenu("Menu personnel", "~b~Menu personnel de votre personnage"))
RMenu:Get('core', 'main').Closed = function()
    open = false
end
RMenu.Add('core', 'inventory', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu.Add('core', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('core', 'inventory'), "Inventaire", "~b~Inventaire de votre personnage"))

RMenu.Add('core', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu.Add('core', 'portefeuille_usage', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))

RMenu.Add('core', 'accessoire', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))

RMenu.Add('core', 'divers', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))

local selected = {
    event = nil,
    name = nil,
    label = nil,
    count = nil,
    newLabel = nil,
}
local moneySelected = {
    type = nil,
    count = nil,
}
local accessoire = {
    casque = true,
    lunette = true,
    mask = true,
}
local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

function OpenPlayerMenu()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'main'), true, true, true, function()
                RageUI.Button("Inventaire", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'inventory'))
                RageUI.Button("Portefeuille", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'portefeuille'))
                RageUI.Button("Géstion accessoire", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'accessoire'))
                RageUI.Button("Divers", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'divers'))

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'inventory'), true, true, true, function()
                RageUI.Separator("Poid: ~b~"..pWeight.."/50.0")
                for k,v in pairs(pInventory) do
                    if v.olabel == v.label then
                        RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                selected.event = v.event
                                selected.name = v.name
                                selected.olabel = v.olabel
                                selected.label = v.label
                                selected.count = v.count
                            end
                        end, RMenu:Get('core', 'inventory_use'))
                    else
                        RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                selected.event = v.event
                                selected.name = v.name
                                selected.olabel = v.olabel
                                selected.label = v.label
                                selected.count = v.count
                            end
                        end, RMenu:Get('core', 'inventory_use'))
                    end
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'inventory_use'), true, true, true, function()
                RageUI.Separator(selected.label.." ~b~("..rUtils.Math.GroupDigits(selected.count)..")")
                RageUI.Button("Utiliser", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent("rF:UseItem", selected.name)
                    end
                end)
                RageUI.Button("Donner", nil, {RightLabel = "📦"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local cSid = GetPlayerServerId(ClosetPlayer)
                        if ClosetPlayer ~= -1 then
                            local amount = CustomAmount()
                            if amount <= selected.count then
                                TriggerServerEvent("rF:TransferItemIfTargetCanHoldIt", token, cSid, selected.name, amount, selected.label)
                                TriggerServerEvent("rF:GetPlayerInventory")
                                RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                            end
                        else
                            RageUI.Popup({message = "Aucune personne proche."})
                        end
                    end
                    if Active then
                        rUtils.DisplayClosetPlayer()
                    end
                end, RMenu:Get('core', 'inventory'))
                if selected.label == selected.olabel then
                    RageUI.Button("Renommer", nil, { RightLabel = "✍"  }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            RenameAnItem()
                            TriggerServerEvent("rF:RenameItem", token, selected.name, selected.newLabel, selected.label)
                            TriggerServerEvent("rF:GetPlayerInventory")
                            RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                        end
                    end)
                else
                    RageUI.Button("Réinitialiser ", "~r~Tu ne peu pas rename un item déja rename, tu doit le réinitialiser avant.", { RightLabel = "🛠" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent("rF:ResetRenameItem", token, selected.name, selected.olabel, selected.label)
                            TriggerServerEvent("rF:GetPlayerInventory")
                            RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                        end
                    end)
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'portefeuille'), true, true, true, function()
                RageUI.Separator(pJob.." - "..GetGradeLabel(pJob, pJob_Grade))
                RageUI.Button("Poche: ~g~"..rUtils.Math.GroupDigits(pMoney).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Poche: ~g~"
                        moneySelected.count = pMoney
                    end
                end)
                RageUI.Button("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Banque: ~b~"
                        moneySelected.count = pBank
                    end
                end)
                RageUI.Button("Source inconnu: ~c~"..rUtils.Math.GroupDigits(pDirty).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Source inconnu: ~c~"
                        moneySelected.count = pDirty
                    end
                end)

                if IsPatron(pJob, pJob_Grade) then
                    RageUI.Button("Ouvrire le menu patron: ~c~"..pJob, nil, {}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            OpenBossMenu(pJob)
                        end
                    end)
                end

                RageUI.Button("Regarder sa carte d'identité", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ShowIdentityCard()
                    end
                end)

                RageUI.Button("Montrer sa carte d'identité", nil, {}, true, function(Hovered, Active, Selected)
                    if Selected then
                        ShowIdentityCardToOther()
                    end
                    if Active then
                        rUtils.DisplayClosetPlayer()
                    end
                end)
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'portefeuille_usage'), true, true, true, function()
                RageUI.Separator(moneySelected.type.." "..rUtils.Math.GroupDigits(moneySelected.count).."$")
                RageUI.Button("Donner", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then

                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'accessoire'), true, true, true, function()
                RageUI.Button("Chapeau", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.casque) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.casque then
                            accessoire.casque = false
                            ClearPedProp(GetPlayerPed(-1), 0)
                            rUtils.PlayAnim("veh@bike@common@front@base", "take_off_helmet_stand", 11, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.casque = true
                            local key = exports.rFramework:GetKeyValue("helmet_1")
                            local key2 = exports.rFramework:GetKeyValue("helmet_2")
                            SetPedPropIndex(GetPlayerPed(-1), 0, key, key2, 2)
                        end
                    end
                end)

                RageUI.Button("Lunette", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.lunette) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.lunette then
                            accessoire.lunette = false
                            ClearPedProp(GetPlayerPed(-1), 1)
                            rUtils.PlayAnim("veh@bike@common@front@base", "take_off_helmet_stand", 11, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.lunette = true
                            local key = exports.rFramework:GetKeyValue("glasses_1")
                            local key2 = exports.rFramework:GetKeyValue("glasses_2")
                            SetPedPropIndex(GetPlayerPed(-1), 1, key, key2, 2)
                        end
                    end
                end)


                RageUI.Button("Masque", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.mask) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.mask then
                            accessoire.mask = false
                            local key2 = exports.rFramework:GetKeyValue("mask_2")
                            SetPedComponentVariation(GetPlayerPed(-1), 1, 0, key2, 2)	
                            rUtils.PlayAnim("missfbi4", "takeoff_mask", 11, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.mask = true
                            local key = exports.rFramework:GetKeyValue("mask_1")
                            local key2 = exports.rFramework:GetKeyValue("mask_2")
                            SetPedComponentVariation(GetPlayerPed(-1), 1, key, key2, 2)
                            rUtils.PlayAnim("mp_masks@on_foot", "put_on_mask", 11, 1.0, 1.0, 1.0, 850)
                        end
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'divers'), true, true, true, function()
                RageUI.Button("Activer/Desactiver l'HUD", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent("rF:HudToogle")
                    end
                end)

                RageUI.Button("Props", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then RageUI.Visible(RMenu:Get('core', 'props'), true) OpenPropsMenu() end
                end)

                local self = RMenu:Get('core', 'divers')
                self.EnableMouse = true
            
                RageUI.Progress("Rouge", menuColor[1], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[1] = Color
                    ReloadColor()
                end)
            
                RageUI.Progress("Vert", menuColor[2], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[2] = Color
                    ReloadColor()
                end)
            
                RageUI.Progress("Bleu", menuColor[3], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[3] = Color
                    ReloadColor()
                end)
            
                RageUI.Separator("")
            
                RageUI.Button("Appliquer la couleur", nil, {}, true, function(Hovered, Active, Selected)
                    if Selected then
                        SetResourceKvpInt("menuR", menuColor[1])
                        SetResourceKvpInt("menuG", menuColor[2])
                        SetResourceKvpInt("menuB", menuColor[3])
                        ReloadColor()
                    end
                end)

            end, function()
            end)

        end
    end)
end

function MettreOuEnleverDisplay(status)
    if status then
        return " Enlever"
    else
        return " Mettre"
    end
end

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['core']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('core', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

function CustomAmount()
    local montant = nil
    AddTextEntry("BANK_CUSTOM_AMOUNT", "Entrez le montant")
    DisplayOnscreenKeyboard(1, "BANK_CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        montant = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(montant)
end

function RenameAnItem()
    AddTextEntry("ITEM_CUSTOM_LABEL", "Entrez le nouveau nom de l'item")
    DisplayOnscreenKeyboard(1, "ITEM_CUSTOM_LABEL", '', "", '', '', '', 35)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        selected.newLabel = GetOnscreenKeyboardResult()
        if selected.newLabel == nil then
            selected.newLabel = ""
        end
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
end


function ShowIdentityCard()
    local mug, txd = rUtils.GetPedMugshot(GetPlayerPed(-1))
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..pPrenom.."~w~\nNom: ~o~"..pNom.."~w~\nAge:~o~ "..pAge.."~w~\nMétier: ~o~"..pJob, txd, 7, false, false)
    UnregisterPedheadshot(mug)
end

function ShowIdentityCardToOther()
    local player, dst = rUtils.GetClosestPlayer(GetEntityCoords(GetPlayerPed(-1)))
    if dst <= 2.0 then
        local sID = GetPlayerServerId(player)
        TriggerServerEvent("core:ShowIdentityCardToOther", sID, PedToNet(GetPlayerPed(player)), pPrenom, pNom, pAge, pJob)
    else
        RageUI.Popup({message = "~r~Action impossible\n~w~Aucun joueur proche."})
    end
end


RegisterNetEvent("core:ShowIdentityCardToOther")
AddEventHandler("core:ShowIdentityCardToOther", function(net, source, Prenom, Nom, Age, Job)
    local player = GetPedIndexFromEntityIndex(NetToEnt(net))
    local mug, txd = rUtils.GetPedMugshot(player)
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..Prenom.."~w~\nNom: ~o~"..Nom.."~w~\nAge:~o~ "..Age.."~w~\nMétier: ~o~"..Job, txd, 7, false, false)
    UnregisterPedheadshot(mug)
end)