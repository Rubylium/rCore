
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
        print(hash)
        local item = weapons[hash].item
        if item == nil then
            print("Detection arme give 1")
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
        else
            for k,v in pairs(pInventory) do
                if v.name == item then
                    print("Allowed weapon")
                    return
                end
            end
            print("Detection arme give 2")
            RemoveWeaponFromPed(GetPlayerPed(-1), hash)
        end
    end)
end
