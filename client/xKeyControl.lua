rUtils.RegisterControlKey("inventaire", "Ouvrir l'inventaire", "F5", function()
    TriggerServerEvent("rF:GetPlayerInventory")
    TriggerServerEvent("rF:GetPlayerAccounts", token)
    OpenPlayerMenu()
    RageUI.Visible(RMenu:Get('core', 'main'), true)
end)


rUtils.RegisterControlKey("metier", "Ouvrir le menu de métier", "F6", function()
    if pJob == "mecano" then
        RageUI.Visible(RMenu:Get('core', 'mecano_main'), not RageUI.Visible(RMenu:Get('core', 'mecano_main')))
        OpenMecanoActionMenu()
    end
end)

rUtils.RegisterControlKey("speed", "Ouvrir le menu de métier", "9", function()
    SetTimeScale(1.0)
end)

rUtils.RegisterControlKey("slow", "Ouvrir le menu de métier", "6", function()
    SetTimeScale(0.25)
end)

rUtils.RegisterControlKey("creator", "Ouvrir le menu de création", "f1", function()
    OpenCreatorMenu()
end)

rUtils.RegisterControlKey("chest", "Ouvrir le coffre du véhicule", "k", function()
    OpenVehicleChest()
end)

rUtils.RegisterControlKey("removeweapon", "Ranger son arme", "1", function()
    local pPed = GetPlayerPed(-1)
    if IsPedArmed(pPed, 7) then
        local _, pWeapon = GetCurrentPedWeapon(pPed, 1)
        RemoveWeaponFromPed(pPed, pWeapon)
        RemoveAllPedWeapons(pPed, 1)
        SendActionTxt(" range son arme.")
    end
end)