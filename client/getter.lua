token = ""
pInventory = {}
pWeight = 0
pJob = ""
pJob_Grade = 0
pMoney = 0
pBank = 0
pDirty = 0

RegisterNetEvent("rF:SendPlayerInventory")
AddEventHandler("rF:SendPlayerInventory", function(inv, weight)
    pInventory = inv
    pWeight = weight
end)


RegisterNetEvent("rF:SendToken")
AddEventHandler("rF:SendToken", function(NewToken)
    token = NewToken
end)


RegisterNetEvent("rF:JobRefresh")
AddEventHandler("rF:JobRefresh", function(job, grade)
    pJob = job
    pJob_Grade = grade
end)


RegisterNetEvent("rF:SendPlayerAccounts")
AddEventHandler("rF:SendPlayerAccounts", function(money, bank, dirty)
    pMoney = money
    pBank = bank
    pDirty = dirty
end)