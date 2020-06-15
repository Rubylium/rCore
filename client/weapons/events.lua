
RegisterNetEvent("core:GetPistol")
AddEventHandler("core:GetPistol", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_pistol"), 255, false, true)
    SendActionTxt(" sort son "..GetLabelText("WT_PIST"))
end)

RegisterNetEvent("core:GetTazer")
AddEventHandler("core:GetTazer", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_stungun"), 255, false, true)
    SendActionTxt(" sort son "..GetLabelText("WT_STUN"))
end)

RegisterNetEvent("core:GetPistolmk2")
AddEventHandler("core:GetPistolmk2", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_pistol_mk2"), 255, false, true)
    SendActionTxt(" sort son "..GetLabelText("WT_PIST2"))
end)

RegisterNetEvent("core:GetPistollspd")
AddEventHandler("core:GetPistollspd", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_combatpistol"), 255, false, true)
    SendActionTxt(" sort son "..GetLabelText("WT_PIST_CBT"))
end)

RegisterNetEvent("core:GetM4")
AddEventHandler("core:GetM4", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_carbinerifle"), 255, false, true)
    SendActionTxt(" sort sa m4")
end)

RegisterNetEvent("core:GetMattraque")
AddEventHandler("core:GetMattraque", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_nightstick"), 255, false, true)
    SendActionTxt(" sort sa matraque")
end)


-- chasse
RegisterNetEvent("core:GetMusket")
AddEventHandler("core:GetMusket", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_musket"), 255, false, true)
    SendActionTxt(" sort son fusils de chasse")
end)

RegisterNetEvent("core:GetHuntSniper")
AddEventHandler("core:GetHuntSniper", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_sniperrifle"), 255, false, true)
    SendActionTxt(" sort son fusils de précision de chasseur")
end)


RegisterNetEvent("core:GetBat")
AddEventHandler("core:GetBat", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_bat"), 255, false, true)
    SendActionTxt(" sort sa Batte De Baseball")
end)

RegisterNetEvent("core:GetKnife")
AddEventHandler("core:GetKnife", function()
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_knife"), 255, false, true)
    SendActionTxt(" sort un couteau")
end)


RegisterNetEvent("core:GetKnifeVip")
AddEventHandler("core:GetKnifeVip", function()
    if pVip == 0 then rUtils.Notif("~r~Action impossible\n~s~Ton niveau VIP est insuffisant pour utiliser l'objet.") return end
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_switchblade"), 255, false, true)
    SendActionTxt(" sort un couteau")
end)

RegisterNetEvent("core:weapon_golfclub")
AddEventHandler("core:weapon_golfclub", function()
    if pVip == 0 then rUtils.Notif("~r~Action impossible\n~s~Ton niveau VIP est insuffisant pour utiliser l'objet.") return end
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_golfclub"), 255, false, true)
    SendActionTxt(" sort un club de golf")
end)


RegisterNetEvent("core:weapon_machete")
AddEventHandler("core:weapon_machete", function()
    if pVip == 0 then rUtils.Notif("~r~Action impossible\n~s~Ton niveau VIP est insuffisant pour utiliser l'objet.") return end
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_machete"), 255, false, true)
    SendActionTxt(" sort une machette")
end)

RegisterNetEvent("core:weapon_battleaxe")
AddEventHandler("core:weapon_battleaxe", function()
    if pVip == 0 then rUtils.Notif("~r~Action impossible\n~s~Ton niveau VIP est insuffisant pour utiliser l'objet.") return end
    RemoveAllPedWeapons(pPed, 1)
    GiveWeaponToPed_(pPed, GetHashKey("weapon_battleaxe"), 255, false, true)
    SendActionTxt(" sort une hache")
end)