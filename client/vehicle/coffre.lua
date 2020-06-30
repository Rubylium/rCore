local VehInventory = {}
local BoiteAGant = {}
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
    TriggerServerEvent(events.OpenHood, token, entity, false)
    TriggerServerEvent(events.rmvVehInvStatus, token, vPlate)
end

RMenu.Add('core', 'veh_inv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~Coffre du véhicule"))
RMenu:Get('core', 'veh_inv').Closed = function()end

RMenu.Add('core', 'veh_money', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~Boîte à gants"))
RMenu:Get('core', 'veh_money').Closed = function()end

RMenu.Add('core', 'veh_pInv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~inventaire du joueur"))
RMenu:Get('core', 'veh_pInv').Closed = function()end

RegisterNetEvent("core:GetVehicleInventory")
AddEventHandler("core:GetVehicleInventory", function(inv, boitagant)
    VehInventory = inv
    BoiteAGant = boitagant
    if BoiteAGant.money == nil then
        BoiteAGant.money = 0
    end
    if BoiteAGant.dirty == nil then
        BoiteAGant.dirty = 0
    end
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

function GetVehLimit(class, veh)
    if invByModel[veh] == nil then
        VehLimit = invByClass[class].place
        VehInvTotal = 0
        for k,v in pairs(VehInventory) do
            VehInvTotal = VehInvTotal + v.count
        end
        VehInvTotal = VehInvTotal + TempAdd
    else
        VehLimit = invByModel[veh].place
        VehInvTotal = 0
        for k,v in pairs(VehInventory) do
            VehInvTotal = VehInvTotal + v.count
        end
        VehInvTotal = VehInvTotal + TempAdd
    end
end

function OpenVehicleChest()
    if open then return end
    if pVeh ~= 0 then RageUI.Popup({message = "~r~Action impossible\n~w~Tu ne peux pas regarder le coffre dans le véhicule."}) return end
    local pCoords = GetEntityCoords(pPed)
    local vehicle, dstV = rUtils.GetClosestVehicle(pCoords)
    local locked = GetVehicleDoorLockStatus(vehicle)
    if locked ~= 2 then
        if dstV < 2.5 then
            
            entity = VehToNet(vehicle)
            vClasse = GetVehicleClass(vehicle)
            vPlate = GetVehicleNumberPlateText(vehicle)
            exports.rFramework:TriggerServerCallback('core:OpenChestIfCan', function(open)
                if open then 
                    DecorSetInt(NetToEnt(entity), "TRUCK_OPEN", 1)
                    VehInventory = {}
                    TempAdd = 0
                    TriggerServerEvent(events.GetVehInv, token, vPlate, entity, DecorExistOn(NetToEnt(entity), "OWNED_VEH"))
                    GetVehLimit(vClasse, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
                    RageUI.Visible(RMenu:Get('core', 'veh_main'), true)
                    OpenVehInventory()
                    TriggerServerEvent(events.OpenHood, token, entity, true)
                    SendActionTxt(" ouvre le coffre du véhicule.")
                else
                    RageUI.Popup({message = "~r~Action impossible\n~w~Quelqu'un regarde déja dans le coffre."})
                end
            end, vPlate)
        else
            RageUI.Popup({message = "~r~Action impossible\n~w~Aucun véhicule proche / tu n'est pas proche du coffre."})
        end
    else
        RageUI.Popup({message = "~r~Action impossible\n~w~Le coffre est fermé."})
    end
end



function OpenVehInventory()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(150)
            GetVehLimit(vClasse, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(NetToVeh(entity)))))
        end
    end)
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            local trunkpos = GetWorldPositionOfEntityBone(NetToEnt(entity), GetEntityBoneIndexByName(NetToEnt(entity), "neon_b"))
            if trunkpos == vector3(0,0,0) then 
                trunkpos = GetEntityCoords(NetToEnt(entity))
            else
                trunkpos = vector3(trunkpos.x, trunkpos.y, trunkpos.z+0.4)
            end
            rUtils.ShowFloatingHelpNotification("Poids: "..VehInvTotal.."/"..VehLimit, trunkpos)
            RageUI.IsVisible(RMenu:Get('core', 'veh_main'), true, true, true, function()
                RageUI.ButtonWithStyle("Prendre", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent(events.GetVehInv, token, vPlate, entity, DecorExistOn(NetToEnt(entity), "OWNED_VEH")) TempAdd = 0 end
                end, RMenu:Get('core', 'veh_inv'))

                RageUI.ButtonWithStyle("Boîte à gants", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent(events.GetInv, token) end
                end, RMenu:Get('core', 'veh_money'))

                RageUI.ButtonWithStyle("Déposer", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent(events.GetInv, token) end
                end, RMenu:Get('core', 'veh_pInv'))
                
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_money'), true, true, true, function()

                RageUI.Separator("Poche")
                RageUI.ButtonWithStyle("Déposer argent: ", nil, { RightLabel = "~g~"..pMoney.."$" }, true, function(_,_,s)
                    if s then 
                        local amount = CustomAmount()
                        if amount ~= nil and amount <= pMoney and amount > 0 then
                            BoiteAGant.money = BoiteAGant.money + amount
                            TriggerServerEvent(events.rmvMoney, token, tonumber(amount)) 
                            TriggerServerEvent(events.VehInvSync, token, vPlate, BoiteAGant)
                            pMoney = pMoney - amount
                        end
                    end
                end)
                RageUI.ButtonWithStyle("Déposer source inconnue: ", nil, { RightLabel = "~g~"..pDirty.."$" }, true, function(_,_,s)
                    if s then 
                        local amount = CustomAmount()
                        if amount ~= nil and amount <= pDirty and amount > 0 then
                            BoiteAGant.dirty = BoiteAGant.dirty + amount
                            TriggerServerEvent(events.rmvDirty, token, tonumber(amount)) 
                            TriggerServerEvent(events.VehInvSync, token, vPlate, BoiteAGant)
                            pDirty = pDirty - amount
                        end
                    end
                end)
                RageUI.Separator("Véhicule")
                RageUI.ButtonWithStyle("Prendre argent: ", nil, { RightLabel = "~g~"..BoiteAGant.money.."$" }, true, function(_,_,s)
                    if s then 
                        local amount = CustomAmount()
                        if amount ~= nil and amount <= BoiteAGant.money and amount > 0 then
                            BoiteAGant.money = BoiteAGant.money - amount
                            TriggerServerEvent(events.giveMoney, token, tonumber(amount))
                            TriggerServerEvent(events.VehInvSync, token, vPlate, BoiteAGant)
                            pMoney = pMoney + amount
                        end
                    end
                end)
                RageUI.ButtonWithStyle("Prendre source inconnue: ", nil, { RightLabel = "~g~"..BoiteAGant.dirty.."$" }, true, function(_,_,s)
                    if s then 
                        local amount = CustomAmount()
                        if amount ~= nil and amount <= BoiteAGant.dirty and amount > 0 then
                            BoiteAGant.dirty = BoiteAGant.dirty - amount
                            TriggerServerEvent(events.GiveDirty, token, tonumber(amount))
                            TriggerServerEvent(events.VehInvSync, token, vPlate, BoiteAGant)
                            pDirty = pDirty + amount
                        end
                    end
                end)
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_pInv'), true, true, true, function()
                RageUI.Separator("Coffre: "..VehInvTotal.."/"..VehLimit)
                for k,v in pairs(pInventory) do
                    if v.olabel == v.label then
                        RageUI.ButtonWithStyle(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    if VehInvTotal + amount <= VehLimit then
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent(events.AddToVeh, token, vPlate, v.name, v.label, v.olabel, amount)
                                        IsItemAWeapon(v.name)
                                        if amount == v.count then
                                            pInventory[k] = nil
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
                        RageUI.ButtonWithStyle(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    if VehInvTotal + amount <= VehLimit then

                                        if VehInventory[v.label] ~= nil then
                                            rUtils.ImportantNotif("~r~ERREUR: ~b~Un item avec le rename "..v.label.." éxiste déja")
                                        else
                                            rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                            TriggerServerEvent(events.AddToVeh, token, vPlate, v.name, v.label, v.olabel, amount)
                                            IsItemAWeapon(v.name)
                                            if amount == v.count then
                                                pInventory[k] = nil
                                            else
                                                pInventory[k].count = pInventory[k].count - amount
                                            end
                                            TempAdd = TempAdd + amount
                                        end
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
                for k,v in pairs(VehInventory) do
                    if v.olabel == v.label then
                        RageUI.ButtonWithStyle(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                    TriggerServerEvent(events.RmvFromVeh, token, pWeight, v.count, vPlate, v.name, v.label, v.olabel, amount)
                                    if amount == v.count then
                                        VehInventory[k] = nil
                                    else
                                        VehInventory[k].count = VehInventory[k].count - amount
                                    end
                                    GetVehLimit(vClasse, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(NetToVeh(entity)))))
                                end
                            end
                        end)
                    else
                        RageUI.ButtonWithStyle("["..v.label.."] "..v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    if pInventory[v.label] ~= nil then
                                        rUtils.ImportantNotif("~r~ERREUR: ~b~Un item avec le rename "..v.label.." éxiste déja")
                                    else
                                        rUtils.PlayAnim(dict, anim, 48, 8.0, 2.0, 2)
                                        TriggerServerEvent(events.RmvFromVeh, token, pWeight, v.count, vPlate, v.name, v.label, v.olabel, amount)
                                        if amount == v.count then
                                            VehInventory[k] = nil
                                        else
                                            VehInventory[k].count = VehInventory[k].count - amount
                                        end
                                        GetVehLimit(vClasse, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(NetToVeh(entity)))))
                                    end
                                end
                            end
                        end)
                    end
                end
            end, function()
            end)

        end
    end)


end