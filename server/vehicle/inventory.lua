

VehicleInventoryCache = {}


local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        Wait(20*second)
        for k,v in pairs(VehicleInventoryCache) do
            if v.owned == false then
                local entity = NetworkGetEntityFromNetworkId(v.NetID)
                if not DoesEntityExist(entity) then
                    print("^1Removing ^7["..v.plate.."] from vehicle cache.") -- debug
                    VehicleInventoryCache[v.plate] = nil
                end
            else
                MySQL.Async.execute('UPDATE `veh_inventory` SET veh_inventory.plate = @plate, veh_inventory.inventory = @inventory WHERE veh_inventory.plate = @plate', {
                    ["@plate"] = v.plate,
                    ["@inventory"] = json.encode(v.inventory),
                }, function(rowsChanged) end)  
                print("^2Saving ^7["..v.plate.."] to BDD with "..#v.inventory.." items in it.") -- debug
            end
        end
    end
end)


RegisterNetEvent("core:GetVehicleInventory")
AddEventHandler("core:GetVehicleInventory", function(plate, net, _owned)
    local plate = plate
    for k,v in pairs(VehicleInventoryCache) do
        local VehCache = VehicleInventoryCache[plate]
        if VehCache ~= nil then
            TriggerClientEvent("core:GetVehicleInventory", source, VehCache.inventory)
            return
        end
    end

    local info = MySQL.Sync.fetchAll("SELECT * FROM `veh_inventory` WHERE plate = @plate", {
        ['@plate'] = plate
    })

    if info[1] ~= nil then
        for k,v in pairs(info) do
            local decodedInv = json.decode(v.inventory)
            VehicleInventoryCache[plate] = {plate = v.plate,inventory = decodedInv, owned = 1, NetID = nil}
            print("^2Added ^7["..v.plate.."] to vehicle cache with "..#decodedInv.." items in it.")
        end
    else
        VehicleInventoryCache[plate] = {plate = plate, inventory = {}, owned = _owned, NetID = net,}
        print("^2Creating dynamic cache for ^7["..plate.."] with an owned status of "..tostring(_owned)..".")
        
        if _owned then
            Citizen.CreateThread(function()
                MySQL.Async.execute('INSERT INTO `veh_inventory` VALUES (@plate, @inventory)', {
                    ["@plate"] = plate,
                    ["@inventory"] = json.encode({}),
                }, function(rowsChanged) end)
            end)
        end
    end
    return {}
end)


RegisterNetEvent("core:AddItemToVeh")
AddEventHandler("core:AddItemToVeh", function(plate, _item, _label, _olabel, _count)
    AddItemToVeh(source, plate, _item, _label, _olabel, _count)
end)

function AddItemToVeh(source, plate, _item, _label, _olabel, _count)
    local iCount = VehicleInventoryCache[plate].inventory[_label]
    if iCount == nil then
        VehicleInventoryCache[plate].inventory[_label] = {name = _item, label = _label, olabel = _olabel, count = _count}
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
    else
        VehicleInventoryCache[plate].inventory[_label].count = VehicleInventoryCache[plate].inventory[_label].count + _count
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
    end
end

RegisterNetEvent("core:RemoveItemFromVeh")
AddEventHandler("core:RemoveItemFromVeh", function(weight, ClientCount, plate, _item, _label, _olabel, _count)
    RemoveItemFromVeh(source, ClientCount, weight, plate, _item, _label, _olabel, _count)
end)

function RemoveItemFromVeh(source, ClientCount, pWeight, plate, _item, _label, _olabel, _count)
    if VehicleInventoryCache[plate].inventory[_label] ~= nil then
        local iCount = VehicleInventoryCache[plate].inventory[_label].count
        if ClientCount == iCount then
            local weight = exports.rFramework:GetItemWeightWithLabel(_olabel, _count)
            if pWeight + weight < 50.0 then
                if iCount - _count <= 0 then
                    VehicleInventoryCache[plate].inventory[_label] = nil
                    exports.rFramework:AddItemToPlayerInvBypass(source, _item, _count, _label, _olabel)
                else
                    VehicleInventoryCache[plate].inventory[_label].count = VehicleInventoryCache[plate].inventory[_label].count - _count
                    exports.rFramework:AddItemToPlayerInvBypass(source, _item, _count, _label, _olabel)
                end
            else
                TriggerClientEvent("rF:notification", source, "~r~Action impossible.\n~w~Tu porte trop de chose.") 
            end
        else
            -- Desync serveur client
        end
    else
        -- Desync serveur client
    end
end

function GetVehItemCount(cache, label)
    for k,v in pairs(VehicleInventoryCache[cache].inventory) do
        if v.label == label then
            return v.count, k
        end
    end
    return 0
end