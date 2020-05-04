RMenu.Add('core', 'main', RageUI.CreateMenu("RageUI", "~b~RAGEUI core"))
RMenu.Add('core', 'submenu', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "RageUI", "~b~RAGEUI core", nil, nil, "root_cause", "shopui_title_dynasty8"))

-- RageUI.CreateWhile(wait, menu, key, closure)
RageUI.CreateWhile(1.0, RMenu:Get('core', 'main'), 51, function()
    RageUI.IsVisible(RMenu:Get('core', 'main'), true, true, true, function()
     
        
    end, function()
    end)

end)