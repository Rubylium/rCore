
local controls = {12,13,14,15,16,17, 261, 262, 14, 15, 16, 17, 115,99}
Citizen.CreateThread(function()
    while true do
        for k,v in pairs(controls) do
            DisableControlAction(1, v, true)
        end
        Wait(10)
    end
end)


local weaponsListXD = {
    "WEAPON_KNIFE",
    "WEAPON_KNUCKLE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT" ,
    "WEAPON_SWITCHBLADE",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_SNOWBALL",
    "WEAPON_FLARE",
    "WEAPON_BALL",
    "WEAPON_REVOLVER",
    "WEAPON_POOLCUE" ,
    "WEAPON_PIPEWRENCH",
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_MG",
    "WEAPON_COMBATMG" ,
    "WEAPON_COMBATMG_MK2",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_PUMPSHOTGUN" ,
    "WEAPON_SWEEPERSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_RAYPISTOL",
    "WEAPON_RAYCARBINE",
    "WEAPON_RAYMINIGUN",
    "WEAPON_DIGISCANNER",
}

Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)

        for k,v in pairs(weaponsListXD) do
            if HasPedGotWeapon(pPed, GetHashKey(v), false) then
                IsWeaponAllowed(GetHashKey(v))
            end
        end
        Wait(1*1000)
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
    z = -0.15,  
    xR = 0.0,
    yR = 180.0,
    zR = 0.0,
}

local huntrifleSetting = {
    back_bone = 24816,
    x = 0.31,
    y = -0.14,
    z = 0.15,  
    xR = 0.0,
    yR = 180.0,
    zR = 0.0,
}

local batteSetting = {
    back_bone = 24816,
    x = 0.41,
    y = -0.14,
    z = -0.15,  
    xR = 0.0,
    yR = 270.0,
    zR = 0.0,
}

local golfSetting = {
    back_bone = 24816,
    x = 0.45,
    y = -0.14,
    z = 0.15,  
    xR = 0.0,
    yR = 270.0,
    zR = 0.0,
}

local hacheSettings = {
    back_bone = 24816,
    x = -0.41,
    y = -0.15,
    z = -0.20,  
    xR = 90.0,
    yR = 90.0,
    zR = 35.0,
}

local hacheSettings = {
    back_bone = 24816,
    x = -0.41,
    y = -0.15,
    z = -0.20,  
    xR = 90.0,
    yR = 90.0,
    zR = 35.0,
}

local machetteSettings = {
    back_bone = 24816,
    x = -0.15,
    y = 0.10,
    z = 0.22,  
    xR = 90.0,
    yR = 270.0,
    zR = 35.0,
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
    [GetHashKey("weapon_bat")] = {item = "batte",                pvp = true, itemName = "weapon_bat" ,          prop = "w_me_bat", settings = batteSetting},
    [GetHashKey("weapon_knife")] = {item = "knife",              pvp = true, itemName = "weapon_knife" ,          prop = ""},

    [GetHashKey("weapon_switchblade")] = {item = "knifeVip",     pvp = true, itemName = "weapon_switchblade" ,          prop = ""},
    [GetHashKey("weapon_golfclub")] = {item = "golf",            pvp = true, itemName = "weapon_golfclub" ,          prop = "w_me_gclub", settings = golfSetting},
    [GetHashKey("weapon_machete")] = {item = "machette",         pvp = true, itemName = "weapon_machete" ,          prop = "prop_ld_w_me_machette", settings = machetteSettings},
    [GetHashKey("weapon_battleaxe")] = {item = "hache",          pvp = true, itemName = "weapon_battleaxe" ,          prop = "w_me_hatchet", settings = hacheSettings},
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
        if weapons[hash] == nil then
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
            RemoveAllPedWeapons(GetPlayerPed(-1), 1)
            NetworkSetFriendlyFireOption(false)
            SetCanAttackFriendly(PlayerPedId(), false, false)
            return  
        end
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
