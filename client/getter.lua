token = ""
pInventory = {}
pClothing = {}
pVehs = {}
pWeight = 0
pJob = ""
pJob_Grade = 0
pMoney = 0
pBank = 0
pDirty = 0
pDeath = false
pSocietyTable = {}
pSocietyTable.money = 0
pSocietyTable.inventory = {}

pPed = 0
pVeh = 0
pVehLast = 0

pPrenom = ""
pNom = ""
pAge = ""

Citizen.CreateThread(function()
    while true do
        pPed = GetPlayerPed(-1)
        pVeh = GetVehiclePedIsIn(pPed, 0)
        pVehLast = GetVehiclePedIsIn(pPed, 1)
        Wait(2000)
    end
end)

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

RegisterNetEvent("rF:RefreshCloths")
AddEventHandler("rF:RefreshCloths", function(cloths)
    pClothing = cloths
end)

RegisterNetEvent("core:GetPlayersVehicle")
AddEventHandler("core:GetPlayersVehicle", function(vehs)
    pVehs = vehs 
end)

RegisterNetEvent("rF:SendPlayerAccounts")
AddEventHandler("rF:SendPlayerAccounts", function(money, bank, dirty)
    pMoney = money
    pBank = bank
    pDirty = dirty
end)


RegisterNetEvent("rF:initializeinfo")
AddEventHandler("rF:initializeinfo", function(money, dirtyMoney, bankBalance, job, grade, skin, identity, cloths)
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
    pClothing = cloths
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