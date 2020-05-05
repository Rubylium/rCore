RMenu.Add('core', '247', RageUI.CreateMenu("", "~b~Magasin 24/7", nil, nil, "root_cause", "shopui_title_24-7"))
RMenu.Add('core', '247_confirm', RageUI.CreateSubMenu(RMenu:Get('core', '247'), "", "~b~Magasin 24/7", nil, nil, "root_cause", "shopui_title_24-7"))

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
            DrawMarker(25, NearestShop.pos.x, NearestShop.pos.y, NearestShop.pos.z-0.6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 204, 255, 170, 0, 0, 2, 0, nil, nil, 0)
            if dst < 1.0 then
                RageUI.Text({
                    message = "Appuyer sur E pour ouvrir le magasin.",
                    time_display = 100,
                })
                if IsControlJustReleased(0, 38) then
                    RageUI.Visible(RMenu:Get('core', '247'), not RageUI.Visible(RMenu:Get('core', '247')))
                end
            end
        end

        if NearShop then
            Wait(1)
        else
            Wait(250)
        end
    end
end)


local SelectedItem = {
    item = nil,
    price = nil,
}
Citizen.CreateThread(function()
    while true do
        local open = false
        RageUI.IsVisible(RMenu:Get('core', '247'), true, true, true, function()
            open = true
            for k,v in pairs(NearestShop.items) do
                RageUI.Button(v.item, nil, { RightLabel = v.price.."~g~$" }, true, function(_,_,s)
                    if s then 
                        SelectedItem.item = v.item
                        SelectedItem.price = v.price
                    end
                end, RMenu:Get('core', '247_confirm'))
            end

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('core', '247_confirm'), true, true, true, function()
            open = true
            RageUI.Separator("Prix "..SelectedItem.item..": ~b~"..rUtils.Math.GroupDigits(SelectedItem.price).."$")
            RageUI.Button("Acheter", nil, {}, true, function(_,_,s)
                if s then
                    -- Faire achats
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