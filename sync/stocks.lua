local items = {
    {item = "pain", label = "Pain de cuisine", prix = 3, stock = 10},
    {item = "patte", label = "Patte de cuisine", prix = 1, stock = 10},
    {item = "viande", label = "Viande de cuisine", prix = 5, stock = 10},
}


RegisterNetEvent("core:AddStocks")
AddEventHandler("core:AddStocks", function(token)
    if not exports.rFramework:CheckToken(token, source, "core:AddStocks") then return end
    for k,v in pairs(items) do
        items[k].stock = items[k].stock + 5
    end
end)

RegisterNetEvent("core:UpdateStocks")
AddEventHandler("core:UpdateStocks", function(token, item, count)
    if not exports.rFramework:CheckToken(token, source, "core:UpdateStocks") then return end
    for k,v in pairs(items) do
        if v.item == item then
            items[k].stock = items[k].stock - count
        end
    end
end)

RegisterNetEvent("core:SendStocksToClient")
AddEventHandler("core:SendStocksToClient", function(token)
    if not exports.rFramework:CheckToken(token, source, "core:UpdateStocks") then return end
    TriggerClientEvent("core:SendStocksToClient", source, items)
end)