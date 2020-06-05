rUtils.RegisterControlKey("inventaire", "Ouvrir l'inventaire", "F5", function()
    if IsCuffed then return end
    TriggerServerEvent(events.GetInv, token)
    TriggerServerEvent(events.GetAccs, token)
    OpenPlayerMenu()
    RageUI.Visible(RMenu:Get('core', 'main'), not RageUI.Visible(RMenu:Get('core', 'main')))
end)


rUtils.RegisterControlKey("metier", "Ouvrir le menu de métier", "F6", function()
    print(pJob)
    if IsCuffed then return end
    if pJob == "mecano" then
        OpenMecanoActionMenu()
    elseif pJob == "medecin" then
        OpenEmsActionMenu()
    elseif pJob == "police" then
        OpenPoliceActionMenu()
    elseif pJob == "sheriff" then
        OpenSheriffActionMenu()
    end
end)

rUtils.RegisterControlKey("speed", "[DEV] - Reset slowmotion", "9", function()
    SetTimeScale(1.0)
end)

rUtils.RegisterControlKey("slow", "[DEV] - Activer slowmotion", "6", function()
    SetTimeScale(0.25)
end)

rUtils.RegisterControlKey("creator", "[DEV] - Ouvrir le menu de création", "f1", function()
    OpenCreatorMenu()
end)

rUtils.RegisterControlKey("chest", "Ouvrir le coffre du véhicule", "k", function()
    OpenVehicleChest()
end)

rUtils.RegisterControlKey("removeweapon", "Ranger son arme", "1", function()
    if IsPedArmed(pPed, 7) then
        local _, pWeapon = GetCurrentPedWeapon(pPed, 1)
        RemoveWeaponFromPed(pPed, pWeapon)
        RemoveAllPedWeapons(pPed, 1)
        SendActionTxt(" range son arme.")
    end
end)

rUtils.RegisterControlKey("vehlist", "Ouvrir la liste de véhicule", "f2", function()
    if IsCuffed then return end
    OpenVehMenu()
end)

rUtils.RegisterControlKey("lock", "Clé du véhicule", "u", function()
    if IsCuffed then return end
    OpenOrCloseVeh()
end)