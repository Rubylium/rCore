local VehInventory = {}
local VehLimit = 0
local VehInvTotal = 0
local TempAdd = 0
local vPlate = nil
local vClasse = nil
local entity = nil
local open = false

local dict = "mp_am_hold_up"
local anim = "purchase_beerbox_shopkeeper"
RMenu.Add('core', 'veh_main', RageUI.CreateMenu("Coffre véhicule", "~b~Menu coffre de véhicule"))
RMenu:Get('core', 'veh_main').Closed = function()
    open = false
    TriggerServerEvent("core:OpenVehHood", VehToNet(entity), false)
    DecorRemove(entity, "TRUCK_OPEN")
end

RMenu.Add('core', 'veh_inv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~Coffre du véhicule"))
RMenu.Add('core', 'veh_pInv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~inventaire du joueur"))

RegisterNetEvent("core:GetVehicleInventory")
AddEventHandler("core:GetVehicleInventory", function(inv)
    VehInventory = inv
end)

RegisterNetEvent("core:OpenVehHood")
AddEventHandler("core:OpenVehHood", function(net, status)
    local vehicle = NetworkGetEntityFromNetworkId(net)
    if status then
        SetVehicleDoorOpen(vehicle, 5, 0, 1)
    else
        SetVehicleDoorShut(vehicle, 5, 1)
    end
end)

function GetVehLimit(class)
    VehLimit = invByClass[class].place
    VehInvTotal = 0
    for k,v in pairs(VehInventory) do
        VehInvTotal = VehInvTotal + v.count
    end
    VehInvTotal = VehInvTotal + TempAdd
end

function OpenVehicleChest()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local vehicle, _ = rUtils.GetClosestVehicle(pCoords)
    local locked = GetVehicleDoorLockStatus(vehicle)
    if locked ~= 2 then
        local trunkpos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "neon_b"))
        local dst = GetDistanceBetweenCoords(trunkpos, pCoords, 1)
        if dst < 1.5 then
            entity = vehicle
            vClasse = GetVehicleClass(vehicle)
            vPlate = GetVehicleNumberPlateText(vehicle)
            if not DecorExistOn(vehicle, "TRUCK_OPEN") then
                VehInventory = {}
                TempAdd = 0
                TriggerServerEvent("core:GetVehicleInventory", vPlate, VehToNet(vehicle), false)
                GetVehLimit(vClasse)
                RageUI.Visible(RMenu:Get('core', 'veh_main'), true)
                OpenVehInventory()
                TriggerServerEvent("core:OpenVehHood", VehToNet(vehicle), true)
                SendActionTxt(" ouvre le coffre du véhicule.")
                DecorSetBool(vehicle, "TRUCK_OPEN", true)
            else
                RageUI.Popup({message = "~r~Action impossible\n~w~Quelqu'un regarde déja dans le coffre."})
            end
        else
            RageUI.Popup({message = "~r~Action impossible\n~w~Aucun véhicule proche / tu n'est pas proche du coffre."})
        end
    end
end



function OpenVehInventory()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(150)
            GetVehLimit(vClasse)
        end
    end)
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_main'), true, true, true, function()
                RageUI.Button("Prendre", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent("core:GetVehicleInventory", vPlate, VehToNet(vehicle), false) TempAdd = 0 end
                end, RMenu:Get('core', 'veh_inv'))

                RageUI.Button("Déposer", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent("rF:GetPlayerInventory") end
                end, RMenu:Get('core', 'veh_pInv'))
                
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_pInv'), true, true, true, function()
                RageUI.Separator("Coffre: "..VehInvTotal.."/"..VehLimit)
                for k,v in pairs(pInventory) do
                    if v.olabel == v.label then
                        RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    if VehInvTotal + amount <= VehLimit then
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent("core:AddItemToVeh", vPlate, v.name, v.label, v.olabel, amount)
                                        IsItemAWeapon(v.name)
                                        if amount == v.count then
                                            table.remove(pInventory, k)
                                        else
                                            pInventory[k].count = pInventory[k].count - amount
                                        end
                                        TempAdd = TempAdd + amount
                                    else
                                        RageUI.Popup({message = "~r~Action impossible\n~w~La quantité dépasse la limite du coffre."})
                                    end
                                end
                            end
                        end)
                    else
                        RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    if VehInvTotal + amount <= VehLimit then
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent("core:AddItemToVeh", vPlate, v.name, v.label, v.olabel, amount)
                                        IsItemAWeapon(v.name)
                                        if amount == v.count then
                                            table.remove(pInventory, k)
                                        else
                                            pInventory[k].count = pInventory[k].count - amount
                                        end
                                        TempAdd = TempAdd + amount
                                    else
                                        RageUI.Popup({message = "~r~Action impossible\n~w~La quantité dépasse la limite du coffre."})
                                    end
                                end
                            end
                        end)
                    end
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_inv'), true, true, true, function()
                RageUI.Separator("Coffre: "..VehInvTotal.."/"..VehLimit)
                if #VehInventory == 0 then
                    RageUI.Button("Coffre vide.", nil, {}, true, function()end)
                else
                    for k,v in pairs(VehInventory) do
                        if v.olabel == v.label then
                            RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    local amount = CustomAmount()
                                    if amount > 0 and amount <= v.count then
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent("core:RemoveItemFromVeh", pWeight, v.count, vPlate, v.name, v.label, v.olabel, amount)
                                        if amount == v.count then
                                            table.remove(VehInventory, k)
                                        else
                                            VehInventory[k].count = VehInventory[k].count - amount
                                        end
                                        GetVehLimit(vClasse)
                                    end
                                end
                            end)
                        else
                            RageUI.Button("["..v.label.."] "..v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    local amount = CustomAmount()
                                    if amount > 0 and amount <= v.count then
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent("core:RemoveItemFromVeh", pWeight, v.count, vPlate, v.name, v.label, v.olabel, amount)
                                        if amount == v.count then
                                            table.remove(VehInventory, k)
                                        else
                                            VehInventory[k].count = VehInventory[k].count - amount
                                        end
                                        GetVehLimit(vClasse)
                                    end
                                end
                            end)
                        end
                    end
                end
            end, function()
            end)

        end
    end)


end