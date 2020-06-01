
local controls = {12,13,14,15,16,17}
Citizen.CreateThread(function()
    while true do
        for k,v in pairs(controls) do
            DisableControlAction(1, v, true)
        end
        Wait(10)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        if IsPedArmed(pPed, 7) then
            local _, pWeapon = GetCurrentPedWeapon(pPed, 1)
            IsWeaponAllowed(pWeapon)
        else
            NetworkSetFriendlyFireOption(true)
            SetCanAttackFriendly(PlayerPedId(), true, true)
        end
        Wait(2*1000)
    end
end)


local m4Settings = {
    back_bone = 24816,
    x = 0.10,
    y = 0.21,
    z = -0.05,
    xR = 0.0,
    yR = 165.0,
    zR = 0.0,
}

local musketSetting = {
    back_bone = 24816,
    x = 0.31,
    y = -0.14,
    z = -0.20,  
    xR = 0.0,
    yR = 180.0,
    zR = 0.0,
}

local huntrifleSetting = {
    back_bone = 24816,
    x = 0.31,
    y = -0.14,
    z = 0.20,  
    xR = 0.0,
    yR = 180.0,
    zR = 0.0,
}

weapons = {
    [GetHashKey("weapon_pistol")] = {item = "pistolet",          pvp = true,  itemName = "weapon_pistol"      , prop = "",},
    [GetHashKey("weapon_stungun")] = {item = "tazer",            pvp = true,  itemName = "weapon_stungun"     , prop = "",},
    [GetHashKey("weapon_nightstick")] = {item = "matraque",      pvp = true,  itemName = "weapon_nightstick"  , prop = "",},
    [GetHashKey("weapon_pistol_mk2")] = {item = "pistoletmk2",   pvp = true,  itemName = "weapon_pistol_mk2"  , prop = "",},
    [GetHashKey("weapon_combatpistol")] = {item = "pistoletlspd",pvp = true,  itemName = "weapon_combatpistol", prop = "",},
    [GetHashKey("weapon_pumpshotgun")] = {item = "pompe",        pvp = true,  itemName = "weapon_pumpshotgun" , prop = "w_sg_pumpshotgun",},
    [GetHashKey("weapon_carbinerifle")] = {item = "m4",          pvp = true,  itemName = "weapon_carbinerifle", prop = "w_ar_carbinerifle", settings = m4Settings},
    [GetHashKey("weapon_assaultrifle")] = {item = "AK-47",       pvp = true,  itemName = "weapon_assaultrifle", prop = "w_ar_assaultrifle",},
    [GetHashKey("weapon_musket")] = {item = "musket",            pvp = false, itemName = "weapon_musket"      , prop = "w_ar_musket", settings = musketSetting},
    [GetHashKey("weapon_sniperrifle")] = {item = "huntrifle",    pvp = false, itemName = "weapon_sniperrifle" , prop = "w_sr_sniperrifle", settings = huntrifleSetting},
}

function IsItemAWeapon(item)
    for k,v in pairs(weapons) do
        if item == v.item then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetCurrentPedWeapon(GetPlayerPed(-1), 1))
        end
    end
end

function IsWeaponAllowed(hash)
    Citizen.CreateThread(function()
        local item = weapons[hash].item
        if item == nil then
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
            RemoveAllPedWeapons(GetPlayerPed(-1), 1)
            NetworkSetFriendlyFireOption(true)
            SetCanAttackFriendly(PlayerPedId(), true, true)
        else
            local allowed = false
            for k,v in pairs(pInventory) do
                if v.name == item then
                    allowed = true
                    if weapons[hash].pvp == false then
                        NetworkSetFriendlyFireOption(false)
                        SetCanAttackFriendly(PlayerPedId(), false, false)
                    else
                        NetworkSetFriendlyFireOption(true)
                        SetCanAttackFriendly(PlayerPedId(), true, true)
                    end
                    break
                end
            end
            if not allowed then
                RemoveWeaponFromPed(GetPlayerPed(-1), hash)
                RemoveAllPedWeapons(GetPlayerPed(-1), 1)
                NetworkSetFriendlyFireOption(true)
                SetCanAttackFriendly(PlayerPedId(), true, true)
            end
        end
    end)
end
