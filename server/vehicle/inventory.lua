

VehicleInventoryCache = {}


local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        Wait(5*minute)
        for k,v in pairs(VehicleInventoryCache) do
            if v.owned == false then
                local entity = NetworkGetEntityFromNetworkId(v.NetID)
                if not DoesEntityExist(entity) then
                    print("^1Removing ^7["..v.plate.."] from vehicle cache.") -- debug
                    VehicleInventoryCache[v.plate] = nil
                end
            else
                MySQL.Async.execute('UPDATE `veh_inventory` SET veh_inventory.plate = @plate, veh_inventory.money = @money, veh_inventory.inventory = @inventory WHERE veh_inventory.plate = @plate', {
                    ["@plate"] = v.plate,
                    ["@inventory"] = json.encode(v.inventory),
                    ["@money"] = json.encode(v.money),
                }, function(rowsChanged) end)  
                print("^2Saving ^7["..v.plate.."] to BDD.") -- debug
                local entity = NetworkGetEntityFromNetworkId(v.NetID)
                if not DoesEntityExist(entity) then
                    print("^1Removing ^7["..v.plate.."] from vehicle cache.") -- debug
                    VehicleInventoryCache[v.plate] = nil
                end
            end
        end
    end
end) 


RegisterNetEvent("core:GetVehicleInventory")
AddEventHandler("core:GetVehicleInventory", function(token, plate, net, _owned)
    if not exports.rFramework:CheckToken(token, source, "GetVehicleInventory") then return end
    local source = source
    local plate = plate
    for k,v in pairs(VehicleInventoryCache) do
        local VehCache = VehicleInventoryCache[plate]
        if VehCache ~= nil then
            TriggerClientEvent("core:GetVehicleInventory", source, VehCache.inventory, VehCache.money)
            return
        end
    end

    local info = MySQL.Sync.fetchAll("SELECT * FROM `veh_inventory` WHERE plate = @plate", {
        ['@plate'] = plate
    })

    if info[1] ~= nil then
        for k,v in pairs(info) do
            local decodedInv = json.decode(v.inventory)
            local decodedMoney 
            if v.money == nil then 
                decodedMoney = {} 
                decodedMoney.money = 0
                decodedMoney.dirty = 0
            else 
                decodedMoney = json.decode(v.money) 
            end
            VehicleInventoryCache[plate] = {plate = v.plate, inventory = decodedInv, money = decodedMoney, owned = 1, NetID = net}
            print("^2Added ^7["..v.plate.."] to vehicle cache with "..#decodedInv.." items in it.")
            TriggerClientEvent("core:GetVehicleInventory", source, VehicleInventoryCache[plate].inventory, VehicleInventoryCache[plate].money)
        end
    else
        VehicleInventoryCache[plate] = {plate = plate, inventory = {}, money = {}, owned = _owned, NetID = net,}
        print("^2Creating dynamic cache for ^7["..plate.."] with an owned status of "..tostring(_owned)..".")
        TriggerClientEvent("core:GetVehicleInventory", source, VehicleInventoryCache[plate].inventory, VehicleInventoryCache[plate].money)
        
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

RegisterNetEvent("core:SyncInvMoney")
AddEventHandler("core:SyncInvMoney", function(token, plate, sync)
    if not exports.rFramework:CheckToken(token, source, "SyncInvMoney") then return end
    VehicleInventoryCache[plate].money = sync
    TriggerClientEvent("core:GetVehicleInventory", source, VehicleInventoryCache[plate].inventory, VehicleInventoryCache[plate].money)
end)

RegisterNetEvent("core:AddItemToVeh")
AddEventHandler("core:AddItemToVeh", function(token, plate, _item, _label, _olabel, _count)
    if not exports.rFramework:CheckToken(token, source, "AddItemToVeh") then return end
    AddItemToVeh(source, plate, _item, _label, _olabel, _count)
end)

function AddItemToVeh(source, plate, _item, _label, _olabel, _count)
    local iCount = VehicleInventoryCache[plate].inventory[_label]
    if iCount == nil then
        VehicleInventoryCache[plate].inventory[_label] = {name = _item, label = _label, olabel = _olabel, count = _count}
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
        exports.rFramework:SendLog("``Le joueur ["..source.."] "..GetPlayerName(source).." à déposé ".._item.." [".._label.."] x".._count.." dans le véhicule ["..plate.."]``", "veh")
    else
        VehicleInventoryCache[plate].inventory[_label].count = VehicleInventoryCache[plate].inventory[_label].count + _count
        exports.rFramework:RemoveItemFromPlayerInv(source, _label, _count)
        exports.rFramework:SendLog("``Le joueur ["..source.."] "..GetPlayerName(source).." à déposé ".._item.." [".._label.."] x".._count.." dans le véhicule ["..plate.."]``", "veh")
    end
end

RegisterNetEvent("core:RemoveItemFromVeh")
AddEventHandler("core:RemoveItemFromVeh", function(token, weight, ClientCount, plate, _item, _label, _olabel, _count)
    if not exports.rFramework:CheckToken(token, source, "RemoveItemFromVeh") then return end
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
                    exports.rFramework:SendLog("``Le joueur ["..source.."] "..GetPlayerName(source).." à retiré ".._item.." [".._label.."] x".._count.." dans le véhicule ["..plate.."]``", "veh")
                else
                    VehicleInventoryCache[plate].inventory[_label].count = VehicleInventoryCache[plate].inventory[_label].count - _count
                    exports.rFramework:AddItemToPlayerInvBypass(source, _item, _count, _label, _olabel)
                    exports.rFramework:SendLog("``Le joueur ["..source.."] "..GetPlayerName(source).." à retiré ".._item.." [".._label.."] x".._count.." dans le véhicule ["..plate.."]``", "veh")
                end
            else
                TriggerClientEvent("rF:notification", source, "~r~Action impossible.\n~w~Tu porte trop de chose.") 
            end
        else
            -- Desync serveur client 
            exports.rFramework:AddPlayerLog(source, "AC: Desync client server, count client: "..ClientCount.." / count server: "..iCount.." / item: ".._item.." ".._label.." x".._count, 3)
        end
    else
        -- Desync serveur client
        exports.rFramework:AddPlayerLog(source, "AC: Desync client server, count client: "..ClientCount.." / count server: 0 / item: ".._item.." ".._label.." x".._count, 3)
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



-- Status 


local VehsChestStatus = {}

function DeployCbVehicle()
    exports.rFramework:RegisterServerCallback('core:OpenChestIfCan', function(source, cb, plate)
        if VehsChestStatus[plate] == nil then 
            VehsChestStatus[plate] = true
            cb(true) 
        end

        if VehsChestStatus[plate] == false then
            cb(false)
        end

        if VehsChestStatus[plate] == true then
            cb(false)
        end
    end)
end


RegisterNetEvent("core:RemoveChestStatus")
AddEventHandler("core:RemoveChestStatus", function(token, plate)
    if not exports.rFramework:CheckToken(token, source, "RemoveChestStatus") then return end
    VehsChestStatus[plate] = nil
end)