JobsData = {}
items = {}

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
    elseif pJob == "hotdogs" then
        LoadhotdogData()
    end 

    TriggerServerEvent(events.CheckData, token, pJob)
    print("^2Loading "..pJob.." data.")
end

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(_JobsData, event, mine, hunt, arm, weed, missionJob, convoi, item, doors)
    print("^1Loading up Game Data, please wait ...")
    MineData.m = mine
    HuntData.h = hunt
    ArmoryData.a = arm
    WeedData.w = weed
    events = event
    NpcJobMissions.m = missionJob
    ConvoiData.c = convoi
    JobsData = _JobsData
    items = item
    avalaibleBraquo = _JobsData.superette
    doords = doors

    ArmoryData:LoadArmoryData()
    MineData:LoadMineData()
    HuntData:LoadHuntData()
    WeedData:LoadWeedData()
    NpcJobMissions:LoadMissionData()
    ConvoiData:LoadConvoiData()
    InitTeleportZone(_JobsData.general.tp)
    InitBraquageSup()
end)


function GetItemId(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.id
        end
    end
end


function GetFirstLabelFromItem(item)
    print(#pInventory)
    for k,v in pairs(pInventory) do
        print(pInventory[k].name, item)
        if pInventory[k].name == item then
            print(v.label)
            return v.label
        end
    end
end