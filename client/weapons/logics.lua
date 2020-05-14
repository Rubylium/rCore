
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
    [GetHashKey("weapon_pistol")] = {item = "pistolet"},
    [GetHashKey("weapon_stungun")] = {item = "tazer"},
    [GetHashKey("weapon_pistol_mk2")] = {item = "pistoletmk2"},
    [GetHashKey("weapon_combatpistol")] = {item = "pistoletlspd"},

    [GetHashKey("weapon_pumpshotgun")] = {item = "pompe"},
    [GetHashKey("weapon_carbinerifle")] = {item = "m4"},
    [GetHashKey("weapon_assaultrifle")] = {item = "AK-47"},
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
            print("Detection arme give 1")
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
            RemoveAllPedWeapons(GetPlayerPed(-1), 1)
        else
            for k,v in pairs(pInventory) do
                if v.name == item then
                    return
                end
            end
            print("Detection arme give 2")
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
            RemoveAllPedWeapons(GetPlayerPed(-1), 1)
        end
    end)
end
