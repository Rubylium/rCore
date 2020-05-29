
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
        end
        Wait(3*1000)
    end
end)


local weapons = {
    [GetHashKey("weapon_pistol")] = {item = "pistolet", pvp = true},
    [GetHashKey("weapon_stungun")] = {item = "tazer", pvp = true},
    [GetHashKey("weapon_pistol_mk2")] = {item = "pistoletmk2", pvp = true},
    [GetHashKey("weapon_combatpistol")] = {item = "pistoletlspd", pvp = true},

    [GetHashKey("weapon_pumpshotgun")] = {item = "pompe", pvp = true},
    [GetHashKey("weapon_carbinerifle")] = {item = "m4", pvp = true},
    [GetHashKey("weapon_assaultrifle")] = {item = "AK-47", pvp = true},
    [GetHashKey("weapon_musket")] = {item = "musket", pvp = false},
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
            for k,v in pairs(pInventory) do
                if v.name == item then
                    if not v.pvp then
                        NetworkSetFriendlyFireOption(false)
                        SetCanAttackFriendly(PlayerPedId(), false, false)
                    else
                        NetworkSetFriendlyFireOption(true)
                        SetCanAttackFriendly(PlayerPedId(), true, true)
                    end
                    return
                end
            end
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
            RemoveAllPedWeapons(GetPlayerPed(-1), 1)
            NetworkSetFriendlyFireOption(true)
            SetCanAttackFriendly(PlayerPedId(), true, true)
        end
    end)
end
