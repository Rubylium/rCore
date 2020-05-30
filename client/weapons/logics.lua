
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


local weapons = {
    [GetHashKey("weapon_pistol")] = {item = "pistolet", pvp = true},
    [GetHashKey("weapon_stungun")] = {item = "tazer", pvp = true},
    [GetHashKey("weapon_nightstick")] = {item = "matraque", pvp = true},
    [GetHashKey("weapon_pistol_mk2")] = {item = "pistoletmk2", pvp = true},
    [GetHashKey("weapon_combatpistol")] = {item = "pistoletlspd", pvp = true},

    [GetHashKey("weapon_pumpshotgun")] = {item = "pompe", pvp = true},
    [GetHashKey("weapon_carbinerifle")] = {item = "m4", pvp = true},
    [GetHashKey("weapon_assaultrifle")] = {item = "AK-47", pvp = true},
    [GetHashKey("weapon_musket")] = {item = "musket", pvp = false},
    [GetHashKey("weapon_sniperrifle")] = {item = "huntrifle", pvp = false},
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
        print(hash, item)
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
                        print("PVP Disabled")
                        NetworkSetFriendlyFireOption(false)
                        SetCanAttackFriendly(PlayerPedId(), false, false)
                    else
                        print("PVP Allowed")
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
