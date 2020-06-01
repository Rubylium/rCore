-- this script puts certain large weapons on a player's back when it is not currently selected but still in there weapon wheel
-- by: minipunch
-- originally made for USA Realism RP (https://usarrp.net)

-- Add weapons to the 'compatable_weapon_hashes' table below to make them show up on a player's back (can use GetHashKey(...) if you don't know the hash) --
local SETTINGS = {
    back_bone = 24816,
    x = 0.075,
    y = -0.15,
    z = -0.02,
    x_rotation = 0.0,
    y_rotation = 165.0,
    z_rotation = 0.0,
}

local attached_weapons = {}

Citizen.CreateThread(function()
    while true do

        local SelectedWeapon = GetSelectedPedWeapon(pPed)
        for _,v in pairs(pInventory) do
            for k,i in pairs(weapons) do
                if v.name == i.item then
                    if attached_weapons[i.prop] == nil then
                        if i.prop ~= "" then
                            if SelectedWeapon ~= k then
                                if i.settings == nil then
                                    AttachWeapon(i.prop, k, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation, isMeleeWeapon(i.prop), i.item)
                                else
                                    AttachWeapon(i.prop, k, i.settings.back_bone, i.settings.x, i.settings.y, i.settings.z, i.settings.xR, i.settings.yR, i.settings.zR, isMeleeWeapon(i.prop), i.item)
                                end
                            end
                        end
                    end
                end
            end
        end


        
        for name, attached_object in pairs(attached_weapons) do
            if SelectedWeapon == attached_object.hash then -- equipped
                TriggerServerEvent("DeleteEntity", token, ObjToNet(attached_object.handle))
                attached_weapons[name] = nil
            end

            local stillHave = false
            for _,v in pairs(pInventory) do
                if v.name == attached_object.item then
                    stillHave = true
                end
            end
            if not stillHave then
                TriggerServerEvent("DeleteEntity", token, ObjToNet(attached_object.handle))
                attached_weapons[name] = nil
            end
        end
        Wait(1500)
    end
end)

function AttachWeapon(attachModel, modelHash, boneNumber ,x ,y ,z ,xR ,yR ,zR, isMelee, itemName)
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
    rUtils.LoadModel(attachModel)

    attached_weapons[attachModel] = {
        hash = modelHash,
        handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false),
        item = itemName
    }

    SetEntityCollision(attached_weapons[attachModel].handle, false, true)

    if isMelee then x = 0.11 y = -0.14 z = 0.0 xR = -75.0 yR = 185.0 zR = 92.0 end -- reposition for melee items
    if attachModel == "prop_ld_jerrycan_01" then x = x + 0.3 end
	AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end

function isMeleeWeapon(wep_name)
    if wep_name == "prop_golf_iron_01" then
        return true
    elseif wep_name == "w_me_bat" then
        return true
    elseif wep_name == "prop_ld_jerrycan_01" then
      return true
    else
        return false
    end
end
