RMenu.Add('core', 'main', RageUI.CreateMenu("Menu personnel", "~b~Menu personnel de votre personnage"))

RMenu.Add('core', 'inventory', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu.Add('core', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('core', 'inventory'), "Inventaire", "~b~Inventaire de votre personnage"))

RMenu.Add('core', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu.Add('core', 'portefeuille_usage', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))

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

local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'main'), true, true, true, function()
            open = true
            RageUI.Button("Inventaire", nil, { RightLabel = "→→" }, true, function()
            end, RMenu:Get('core', 'inventory'))
            RageUI.Button("Portefeuille", nil, { RightLabel = "→→" }, true, function()
            end, RMenu:Get('core', 'portefeuille'))
            RageUI.Button("Divers", nil, { RightLabel = "→→" }, true, function()
            end, RMenu:Get('core', 'divers'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'inventory'), true, true, true, function()
            open = true
            RageUI.Separator("Poid: ~b~"..pWeight.."/50.0")
            for k,v in pairs(pInventory) do
                if v.olabel == v.label then
                    RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", description, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            selected.event = v.event
                            selected.name = v.name
                            selected.olabel = v.olabel
                            selected.label = v.label
                            selected.count = v.count
                        end
                    end, RMenu:Get('core', 'inventory_use'))
                else
                    RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", description, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
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
            open = true
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
                    if ClosetPlayer ~= -1 and dst <= 3.0 then
                        TriggerServerEvent("rF:TransferItemIfTargetCanHoldIt", token, cSid, selected.name, selected.count, selected.label)
                        TriggerServerEvent("rF:GetPlayerInventory")
                    else
                        RageUI.Popup({message = "Aucune personne proche."})
                    end
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
            open = true
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
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'portefeuille_usage'), true, true, true, function()
            open = true
            RageUI.Separator(moneySelected.type.." "..rUtils.Math.GroupDigits(moneySelected.count).."$")
            RageUI.Button("Utiliser", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerEvent("rF:UseItem", selected.name)
                end
            end)
            RageUI.Button("Donner", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then

                end
            end)

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'divers'), true, true, true, function()
            open = true
            RageUI.Button("Activer/Desactiver l'HUD", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerEvent("rF:HudToogle")
                end
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

        if open then
            Wait(1)
        else
            Wait(250)
        end
    end
end)

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