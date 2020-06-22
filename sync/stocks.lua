local items = {
    {item = "pain", label = "Pain de cuisine", prix = 3, stock = 0},
    {item = "patte", label = "Patte de cuisine", prix = 1, stock = 0},
    {item = "viande", label = "Viande de cuisine", prix = 5, stock = 0},
    {item = "patepizza", label = "Pâte à pizza", prix = 1, stock = 0},
    {item = "coulisTomate", label = "Coulis de tomate", prix = 1, stock = 0},
    {item = "fromage", label = "Fromage", prix = 1, stock = 0},
    {item = "tomate", label = "Tomate", prix = 1, stock = 0},
    {item = "thon", label = "Thon", prix = 1, stock = 0},
    {item = "parmesan", label = "Parmesan", prix = 1, stock = 0},
    {item = "poulet", label = "Poulet", prix = 1, stock = 0},
    {item = "pain2", label = "Pain à sandwich", prix = 1, stock = 0},
    {item = "quinoa", label = "Quinoa", prix = 1, stock = 0},
    {item = "salade", label = "Salade", prix = 1, stock = 0},
    {item = "avocat", label = "Avocat", prix = 1, stock = 0},
    {item = "saucisson", label = "Saucisson", prix = 1, stock = 0},
    {item = "sauce", label = "Sauce", prix = 1, stock = 0},
    {item = "tortilla", label = "Tortilla", prix = 1, stock = 0},
    {item = "bouteille", label = "Bouteille vide", prix = 1, stock = 0}, 
    {item = "saucisse", label = "Saucisse", prix = 1, stock = 0}, 
}


RegisterNetEvent("core:AddStocks")
AddEventHandler("core:AddStocks", function(token)
    if not exports.rFramework:CheckToken(token, source, "core:AddStocks") then return end
    for k,v in pairs(items) do
        items[k].stock = items[k].stock + math.random(1,10)
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