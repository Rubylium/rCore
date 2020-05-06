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
}
local moneySelected = {
    type = nil,
    count = nil,
}
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
                RageUI.Button(v.label.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", description, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        selected.event = v.event
                        selected.name = v.name
                        selected.label = v.label
                        selected.count = v.count
                    end
                end, RMenu:Get('core', 'inventory_use'))
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
            RageUI.Button("Donner", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then

                end
            end)

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

        end, function()
        end)

        if open then
            Wait(1)
        else
            Wait(250)
        end
    end
end)