

function LoadData()
    Wait(5000)
    if pJob == "mecano" then
        LoadMecanoData()
    elseif pJob == "medecin" then
        LoadEmsData()
    elseif pJob == "police" then
        LoadPoliceData()
    elseif pJob == "concessionnaire" then
        LoadConcessData()
    elseif pJob == "sheriff" then
        LoadSheriffData()
    end 

    print("^2Loading "..pJob.." data.")
end

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(mine)
    print("^1Loading up Game Data, please wait ...")
    MineData.m = mine


    MineData:LoadMineData()
end)