RMenu.Add('core', 'main', RageUI.CreateMenu("Menu personnel", "~b~Menu personnel de votre personnage"))

RMenu.Add('core', 'inventory', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu.Add('core', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('core', 'inventory'), "Inventaire", "~b~Inventaire de votre personnage"))


Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(1, 166) then
            TriggerServerEvent("rF:GetPlayerInventory")
            RageUI.Visible(RMenu:Get('core', 'main'), not RageUI.Visible(RMenu:Get('core', 'main')))
        end
        Wait(1)
    end
end)

local selected = {
    event = nil,
    name = nil,
    count = nil,
}
Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', 'main'), true, true, true, function()
            open = true
            RageUI.Button("Inventaire", nil, { RightLabel = "→→→" }, true, function()
            end, RMenu:Get('core', 'inventory'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'inventory'), true, true, true, function()
            open = true
            for k,v in pairs(pInventory) do
                RageUI.Button(v.name.." ~b~("..v.count..")", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        selected.event = v.event
                        selected.name = v.name
                        selected.count = v.count
                    end
                end, RMenu:Get('core', 'inventory_use'))
            end
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', 'inventory_use'), true, true, true, function()
            open = true
            RageUI.Separator(selected.name.." ~b~("..selected.count..")")
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

        if open then
            Wait(1)
        else
            Wait(100)
        end
    end
end)