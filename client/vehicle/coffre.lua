local VehInventory = {}
local vPlate = nil
local vClasse = nil
local entity = nil
local open = false
RMenu.Add('core', 'veh_main', RageUI.CreateMenu("Coffre véhicule", "~b~Menu coffre de véhicule"))
RMenu:Get('core', 'veh_main').Closed = function()
    open = false
    FreezeEntityPosition(entity, false)
    SetVehicleDoorShut(entity, 5, 1)
end

RMenu.Add('core', 'veh_inv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~Coffre du véhicule"))
RMenu.Add('core', 'veh_pInv', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_main'), "Coffre véhicule", "~b~inventaire du joueur"))

RegisterNetEvent("core:GetVehicleInventory")
AddEventHandler("core:GetVehicleInventory", function(inv)
    VehInventory = inv
end)




function OpenVehicleChest()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local vehicle, dst = rUtils.GetClosestVehicle(pCoords)
    if dst < 2.0 then
        entity = vehicle
        vClasse = GetVehicleClass(vehicle)
        vPlate = GetVehicleNumberPlateText(vehicle)
        VehInventory = {}
        TriggerServerEvent("core:GetVehicleInventory", vPlate, VehToNet(vehicle))
        RageUI.Visible(RMenu:Get('core', 'veh_main'), true)
        OpenVehInventory()
        FreezeEntityPosition(entity, true)
        SetVehicleDoorOpen(entity, 5, 0, 1)
    else
        RageUI.Popup({message = "~r~Action impossible\n~w~Aucun véhicule proche."})
    end
end



function OpenVehInventory()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_main'), true, true, true, function()
                RageUI.Button("Prendre", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent("core:GetVehicleInventory", vPlate, VehToNet(vehicle)) end
                end, RMenu:Get('core', 'veh_inv'))

                RageUI.Button("Déposer", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then TriggerServerEvent("rF:GetPlayerInventory") end
                end, RMenu:Get('core', 'veh_pInv'))
                
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_pInv'), true, true, true, function()
                for k,v in pairs(pInventory) do
                    if v.olabel == v.label then
                        RageUI.Button(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    TriggerServerEvent("core:AddItemToVeh", vPlate, v.name, v.label, v.olabel, amount)
                                    if amount == v.count then
                                        table.remove(pInventory, k)
                                    else
                                        pInventory[k].count = pInventory[k].count - amount
                                    end
                                end
                            end
                        end)
                    else
                        RageUI.Button(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount ~= nil and amount > 0 and amount <= v.count then
                                    TriggerServerEvent("core:AddItemToVeh", vPlate, v.name, v.label, v.olabel, amount)
                                    if amount == v.count then
                                        table.remove(pInventory, k)
                                    else
                                        pInventory[k].count = pInventory[k].count - amount
                                    end
                                end
                            end
                        end)
                    end
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'veh_inv'), true, true, true, function()
                if #VehInventory == 0 then
                    RageUI.Button("Coffre vide.", nil, {}, true, function()end)
                else
                    for k,v in pairs(VehInventory) do
                        RageUI.Button("["..v.label.."] "..v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                local amount = CustomAmount()
                                if amount > 0 and amount <= v.count then
                                    TriggerServerEvent("core:RemoveItemFromVeh", pWeight, v.count, vPlate, v.name, v.label, v.olabel, amount)
                                    if amount == v.count then
                                        table.remove(VehInventory, k)
                                    else
                                        VehInventory[k].count = VehInventory[k].count - amount
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