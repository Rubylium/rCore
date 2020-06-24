local open = false
RMenu.Add('core', '247', RageUI.CreateMenu("", "~b~Magasin 24/7", nil, nil, "root_cause", "shopui_title_24-7"))
RMenu.Add('core', '247_confirm', RageUI.CreateSubMenu(RMenu:Get('core', '247'), "", "~b~Magasin 24/7", nil, nil, "root_cause", "shopui_title_24-7"))
RMenu:Get('core', '247').Closed = function()
    open = false
end

RMenu.Add('core', 'ltd', RageUI.CreateMenu("", "~b~Magasin LTD", nil, nil, "root_cause", "shopui_title_ltdgasoline"))
RMenu.Add('core', 'ltd_confirm', RageUI.CreateSubMenu(RMenu:Get('core', 'ltd'), "", "~b~Magasin ltd", nil, nil, "root_cause", "shopui_title_ltdgasoline"))
RMenu:Get('core', 'ltd').Closed = function()
    open = false
end
local NearestShop = {}

Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        local NearDst = 10000000
        local NearShop = false
        for k,v in pairs(shops) do
            if NearDst == nil then
                NearestShop = v
            end
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst < NearDst then
                NearDst = dst
                NearestShop = v
            end
        end

        local dst = GetDistanceBetweenCoords(NearestShop.pos, pCoords, true)
        if dst < 10.0 then
            NearShop = true
            DrawMarker(25, NearestShop.pos.x, NearestShop.pos.y, NearestShop.pos.z-0.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 204, 255, 170, 0, 0, 2, 0, nil, nil, 0)
            if dst < 1.0 then
                RageUI.Text({
                    message = "Appuyer sur E pour ouvrir le magasin.",
                    time_display = 100,
                })
                if IsControlJustReleased(0, 38) then
                    if NearestShop.type == 1 then
                        RageUI.Visible(RMenu:Get('core', '247'), not RageUI.Visible(RMenu:Get('core', '247')))
                        OpenShop()
                    else
                        RageUI.Visible(RMenu:Get('core', 'ltd'), not RageUI.Visible(RMenu:Get('core', 'ltd')))
                        OpenShop()
                    end
                end
            end
        end

        if NearShop then
            Wait(1)
        else
            Wait(1000)
        end
    end
end)


local SelectedItem = {
    item = nil,
    price = nil,
}
function OpenShop()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', '247'), true, true, true, function()
                for k,v in pairs(NearestShop.items) do
                    RageUI.ButtonWithStyle(v.item, nil, { RightLabel = v.price.."~g~$" }, true, function(_,_,s)
                        if s then 
                            SelectedItem.item = v.item
                            SelectedItem.price = v.price
                        end
                    end, RMenu:Get('core', '247_confirm'))
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', '247_confirm'), true, true, true, function()
                RageUI.Separator("Prix "..SelectedItem.item..": ~b~"..rUtils.Math.GroupDigits(SelectedItem.price).."$")
                RageUI.ButtonWithStyle("Acheter", nil, {}, true, function(_,_,s)
                    if s then
                        local amount = CustomAmount()
                        TriggerServerEvent(events.BuyIf, token, SelectedItem.item, amount, SelectedItem.price, GetItemId(SelectedItem.item))
                    end
                end)
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'ltd'), true, true, true, function()
                for k,v in pairs(NearestShop.items) do
                    RageUI.ButtonWithStyle(v.item, nil, { RightLabel = v.price.."~g~$" }, true, function(_,_,s)
                        if s then 
                            SelectedItem.item = v.item
                            SelectedItem.price = v.price
                        end
                    end, RMenu:Get('core', 'ltd_confirm'))
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'ltd_confirm'), true, true, true, function()
                RageUI.Separator("Prix "..SelectedItem.item..": ~b~"..rUtils.Math.GroupDigits(SelectedItem.price).."$")
                RageUI.ButtonWithStyle("Acheter", nil, {}, true, function(_,_,s)
                    if s then
                        local amount = CustomAmount()
                        TriggerServerEvent(events.BuyIf, token, SelectedItem.item, amount, SelectedItem.price, GetItemId(SelectedItem.item))
                    end
                end)
            end, function()
            end)
        end
    end)
end