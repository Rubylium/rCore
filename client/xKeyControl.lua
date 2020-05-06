rUtils.RegisterControlKey("inventaire", "Ouvrir l'inventaire", "F5", function()
    TriggerServerEvent("rF:GetPlayerInventory")
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    RageUI.Visible(RMenu:Get('core', 'main'), not RageUI.Visible(RMenu:Get('core', 'main')))
end)


rUtils.RegisterControlKey("metier", "Ouvrir le menu de métier", "F6", function()
    if pJob == "mecano" then
        RageUI.Visible(RMenu:Get('core', 'mecano_main'), not RageUI.Visible(RMenu:Get('core', 'mecano_main')))
    end
end)