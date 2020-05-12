

VehicleInventoryCache = {}


MySQL.ready(function ()
    local info = MySQL.Sync.fetchAll("SELECT * FROM `veh_inventory`", {
        ['@identifier'] = player
    })

    for k,v in pairs(info) do
        local decodedInv = json.decode(v.inventory)
        table.insert(VehicleInventoryCache, {
            plate = v.plate,
            inventory = decodedInv,
            owned = 1,
            NetID = nil,
        })
        print("^2Added ^7["..v.plate.."] to vehicle cache with "..#decodedInv.." items in it.")
    end
end)

local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        Wait(3*minute)
        for k,v in pairs(VehicleInventoryCache) do
            if v.owned == 0 then
                local entity = NetworkGetEntityFromNetworkId(v.NetID)
                if not DoesEntityExist(entity) then
                    print("^1Removing ^7["..v.plate.."] from vehicle cache.") -- debug
                    table.remove(VehicleInventoryCache, k)
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
AddEventHandler("core:GetVehicleInventory", function(plate, net)
    local plate = plate
    for k,v in pairs(VehicleInventoryCache) do
        if v.plate == plate then
            if v.NetID ~= net then
                VehicleInventoryCache[k].NetID = net
            end
            TriggerClientEvent("core:GetVehicleInventory", source, v.inventory)
            return
        end
    end

    table.insert(VehicleInventoryCache, {
        plate = plate,
        inventory = {},
        owned = 0, -- à changer
        NetID = net,
    })
    print("^2Added ^7["..plate.."] to vehicle cache.")
    Citizen.CreateThread(function()
        MySQL.Async.execute('INSERT INTO `veh_inventory` VALUES (@plate, @inventory)', {
            ["@plate"] = plate,
            ["@inventory"] = json.encode({}),
        }, function(rowsChanged) end)
    end)
    return {}
end)


RegisterNetEvent("core:AddItemToVeh")
AddEventHandler("core:AddItemToVeh", function(plate, _item, _label, _olabel, _count)
    AddItemToVeh(source, plate, _item, _label, _olabel, _count)
end)

function AddItemToVeh(source, plate, _item, _label, _olabel, _count)
    local vCache = GetVehCache(plate)
    local iCount, i = GetVehItemCount(vCache, _label)
    if iCount == 0 then
        table.insert(VehicleInventoryCache[vCache].inventory, {name = _item, label = _label, olabel = _olabel, count = _count})
        print(source, _item, _count)
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
    else
        VehicleInventoryCache[vCache].inventory[i].count = VehicleInventoryCache[vCache].inventory[i].count + _count
        print(source, _item, _count)
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
    end
end

RegisterNetEvent("core:RemoveItemFromVeh")
AddEventHandler("core:RemoveItemFromVeh", function(weight, ClientCount, plate, _item, _label, _olabel, _count)
    RemoveItemFromVeh(source, ClientCount, weight, plate, _item, _label, _olabel, _count)
end)

function RemoveItemFromVeh(source, ClientCount, pWeight, plate, _item, _label, _olabel, _count)
    local vCache = GetVehCache(plate)
    local iCount, i = GetVehItemCount(vCache, _label)
    if ClientCount == iCount then
        local weight = exports.rFramework:GetItemWeightWithLabel(_olabel, _count)
        --local pWeight = exports.rFramework:GetWeight(source)
        if pWeight + weight < 50.0 then
            if iCount - _count <= 0 then
                table.remove(VehicleInventoryCache[vCache].inventory, i)
                exports.rFramework:AddItemToPlayerInvBypass(source, _item, _count, _label, _olabel)
            else
                VehicleInventoryCache[vCache].inventory[i].count = VehicleInventoryCache[vCache].inventory[i].count - _count
                exports.rFramework:AddItemToPlayerInvBypass(source, _item, _count, _label, _olabel)
            end
        else
            TriggerClientEvent("rF:notification", source, "~r~Action impossible.\n~w~Tu porte trop de chose.") 
        end
    else
        DropPlayer(source, "DUPLICATION")
    end
end

function GetVehCache(plate)
    for k,v in pairs(VehicleInventoryCache) do
        if v.plate == plate then
            return k
        end
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