token = ""
pCallBack = false
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
pGroup = ""
pVip = 0
pUniqueID = 0

pPed = 0
pVeh = 0
pVehLast = 0

pPrenom = ""
pNom = ""
pAge = ""

pLoaded = false
skip = false

events = {}

function SkipLogo()
    skip = true

end

Citizen.CreateThread(function()
    DecorRegister("aim", 3)
    pPed = GetPlayerPed(-1)
    pVeh = GetVehiclePedIsIn(pPed, 0)
    pVehLast = GetVehiclePedIsIn(pPed, 1)

    StartAudioScene("MP_LEADERBOARD_SCENE")
    ActivateFrontendMenu('FE_MENU_VERSION_PRE_LOBBY', true, -1)

    local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -0.5, 10.0)

    local spawnCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        
    SetCamActive(spawnCam, 1)
    SetCamCoord(spawnCam, pos.x, pos.y, pos.z)
    SetCamFov(spawnCam, 60.0)
    PointCamAtCoord(spawnCam, GetEntityCoords(GetPlayerPed(-1)))

    RenderScriptCams(1, 0, 1000, 0, 0)
    TriggerServerEvent("core:RequestGameData")


    while not pLoaded do
        Wait(1)
        RageUI.Text({message = "Chargement de ton personnage ..."})
        DisableAllControlActions(1)

        local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -0.5, 10.0)
        SetCamCoord(spawnCam, pos.x, pos.y, pos.z)
        PointCamAtCoord(spawnCam, GetEntityCoords(GetPlayerPed(-1)))
        if skip then 
            break 
        end
    end

    
    while token == "" do
        Wait(1)
        RageUI.Text({message = "Chargement de ton personnange ..."})
        DisableAllControlActions(1)

        local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, -0.5, 10.0)
        SetCamCoord(spawnCam, pos.x, pos.y, pos.z)
        PointCamAtCoord(spawnCam, GetEntityCoords(GetPlayerPed(-1)))
        if skip then 
            break 
        end
    end

    if not skip then
        RenderScriptCams(0, 1, 3500, 0, 0)
        SetCamActive(spawnCam, 0)

        SendNUIMessage({ 
	    	logo = true
        })
        StopAudioScenes()
        ActivateFrontendMenu('FE_MENU_VERSION_PRE_LOBBY', false, -1)
    end

    

    TriggerEvent("rF:HudToogle")
    TriggerServerEvent("core:CheckTig", token)
    TriggerServerEvent("core:GetWeather")

    StopAudioScenes()
    InitVoiceChat()
    InitStealVeh()
    LoadBarberShopData()
    InitRecoil()
    InitPossibleCrimes()
    InitChecks()
    InitDoorSync()

    SetWeaponDamageModifier(133987706, 0.0)
    SetWeaponDamageModifier(-1553120962, 0.0)
    
    while true do
        pPed = GetPlayerPed(-1)
        pVeh = GetVehiclePedIsIn(pPed, 0)
        pVehLast = GetVehiclePedIsIn(pPed, 1)
        SetEntityAsMissionEntity(pVeh, 1, 1)
        SetEntityAsMissionEntity(pVehLast, 1, 1)
        if pGroup == "user" then
            DecorSetInt(pPed, "group", 0)
        elseif pGroup == "mod" then
            DecorSetInt(pPed, "group", 1)
        elseif pGroup == "remb" then
            DecorSetInt(pPed, "group", 2)
        elseif pGroup == "fonda" then
            DecorSetInt(pPed, "group", 3)
        elseif pGroup == "dev" then
            DecorSetInt(pPed, "group", 4)
        end


        SetEntityProofs(pPed, false, true, true, false, false, 0, 0, 0)

        SetVehicleModelIsSuppressed(GetHashKey("model"), true)

        SetVehicleModelIsSuppressed(GetHashKey("armytanker"), true)
        SetVehicleModelIsSuppressed(GetHashKey("armytrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("armytrailer2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("baletrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("boattrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("cablecar"), true)
        SetVehicleModelIsSuppressed(GetHashKey("docktrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("freighttrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("graintrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("proptrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("raketrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tr2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tr3"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tr4"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trflat"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tvtrailer"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tanker"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tanker2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailerlarge"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailerlogs"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailersmall"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailers"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailers2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailers3"), true)
        SetVehicleModelIsSuppressed(GetHashKey("trailers4"), true)
        SetVehicleModelIsSuppressed(GetHashKey("airbus"), true)

        SetVehicleModelIsSuppressed(GetHashKey("freight"), true)
        SetVehicleModelIsSuppressed(GetHashKey("freightcar"), true)
        SetVehicleModelIsSuppressed(GetHashKey("freightcont1"), true)
        SetVehicleModelIsSuppressed(GetHashKey("freightcont2"), true)
        SetVehicleModelIsSuppressed(GetHashKey("freightgrain"), true)
        SetVehicleModelIsSuppressed(GetHashKey("metrotrain"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tankercar"), true)
        SetVehicleModelIsSuppressed(GetHashKey("tug"), true)
        SetVehicleModelIsSuppressed(GetHashKey("submersible"), true)
        SetVehicleModelIsSuppressed(GetHashKey("submersible2"), true)

        for k,v in pairs(GetActivePlayers()) do
            local ped = GetPlayerPed(v)
            if DecorExistOn(ped, "aim") then
                if DecorGetInt(ped, "aim") == 1 then
                    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
                else
                    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
                end
            else
                SetWeaponAnimationOverride(ped, GetHashKey("Default"))
            end
        end
        Wait(2000)
    end
end)

RegisterNetEvent("rF:SkinLoaded")
AddEventHandler("rF:SkinLoaded", function()
    pLoaded = true
end)

RegisterNetEvent("rF:UpdateGroup")
AddEventHandler("rF:UpdateGroup", function(group)
    pGroup = group
end)

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
    LoadData()
end)

RegisterNetEvent("rF:RefreshCloths")
AddEventHandler("rF:RefreshCloths", function(cloths)
    pClothing = cloths
end)

RegisterNetEvent("core:GetPlayersVehicle")
AddEventHandler("core:GetPlayersVehicle", function(vehs)
    for k,v in pairs(vehs) do
        local props = json.decode(v.props)
        vehs[k].props = props
    end
    pVehs = vehs 
end)

RegisterNetEvent("rF:SendPlayerAccounts")
AddEventHandler("rF:SendPlayerAccounts", function(money, bank, dirty)
    pMoney = money
    pBank = bank
    pDirty = dirty
end)

local RealIdentity = {}
function ResetIdentity()
    pPrenom = RealIdentity.prenom
    pNom = RealIdentity.nom
    pAge = RealIdentity.age
end

RegisterNetEvent("rF:initializeinfo")
AddEventHandler("rF:initializeinfo", function(money, dirtyMoney, bankBalance, job, grade, skin, identity, cloths, group, vip, death, id)
    DecorRegister("group", 3)
    pJob = job
    pJob_Grade = grade
    pMoney = money
    pBank = bankBalance
    pDirty = dirtyMoney
    pGroup = group
    if identity ~= nil then
        pPrenom = identity.prenom
        pNom = identity.nom
        pAge = identity.age
        RealIdentity = identity
    end
    pVip = vip
    pUniqueID = id
    pClothing = cloths
    LoadData()
    Wait(3000)
    if death == 1 then
        rUtils.ImportantNotif("Tu as été replacé en tant que mort. Il est interdit de se déconnecter pour essayer de se revive.")
        SetEntityHealth(pPed, 0)
    end
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

RegisterNetEvent("core:CallBackReady")
AddEventHandler("core:CallBackReady", function()
    pCallBack = true
end)