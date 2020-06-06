

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
    elseif pJob == "bestbuds" then
        LoadBestbudsData()
    end 

    print("^2Loading "..pJob.." data.")
end

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(event, mine, hunt, arm, weed)
    print("^1Loading up Game Data, please wait ...")
    MineData.m = mine
    HuntData.h = hunt
    ArmoryData.a = arm
    WeedData.w = weed
    events = event

    ArmoryData:LoadArmoryData()
    MineData:LoadMineData()
    HuntData:LoadHuntData()
    WeedData:LoadWeedData()
end)