JobsData = {}

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
    elseif pJob == "drusilla" then
        LoadDrusillaData()
    elseif pJob == "crucial" then
        LoadCrucialData()
    end 

    print("^2Loading "..pJob.." data.")
end

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(_JobsData, event, mine, hunt, arm, weed, missionJob, convoi)
    print("^1Loading up Game Data, please wait ...")
    MineData.m = mine
    HuntData.h = hunt
    ArmoryData.a = arm
    WeedData.w = weed
    events = event
    NpcJobMissions.m = missionJob
    ConvoiData.c = convoi
    JobsData = _JobsData

    ArmoryData:LoadArmoryData()
    MineData:LoadMineData()
    HuntData:LoadHuntData()
    WeedData:LoadWeedData()
    NpcJobMissions:LoadMissionData()
    ConvoiData:LoadConvoiData()
end)