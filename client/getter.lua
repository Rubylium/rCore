token = ""
pInventory = {}
pWeight = 0
pJob = ""
pJob_Grade = 0
pMoney = 0
pBank = 0
pDirty = 0
pSocietyTable = {}
pSocietyTable.money = 0
pSocietyTable.inventory = {}

pPrenom = ""
pNom = ""
pAge = ""

RegisterNetEvent("rF:SendPlayerInventory")
AddEventHandler("rF:SendPlayerInventory", function(inv, weight)
    pInventory = inv
    pWeight = weight
end)


RegisterNetEvent("rF:SendToken")AddEventHandler("rF:SendToken", function(NewToken)token = NewToken end)


RegisterNetEvent("rF:JobRefresh")
AddEventHandler("rF:JobRefresh", function(job, grade)
    pJob = job
    pJob_Grade = grade
    LoadData()
end)


RegisterNetEvent("rF:SendPlayerAccounts")
AddEventHandler("rF:SendPlayerAccounts", function(money, bank, dirty)
    pMoney = money
    pBank = bank
    pDirty = dirty
end)


RegisterNetEvent("rF:initializeinfo")
AddEventHandler("rF:initializeinfo", function(money, dirtyMoney, bankBalance, job, grade, identity)
    pJob = job
    pJob_Grade = grade
    pMoney = money
    pBank = bankBalance
    pDirty = dirtyMoney
    if identity ~= nil then
        pPrenom = identity.prenom
        pNom = identity.nom
        pAge = identity.age
    end
    LoadData()
end)


RegisterNetEvent("rF:SendSocietyInfo")
AddEventHandler("rF:SendSocietyInfo", function(societyTable)
    pSocietyTable = societyTable
end)

RegisterNetEvent("rF:UpdateIdentity")
AddEventHandler("rF:UpdateIdentity", function(identity)
    pPrenom = identity.prenom
    pNom = identity.nom
    pAge = identity.age
end)